DROP TABLE IF EXISTS "comments";

CREATE TABLE IF NOT EXISTS "comments" (
  "id" bigserial PRIMARY KEY,
  "idContent" int NOT NULL,     
  "idAuthor" int NOT NULL,
  "text" text NOT NULL CHECK("text"!=''),
  "date" timestamp NOT NULL CHECK("date"<=current_timestamp) DEFAULT current_timestamp,
  FOREIGN KEY("idContent") REFERENCES "contents"("id"),
  FOREIGN KEY("idAuthor") REFERENCES "users"("id")
);

INSERT INTO "comments"("idContent", "idAuthor", "text", "date")
VALUES 
  (1, 2, 'This video is absolutely amazing! The scenery is breathtaking.', '2024-01-11 15:00:00'),
  (2, 1, 'Great review! I’m excited to try out the new gadgets you mentioned.', '2024-03-21 10:00:00'),
  (3, 3, 'The pasta recipes were very helpful. The instructions were clear and easy to follow.', '2024-02-16 19:00:00');