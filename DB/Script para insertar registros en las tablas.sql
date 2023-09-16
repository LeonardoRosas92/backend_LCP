-- Insertar roles
INSERT INTO roles (role_name) VALUES ('admin');
INSERT INTO roles (role_name) VALUES ('user');

-- Insertar usuarios
INSERT INTO users (name, lastname, lastname2, birthdate, email, password, phonenumber, sex, fk_role_id) VALUES
('Luisa', 'Eysele', 'Gamboa', '2000-01-01', 'eysele.luisa@gmail.com', '123', '9992757306', 'female', 1),
('John', 'Smith', 'Brooks', '1987-05-12', 'john.smith@example.com', 'P@ssw0rd123', '1234567890', 'male', 2),
('Emily', 'Johnson', 'Cruise', '1992-03-25', 'emily.johnson@example.com', 'SecretPass123', '2345678901', 'female', 2),
('Michael', 'Davis', NULL, '1985-09-18', 'michael.davis@example.com', 'StrongPwd456', '3456789012', 'male', 2),
('Sarah', 'Williams', NULL, '1990-12-02', 'sarah.williams@example.com', 'SecurePass789', '4567890123', 'female', 2);

-- Insertar categorías
INSERT INTO categories (name, url) VALUES
('AUTOINMUNIDAD', 'https://drive.google.com/uc?export=view&id=1KuZ_Dcx2scKNWjEypPi2TvHjhGvLqJjo'),
('BIOLOGÍA MOLECULAR', 'https://drive.google.com/uc?export=view&id=1tJKt4RiUzdVqIpKBxxOg3_R0Z3fV4JzT'),
('COAGULACIÓN', 'https://drive.google.com/uc?export=view&id=1U6yzUSgKjBYJkUxbRuImvMaKNay67QMo'),
('COPROANÁLISIS', 'https://drive.google.com/uc?export=view&id=1P9SzIOGgK4dAAFfP9w1BULStj9IGHzkl'),
('ENFERMEDAD RESPIRATORIA AGUDA', 'https://drive.google.com/uc?export=view&id=15rKts7toVBaj5U-7EMbwQXVsyMZVUaD4');

-- Insertar estudios
INSERT INTO studies (name, description, indications, wait_time, url, fk_category_id) VALUES
('AC ANTI BETA 2 GLICOPROTEÍNA IGG E IGM', 'Prueba para la detección de anticuerpos contra la glicoproteína beta 2 en el sistema inmunológico.', 'Indicada para diagnóstico de enfermedades autoinmunitarias como el lupus y la artritis reumatoide.', '30 minutos', 'https://example.com/1.png', 1),
('PCR VIRUS PAPILOMA HUMANO (VPH) 14 GENOTIPOS', 'Prueba de reacción en cadena de la polimerasa para detectar 14 genotipos del virus del papiloma humano.', 'Recomendada para mujeres mayores de 30 años como parte del monitoreo de salud.', '2 horas', 'https://example.com/2.png', 2),
('DIMERO D', 'Medición del nivel de dímero D en la sangre para evaluar la coagulación sanguínea.', 'Indicada en pacientes con sospecha de coagulopatías o embolias pulmonares.', '45 minutos', 'https://example.com/3.png', 3),
('AMOEBA EN FRESCO', 'Examen de microscopía para detectar la presencia de amebas en muestras fecales.', 'Útil en el diagnóstico de infecciones intestinales parasitarias.', '1 hora', 'https://example.com/4.png', 4),
('AG VIRUS SINCITIAL RESPIRATORIO', 'Detección del antígeno del virus sincitial respiratorio en muestras respiratorias.', 'Importante para diagnosticar infecciones respiratorias agudas en niños y adultos.', '45 minutos', 'https://example.com/enfermedad-respiratoria-aguda.png', 5);

-- Insertar citas
INSERT INTO appointments (datetime, email, name, lastname, lastname2, phonenumber, birthdate, sex, fk_user_id) VALUES
('2023-04-15 14:23:55', 'john.smith@example.com', 'John', 'Smith', 'Brooks', '1234567890', '1987-05-12', 'male', 2),
('2021-09-28 09:41:12', 'emily.johnson@example.com', 'Emily', 'Johnson', 'Cruise', '2345678901', '1992-03-25', 'female', 3),
('2022-07-03 18:55:30', 'michael.davis@example.com', 'Michael', 'Davis', NULL, '3456789012', '1985-09-18', 'male', 4),
('2023-01-11 06:37:48', 'maganainurreta@gmail.com', 'Jose', 'Magana', 'Inurreta', '9992721893', '2000-06-15', 'male', NULL),
('2020-11-07 22:14:09', 'marianapelayo9@gmail.com', 'Mariana', 'Pelayo', 'Hernández', '9991234567', '1997-09-11', 'female', NULL);

-- Insertar relación citas con estudios
INSERT INTO appointments_has_studies (appointments_id, studies_id) VALUES
(1, 5),
(2, 4),
(3, 3),
(3, 5),
(4, 1),
(4, 3),
(5, 2);

-- Mostrar tablas
select * from roles;
select * from users;
select * from categories;
select * from studies;
select * from appointments;
select * from appointments_has_studies;