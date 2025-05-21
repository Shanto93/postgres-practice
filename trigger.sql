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