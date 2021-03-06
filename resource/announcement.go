package resource

import (
	"sort"
	"time"

	"github.com/underlx/disturbancesmlx/dataobjects"
	"github.com/yarf-framework/yarf"
)

// Announcement composites resource
type Announcement struct {
	resource
	annStore dataobjects.AnnouncementStore
}

type apiAnnouncement struct {
	Time    time.Time            `msgpack:"time" json:"time"`
	Network *dataobjects.Network `msgpack:"-" json:"-"`
	Title   string               `msgpack:"title" json:"title"`
	Body    string               `msgpack:"body" json:"body"`
	URL     string               `msgpack:"url" json:"url"`
	Source  string               `msgpack:"source" json:"source"`
}

type apiAnnouncementWrapper struct {
	apiAnnouncement `msgpack:",inline"`
	NetworkID       string `msgpack:"network" json:"network"`
}

// WithAnnouncementStore associates an AnnouncementStore with this resource
func (r *Announcement) WithAnnouncementStore(store dataobjects.AnnouncementStore) *Announcement {
	r.annStore = store
	return r
}

// Get serves HTTP GET requests on this resource
func (r *Announcement) Get(c *yarf.Context) error {
	var anns []*dataobjects.Announcement

	if c.Param("source") != "" {
		anns = r.annStore.SourceAnnouncements(c.Param("source"))
	} else {
		anns = r.annStore.AllAnnouncements()
	}

	sort.SliceStable(anns, func(i, j int) bool {
		return anns[i].Time.Before(anns[j].Time)
	})

	apianns := make([]apiAnnouncementWrapper, len(anns))

	for i := range anns {
		apianns[i] = apiAnnouncementWrapper{
			apiAnnouncement: apiAnnouncement(*anns[i]),
			NetworkID:       anns[i].Network.ID,
		}
	}
	RenderData(c, apianns)

	return nil
}
