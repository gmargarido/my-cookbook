CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "cuisines" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE IF NOT EXISTS "recipe_types" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "recipes" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "difficulty" varchar, "cook_time" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "ingredients" varchar, "method" varchar, "cuisine_id" integer, "recipe_type_id" integer, "image_file_name" varchar, "image_content_type" varchar, "image_file_size" integer, "image_updated_at" datetime);
CREATE INDEX "index_recipes_on_cuisine_id" ON "recipes" ("cuisine_id");
CREATE INDEX "index_recipes_on_recipe_type_id" ON "recipes" ("recipe_type_id");
CREATE TABLE IF NOT EXISTS "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0 NOT NULL, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar, "last_sign_in_ip" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
INSERT INTO "schema_migrations" (version) VALUES
('20180219020413'),
('20180219020429'),
('20180221212957'),
('20180221213822'),
('20180221213856'),
('20180306205105'),
('20180320212644');


