CREATE TABLE "profile" (
"id"  SERIAL ,
"mail" TEXT NOT NULL /* メールアドレス兼ログインアカウント */,
"name" TEXT NOT NULL /* 名前 */,
"ruby" TEXT /* 名前のルビ */,
"zip" TEXT /* 郵便番号 */,
"address" TEXT /* 住所 */,
"tel" TEXT /* 電話番号 */,
"fax" TEXT /* FAX番号 */,
"created_at" TIMESTAMP NOT NULL ,
"updated_at" TIMESTAMP NOT NULL ,
PRIMARY KEY ("id")
);
COMMENT ON TABLE "profile" IS 'プロフィール';
COMMENT ON COLUMN "profile"."mail" IS 'メールアドレス兼ログインアカウント';
COMMENT ON COLUMN "profile"."name" IS '名前';
COMMENT ON COLUMN "profile"."ruby" IS '名前のルビ';
COMMENT ON COLUMN "profile"."zip" IS '郵便番号';
COMMENT ON COLUMN "profile"."address" IS '住所';
COMMENT ON COLUMN "profile"."tel" IS '電話番号';
COMMENT ON COLUMN "profile"."fax" IS 'FAX番号';

CREATE TABLE "passwords" (
"id"  SERIAL ,
"id_profile" INTEGER ,
"id_companie" INTEGER ,
"value" TEXT NOT NULL ,
"created_at" TIMESTAMP NOT NULL ,
PRIMARY KEY ("id")
);

CREATE TABLE "notes" (
"id"  SERIAL ,
"id_profile" INTEGER ,
"value" TEXT /* 備考の内容 */,
"created_at" TIMESTAMP NOT NULL ,
PRIMARY KEY ("id")
);
COMMENT ON TABLE "notes" IS '備考';
COMMENT ON COLUMN "notes"."value" IS '備考の内容';

CREATE TABLE "companies" (
"id"  SERIAL ,
"id_profile" INTEGER ,
"name" TEXT /* 会社名 */,
"branch_name" TEXT ,
"post" TEXT /* 役職 */,
"zip" TEXT ,
"address" TEXT ,
"tel" TEXT /* 電話番号 */,
"fax" TEXT /* FAX番号 */,
"created_at" TIMESTAMP NOT NULL ,
PRIMARY KEY ("id")
);
COMMENT ON TABLE "companies" IS '所属している会社の情報';
COMMENT ON COLUMN "companies"."name" IS '会社名';
COMMENT ON COLUMN "companies"."post" IS '役職';
COMMENT ON COLUMN "companies"."tel" IS '電話番号';
COMMENT ON COLUMN "companies"."fax" IS 'FAX番号';

CREATE TABLE "affiliations" (
"id"  SERIAL ,
"id_profile" INTEGER NOT NULL ,
"id_branch" INTEGER ,
"created_at" TIMESTAMP NOT NULL ,
PRIMARY KEY ("id")
);
COMMENT ON TABLE "affiliations" IS '企業版で利用 所属';

CREATE TABLE "relational_profile" (
"id"  SERIAL ,
"id_profile" INTEGER NOT NULL /* 自分のプロフィールID */,
"id_profile_other" INTEGER NOT NULL /* 他者のプロフィールID */,
"created_at" TIMESTAMP NOT NULL ,
PRIMARY KEY ("id")
);
COMMENT ON TABLE "relational_profile" IS 'プロフィールの繋り';
COMMENT ON COLUMN "relational_profile"."id_profile" IS '自分のプロフィールID';
COMMENT ON COLUMN "relational_profile"."id_profile_other" IS '他者のプロフィールID';

CREATE TABLE "relational_situations" (
"id"  SERIAL ,
"id_relational_profile" INTEGER ,
"location" GEOMETRY /* 出会った場所 */,
"photo" BYTEA /* 写真 */,
"comment" TEXT NOT NULL /* 状況の説明 */,
"created_at" TIMESTAMP ,
PRIMARY KEY ("id")
);
COMMENT ON TABLE "relational_situations" IS '繋りの状態(何所で会ったか？)';
COMMENT ON COLUMN "relational_situations"."location" IS '出会った場所';
COMMENT ON COLUMN "relational_situations"."photo" IS '写真';
COMMENT ON COLUMN "relational_situations"."comment" IS '状況の説明';

CREATE TABLE "cards" (
"id"  SERIAL ,
"id_profile" INTEGER ,
"value" BYTEA NOT NULL ,
"created_at" TIMESTAMP NOT NULL ,
PRIMARY KEY ("id")
);
COMMENT ON TABLE "cards" IS '名刺 列についてはPending';

CREATE TABLE "photos" (
"id"  SERIAL ,
"id_profile" INTEGER ,
"value" BYTEA ,
"created_at" TIMESTAMP NOT NULL ,
PRIMARY KEY ("id")
);

CREATE TABLE "branches" (
"id"  SERIAL ,
"id_branch" INTEGER ,
"id_company" INTEGER ,
"name" TEXT NOT NULL /* 所属名 */,
"created_at" TIMESTAMP NOT NULL ,
PRIMARY KEY ("id")
);
COMMENT ON TABLE "branches" IS '部門';
COMMENT ON COLUMN "branches"."name" IS '所属名';

CREATE TABLE "mails" (
"id"  SERIAL ,
"id_profile" INTEGER ,
"account" TEXT NOT NULL /* mail account */,
"created_at" TIMESTAMP NOT NULL ,
PRIMARY KEY ("id")
);
COMMENT ON TABLE "mails" IS 'メール情報';
COMMENT ON COLUMN "mails"."account" IS 'mail account';

ALTER TABLE "passwords" ADD FOREIGN KEY ("id_profile") REFERENCES "profile" ("id");
ALTER TABLE "passwords" ADD FOREIGN KEY ("id_companie") REFERENCES "companies" ("id");
ALTER TABLE "notes" ADD FOREIGN KEY ("id_profile") REFERENCES "profile" ("id");
ALTER TABLE "companies" ADD FOREIGN KEY ("id_profile") REFERENCES "profile" ("id");
ALTER TABLE "affiliations" ADD FOREIGN KEY ("id_profile") REFERENCES "profile" ("id");
ALTER TABLE "affiliations" ADD FOREIGN KEY ("id_branch") REFERENCES "branches" ("id");
ALTER TABLE "relational_profile" ADD FOREIGN KEY ("id_profile") REFERENCES "profile" ("id");
ALTER TABLE "relational_profile" ADD FOREIGN KEY ("id_profile_other") REFERENCES "profile" ("id");
ALTER TABLE "relational_situations" ADD FOREIGN KEY ("id_relational_profile") REFERENCES "relational_profile" ("id");
ALTER TABLE "cards" ADD FOREIGN KEY ("id_profile") REFERENCES "profile" ("id");
ALTER TABLE "photos" ADD FOREIGN KEY ("id_profile") REFERENCES "profile" ("id");
ALTER TABLE "branches" ADD FOREIGN KEY ("id_branch") REFERENCES "branches" ("id");
ALTER TABLE "branches" ADD FOREIGN KEY ("id_company") REFERENCES "companies" ("id");
ALTER TABLE "mails" ADD FOREIGN KEY ("id_profile") REFERENCES "profile" ("id");

