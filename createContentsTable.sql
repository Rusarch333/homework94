DROP TABLE IF EXISTS "contents";

CREATE TABLE IF NOT EXISTS "contents"(
  "id" serial PRIMARY KEY,
  "title" varchar(100) NOT NULL CHECK("title"!=''),
  "description" text,
  "dateUpload" timestamp NOT NULL CHECK("dateUpload"<=current_timestamp) DEFAULT current_timestamp,
  "countViews" bigint NOT NULL CHECK("countViews">=0) DEFAULT 0,
  "countLikes" int NOT NULL CHECK("countLikes">=0) DEFAULT 0,
  "countDislikes" int NOT NULL CHECK("countDislikes">=0) DEFAULT 0,
  "idUploader" int NOT NULL,
  FOREIGN KEY("idUploader") REFERENCES "users"("id")
);

INSERT INTO "contents"("title", "description", "dateUpload", "countViews", "countLikes", "countDislikes", "idUploader")
VALUES 
  ('Amazing Nature Video', 'A stunning video showcasing the beauty of nature.', '2024-01-10 14:32:00', 15000, 3000, 50, 1),
  ('Tech Review 2024', 'In-depth review of the latest tech gadgets of 2024.', '2024-03-20 09:45:00', 8000, 1200, 30, 2),
  ('Cooking Show: Pasta Recipes', 'Learn to cook delicious pasta recipes in this cooking show.', '2024-02-15 18:00:00', 5000, 800, 20, 3);