CREATE TABLE "profile" (
"id"  SERIAL ,
"name" TEXT NOT NULL /* 名前 */,
"ruby" TEXT /* 名前のルビ */,
"zip" TEXT /* 郵便番号 */,
"address" TEXT /* 住所 */,
"tel" TEXT /* 電話番号 */,
"fax" TEXT /* FAX番号 */,
"photo" BYTEA /* 写真 */,
PRIMARY KEY ("id")
);
COMMENT ON TABLE "profile" IS 'プロフィール';
COMMENT ON COLUMN "profile"."name" IS '名前';
COMMENT ON COLUMN "profile"."ruby" IS '名前のルビ';
COMMENT ON COLUMN "profile"."zip" IS '郵便番号';
COMMENT ON COLUMN "profile"."address" IS '住所';
COMMENT ON COLUMN "profile"."tel" IS '電話番号';
COMMENT ON COLUMN "profile"."fax" IS 'FAX番号';
COMMENT ON COLUMN "profile"."photo" IS '写真';

CREATE TABLE "password" (
"id"  SERIAL ,
"value" TEXT NOT NULL ,
PRIMARY KEY ("id")
);

CREATE TABLE "profile_password" (
"id"  SERIAL ,
"id_profile" INTEGER NOT NULL ,
"id_password" INTEGER NOT NULL ,
"timestamp" TIMESTAMP NOT NULL ,
PRIMARY KEY ("id")
);

CREATE TABLE "note" (
"id"  SERIAL ,
"value" TEXT /* 備考の内容 */,
PRIMARY KEY ("id")
);
COMMENT ON TABLE "note" IS '備考';
COMMENT ON COLUMN "note"."value" IS '備考の内容';

CREATE TABLE "profile_note" (
"id"  SERIAL ,
"id_profile" INTEGER NOT NULL ,
"id_note" INTEGER NOT NULL ,
"timestamp" TIMESTAMP ,
PRIMARY KEY ("id")
);

CREATE TABLE "Company" (
"id"  SERIAL ,
"name" TEXT /* 会社名 */,
"brunch" TEXT /* 部署 */,
"post" TEXT /* 役職 */,
"tel" TEXT /* 電話番号 */,
"fax" TEXT /* FAX番号 */,
PRIMARY KEY ("id")
);
COMMENT ON TABLE "Company" IS '所属している会社の情報';
COMMENT ON COLUMN "Company"."name" IS '会社名';
COMMENT ON COLUMN "Company"."brunch" IS '部署';
COMMENT ON COLUMN "Company"."post" IS '役職';
COMMENT ON COLUMN "Company"."tel" IS '電話番号';
COMMENT ON COLUMN "Company"."fax" IS 'FAX番号';

CREATE TABLE "profile_company" (
"id"  SERIAL ,
"id_profile" INTEGER NOT NULL ,
"id_Company" INTEGER NOT NULL ,
"timestamp" TIMESTAMP ,
PRIMARY KEY ("id")
);

CREATE TABLE "relational_profile" (
"id"  SERIAL ,
"id_profile" INTEGER NOT NULL /* 自分のプロフィールID */,
"id_profile_other" INTEGER NOT NULL /* 他者のプロフィールID */,
"id_relational_status" INTEGER ,
PRIMARY KEY ("id")
);
COMMENT ON TABLE "relational_profile" IS 'プロフィールの繋り';
COMMENT ON COLUMN "relational_profile"."id_profile" IS '自分のプロフィールID';
COMMENT ON COLUMN "relational_profile"."id_profile_other" IS '他者のプロフィールID';

CREATE TABLE "relational_status" (
"id"  SERIAL ,
"timestamp" TIMESTAMP /* 出会いの時刻 */,
"location" GEOMETRY /* 出会った場所 */,
"photo" BYTEA /* 写真 */,
PRIMARY KEY ("id")
);
COMMENT ON TABLE "relational_status" IS '繋りの状態';
COMMENT ON COLUMN "relational_status"."timestamp" IS '出会いの時刻';
COMMENT ON COLUMN "relational_status"."location" IS '出会った場所';
COMMENT ON COLUMN "relational_status"."photo" IS '写真';

ALTER TABLE "profile_password" ADD FOREIGN KEY ("id_profile") REFERENCES "profile" ("id");
ALTER TABLE "profile_password" ADD FOREIGN KEY ("id_password") REFERENCES "password" ("id");
ALTER TABLE "profile_note" ADD FOREIGN KEY ("id_profile") REFERENCES "profile" ("id");
ALTER TABLE "profile_note" ADD FOREIGN KEY ("id_note") REFERENCES "note" ("id");
ALTER TABLE "profile_company" ADD FOREIGN KEY ("id_profile") REFERENCES "profile" ("id");
ALTER TABLE "profile_company" ADD FOREIGN KEY ("id_Company") REFERENCES "Company" ("id");
ALTER TABLE "relational_profile" ADD FOREIGN KEY ("id_profile") REFERENCES "profile" ("id");
ALTER TABLE "relational_profile" ADD FOREIGN KEY ("id_profile_other") REFERENCES "profile" ("id");
ALTER TABLE "relational_profile" ADD FOREIGN KEY ("id_relational_status") REFERENCES "relational_status" ("id");

