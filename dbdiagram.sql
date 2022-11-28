CREATE TABLE "users" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "phone" varchar UNIQUE NOT NULL
);

CREATE TABLE "conversations" (
  "id" serial PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" varchar NOT NULL,
  "image_url" varchar NOT NULL
);

CREATE TABLE "messages" (
  "id" serial PRIMARY KEY,
  "user_id" int NOT NULL,
  "conversation_id" int NOT NULL,
  "content" text NOT NULL
);

CREATE TABLE "participantes" (
  "id" serial PRIMARY KEY,
  "user_id" int NOT NULL,
  "conversation_id" int NOT NULL,
  "is_admin" boolean DEFAULT false
);

ALTER TABLE "participantes" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "participantes" ADD FOREIGN KEY ("conversation_id") REFERENCES "conversations" ("id");

ALTER TABLE "messages" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "messages" ADD FOREIGN KEY ("conversation_id") REFERENCES "conversations" ("id");
