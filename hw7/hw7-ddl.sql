# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.


# Section 1
# Drops all tables.  This section should be amended as new tables are added.
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleroles;
SET FOREIGN_KEY_CHECKS=1;


# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time commitment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

create table skills (
    skill_id int NOT NULL PRIMARY KEY,
    name varchar(255) NOT NULL,
    description varchar(4096) NOT NULL,
    tag varchar(255) NOT NULL,
    url varchar(255),
    time_commitment int
);


# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

insert into skills values 
    (1, 'Superrrrr', 'Has a cool cyborg body and only wears a swimsuit.', 'Skill 1', 'https://onepiece.fandom.com/wiki/Cyborgs', 25),
    (2, 'Cooking', 'Can cook almost at Sanji level.', 'Skill 2', NULL, NULL),
    (3, 'Devil Fruit', 'Has consumed a devil fruit and gained a special power - however, lost ability to swim', 'Skill 3', 'https://onepiece.fandom.com/wiki/Devil_Fruit', 100),
    (4, 'Navigation', 'Can navigate a ship in the 4 Seas and the Grand Line - both halves', 'Skill 4', 'https://onepiece.fandom.com/wiki/Navigator', 15),
    (5, 'Lying', 'Can convince others you are a god by accidentally lying yourself into it.', 'Skill 5', NULL, NULL),
    (6, 'Fighting', 'Can utilize any means to protect their crew.', 'Skill 6', NULL, NULL),
    (7, 'Showering', 'Can wash themselves properly in a shower or bath - rare for a pirate.', 'Skill 7', NULL, NULL),
    (8, 'NPC', 'Can live a generic, non-adventurous life.', 'Skill 8', NULL, NULL);


# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

create table people (
    people_id int NOT NULL PRIMARY KEY,
    people_first_name varchar(255),
    people_last_name varchar(256) NOT NULL,
    email varchar(255),
    linkedin_url varchar(255),
    headshot_url varchar(255),
    discord_handle varchar(255),
    brief_bio varchar(4096),
    date_joined date NOT NULL
);


# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

insert into people values
    (1, 'Buggy', 'Person 1', 'most_famous_clown@buggy-pirates.com', NULL, NULL, NULL, 'Infamouse clown pirate who rose to fame in the Summit War for freeing prisoners from Impel Down.', '1528-08-13'),
    (2, 'Burgess', 'Person 2', 'weehahahaha@blackbeard-world-domination.gov', NULL, NULL, NULL, 'Captain of the first Blackbeard Pirate ship, can create shockwaves when he attacks.', '1528-08-13'),
    (3, 'Trebol', 'Person 3', 'betabeta-executive@joker-family.com', NULL, NULL, NULL, 'Gross guy who has a power centered around his snot.', '1528-08-13'), 
    (4, 'Blackbeard', 'Person 4', 'zehahaha@blackbeard-world-domination.gov', NULL, NULL, NULL, 'Top of the hit list for most One Piece fans, the first known person to ever eat two Devil Fruits and survive', '1528-08-13'),
    (5, 'Zoro', 'Person 5', 'Xx_katana_xX@strawhats.com', NULL, NULL, NULL, 'Vice captain of the Straw Hat Pirates and uses 3 swords, gets lost at a supernatural rate.', '1528-08-13'),
    (6, 'Luffy', 'Person 6', 'rubberbandcaptain@strawhats.com', NULL, NULL, NULL, 'Captain of the Straw Hat Pirates, ate the Gomu Gomu Fruit and became a rubber humna, known for being super wacky and following no social expectations.', '1528-08-13'),
    (7, 'Bartolomeo', 'Person 7', 'X_number1_strawhats_stan_X@strawhats-fansite.com', NULL, NULL, NULL, 'Extreme fan of the Straw Hat Pirates, ate the barrier barrier fruit, hated by society in the One Piece universe.', '1528-08-13'),
    (8, 'Usopp', 'Person 8', 'god-usopp@strawhats.com', NULL, NULL, NULL, 'Straw Hat sniper, known for being afraid easily and lieing about how many men he has under his command.', '1528-08-13'),
    (9, 'Shanks', 'Person 9', 'absentfather@redhaircrew.com', NULL, NULL, NULL, 'Inspired Luffy to become a pirate and gave him the straw hat, super strong.', '1528-08-13'),
    (10, 'Franky', 'Person 10', 'superrrrcyborg@strawhats.com', NULL, NULL, NULL, 'Shipwright for the Straw Hat Pirates, made himself into a cyborg that runs on cola after being hit by a train.', '1528-08-13');



# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    skills_id int NOT NULL,
    people_id int NOT NULL,
    date_acquired date NOT NULL,
    FOREIGN KEY (skills_id) references skills(skill_id),
    FOREIGN KEY (people_id) references people(people_id)
);


# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.
 
insert into peopleskills (skills_id, people_id, date_acquired) values 
    (1, 1, '1557-08-23'),
    (3, 1, '1550-04-11'),
    (6, 1, '1585-12-29'),
    (3, 2, '1567-06-05'),
    (4, 2, '1534-10-17'),
    (5, 2, '1588-02-02'),
    (1, 3, '1579-07-18'),
    (5, 3, '1561-11-30'),
    (2, 4, '1556-09-03'),
    (3, 4, '1566-01-14'),
    (4, 4, '1558-03-26'),
    (3, 5, '1538-12-09'),
    (6, 5, '1598-10-22'),
    (5, 6, '1575-06-13'),
    (6, 6, '1589-09-08'),
    (3, 7, '1562-02-19'),
    (5, 7, '1575-06-13'),
    (6, 7, '1589-09-08'),
    (1, 8, '1564-04-20'),
    (3, 8, '1562-02-19'),
    (5, 8, '1575-06-13'),
    (6, 8, '1589-09-08'),
    (2, 9, '1600-01-01'),
    (5, 9, '1600-01-01'),
    (6, 9, '1600-01-01'),
    (1, 10, '1600-01-01'),
    (4, 10, '1600-01-01'),
    (5, 10, '1600-01-01');


# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    role_id int PRIMARY KEY,
    name varchar(255),
    sort_priority int
);


# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

insert into roles values 
    (1, 'Designer', 10),
    (2, 'Developer', 20),
    (3, 'Recruit', 30),
    (4, 'Team Lead', 40),
    (5, 'Boss', 50),
    (6, 'Mentor', 60);


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    people_id int NOT NULL,
    role_id int NOT NULL,
    date_assigned date NOT NULL,
    FOREIGN KEY (people_id) references people(people_id),
    FOREIGN KEY (role_id) references roles(role_id)
);


# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

insert into peopleroles (people_id,role_id,date_assigned) values 
    (1, 2, 15300921),
    (2, 5, 15300921),
    (2, 6, 15300921),
    (3, 2, 15300921),
    (3, 4, 15300921),
    (4, 3, 15300921),
    (5, 3, 15300921),
    (6, 2, 15300921),
    (6, 1, 15300921),
    (7, 1, 15300921),
    (8, 1, 15300921),
    (8, 4, 15300921),
    (9, 2, 15300921),
    (10, 2, 15300921),
    (10, 1, 15300921);