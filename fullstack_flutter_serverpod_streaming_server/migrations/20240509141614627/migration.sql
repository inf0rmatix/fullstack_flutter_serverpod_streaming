BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "text_message" (
    "id" serial PRIMARY KEY,
    "author" text NOT NULL,
    "text" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "text_message_timestamp_index" ON "text_message" USING btree ("timestamp");


--
-- MIGRATION VERSION FOR fullstack_flutter_serverpod_streaming
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('fullstack_flutter_serverpod_streaming', '20240509141614627', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240509141614627', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240115074235544', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074235544', "timestamp" = now();


COMMIT;
