INSERT INTO station VALUES
('pt-ml-ap', 'Aeroporto', 'pt-ml'),
('pt-ml-am', 'Alameda', 'pt-ml'),
('pt-ml-af', 'Alfornelos', 'pt-ml'),
('pt-ml-ah', 'Alto dos Moinhos', 'pt-ml'),
('pt-ml-al', 'Alvalade', 'pt-ml'),
('pt-ml-as', 'Amadora Este', 'pt-ml'),
('pt-ml-ax', 'Ameixoeira', 'pt-ml'),
('pt-ml-an', 'Anjos', 'pt-ml'),
('pt-ml-ae', 'Areeiro', 'pt-ml'),
('pt-ml-ar', 'Arroios', 'pt-ml'),
('pt-ml-av', 'Avenida', 'pt-ml'),
('pt-ml-bc', 'Baixa-Chiado', 'pt-ml'),
('pt-ml-bv', 'Bela Vista', 'pt-ml'),
('pt-ml-cr', 'Cabo Ruivo', 'pt-ml'),
('pt-ml-cs', 'Cais do Sodré', 'pt-ml'),
('pt-ml-cg', 'Campo Grande', 'pt-ml'),
('pt-ml-cp', 'Campo Pequeno', 'pt-ml'),
('pt-ml-ca', 'Carnide', 'pt-ml'),
('pt-ml-ch', 'Chelas', 'pt-ml'),
('pt-ml-cu', 'Cidade Universitária', 'pt-ml'),
('pt-ml-cm', 'Colégio Militar/Luz', 'pt-ml'),
('pt-ml-en', 'Encarnação', 'pt-ml'),
('pt-ml-ec', 'Entre Campos', 'pt-ml'),
('pt-ml-in', 'Intendente', 'pt-ml'),
('pt-ml-jz', 'Jardim Zoológico', 'pt-ml'),
('pt-ml-la', 'Laranjeiras', 'pt-ml'),
('pt-ml-lu', 'Lumiar', 'pt-ml'),
('pt-ml-mp', 'Marquês de Pombal', 'pt-ml'),
('pt-ml-mm', 'Martim Moniz', 'pt-ml'),
('pt-ml-mo', 'Moscavide', 'pt-ml'),
('pt-ml-od', 'Odivelas', 'pt-ml'),
('pt-ml-ol', 'Olaias', 'pt-ml'),
('pt-ml-os', 'Olivais', 'pt-ml'),
('pt-ml-or', 'Oriente', 'pt-ml'),
('pt-ml-pa', 'Parque', 'pt-ml'),
('pt-ml-pi', 'Picoas', 'pt-ml'),
('pt-ml-po', 'Pontinha', 'pt-ml'),
('pt-ml-pe', 'Praça de Espanha', 'pt-ml'),
('pt-ml-qc', 'Quinta das Conchas', 'pt-ml'),
('pt-ml-ra', 'Rato', 'pt-ml'),
('pt-ml-rb', 'Reboleira', 'pt-ml'),
('pt-ml-re', 'Restauradores', 'pt-ml'),
('pt-ml-rm', 'Roma', 'pt-ml'),
('pt-ml-ro', 'Rossio', 'pt-ml'),
('pt-ml-sa', 'Saldanha', 'pt-ml'),
('pt-ml-sp', 'Santa Apolónia', 'pt-ml'),
('pt-ml-ss', 'São Sebastião', 'pt-ml'),
('pt-ml-sr', 'Senhor Roubado', 'pt-ml'),
('pt-ml-te', 'Telheiras', 'pt-ml'),
('pt-ml-tp', 'Terreiro do Paço', 'pt-ml');

INSERT INTO line_has_station VALUES
('pt-ml-amarela', 'pt-ml-od', 100),
('pt-ml-amarela', 'pt-ml-sr', 200),
('pt-ml-amarela', 'pt-ml-ax', 300),
('pt-ml-amarela', 'pt-ml-lu', 400),
('pt-ml-amarela', 'pt-ml-qc', 500),
('pt-ml-amarela', 'pt-ml-cg', 600),
('pt-ml-amarela', 'pt-ml-cu', 700),
('pt-ml-amarela', 'pt-ml-ec', 800),
('pt-ml-amarela', 'pt-ml-cp', 900),
('pt-ml-amarela', 'pt-ml-sa', 1000),
('pt-ml-amarela', 'pt-ml-pi', 1100),
('pt-ml-amarela', 'pt-ml-mp', 1200),
('pt-ml-amarela', 'pt-ml-ra', 1300);

INSERT INTO connection VALUES
('pt-ml-od', 'pt-ml-sr', 0), ('pt-ml-sr', 'pt-ml-od', 0),
('pt-ml-sr', 'pt-ml-ax', 0), ('pt-ml-ax', 'pt-ml-sr', 0),
('pt-ml-ax', 'pt-ml-lu', 0), ('pt-ml-lu', 'pt-ml-ax', 0),
('pt-ml-lu', 'pt-ml-qc', 0), ('pt-ml-qc', 'pt-ml-lu', 0),
('pt-ml-qc', 'pt-ml-cg', 0), ('pt-ml-cg', 'pt-ml-qc', 0),
('pt-ml-cg', 'pt-ml-cu', 0), ('pt-ml-cu', 'pt-ml-cg', 0),
('pt-ml-cu', 'pt-ml-ec', 0), ('pt-ml-ec', 'pt-ml-cu', 0),
('pt-ml-ec', 'pt-ml-cp', 0), ('pt-ml-cp', 'pt-ml-ec', 0),
('pt-ml-cp', 'pt-ml-sa', 0), ('pt-ml-sa', 'pt-ml-cp', 0),
('pt-ml-sa', 'pt-ml-pi', 0), ('pt-ml-pi', 'pt-ml-sa', 0),
('pt-ml-pi', 'pt-ml-mp', 0), ('pt-ml-mp', 'pt-ml-pi', 0),
('pt-ml-mp', 'pt-ml-ra', 0), ('pt-ml-ra', 'pt-ml-mp', 0);

INSERT INTO line_has_station VALUES
('pt-ml-azul', 'pt-ml-rb', 100),
('pt-ml-azul', 'pt-ml-as', 200),
('pt-ml-azul', 'pt-ml-af', 300),
('pt-ml-azul', 'pt-ml-po', 400),
('pt-ml-azul', 'pt-ml-ca', 500),
('pt-ml-azul', 'pt-ml-cm', 600),
('pt-ml-azul', 'pt-ml-ah', 700),
('pt-ml-azul', 'pt-ml-la', 800),
('pt-ml-azul', 'pt-ml-jz', 900),
('pt-ml-azul', 'pt-ml-pe', 1000),
('pt-ml-azul', 'pt-ml-ss', 1100),
('pt-ml-azul', 'pt-ml-pa', 1200),
('pt-ml-azul', 'pt-ml-mp', 1300),
('pt-ml-azul', 'pt-ml-av', 1400),
('pt-ml-azul', 'pt-ml-re', 1500),
('pt-ml-azul', 'pt-ml-bc', 1600),
('pt-ml-azul', 'pt-ml-tp', 1700),
('pt-ml-azul', 'pt-ml-sp', 1800);

INSERT INTO connection VALUES
('pt-ml-rb', 'pt-ml-as', 0), ('pt-ml-as', 'pt-ml-rb', 0),
('pt-ml-as', 'pt-ml-af', 0), ('pt-ml-af', 'pt-ml-as', 0),
('pt-ml-af', 'pt-ml-po', 0), ('pt-ml-po', 'pt-ml-af', 0),
('pt-ml-po', 'pt-ml-ca', 0), ('pt-ml-ca', 'pt-ml-po', 0),
('pt-ml-ca', 'pt-ml-cm', 0), ('pt-ml-cm', 'pt-ml-ca', 0),
('pt-ml-cm', 'pt-ml-ah', 0), ('pt-ml-ah', 'pt-ml-cm', 0),
('pt-ml-ah', 'pt-ml-la', 0), ('pt-ml-la', 'pt-ml-ah', 0),
('pt-ml-la', 'pt-ml-jz', 0), ('pt-ml-jz', 'pt-ml-la', 0),
('pt-ml-jz', 'pt-ml-pe', 0), ('pt-ml-pe', 'pt-ml-jz', 0),
('pt-ml-pe', 'pt-ml-ss', 0), ('pt-ml-ss', 'pt-ml-pe', 0),
('pt-ml-ss', 'pt-ml-pa', 0), ('pt-ml-pa', 'pt-ml-ss', 0),
('pt-ml-pa', 'pt-ml-mp', 0), ('pt-ml-mp', 'pt-ml-pa', 0),
('pt-ml-mp', 'pt-ml-av', 0), ('pt-ml-av', 'pt-ml-mp', 0),
('pt-ml-av', 'pt-ml-re', 0), ('pt-ml-re', 'pt-ml-av', 0),
('pt-ml-re', 'pt-ml-bc', 0), ('pt-ml-bc', 'pt-ml-re', 0),
('pt-ml-bc', 'pt-ml-tp', 0), ('pt-ml-tp', 'pt-ml-bc', 0),
('pt-ml-tp', 'pt-ml-sp', 0), ('pt-ml-sp', 'pt-ml-tp', 0);

INSERT INTO line_has_station VALUES
('pt-ml-verde', 'pt-ml-te', 100),
('pt-ml-verde', 'pt-ml-cg', 200),
('pt-ml-verde', 'pt-ml-al', 300),
('pt-ml-verde', 'pt-ml-rm', 400),
('pt-ml-verde', 'pt-ml-ae', 500),
('pt-ml-verde', 'pt-ml-am', 600),
('pt-ml-verde', 'pt-ml-ar', 700),
('pt-ml-verde', 'pt-ml-an', 800),
('pt-ml-verde', 'pt-ml-in', 900),
('pt-ml-verde', 'pt-ml-mm', 1000),
('pt-ml-verde', 'pt-ml-ro', 1100),
('pt-ml-verde', 'pt-ml-bc', 1200),
('pt-ml-verde', 'pt-ml-cs', 1300);

INSERT INTO connection VALUES
('pt-ml-te', 'pt-ml-cg', 0), ('pt-ml-cg', 'pt-ml-te', 0),
('pt-ml-cg', 'pt-ml-al', 0), ('pt-ml-al', 'pt-ml-cg', 0),
('pt-ml-al', 'pt-ml-rm', 0), ('pt-ml-rm', 'pt-ml-al', 0),
('pt-ml-rm', 'pt-ml-ae', 0), ('pt-ml-ae', 'pt-ml-rm', 0),
('pt-ml-ae', 'pt-ml-am', 0), ('pt-ml-am', 'pt-ml-ae', 0),
('pt-ml-am', 'pt-ml-ar', 0), ('pt-ml-ar', 'pt-ml-am', 0),
('pt-ml-ar', 'pt-ml-an', 0), ('pt-ml-an', 'pt-ml-ar', 0),
('pt-ml-an', 'pt-ml-in', 0), ('pt-ml-in', 'pt-ml-an', 0),
('pt-ml-in', 'pt-ml-mm', 0), ('pt-ml-mm', 'pt-ml-in', 0),
('pt-ml-mm', 'pt-ml-ro', 0), ('pt-ml-ro', 'pt-ml-mm', 0),
('pt-ml-ro', 'pt-ml-bc', 0), ('pt-ml-bc', 'pt-ml-ro', 0),
('pt-ml-bc', 'pt-ml-cs', 0), ('pt-ml-cs', 'pt-ml-bc', 0);

INSERT INTO line_has_station VALUES
('pt-ml-vermelha', 'pt-ml-ss', 100),
('pt-ml-vermelha', 'pt-ml-sa', 200),
('pt-ml-vermelha', 'pt-ml-am', 300),
('pt-ml-vermelha', 'pt-ml-ol', 400),
('pt-ml-vermelha', 'pt-ml-bv', 500),
('pt-ml-vermelha', 'pt-ml-ch', 600),
('pt-ml-vermelha', 'pt-ml-os', 700),
('pt-ml-vermelha', 'pt-ml-cr', 800),
('pt-ml-vermelha', 'pt-ml-or', 900),
('pt-ml-vermelha', 'pt-ml-mo', 1000),
('pt-ml-vermelha', 'pt-ml-en', 1100),
('pt-ml-vermelha', 'pt-ml-ap', 1200);

INSERT INTO connection VALUES
('pt-ml-ss', 'pt-ml-sa', 0), ('pt-ml-sa', 'pt-ml-ss', 0),
('pt-ml-sa', 'pt-ml-am', 0), ('pt-ml-am', 'pt-ml-sa', 0),
('pt-ml-am', 'pt-ml-ol', 0), ('pt-ml-ol', 'pt-ml-am', 0),
('pt-ml-ol', 'pt-ml-bv', 0), ('pt-ml-bv', 'pt-ml-ol', 0),
('pt-ml-bv', 'pt-ml-ch', 0), ('pt-ml-ch', 'pt-ml-bv', 0),
('pt-ml-ch', 'pt-ml-os', 0), ('pt-ml-os', 'pt-ml-ch', 0),
('pt-ml-os', 'pt-ml-cr', 0), ('pt-ml-cr', 'pt-ml-os', 0),
('pt-ml-cr', 'pt-ml-or', 0), ('pt-ml-or', 'pt-ml-cr', 0),
('pt-ml-or', 'pt-ml-mo', 0), ('pt-ml-mo', 'pt-ml-or', 0),
('pt-ml-mo', 'pt-ml-en', 0), ('pt-ml-en', 'pt-ml-mo', 0),
('pt-ml-en', 'pt-ml-ap', 0), ('pt-ml-ap', 'pt-ml-en', 0);

-- Line transfers

INSERT INTO transfer VALUES
('pt-ml-bc', 'pt-ml-azul', 'pt-ml-verde', 0), ('pt-ml-bc', 'pt-ml-verde', 'pt-ml-azul', 0),
('pt-ml-mp', 'pt-ml-azul', 'pt-ml-amarela', 0), ('pt-ml-mp', 'pt-ml-amarela', 'pt-ml-azul', 0),
('pt-ml-ss', 'pt-ml-azul', 'pt-ml-vermelha', 0), ('pt-ml-ss', 'pt-ml-vermelha', 'pt-ml-azul', 0),
('pt-ml-sa', 'pt-ml-amarela', 'pt-ml-vermelha', 0), ('pt-ml-sa', 'pt-ml-vermelha', 'pt-ml-amarela', 0),
('pt-ml-am', 'pt-ml-verde', 'pt-ml-vermelha', 0), ('pt-ml-am', 'pt-ml-vermelha', 'pt-ml-verde', 0),
('pt-ml-cg', 'pt-ml-verde', 'pt-ml-amarela', 0), ('pt-ml-cg', 'pt-ml-amarela', 'pt-ml-verde', 0);

-- Wi-Fi APs linha vermelha

INSERT INTO wifiap VALUES
('24:a4:3c:04:1a:a1', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1a:a1', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:1a:60', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1a:60', 'Go Wi-Fi Free & Fast'),

('24:a4:3c:04:1b:06', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:1b:0e', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1b:06', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1b:0e', 'Go Wi-Fi Free & Fast'),

('24:a4:3c:16:fa:c0', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:16:a7:40', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:16:fa:d0', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:16:a7:50', 'Go Wi-Fi Free & Fast'),

('24:a4:3c:17:0e:c0', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:17:0e:d0', 'Go Wi-Fi Free & Fast'),

('2a:a4:3c:03:1a:fd', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:1a:fd', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1e:ed', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:1e:ed', 'Go Wi-Fi Free & Fast'),

('2a:a4:3c:03:1f:61', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:1e:e5', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:1f:61', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1e:e5', 'Go Wi-Fi Free & Fast'),

('2a:a4:3c:04:1b:0b', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:1b:4e', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:03:1b:4e', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1b:0b', 'Go Wi-Fi Free & Fast'),

('24:a4:3c:04:1a:05', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:1a:9c', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1a:9c', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1a:05', 'Go Wi-Fi Free & Fast'),

('24:a4:3c:04:1a:6b', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:1b:0d', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1b:0d', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1a:6b', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:04:1a:6d', 'Go Wi-Fi Free & Fast'),

('24:a4:3c:04:1a:3b', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:1a:9e', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1a:3b', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1a:9e', 'Go Wi-Fi Free & Fast'),

('24:a4:3c:04:1a:e7', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:1f:fa', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1f:fa', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1a:e7', 'Go Wi-Fi Free & Fast'),

('24:a4:3c:04:1f:f6', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:1e:42', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1e:42', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1f:f6', 'Go Wi-Fi Free & Fast');

INSERT INTO station_has_wifiap VALUES
('pt-ml-ss', '24:a4:3c:04:1a:a1', 'pt-ml-vermelha'),
('pt-ml-ss', '2a:a4:3c:03:1a:a1', 'pt-ml-vermelha'),
('pt-ml-ss', '24:a4:3c:04:1a:60', 'pt-ml-vermelha'),
('pt-ml-ss', '2a:a4:3c:03:1a:60', 'pt-ml-vermelha'),
('pt-ml-sa', '24:a4:3c:04:1b:06', 'pt-ml-vermelha'),
('pt-ml-sa', '24:a4:3c:04:1b:0e', 'pt-ml-vermelha'),
('pt-ml-sa', '2a:a4:3c:03:1b:06', 'pt-ml-vermelha'),
('pt-ml-sa', '2a:a4:3c:03:1b:0e', 'pt-ml-vermelha'),
('pt-ml-am', '24:a4:3c:16:fa:c0', 'pt-ml-vermelha'),
('pt-ml-am', '24:a4:3c:16:a7:40', 'pt-ml-vermelha'),
('pt-ml-am', '24:a4:3c:16:fa:d0', 'pt-ml-vermelha'),
('pt-ml-am', '24:a4:3c:16:a7:50', 'pt-ml-vermelha'),
('pt-ml-ol', '24:a4:3c:17:0e:c0', 'pt-ml-vermelha'),
('pt-ml-ol', '24:a4:3c:17:0e:d0', 'pt-ml-vermelha'),
('pt-ml-bv', '2a:a4:3c:03:1a:fd', 'pt-ml-vermelha'),
('pt-ml-bv', '24:a4:3c:04:1a:fd', 'pt-ml-vermelha'),
('pt-ml-bv', '2a:a4:3c:03:1e:ed', 'pt-ml-vermelha'),
('pt-ml-bv', '24:a4:3c:04:1e:ed', 'pt-ml-vermelha'),
('pt-ml-ch', '2a:a4:3c:03:1f:61', 'pt-ml-vermelha'),
('pt-ml-ch', '24:a4:3c:04:1e:e5', 'pt-ml-vermelha'),
('pt-ml-ch', '24:a4:3c:04:1f:61', 'pt-ml-vermelha'),
('pt-ml-ch', '2a:a4:3c:03:1e:e5', 'pt-ml-vermelha'),
('pt-ml-os', '2a:a4:3c:04:1b:0b', 'pt-ml-vermelha'),
('pt-ml-os', '24:a4:3c:04:1b:4e', 'pt-ml-vermelha'),
('pt-ml-os', '24:a4:3c:03:1b:4e', 'pt-ml-vermelha'),
('pt-ml-os', '2a:a4:3c:03:1b:0b', 'pt-ml-vermelha'),
('pt-ml-cr', '24:a4:3c:04:1a:05', 'pt-ml-vermelha'),
('pt-ml-cr', '24:a4:3c:04:1a:9c', 'pt-ml-vermelha'),
('pt-ml-cr', '2a:a4:3c:03:1a:9c', 'pt-ml-vermelha'),
('pt-ml-cr', '2a:a4:3c:03:1a:05', 'pt-ml-vermelha'),
('pt-ml-or', '24:a4:3c:04:1a:6b', 'pt-ml-vermelha'),
('pt-ml-or', '24:a4:3c:04:1b:0d', 'pt-ml-vermelha'),
('pt-ml-or', '2a:a4:3c:03:1b:0d', 'pt-ml-vermelha'),
('pt-ml-or', '2a:a4:3c:03:1a:6b', 'pt-ml-vermelha'),
('pt-ml-or', '2a:a4:3c:04:1a:6d', 'pt-ml-vermelha'),
('pt-ml-mo', '24:a4:3c:04:1a:3b', 'pt-ml-vermelha'),
('pt-ml-mo', '24:a4:3c:04:1a:9e', 'pt-ml-vermelha'),
('pt-ml-mo', '2a:a4:3c:03:1a:3b', 'pt-ml-vermelha'),
('pt-ml-mo', '2a:a4:3c:03:1a:9e', 'pt-ml-vermelha'),
('pt-ml-en', '24:a4:3c:04:1a:e7', 'pt-ml-vermelha'),
('pt-ml-en', '24:a4:3c:04:1f:fa', 'pt-ml-vermelha'),
('pt-ml-en', '2a:a4:3c:03:1f:fa', 'pt-ml-vermelha'),
('pt-ml-en', '2a:a4:3c:03:1a:e7', 'pt-ml-vermelha'),
('pt-ml-ap', '24:a4:3c:04:1f:f6', 'pt-ml-vermelha'),
('pt-ml-ap', '24:a4:3c:04:1e:42', 'pt-ml-vermelha'),
('pt-ml-ap', '2a:a4:3c:03:1e:42', 'pt-ml-vermelha'),
('pt-ml-ap', '2a:a4:3c:03:1f:f6', 'pt-ml-vermelha');

-- Wi-Fi APs linha azul

INSERT INTO wifiap VALUES
('82:2a:a8:4a:ac:b4', 'Go Wi-Fi Free & Fast'),
('80:2a:a8:4a:ac:b4', 'Go Wi-Fi by Transavia'),
('2a:a4:3c:04:1a:1e', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:1a:1e', 'Go Wi-Fi by Transavia'),
('2a:a4:3c:03:1a:1e', 'Go Wi-Fi by Transavia'),
('2e:a4:3c:03:1a:1e', 'Go Wi-Fi Free & Fast'),
('82:2a:a8:4b:ac:b4', 'Go Wi-Fi by Transavia'),
('92:2a:a8:4b:ac:b4', 'Go Wi-Fi Free & Fast'),

('24:a4:3c:16:a7:20', 'Go Wi-Fi by Transavia'),
('24:a4:3c:16:a7:21', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:17:0d:c0', 'Go Wi-Fi by Transavia'),
('24:a4:3c:17:0d:c1', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:16:a7:30', 'Go Wi-Fi by Transavia'),
('24:a4:3c:17:0d:d0', 'Go Wi-Fi by Transavia'),
('24:a4:3c:17:0d:d1', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:16:a7:31', 'Go Wi-Fi Free & Fast'),

('82:2a:a8:c2:54:c0', 'Go Wi-Fi by Transavia'),
('92:2a:a8:c2:54:c0', 'Go Wi-Fi Free & Fast'),
('80:2a:a8:c1:54:c0', 'Go Wi-Fi by Transavia'),
('80:2a:a8:4a:b0:55', 'Go Wi-Fi by Transavia'),
('82:2a:a8:4b:b0:55', 'Go Wi-Fi by Transavia'),
('92:2a:a8:4b:b0:55', 'Go Wi-Fi Free & Fast'),
('82:2a:a8:4a:b0:55', 'Go Wi-Fi Free & Fast'),

('2a:a4:3c:03:1d:b3', 'Go Wi-Fi by Transavia'),
('2e:a4:3c:03:1d:b3', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:04:1d:b3', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:1d:b3', 'Go Wi-Fi by Transavia'),
('2a:a4:3c:04:20:a9', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:20:a9', 'Go Wi-Fi by Transavia'),
('2a:a4:3c:03:20:a9', 'Go Wi-Fi by Transavia'),
('2e:a4:3c:03:20:a9', 'Go Wi-Fi Free & Fast'),

('2a:a4:3c:03:1f:5e', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:04:1f:5e', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:1f:5e', 'Go Wi-Fi by Transavia'),

('2a:a4:3c:03:1d:5b', 'Go Wi-Fi by Transavia'),
('24:a4:3c:04:1a:17', 'Go Wi-Fi by Transavia'),
('2a:a4:3c:04:1a:17', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:1d:5b', 'Go Wi-Fi by Transavia'),
('2a:a4:3c:04:1d:5b', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1a:17', 'Go Wi-Fi by Transavia'),

('2e:a4:3c:03:1e:e0', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1e:e0', 'Go Wi-Fi by Transavia'),
('2e:a4:3c:03:1a:94', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:1a:94', 'Go Wi-Fi by Transavia'),
('2a:a4:3c:03:1a:94', 'Go Wi-Fi by Transavia'),
('2a:a4:3c:04:1a:94', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:1e:e0', 'Go Wi-Fi by Transavia'),
('2a:a4:3c:04:1e:e0', 'Go Wi-Fi Free & Fast'),

('2a:a4:3c:04:1f:f1', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:03:1f:f1', 'Go Wi-Fi by Transavia'),
('2a:a4:3c:03:1f:f1', 'Go Wi-Fi by Transavia'),
('2e:a4:3c:03:1f:f1', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:04:1f:64', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:1f:64', 'Go Wi-Fi by Transavia'),
('2e:a4:3c:03:1f:64', 'Go Wi-Fi Free & Fast'),

('24:a4:3c:16:a8:a0', 'Go Wi-Fi by Transavia'),
('24:a4:3c:16:a8:a1', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:16:a8:b0', 'Go Wi-Fi by Transavia'),
('24:a4:3c:16:a8:b1', 'Go Wi-Fi Free & Fast'),

('82:2a:a8:c1:53:c6', 'Go Wi-Fi Free & Fast'),
('80:2a:a8:c1:53:c6', 'Go Wi-Fi by Transavia'),
('24:a4:3c:04:1b:60', 'Go Wi-Fi by Transavia'),
('2e:a4:3c:03:1b:60', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1b:60', 'Go Wi-Fi by Transavia'),
('82:2a:a8:c2:53:c6', 'Go Wi-Fi by Transavia'),
('92:2a:a8:c2:53:c6', 'Go Wi-Fi Free & Fast'),

('24:a4:3c:04:1a:3f', 'Go Wi-Fi by Transavia'),
('2a:a4:3c:03:20:a2', 'Go Wi-Fi by Transavia'),
('2a:a4:3c:04:1a:3f', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1a:3f', 'Go Wi-Fi by Transavia'),
('2e:a4:3c:03:1a:3f', 'Go Wi-Fi Free & Fast'),
('2e:a4:3c:03:20:a2', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:20:a2', 'Go Wi-Fi by Transavia'),

('80:2a:a8:c1:52:fa', 'Go Wi-Fi by Transavia'),
('82:2a:a8:c2:52:fa', 'Go Wi-Fi by Transavia'),
('80:2a:a8:c1:55:31', 'Go Wi-Fi by Transavia'),
('82:2a:a8:c1:52:fa', 'Go Wi-Fi Free & Fast'),
('82:2a:a8:c1:55:31', 'Go Wi-Fi Free & Fast'),
('82:2a:a8:c2:55:31', 'Go Wi-Fi by Transavia'),
('92:2a:a8:c2:52:fa', 'Go Wi-Fi Free & Fast'),
('80:2a:a8:c1:54:75', 'Go Wi-Fi Free & Fast'),
('82:2a:a8:c2:54:75', 'Go Wi-Fi Free & Fast'),
('80:2a:a8:c1:54:33', 'Go Wi-Fi Free & Fast'),
('82:2a:a8:c2:54:33', 'Go Wi-Fi Free & Fast'),

('92:2a:a8:c2:51:5e', 'Go Wi-Fi Free & Fast'),
('82:2a:a8:c2:51:5e', 'Go Wi-Fi by Transavia'),
('80:2a:a8:c1:51:5e', 'Go Wi-Fi by Transavia'),
('82:2a:a8:c1:51:5e', 'Go Wi-Fi Free & Fast'),
('80:2a:a8:4a:b2:ff', 'Go Wi-Fi Free & Fast'),
('82:2a:a8:4b:b2:ff', 'Go Wi-Fi Free & Fast'),

('24:a4:3c:04:1d:28', 'Go Wi-Fi by Transavia'),
('2a:a4:3c:04:1d:28', 'Go Wi-Fi Free & Fast'),
('2e:a4:3c:03:1d:28', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1d:28', 'Go Wi-Fi by Transavia');

INSERT INTO station_has_wifiap VALUES
('pt-ml-ca', '82:2a:a8:4a:ac:b4', 'pt-ml-azul'),
('pt-ml-ca', '80:2a:a8:4a:ac:b4', 'pt-ml-azul'),
('pt-ml-ca', '2a:a4:3c:04:1a:1e', 'pt-ml-azul'),
('pt-ml-ca', '24:a4:3c:04:1a:1e', 'pt-ml-azul'),
('pt-ml-ca', '2a:a4:3c:03:1a:1e', 'pt-ml-azul'),
('pt-ml-ca', '2e:a4:3c:03:1a:1e', 'pt-ml-azul'),
('pt-ml-ca', '82:2a:a8:4b:ac:b4', 'pt-ml-azul'),
('pt-ml-ca', '92:2a:a8:4b:ac:b4', 'pt-ml-azul'),
('pt-ml-cm', '24:a4:3c:16:a7:20', 'pt-ml-azul'),
('pt-ml-cm', '24:a4:3c:16:a7:21', 'pt-ml-azul'),
('pt-ml-cm', '24:a4:3c:17:0d:c0', 'pt-ml-azul'),
('pt-ml-cm', '24:a4:3c:17:0d:c1', 'pt-ml-azul'),
('pt-ml-cm', '24:a4:3c:16:a7:30', 'pt-ml-azul'),
('pt-ml-cm', '24:a4:3c:17:0d:d0', 'pt-ml-azul'),
('pt-ml-cm', '24:a4:3c:17:0d:d1', 'pt-ml-azul'),
('pt-ml-cm', '24:a4:3c:16:a7:31', 'pt-ml-azul'),
('pt-ml-ah', '82:2a:a8:c2:54:c0', 'pt-ml-azul'),
('pt-ml-ah', '92:2a:a8:c2:54:c0', 'pt-ml-azul'),
('pt-ml-ah', '80:2a:a8:c1:54:c0', 'pt-ml-azul'),
('pt-ml-ah', '80:2a:a8:4a:b0:55', 'pt-ml-azul'),
('pt-ml-ah', '82:2a:a8:4b:b0:55', 'pt-ml-azul'),
('pt-ml-ah', '92:2a:a8:4b:b0:55', 'pt-ml-azul'),
('pt-ml-ah', '82:2a:a8:4a:b0:55', 'pt-ml-azul'),
('pt-ml-la', '2a:a4:3c:03:1d:b3', 'pt-ml-azul'),
('pt-ml-la', '2e:a4:3c:03:1d:b3', 'pt-ml-azul'),
('pt-ml-la', '2a:a4:3c:04:1d:b3', 'pt-ml-azul'),
('pt-ml-la', '24:a4:3c:04:1d:b3', 'pt-ml-azul'),
('pt-ml-la', '2a:a4:3c:04:20:a9', 'pt-ml-azul'),
('pt-ml-la', '24:a4:3c:04:20:a9', 'pt-ml-azul'),
('pt-ml-la', '2a:a4:3c:03:20:a9', 'pt-ml-azul'),
('pt-ml-la', '2e:a4:3c:03:20:a9', 'pt-ml-azul'),
('pt-ml-jz', '2a:a4:3c:03:1f:5e', 'pt-ml-azul'),
('pt-ml-jz', '2a:a4:3c:04:1f:5e', 'pt-ml-azul'),
('pt-ml-jz', '24:a4:3c:04:1f:5e', 'pt-ml-azul'),
('pt-ml-pe', '2a:a4:3c:03:1d:5b', 'pt-ml-azul'),
('pt-ml-pe', '24:a4:3c:04:1a:17', 'pt-ml-azul'),
('pt-ml-pe', '2a:a4:3c:04:1a:17', 'pt-ml-azul'),
('pt-ml-pe', '24:a4:3c:04:1d:5b', 'pt-ml-azul'),
('pt-ml-pe', '2a:a4:3c:04:1d:5b', 'pt-ml-azul'),
('pt-ml-pe', '2a:a4:3c:03:1a:17', 'pt-ml-azul'),
('pt-ml-ss', '2e:a4:3c:03:1e:e0', 'pt-ml-azul'),
('pt-ml-ss', '2a:a4:3c:03:1e:e0', 'pt-ml-azul'),
('pt-ml-ss', '2e:a4:3c:03:1a:94', 'pt-ml-azul'),
('pt-ml-ss', '24:a4:3c:04:1a:94', 'pt-ml-azul'),
('pt-ml-ss', '2a:a4:3c:03:1a:94', 'pt-ml-azul'),
('pt-ml-ss', '2a:a4:3c:04:1a:94', 'pt-ml-azul'),
('pt-ml-ss', '24:a4:3c:04:1e:e0', 'pt-ml-azul'),
('pt-ml-ss', '2a:a4:3c:04:1e:e0', 'pt-ml-azul'),
('pt-ml-pa', '2a:a4:3c:04:1f:f1', 'pt-ml-azul'),
('pt-ml-pa', '24:a4:3c:03:1f:f1', 'pt-ml-azul'),
('pt-ml-pa', '2a:a4:3c:03:1f:f1', 'pt-ml-azul'),
('pt-ml-pa', '2e:a4:3c:03:1f:f1', 'pt-ml-azul'),
('pt-ml-pa', '2a:a4:3c:04:1f:64', 'pt-ml-azul'),
('pt-ml-pa', '24:a4:3c:04:1f:64', 'pt-ml-azul'),
('pt-ml-pa', '2e:a4:3c:03:1f:64', 'pt-ml-azul'),
('pt-ml-mp', '24:a4:3c:16:a8:a0', 'pt-ml-azul'),
('pt-ml-mp', '24:a4:3c:16:a8:a1', 'pt-ml-azul'),
('pt-ml-mp', '24:a4:3c:16:a8:b0', 'pt-ml-azul'),
('pt-ml-mp', '24:a4:3c:16:a8:b1', 'pt-ml-azul'),
('pt-ml-av', '82:2a:a8:c1:53:c6', 'pt-ml-azul'),
('pt-ml-av', '80:2a:a8:c1:53:c6', 'pt-ml-azul'),
('pt-ml-av', '24:a4:3c:04:1b:60', 'pt-ml-azul'),
('pt-ml-av', '2e:a4:3c:03:1b:60', 'pt-ml-azul'),
('pt-ml-av', '2a:a4:3c:03:1b:60', 'pt-ml-azul'),
('pt-ml-av', '82:2a:a8:c2:53:c6', 'pt-ml-azul'),
('pt-ml-av', '92:2a:a8:c2:53:c6', 'pt-ml-azul'),
('pt-ml-re', '24:a4:3c:04:1a:3f', 'pt-ml-azul'),
('pt-ml-re', '2a:a4:3c:03:20:a2', 'pt-ml-azul'),
('pt-ml-re', '2a:a4:3c:04:1a:3f', 'pt-ml-azul'),
('pt-ml-re', '2a:a4:3c:03:1a:3f', 'pt-ml-azul'),
('pt-ml-re', '2e:a4:3c:03:1a:3f', 'pt-ml-azul'),
('pt-ml-re', '2e:a4:3c:03:20:a2', 'pt-ml-azul'),
('pt-ml-re', '24:a4:3c:04:20:a2', 'pt-ml-azul'),
('pt-ml-bc', '80:2a:a8:c1:52:fa', 'pt-ml-azul'),
('pt-ml-bc', '82:2a:a8:c2:52:fa', 'pt-ml-azul'),
('pt-ml-bc', '80:2a:a8:c1:55:31', 'pt-ml-azul'),
('pt-ml-bc', '82:2a:a8:c1:52:fa', 'pt-ml-azul'),
('pt-ml-bc', '82:2a:a8:c1:55:31', 'pt-ml-azul'),
('pt-ml-bc', '82:2a:a8:c2:55:31', 'pt-ml-azul'),
('pt-ml-bc', '92:2a:a8:c2:52:fa', 'pt-ml-azul'),
('pt-ml-bc', '80:2a:a8:c1:54:75', 'pt-ml-azul'),
('pt-ml-bc', '82:2a:a8:c2:54:75', 'pt-ml-azul'),
('pt-ml-bc', '80:2a:a8:c1:54:33', 'pt-ml-azul'),
('pt-ml-bc', '82:2a:a8:c2:54:33', 'pt-ml-azul'),
('pt-ml-tp', '92:2a:a8:c2:51:5e', 'pt-ml-azul'),
('pt-ml-tp', '82:2a:a8:c2:51:5e', 'pt-ml-azul'),
('pt-ml-tp', '80:2a:a8:c1:51:5e', 'pt-ml-azul'),
('pt-ml-tp', '82:2a:a8:c1:51:5e', 'pt-ml-azul'),
('pt-ml-tp', '80:2a:a8:4a:b2:ff', 'pt-ml-azul'),
('pt-ml-tp', '82:2a:a8:4b:b2:ff', 'pt-ml-azul'),
('pt-ml-sp', '24:a4:3c:04:1d:28', 'pt-ml-azul'),
('pt-ml-sp', '2a:a4:3c:04:1d:28', 'pt-ml-azul'),
('pt-ml-sp', '2e:a4:3c:03:1d:28', 'pt-ml-azul'),
('pt-ml-sp', '2a:a4:3c:03:1d:28', 'pt-ml-azul');

-- Wi-Fi APs linha verde

INSERT INTO wifiap VALUES
('24:a4:3c:04:1f:e9', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:19:f4', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1f:e9', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:19:f4', 'Go Wi-Fi Free & Fast'),

('24:a4:3c:17:10:c0', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:17:0d:60', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:17:0d:70', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:17:10:d0', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:1e:eb', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1e:eb', 'Go Wi-Fi Free & Fast'),

('2a:a4:3c:03:1b:01', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:1b:01', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:1f:70', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1f:70', 'Go Wi-Fi Free & Fast'),

('24:a4:3c:04:1a:88', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:1a:5e', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1a:5e', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1a:88', 'Go Wi-Fi Free & Fast'),

('24:a4:3c:04:1a:e5', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:19:fe', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1a:e5', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:19:fe', 'Go Wi-Fi Free & Fast'),

('24:a4:3c:16:ae:50', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:16:af:00', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:16:ae:40', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:16:af:10', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:1f:fb', 'Go Wi-Fi Free & Fast'),

('2a:a4:3c:03:1a:38', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:1d:23', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:1a:38', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1d:23', 'Go Wi-Fi Free & Fast'),

('24:a4:3c:04:1a:8e', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:1a:04', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1a:04', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1a:8e', 'Go Wi-Fi Free & Fast'),

('24:a4:3c:04:1b:5f', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1f:6e', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:1f:6e', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1b:5f', 'Go Wi-Fi Free & Fast'),

('24:a4:3c:04:1f:ea', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1b:55', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:1b:55', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1f:ea', 'Go Wi-Fi Free & Fast'),

('24:a4:3c:04:1b:1f', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:20:9e', 'Go Wi-Fi Free & Fast'),

('92:2a:a8:c2:55:31', 'Go Wi-Fi Free & Fast'),

('80:2a:a8:4a:ac:79', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:16:f6:a0', 'Go Wi-Fi Free & Fast'),
('82:2a:a8:4b:ac:79', 'Go Wi-Fi Free & Fast');

INSERT INTO station_has_wifiap VALUES
('pt-ml-te', '24:a4:3c:04:1f:e9', 'pt-ml-verde'),
('pt-ml-te', '24:a4:3c:04:19:f4', 'pt-ml-verde'),
('pt-ml-te', '2a:a4:3c:03:1f:e9', 'pt-ml-verde'),
('pt-ml-te', '2a:a4:3c:03:19:f4', 'pt-ml-verde'),
('pt-ml-cg', '24:a4:3c:17:10:c0', 'pt-ml-verde'),
('pt-ml-cg', '24:a4:3c:17:0d:60', 'pt-ml-verde'),
('pt-ml-cg', '24:a4:3c:17:0d:70', 'pt-ml-verde'),
('pt-ml-cg', '24:a4:3c:17:10:d0', 'pt-ml-verde'),
('pt-ml-cg', '24:a4:3c:04:1e:eb', 'pt-ml-verde'),
('pt-ml-cg', '2a:a4:3c:03:1e:eb', 'pt-ml-verde'),
('pt-ml-al', '2a:a4:3c:03:1b:01', 'pt-ml-verde'),
('pt-ml-al', '24:a4:3c:04:1b:01', 'pt-ml-verde'),
('pt-ml-al', '24:a4:3c:04:1f:70', 'pt-ml-verde'),
('pt-ml-al', '2a:a4:3c:03:1f:70', 'pt-ml-verde'),
('pt-ml-rm', '24:a4:3c:04:1a:88', 'pt-ml-verde'),
('pt-ml-rm', '24:a4:3c:04:1a:5e', 'pt-ml-verde'),
('pt-ml-rm', '2a:a4:3c:03:1a:5e', 'pt-ml-verde'),
('pt-ml-rm', '2a:a4:3c:03:1a:88', 'pt-ml-verde'),
('pt-ml-ae', '24:a4:3c:04:1a:e5', 'pt-ml-verde'),
('pt-ml-ae', '24:a4:3c:04:19:fe', 'pt-ml-verde'),
('pt-ml-ae', '2a:a4:3c:03:1a:e5', 'pt-ml-verde'),
('pt-ml-ae', '2a:a4:3c:03:19:fe', 'pt-ml-verde'),
('pt-ml-am', '24:a4:3c:16:ae:50', 'pt-ml-verde'),
('pt-ml-am', '24:a4:3c:16:af:00', 'pt-ml-verde'),
('pt-ml-am', '24:a4:3c:16:ae:40', 'pt-ml-verde'),
('pt-ml-am', '24:a4:3c:16:af:10', 'pt-ml-verde'),
('pt-ml-am', '24:a4:3c:04:1f:fb', 'pt-ml-verde'),
('pt-ml-ar', '2a:a4:3c:03:1a:38', 'pt-ml-verde'),
('pt-ml-ar', '24:a4:3c:04:1d:23', 'pt-ml-verde'),
('pt-ml-ar', '24:a4:3c:04:1a:38', 'pt-ml-verde'),
('pt-ml-ar', '2a:a4:3c:03:1d:23', 'pt-ml-verde'),
('pt-ml-an', '24:a4:3c:04:1a:8e', 'pt-ml-verde'),
('pt-ml-an', '24:a4:3c:04:1a:04', 'pt-ml-verde'),
('pt-ml-an', '2a:a4:3c:03:1a:04', 'pt-ml-verde'),
('pt-ml-an', '2a:a4:3c:03:1a:8e', 'pt-ml-verde'),
('pt-ml-in', '24:a4:3c:04:1b:5f', 'pt-ml-verde'),
('pt-ml-in', '2a:a4:3c:03:1f:6e', 'pt-ml-verde'),
('pt-ml-in', '24:a4:3c:04:1f:6e', 'pt-ml-verde'),
('pt-ml-in', '2a:a4:3c:03:1b:5f', 'pt-ml-verde'),
('pt-ml-mm', '24:a4:3c:04:1f:ea', 'pt-ml-verde'),
('pt-ml-mm', '2a:a4:3c:03:1b:55', 'pt-ml-verde'),
('pt-ml-mm', '24:a4:3c:04:1b:55', 'pt-ml-verde'),
('pt-ml-mm', '2a:a4:3c:03:1f:ea', 'pt-ml-verde'),
('pt-ml-ro', '24:a4:3c:04:1b:1f', 'pt-ml-verde'),
('pt-ml-ro', '24:a4:3c:04:20:9e', 'pt-ml-verde'),
-- ('pt-ml-bc', '82:2a:a8:c2:54:33', 'pt-ml-verde'), -- TODO fix line affinity (shared verde, azul)
-- ('pt-ml-bc', '80:2a:a8:c1:54:33', 'pt-ml-verde'),
-- ('pt-ml-bc', '82:2a:a8:c2:54:75', 'pt-ml-verde'),
-- ('pt-ml-bc', '80:2a:a8:c1:54:75', 'pt-ml-verde'),
-- ('pt-ml-bc', '82:2a:a8:c1:55:31', 'pt-ml-verde'),
-- ('pt-ml-bc', '80:2a:a8:c1:55:31', 'pt-ml-verde'),
-- ('pt-ml-bc', '82:2a:a8:c2:52:fa', 'pt-ml-verde'),
-- ('pt-ml-bc', '92:2a:a8:c2:52:fa', 'pt-ml-verde'),
('pt-ml-bc', '92:2a:a8:c2:55:31', 'pt-ml-verde'),
-- ('pt-ml-bc', '82:2a:a8:c2:55:31', 'pt-ml-verde'),
-- ('pt-ml-bc', '80:2a:a8:c1:52:fa', 'pt-ml-verde'),
-- ('pt-ml-bc', '82:2a:a8:c1:52:fa', 'pt-ml-verde'),
('pt-ml-cs', '80:2a:a8:4a:ac:79', 'pt-ml-verde'),
('pt-ml-cs', '24:a4:3c:16:f6:a0', 'pt-ml-verde'),
('pt-ml-cs', '82:2a:a8:4b:ac:79', 'pt-ml-verde');

-- Wi-Fi APs linha amarela

INSERT INTO wifiap VALUES

('24:a4:3c:04:1b:1e', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:17:01:20', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1b:1e', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:17:01:30', 'Go Wi-Fi Free & Fast'),

('24:a4:3c:16:b2:d0', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:16:f6:00', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:16:b2:c0', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:16:f6:10', 'Go Wi-Fi Free & Fast'),

('24:a4:3c:16:e3:30', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:16:d9:90', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:16:d9:80', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:16:e3:20', 'Go Wi-Fi Free & Fast'),

('24:a4:3c:17:04:d0', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:17:04:c0', 'Go Wi-Fi Free & Fast'),

('24:a4:3c:16:9b:d0', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:16:a8:60', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:16:9b:c0', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:16:a8:70', 'Go Wi-Fi Free & Fast'),

('60:e3:27:76:1a:00', 'WiFi FREE'),

('24:a4:3c:16:94:90', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:16:94:80', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:16:b7:90', 'Go Wi-Fi Free & Fast'),

('24:a4:3c:16:95:90', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:17:03:e0', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:17:03:f0', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:16:95:80', 'Go Wi-Fi Free & Fast'),

('24:a4:3c:16:aa:b0', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:16:aa:a0', 'Go Wi-Fi Free & Fast'),

('24:a4:3c:17:0f:50', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:17:0d:b0', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:17:0f:40', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:17:0d:a0', 'Go Wi-Fi Free & Fast'),

('24:a4:3c:16:6d:b0', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:16:6d:a0', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:16:64:50', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:16:64:40', 'Go Wi-Fi Free & Fast'),

('24:a4:3c:17:08:70', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:16:94:40', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:16:94:50', 'Go Wi-Fi Free & Fast'),

('24:a4:3c:04:1b:0a', 'Go Wi-Fi Free & Fast'),
('24:a4:3c:04:1b:61', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1b:0a', 'Go Wi-Fi Free & Fast'),
('2a:a4:3c:03:1b:61', 'Go Wi-Fi Free & Fast');

INSERT INTO station_has_wifiap VALUES

('pt-ml-od', '24:a4:3c:04:1b:1e', 'pt-ml-amarela'),
('pt-ml-od', '24:a4:3c:17:01:20', 'pt-ml-amarela'),
('pt-ml-od', '2a:a4:3c:03:1b:1e', 'pt-ml-amarela'),
('pt-ml-od', '24:a4:3c:17:01:30', 'pt-ml-amarela'),
('pt-ml-sr', '24:a4:3c:16:b2:d0', 'pt-ml-amarela'),
('pt-ml-sr', '24:a4:3c:16:f6:00', 'pt-ml-amarela'),
('pt-ml-sr', '24:a4:3c:16:b2:c0', 'pt-ml-amarela'),
('pt-ml-sr', '24:a4:3c:16:f6:10', 'pt-ml-amarela'),
('pt-ml-ax', '24:a4:3c:16:e3:30', 'pt-ml-amarela'),
('pt-ml-ax', '24:a4:3c:16:d9:90', 'pt-ml-amarela'),
('pt-ml-ax', '24:a4:3c:16:d9:80', 'pt-ml-amarela'),
('pt-ml-ax', '24:a4:3c:16:e3:20', 'pt-ml-amarela'),
('pt-ml-lu', '24:a4:3c:17:04:d0', 'pt-ml-amarela'),
('pt-ml-lu', '24:a4:3c:17:04:c0', 'pt-ml-amarela'),
('pt-ml-qc', '24:a4:3c:16:9b:d0', 'pt-ml-amarela'),
('pt-ml-qc', '24:a4:3c:16:a8:60', 'pt-ml-amarela'),
('pt-ml-qc', '24:a4:3c:16:9b:c0', 'pt-ml-amarela'),
('pt-ml-qc', '24:a4:3c:16:a8:70', 'pt-ml-amarela'),
-- ('pt-ml-cg', '2a:a4:3c:03:1e:eb', 'pt-ml-amarela'), -- TODO fix line affinity (shared verde, amarela)
-- ('pt-ml-cg', '24:a4:3c:04:1e:eb', 'pt-ml-amarela'),
-- ('pt-ml-cg', '24:a4:3c:17:10:c0', 'pt-ml-amarela'),
-- ('pt-ml-cg', '24:a4:3c:17:0d:60', 'pt-ml-amarela'),
('pt-ml-cg', '60:e3:27:76:1a:00', 'pt-ml-amarela'),
('pt-ml-cu', '24:a4:3c:16:94:90', 'pt-ml-amarela'),
('pt-ml-cu', '24:a4:3c:16:94:80', 'pt-ml-amarela'),
('pt-ml-cu', '24:a4:3c:16:b7:90', 'pt-ml-amarela'),
('pt-ml-ec', '24:a4:3c:16:95:90', 'pt-ml-amarela'),
('pt-ml-ec', '24:a4:3c:17:03:e0', 'pt-ml-amarela'),
('pt-ml-ec', '24:a4:3c:17:03:f0', 'pt-ml-amarela'),
('pt-ml-ec', '24:a4:3c:16:95:80', 'pt-ml-amarela'),
('pt-ml-cp', '24:a4:3c:16:aa:b0', 'pt-ml-amarela'),
('pt-ml-cp', '24:a4:3c:16:aa:a0', 'pt-ml-amarela'),
('pt-ml-sa', '24:a4:3c:17:0f:50', 'pt-ml-amarela'),
('pt-ml-sa', '24:a4:3c:17:0d:b0', 'pt-ml-amarela'),
('pt-ml-sa', '24:a4:3c:17:0f:40', 'pt-ml-amarela'),
('pt-ml-sa', '24:a4:3c:17:0d:a0', 'pt-ml-amarela'),
('pt-ml-pi', '24:a4:3c:16:6d:b0', 'pt-ml-amarela'),
('pt-ml-pi', '24:a4:3c:16:6d:a0', 'pt-ml-amarela'),
('pt-ml-pi', '24:a4:3c:16:64:50', 'pt-ml-amarela'),
('pt-ml-pi', '24:a4:3c:16:64:40', 'pt-ml-amarela'),
('pt-ml-mp', '24:a4:3c:17:08:70', 'pt-ml-amarela'),
('pt-ml-mp', '24:a4:3c:16:94:40', 'pt-ml-amarela'),
('pt-ml-mp', '24:a4:3c:16:94:50', 'pt-ml-amarela'),
('pt-ml-ra', '24:a4:3c:04:1b:0a', 'pt-ml-amarela'),
('pt-ml-ra', '24:a4:3c:04:1b:61', 'pt-ml-amarela'),
('pt-ml-ra', '2a:a4:3c:03:1b:0a', 'pt-ml-amarela'),
('pt-ml-ra', '2a:a4:3c:03:1b:61', 'pt-ml-amarela');