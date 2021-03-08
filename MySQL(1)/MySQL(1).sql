-- Створеня схеми бази даних:

CREATE SCHEMA IF NOT EXISTS auto DEFAULT CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS auto.categories
(
    id   INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(50)      NOT NULL,
    PRIMARY KEY (id),
    INDEX id_IDX (id ASC),
    UNIQUE KEY name_UNIQUE (name)
);

CREATE TABLE IF NOT EXISTS auto.marks
(
    id          INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    name        VARCHAR(50)      NOT NULL,
    category_id INT(10) UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    INDEX id_IDX (id ASC),
    UNIQUE KEY name_UNIQUE (name),
    CONSTRAINT category_id FOREIGN KEY (category_id)
        REFERENCES auto.categories (id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS auto.models
(
    id       INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    marka_id INT(10) UNSIGNED NOT NULL,
    name     VARCHAR(50)      NOT NULL,
    PRIMARY KEY (id),
    INDEX id_IDX (id ASC),
    UNIQUE KEY name_UNIQUE (name),
    CONSTRAINT marka_id FOREIGN KEY (marka_id)
        REFERENCES auto.marks (id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS auto.cities
(
    id   INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(50)      NOT NULL,
    PRIMARY KEY (id),
    INDEX id_IDX (id ASC),
    UNIQUE KEY name_UNIQUE (name)
);

CREATE TABLE IF NOT EXISTS auto.currencies
(
    id   INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(50)      NOT NULL,
    PRIMARY KEY (id),
    INDEX id_IDX (id ASC),
    UNIQUE KEY name_UNIQUE (name)
);

CREATE TABLE IF NOT EXISTS auto.advertisements
(
    id          INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    category_id INT(10) UNSIGNED NOT NULL,
    marka_id    INT(10) UNSIGNED NOT NULL,
    model_id    INT(10) UNSIGNED NOT NULL,
    city_id     INT(10) UNSIGNED NOT NULL,
    currency_id INT(10) UNSIGNED NOT NULL,
    price       INT(10) UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    INDEX id_IDX (id ASC),
    INDEX category_marka_model_city_IDX (category_id ASC, marka_id ASC, model_id ASC, city_id ASC),
    KEY category_id_idx (category_id),
    KEY marka_id_idx (marka_id),
    KEY model_id_idx (model_id),
    KEY city_id_idx (city_id),
    KEY currency_id_idx (currency_id),
    CONSTRAINT category_id_idx FOREIGN KEY (category_id)
        REFERENCES auto.categories (id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT marka_id_idx FOREIGN KEY (marka_id)
        REFERENCES auto.marks (id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT model_id_idx FOREIGN KEY (model_id)
        REFERENCES auto.models (id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT city_id_idx FOREIGN KEY (city_id)
        REFERENCES auto.cities (id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT currency_id_idx FOREIGN KEY (currency_id)
        REFERENCES auto.currencies (id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);


-- Наповненя тестовими даними:

INSERT INTO auto.categories (name)
VALUES ('Легкові'),
       ('Мото'),
       ('Вантажівки'),
       ('Причепи'),
       ('Спецтехніка'),
       ('Сільгосптехніка'),
       ('Автобуси');

INSERT INTO auto.marks (category_id, name)
VALUES (1, 'Audi'),
       (2, 'BMW'),
       (3, 'Chery'),
       (4, 'Chevrolet'),
       (5, 'Citroen');

INSERT INTO auto.models (marka_id, name)
VALUES (1, '80'),
       (1, '100'),
       (2, '3'),
       (2, '5'),
       (3, 'Amulet'),
       (3, 'Tiggo'),
       (4, 'Camaro'),
       (4, 'Aveo'),
       (5, 'C8'),
       (5, 'C4');

INSERT INTO auto.cities (name)
VALUES ('Київ'),
       ('Вінниця'),
       ('Житомир'),
       ('Кіровоград'),
       ('Полтава'),
       ('Суми'),
       ('Черкаси'),
       ('Чернігів');

INSERT INTO auto.currencies (name)
VALUES ('долар'),
       ('євро'),
       ('грн');

INSERT INTO auto.advertisements (category_id, marka_id, model_id, city_id, currency_id, price)
VALUES (1, 1, 1, 2, 1, '1500'),
       (1, 1, 1, 2, 1, '1000'),
       (2, 1, 2, 2, 1, '2000'),
       (3, 2, 3, 2, 1, '3000'),
       (4, 2, 4, 2, 1, '4000'),
       (5, 3, 5, 8, 1, '5000'),
       (5, 3, 6, 2, 1, '6000'),
       (5, 4, 7, 3, 1, '7000'),
       (5, 4, 8, 3, 1, '8000'),
       (5, 5, 9, 4, 1, '9000'),
       (5, 5, 10, 5, 1, '10000'),
       (5, 5, 10, 5, 1, '11000');
