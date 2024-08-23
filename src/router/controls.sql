/* last version on 17th june */

CREATE TABLE fb_control (
    control_id INT PRIMARY KEY AUTO_INCREMENT,
    control_name VARCHAR(255),
    control_type_id INT,
    `status` char(36),
    user_created char(36) ,
    date_created timestamp,
    user_updated char(36) ,
    date_updated timestamp,
    KEY `fbcontrol_user_updated_foreign` (`user_updated`),
    KEY `fbcontrol_user_created_foreign` (`user_created`),
    CONSTRAINT `fbcontrol_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`),
    CONSTRAINT `fbcontrol_user_updated_foreign` FOREIGN KEY (`user_updated`) REFERENCES `directus_users` (`id`)
);

CREATE TABLE fb_control_type (
    control_type_id INT PRIMARY KEY AUTO_INCREMENT,
    control_type_name VARCHAR(255),
    `status` char(36),
    user_created char(36) ,
    date_created timestamp,
    user_updated char(36) ,
    date_updated timestamp,
    KEY `fbcontroltype_user_updated_foreign` (`user_updated`),
    KEY `fbcontroltype_user_created_foreign` (`user_created`),
    CONSTRAINT `fbcontroltype_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`),
    CONSTRAINT `fbcontroltype_user_updated_foreign` FOREIGN KEY (`user_updated`) REFERENCES `directus_users` (`id`)
);

CREATE TABLE fb_form_type (
    form_type_id INT PRIMARY KEY AUTO_INCREMENT,
    form_type_name VARCHAR(255),
    `status` char(36),
    user_created char(36) ,
    date_created timestamp,
    user_updated char(36) ,
    date_updated timestamp,
    KEY `fbformtype_user_updated_foreign` (`user_updated`),
    KEY `fbformtype_user_created_foreign` (`user_created`),
    CONSTRAINT `fbformtype_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`),
    CONSTRAINT `fbformtype_user_updated_foreign` FOREIGN KEY (`user_updated`) REFERENCES `directus_users` (`id`)
);

CREATE TABLE fb_form (
    form_id INT PRIMARY KEY AUTO_INCREMENT,
    form_name VARCHAR(255),
    form_type INT,
    `status` char(36),
    user_created char(36) ,
    date_created timestamp,
    user_updated char(36) ,
    date_updated timestamp,
    KEY `fbform_user_updated_foreign` (`user_updated`),
    KEY `fbform_user_created_foreign` (`user_created`),
    CONSTRAINT `fbform_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`),
    CONSTRAINT `fbform_user_updated_foreign` FOREIGN KEY (`user_updated`) REFERENCES `directus_users` (`id`)
);

CREATE TABLE fb_control_definition (
    control_definition_id INT PRIMARY KEY AUTO_INCREMENT,
    form_id INT,
    control_id INT,
    control_label VARCHAR(255),
    is_required BIT,
    required_message VARCHAR(255),
    step: INT,
    `status` char(36),
    user_created char(36) ,
    date_created timestamp,
    user_updated char(36) ,
    date_updated timestamp,
    KEY `fbcontroldefinition_user_updated_foreign` (`user_updated`),
    KEY `fbcontroldefinition_user_created_foreign` (`user_created`),
    CONSTRAINT `fbcontroldefinition_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`),
    CONSTRAINT `fbcontroldefinition_user_updated_foreign` FOREIGN KEY (`user_updated`) REFERENCES `directus_users` (`id`)
);

CREATE TABLE fb_validation_key (
    validation_key_id INT PRIMARY KEY AUTO_INCREMENT,
    validation_key_name VARCHAR(255),
    `status` char(36),
    user_created char(36) ,
    date_created timestamp,
    user_updated char(36) ,
    date_updated timestamp,
    KEY `fbvalidationkey_user_updated_foreign` (`user_updated`),
    KEY `fbvalidationkey_user_created_foreign` (`user_created`),
    CONSTRAINT `fbvalidationkey_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`),
    CONSTRAINT `fbvalidationkey_user_updated_foreign` FOREIGN KEY (`user_updated`) REFERENCES `directus_users` (`id`)
);

CREATE TABLE fb_control_definition_validation (
    control_definition_validation_id INT PRIMARY KEY AUTO_INCREMENT,
    control_definition_id INT,
    validation_key_id INT,
    validation_value VARCHAR(255),
    validation_message VARCHAR(255),
    `status` char(36),
    user_created char(36) ,
    date_created timestamp,
    user_updated char(36) ,
    date_updated timestamp,
    KEY `fbcontroldefinitionvalidation_user_updated_foreign` (`user_updated`),
    KEY `fbcontroldefinitionvalidation_user_created_foreign` (`user_created`),
    CONSTRAINT `fbcontroldefinitionvalidation_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`),
    CONSTRAINT `fbcontroldefinitionvalidation_user_updated_foreign` FOREIGN KEY (`user_updated`) REFERENCES `directus_users` (`id`)
);

CREATE TABLE fb_control_option (
    control_option_id INT PRIMARY KEY AUTO_INCREMENT,
    control_id INT,
    control_key VARCHAR(255),
    control_value VARCHAR(255),
    `status` char(36),
    user_created char(36) ,
    date_created timestamp,
    user_updated char(36) ,
    date_updated timestamp,
    KEY `fbcontroloption_user_updated_foreign` (`user_updated`),
    KEY `fbcontroloption_user_created_foreign` (`user_created`),
    CONSTRAINT `fbcontroloption_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`),
    CONSTRAINT `fbcontroloption_user_updated_foreign` FOREIGN KEY (`user_updated`) REFERENCES `directus_users` (`id`)
);

CREATE TABLE fb_control_definition_option (
    control_definition_option_id INT PRIMARY KEY AUTO_INCREMENT,
    control_definition_id INT,
    control_option_id INT,
    `status` char(36),
    user_created char(36) ,
    date_created timestamp,
    user_updated char(36) ,
    date_updated timestamp,
    KEY `fbcontroldefinitionoption_user_updated_foreign` (`user_updated`),
    KEY `fbcontroldefinitionoption_user_created_foreign` (`user_created`),
    CONSTRAINT `fbcontroldefinitionoption_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`),
    CONSTRAINT `fbcontroldefinitionoption_user_updated_foreign` FOREIGN KEY (`user_updated`) REFERENCES `directus_users` (`id`)
);

ALTER TABLE fb_control ADD CONSTRAINT FK_control_control_type FOREIGN KEY (control_type_id) REFERENCES fb_control_type(control_type_id);
ALTER TABLE fb_control_definition ADD CONSTRAINT FK_control_definition_control FOREIGN KEY (control_id) REFERENCES fb_control(control_id);
ALTER TABLE fb_control_option ADD CONSTRAINT FK_control_option_control FOREIGN KEY (control_id) REFERENCES fb_control(control_id);
ALTER TABLE fb_control_definition_option ADD CONSTRAINT FK_control_definition_option_control_definition FOREIGN KEY (control_definition_id) REFERENCES fb_control_definition(control_definition_id);
ALTER TABLE fb_control_definition_validation ADD CONSTRAINT FK_control_definition_validation_control_definition FOREIGN KEY (control_definition_id) REFERENCES fb_control_definition(control_definition_id);
ALTER TABLE fb_control_definition_validation ADD CONSTRAINT FK_control_definition_validation_validation_key FOREIGN KEY (validation_key_id) REFERENCES fb_validation_key(validation_key_id);
ALTER TABLE fb_control_definition_option ADD CONSTRAINT FK_control_definition_option_control_option FOREIGN KEY (control_option_id) REFERENCES fb_control_option(control_option_id);
ALTER TABLE fb_control_definition ADD CONSTRAINT FK_control_definition_form FOREIGN KEY (form_id) REFERENCES fb_form(form_id);
ALTER TABLE fb_form ADD CONSTRAINT FK_form_form_type FOREIGN KEY (form_type) REFERENCES fb_form_type(form_type_id);

ALTER TABLE control ADD CONSTRAINT FK_control_directus_users FOREIGN KEY (user_created) REFERENCES directus_users(id);
ALTER TABLE control ADD CONSTRAINT FK_control_directus_users1 FOREIGN KEY (user_updated) REFERENCES directus_users(id);
ALTER TABLE control_type ADD CONSTRAINT FK_control_type_directus_users FOREIGN KEY (user_created) REFERENCES directus_users(id);
ALTER TABLE control_type ADD CONSTRAINT FK_control_type_directus_users1 FOREIGN KEY (user_updated) REFERENCES directus_users(id);
ALTER TABLE form_type ADD CONSTRAINT FK_form_type_directus_users FOREIGN KEY (user_created) REFERENCES directus_users(id);
ALTER TABLE form_type ADD CONSTRAINT FK_form_type_directus_users1 FOREIGN KEY (user_updated) REFERENCES directus_users(id);
ALTER TABLE form ADD CONSTRAINT FK_form_directus_users FOREIGN KEY (user_created) REFERENCES directus_users(id);
ALTER TABLE form ADD CONSTRAINT FK_form_directus_users1 FOREIGN KEY (user_updated) REFERENCES directus_users(id);
ALTER TABLE control_definition ADD CONSTRAINT FK_control_definition_directus_users FOREIGN KEY (user_created) REFERENCES directus_users(id);
ALTER TABLE control_definition ADD CONSTRAINT FK_control_definition_directus_users1 FOREIGN KEY (user_updated) REFERENCES directus_users(id);
ALTER TABLE validation_key ADD CONSTRAINT FK_validation_key_directus_users FOREIGN KEY (user_created) REFERENCES directus_users(id);
ALTER TABLE validation_key ADD CONSTRAINT FK_validation_key_directus_users1 FOREIGN KEY (user_updated) REFERENCES directus_users(id);
ALTER TABLE control_definition_validation ADD CONSTRAINT FK_control_definition_validation_directus_users FOREIGN KEY (user_created) REFERENCES directus_users(id);
ALTER TABLE control_definition_validation ADD CONSTRAINT FK_control_definition_validation_directus_users1 FOREIGN KEY (user_updated) REFERENCES directus_users(id);
ALTER TABLE control_option ADD CONSTRAINT FK_control_option_directus_users FOREIGN KEY (user_created) REFERENCES directus_users(id);
ALTER TABLE control_option ADD CONSTRAINT FK_control_option_directus_users1 FOREIGN KEY (user_updated) REFERENCES directus_users(id);
ALTER TABLE control_definition_option ADD CONSTRAINT FK_control_definition_option_directus_users FOREIGN KEY (user_created) REFERENCES directus_users(id);
ALTER TABLE control_definition_option ADD CONSTRAINT FK_control_definition_option_directus_users1 FOREIGN KEY (user_updated) REFERENCES directus_users(id);


INSERT INTO `directus`.`fb_control_type`
(`control_type_id`,
`control_type_name`,
`status`,
`user_created`,
`date_created`,
`user_updated`,
`date_updated`)
VALUES
(1,"text",'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(2,"date",'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(3,"number",'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(4,"select",'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(5,"checkbox",'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(6,"radio",'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW());

INSERT INTO `directus`.`fb_control`
(`control_id`,
`control_name`,
`control_type_id`,
`status`,
`user_created`,
`date_created`,
`user_updated`,
`date_updated`)
VALUES
(1,"start_date",4,'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(2,"education_level",4,'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(3,"campus_preference",4,'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(4,"grad_year",3,'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(5,"first_name",1,'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(6,"last_name",1,'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(7,"age",3,'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(8,"phone_number",1,'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(9,"address",1,'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(10,"zip_code",1,'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(11,"email",1,'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW());

INSERT INTO `directus`.`fb_control_option`
(`control_option_id`,
`control_id`,
`control_key`,
`control_value`,
`status`,
`user_created`,
`date_created`,
`user_updated`,
`date_updated`)
VALUES
(1,1,"within_a_month","Within A Month",'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(2,1,"1_to_3_months","1 to 3 Months",'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(3,1,"3_to_6_months","3 to 6 Months",'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(4,1,"6_to_12_months","6 to 12 Months",'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(5,1,"12_plus_months","12+ Months",'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(6,2,"hs_diploma_or_ged","High School Diploma or GED",'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(7,2,"still_in_high_school","Still in High School",'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(8,2,"some_college","Some College",'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(9,2,"associates_degree","Associates Degree",'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(10,2,"bachelors_degree","Bachelors Degree",'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(11,2,"masters_degree","Masters Degree",'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(12,2,"doctoral_degree","Doctoral Degree",'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(13,3,"online","Online",'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(14,3,"both","Both (Online/Campus)",'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(15,3,"campus","Campus",'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW());

INSERT INTO `directus`.`fb_form`
(`form_id`,
`form_name`,
`status`,
`user_created`,
`date_created`,
`user_updated`,
`date_updated`)
VALUES
(1,"test_form",'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW());

INSERT INTO `directus`.`fb_control_definition`
(`control_definition_id`,
`form_id`,
`control_id`,
`control_label`,
`control_step`,
`control_order`,
`is_required`,
`required_message`,
`status`,
`user_created`,
`date_created`,
`user_updated`,
`date_updated`)
VALUES
(1,1,1,1,"Start date is required",1,1,'When would you like to start?' ,'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(2,1,2,1,"Education level is required",1,1,'What level of education have you completed?' ,'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(3,1,3,1,"Classroom preference is required",1,1,'What is your classroom preference?' ,'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(4,1,4,1,"High school grad year is required",1,1,'What year did you graduate high school?' ,'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW());







INSERT INTO `directus`.`fb_validation_key`
(`validation_key_id`,
`validation_key_name`,
`status`,
`user_created`,
`date_created`,
`user_updated`,
`date_updated`)
VALUES
(1,"minValue",'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(2,"maxValue",'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(3,"pattern",'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(4,"minLength",'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(5,"maxLength",'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW());

INSERT INTO `directus`.`fb_control_definition_validation`
(`control_definition_validation_id`,
`control_definition_id`,
`validation_key_id`,
`validation_value`,
`validation_message`,
`status`,
`user_created`,
`date_created`,
`user_updated`,
`date_updated`)
VALUES
(1,4,1,"1970","should be greater than 1970",'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(2,1,3,"^(1-?)?(\([0-9]{3}\)|[0-9]{3})[- ]?[0-9]{3}[- ]?[0-9]{4}$","should be in the format XXX-XXX-XXXX",'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW());

(2,4,1,"18","should be greater than 18",'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(3,1,2,"60","should be less than 60",'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(3,1,3,"^\d{5}(-\d{4})?$","should be in the format XXXXX or XXXXX-XXXX",'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW()),
(4,1,3,"^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$","should be in the format",'published','d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW(),'d1d3c37b-e3b2-4f41-9a67-c8275f660a7b',NOW());


SELECT
    f.form_id,
    c.control_name,
    ct.control_type_name,
    cd.is_required,
    cd.required_message,
    co.control_key,
    co.control_value,
    vk.validation_key_name,
    cdv.validation_value,
    cdv.validation_message
FROM
directus.fb_form as f
inner join directus.fb_control_definition cd
    on f.form_id = cd.form_id
inner join directus.fb_control c
    on cd.control_id = c.control_id
inner join directus.fb_control_type ct
    on ct.control_type_id = c.control_id
left join directus.fb_control_option co
    on co.control_id = c.control_id
left join directus.fb_control_definition_validation cdv
    on cdv.control_definition_id = cd.control_definition_id
left join directus.fb_validation_key vk
    on vk.validation_key_id = cdv.validation_key_id
