-- an init script to create a new db and fill it with some seed data
-- need to figure out how to persist the db and also how migrations should be done

-- select * from pg_database;

-- SELECT *
-- FROM pg_catalog.pg_tables
-- WHERE schemaname != 'pg_catalog' AND
--     schemaname != 'information_schema';

DROP TABLE IF EXISTS accounts CASCADE;
CREATE TABLE accounts (
  user_id serial PRIMARY KEY,
  username VARCHAR(25) NOT NULL,
  password VARCHAR(50) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  created_on TIMESTAMP NOT NULL,
  last_login TIMESTAMP
);

DROP TABLE IF EXISTS roles CASCADE;
CREATE TABLE roles(
   role_id serial PRIMARY KEY,
   role_name VARCHAR (255) UNIQUE NOT NULL
);

DROP TABLE IF EXISTS account_roles CASCADE;
CREATE TABLE account_roles (
  user_id INT NOT NULL,
  role_id INT NOT NULL,
  grant_date TIMESTAMP,
  PRIMARY KEY (user_id, role_id),
  FOREIGN KEY (role_id)
      REFERENCES roles (role_id),
  FOREIGN KEY (user_id)
      REFERENCES accounts (user_id)
);

DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
  id serial PRIMARY KEY,
  user_id INT DEFAULT NULL,
  title VARCHAR(255) NOT NULL,
  slug VARCHAR(255) NOT NULL UNIQUE,
  views INT NOT NULL DEFAULT '0',
  image varchar(255) NOT NULL,
  body text NOT NULL,
  published smallint NOT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp,
  FOREIGN KEY (user_id) REFERENCES accounts (user_id) ON DELETE NO ACTION ON UPDATE NO ACTION
)
