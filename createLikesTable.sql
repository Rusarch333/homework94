DROP TABLE IF EXISTS "likes";

CREATE TABLE IF NOT EXISTS "likes"(
  "id" bigserial PRIMARY KEY,
  "idContent" int NOT NULL,
  "idUser" int NOT NULL,
  "date" timestamp NOT NULL CHECK("date"<=current_timestamp) DEFAULT current_timestamp,
  UNIQUE("idContent", "idUser"), -- Користувач може лайкнути контент лише 1 раз
  FOREIGN KEY("idContent") REFERENCES "contents"("id"),
  FOREIGN KEY("idUser") REFERENCES "users"("id")
);

INSERT INTO "likes" ("idContent", "idUser", "date")
VALUES 
  (1, 2, '2024-01-11 16:00:00'),
  (2, 1, '2024-03-21 11:00:00'),
  (3, 3, '2024-02-16 20:00:00');