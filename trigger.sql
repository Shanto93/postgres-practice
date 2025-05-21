CREATE Table my_user (
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);

INSERT INTO
    my_user (username, email)
VALUES ('rabbi', 'rabbi@gmail.com'),
    ('habiba', 'habiba@gmail.com')

SELECT * FROM my_user;

SELECT * FROM deleted_users_audit;

CREATE TABLE deleted_users_audit (
    deleted_user_name VARCHAR(50) NOT NULL,
    deleted_at TIMESTAMP
)

CREATE or REPLACE FUNCTION save_deleted_user()
RETURNS TRIGGER
LANGUAGE PLPGSQL AS
    $$
        BEGIN
            INSERT INTO deleted_users_audit VALUES (OLD.username, now());
            RAISE NOTICE 'Deleted users odit table updated'; 
            RETURN OLD;
        END
    $$

CREATE or REPLACE TRIGGER save_deleted_user_trigger
BEFORE DELETE ON my_user
FOR EACH ROW
EXECUTE FUNCTION save_deleted_user();

DELETE FROM my_user WHERE username = 'rabbi';

-------------------------Another Trigger Example Practice-----------------------------------------

CREATE TABLE shop (
    shop_id SERIAL PRIMARY KEY,
    shop_name VARCHAR(50) NOT NULL,
    location VARCHAR(100) NOT NULL
)

INSERT INTO
    shop (shop_name, location)
VALUES ('shop1', 'Dhaka'),
    ('shop2', 'Chittagong'),
    ('shop3', 'Khulna'),
    ('shop4', 'Rajshahi'),
    ('shop5', 'Sylhet'),
    ('shop6', 'Barisal');

SELECT * FROM shop;

CREATE TABLE deleted_shops_audit (
    deleted_shop_name VARCHAR(50) NOT NULL,
    deleted_at TIMESTAMP
);

--Create a function to save deleted shop names
CREATE or REPLACE FUNCTION save_deleted_shops_info()
RETURNS TRIGGER
LANGUAGE PLPGSQL AS
    $$
        BEGIN
            INSERT INTO deleted_shops_audit VALUES(OLD.shop_name, now());
            RAISE NOTICE 'Deleted shops audit table updated';
            RETURN OLD;
        END
    $$

--Creating Trigger function for deleted shops audit

CREATE or REPLACE TRIGGER save_deleted_shops_trigger
BEFORE DELETE ON shop
FOR EACH ROW
EXECUTE FUNCTION save_deleted_shops_info();

SELECT * FROM deleted_shops_audit;

SELECT * FROM shop;

DELETE FROM shop WHERE shop_name = 'shop2';