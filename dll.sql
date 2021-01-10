-- CREATING DATABASE
CREATE DATABASE course-picker;
USE course-picker;

-- CREATING TABLES
CREATE TABLE department(
    department_id int PRIMARY KEY AUTO_INCREMENT,
    department_name varchar(50)
);

CREATE TABLE professor(
    professor_id int PRIMARY KEY AUTO_INCREMENT,
    professor_name varchar(50)
);

CREATE TABLE course(
    course_id int PRIMARY KEY AUTO_INCREMENT,
    course_name varchar(50),
    course_description varchar(250),
    department_id int,
    professor_id int,
    FOREIGN KEY (department_id) REFERENCES (department) ON DELETE CASCADE ON UPDATE NO ACTION,
    FOREIGN KEY (professor_id) REFERENCES (professor) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- INSERTING DUMMY DATA
INSERT INTO department (department_name) VALUES
('Electrical Power Engineering'),
('Electronics and Communications'),
('Mechanical Design and Production'),
('Irrigation and Hydraulics'),
('Mining, Petroleum and Metallurgical'),
('Industrial Systems Engineering'),
('Architectural Engineering');

INSERT INTO professor (professor_name) VALUES
('Clementine Cox'),
('Tomasz Solomon'),
('Karam Vickers'),
('Chay Christensen'),
('Uma Murillo'),
('Katarina Thatcher'),
('Matthias Salas'),
('Duane John'),
('Umer Chambers'),
('Selina Munro');

INSERT INTO course (course_name, course_description, department_id, professor_id) VALUES
('Electrical Circuits', 'This course introduces fundamental properties and methods for analysis of direct- current (DC) electric circuits including components.', '1', '1'),
('Electronics', 'History of Electronics from vacuum tubes to large scale, classification of electronic signals, digital and analog, and electronic components.', '1', '1'),
('Electrical Measurements & Instrumentation', 'Course description : Understanding all electrical measurement concepts, knowing the methods of mechanical quantities using electrical instrumentation systems.', '1', '1'),
('Electric and Magnetic Fields', 'This course is an introduction to electricity and magnetism and their mathematical description, connecting electric and magnetic phenomena via the special theory of relativity.', '1', '2'),
('Power Systems', 'include general aspects of system design, electric generators, components of transmission and distribution systems, power flow analysis, system operation, and performance measures.', '1', '2'),
('Digital Signal Processing', 'The course covers theory and methods for digital signal processing including basic principles governing the analysis and design of discrete-time systems as signal processing devices.', '2', '3'),
('Analog Communication Theory', 'The course will introduce basic analog communication techniques like modulation theory, analog modulator and demodulator, random process and noise analysis.', '2', '4'),
('Digital Logic Circuits', 'Covers the design and application of digital logic circuits, including combinational and sequential logic circuits.', '2', '3'),
('Signals and Systems', 'The course is an introduction to analog and digital signal processing, a topic that forms an integral part of engineering systems', '2', '3'),
('Systems Programming', 'The objective of this course is to provide you with a basic understanding of the issues involved in writing system programs on a Linux or Unix system.', '2', '3'),
('Engineering Mechanics', 'In this course, the student studies the principles of forces as applied to trusses, frames, beams, walls and machine parts', '3', '5'),
('Dynamics', 'In this course, the student studies the principles of dynamics as applied to linear motion and angular motion.', '3', '5'),
('Strength of Materials', 'An introductory course in mechanics of materials, analysis and design of members subjected to various combinations of loading, stress and strain, beams, columns and members in torsion.', '3', '6'),
('Mechanisms', 'A study of mechanical components including gear trains, belt, chain and disk drives, cams, levers, linkage mechanisms and Geneva mechanisms.', '3', '5'),
('Machine Design', 'This course covers the analysis and design of machine components and assemblies such as couplings, bearings, springs, frames, gears, belts, etc.', '3', '6'),
('Sociology', 'Sociology focuses on the systematic understanding of social interaction, social organization, social institutions, and social change.', '4', '7'),
('Economics', 'A one-semester introduction to the basic tools of micro- and macroeconomic analysis.', '4', '10'),
('Chemistry', 'Introduction to the general principles of chemistry.', '4', '8'),
('Drilling', 'The course gives an overview of drilling rig operations and related equipment.', '5', '5'),
('Production and Operations planning', 'The course includes decision-making, capacity planning, project management and quality control.', '6', '6'),
('Materials handling', 'Material handling is the movement, protection, storage and control of materials and products throughout manufacturing, warehousing, distribution, consumption and disposal.', '6', '6'),
('Logistics and Operations scheduling', 'Introduction to logistics providing management perspective on many areas of logistics', '6', '10'),
('Surveying', 'Basics of surveying theory, recording field data and representation of data.', '7', '9'),
('Architectural Design', 'Studio on designing in behavioral and socio-cultural contexts. “Inside-out” approach to Architecture. Design through the study of behavioral use of space.', '7', '9'),
('Urban Design', 'Study & Analysis of Visual Elements. Urban Form, Grain, Texture, and Fabric. The Phenomenon of Perception.', '7', '9');