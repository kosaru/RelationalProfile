CREATE TABLE "profile" (
"id"  SERIAL ,
"mail" TEXT NOT NULL /* メールアドレス兼ログインアカウント */,
"name" TEXT NOT NULL /* 名前 */,
"ruby" TEXT /* 名前のルビ */,
"zip" TEXT /* 郵便番号 */,
"address" TEXT /* 住所 */,
"tel" TEXT /* 電話番号 */,
"fax" TEXT /* FAX番号 */,
PRIMARY KEY ("id")
);
COMMENT ON TABLE "profile" IS 'プロフィール';
COMMENT ON COLUMN "CREATE TABLE "profile" (
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

"."mail" IS 'メールアドレス兼ログインアカウント';
COMMENT ON COLUMN "profile"."name" IS '名前';
COMMENT ON COLUMN "profile"."ruby" IS '名前のルビ';
COMMENT ON COLUMN "profile"."zip" IS '郵便番号';
COMMENT ON COLUMN "profile"."address" IS '住所';
COMMENT ON COLUMN "profile"."tel" IS '電話番号';
COMMENT ON COLUMN "profile"."fax" IS 'FAX番号';

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
"timestamp" TIMESTAMP NOT NULL ,
PRIMARY KEY ("id")
);

CREATE TABLE "company" (
"id"  SERIAL ,
"name" TEXT /* 会社名 */,
"post" TEXT /* 役職 */,
"zip" TEXT ,
"address" TEXT ,
"tel" TEXT /* 電話番号 */,
"fax" TEXT /* FAX番号 */,
PRIMARY KEY ("id")
);
COMMENT ON TABLE "company" IS '所属している会社の情報';
COMMENT ON COLUMN "company"."name" IS '会社名';
COMMENT ON COLUMN "company"."post" IS '役職';
COMMENT ON COLUMN "company"."tel" IS '電話番号';
COMMENT ON COLUMN "company"."fax" IS 'FAX番号';

CREATE TABLE "affiliation" (
"id"  SERIAL ,
"id_profile" INTEGER NOT NULL ,
"id_branch" INTEGER ,
"timestamp" TIMESTAMP NOT NULL ,
PRIMARY KEY ("id")
);
COMMENT ON TABLE "affiliation" IS '企業版で利用 所属';

CREATE TABLE "relational_profile" (
"id"  SERIAL ,
"id_profile" INTEGER NOT NULL /* 自分のプロフィールID */,
"id_profile_other" INTEGER NOT NULL /* 他者のプロフィールID */,
PRIMARY KEY ("id")
);
COMMENT ON TABLE "relational_profile" IS 'プロフィールの繋り';
COMMENT ON COLUMN "relational_profile"."id_profile" IS '自分のプロフィールID';
COMMENT ON COLUMN "relational_profile"."id_profile_other" IS '他者のプロフィールID';

CREATE TABLE "relational_situation" (
"id"  SERIAL ,
"location" GEOMETRY /* 出会った場所 */,
"photo" BYTEA /* 写真 */,
"comment" TEXT NOT NULL /* 状況の説明 */,
PRIMARY KEY ("id")
);
COMMENT ON TABLE "relational_situation" IS '繋りの状態(何所で会ったか？)';
COMMENT ON COLUMN "relational_situation"."location" IS '出会った場所';
COMMENT ON COLUMN "relational_situation"."photo" IS '写真';
COMMENT ON COLUMN "relational_situation"."comment" IS '状況の説明';

CREATE TABLE "relational_profile_status" (
"id"  SERIAL ,
"id_relational_profile" INTEGER NOT NULL ,
"id_relational_status" INTEGER NOT NULL ,
"timestamp" TIMESTAMP NOT NULL ,
PRIMARY KEY ("id")
);
COMMENT ON TABLE "relational_profile_status" IS '何時会ったか';

CREATE TABLE "card" (
"id"  SERIAL ,
"value" BYTEA NOT NULL ,
PRIMARY KEY ("id")
);
COMMENT ON TABLE "card" IS '名刺 列についてはPending';

CREATE TABLE "profile_card" (
"id"  SERIAL ,
"id_profile" INTEGER ,
"id_card" INTEGER ,
"timestamp" TIMESTAMP NOT NULL ,
PRIMARY KEY ("id")
);

CREATE TABLE "photo" (
"id"  SERIAL ,
"value" BYTEA ,
PRIMARY KEY ("id")
);

CREATE TABLE "profile_photo" (
"id"  SERIAL ,
"id_profile" INTEGER ,
"id_photo" INTEGER ,
PRIMARY KEY ("id")
);

CREATE TABLE "branch" (
"id"  SERIAL ,
"id_branch" INTEGER ,
"id_company" INTEGER ,
"name" TEXT NOT NULL /* 所属名 */,
"timestamp" TIMESTAMP NOT NULL ,
PRIMARY KEY ("id")
);
COMMENT ON TABLE "branch" IS '部門';
COMMENT ON COLUMN "branch"."name" IS '所属名';

CREATE TABLE "profile_company" (
"id"  SERIAL ,
"id_profile" INTEGER ,
"id_company" INTEGER ,
"timestamp" TIMESTAMP NOT NULL ,
"branch_name" TEXT /* 部署名 */,
PRIMARY KEY ("id")
);
COMMENT ON TABLE "profile_company" IS '個人版サービスで利用';
COMMENT ON COLUMN "profile_company"."branch_name" IS '部署名';

CREATE TABLE "company_password" (
"id"  SERIAL ,
"id_company" INTEGER ,
"id_password" INTEGER ,
"timestamp" TIMESTAMP NOT NULL ,
PRIMARY KEY ("id")
);

CREATE TABLE "mail" (
"id"  SERIAL ,
"account" TEXT NOT NULL /* mail account */,
PRIMARY KEY ("id")
);
COMMENT ON TABLE "mail" IS 'メール情報';
COMMENT ON COLUMN "mail"."account" IS 'mail account';

CREATE TABLE "profile_mail" (
"id"  SERIAL ,
"id_profile" INTEGER ,
"id_mail" INTEGER ,
"timestamp" TIMESTAMP NOT NULL ,
PRIMARY KEY ("id")
);

ALTER TABLE "profile_password" ADD FOREIGN KEY ("id_profile") REFERENCES "profile" ("id");
ALTER TABLE "profile_password" ADD FOREIGN KEY ("id_password") REFERENCES "password" ("id");
ALTER TABLE "profile_note" ADD FOREIGN KEY ("id_profile") REFERENCES "profile" ("id");
ALTER TABLE "profile_note" ADD FOREIGN KEY ("id_note") REFERENCES "note" ("id");
ALTER TABLE "affiliation" ADD FOREIGN KEY ("id_profile") REFERENCES "profile" ("id");
ALTER TABLE "affiliation" ADD FOREIGN KEY ("id_branch") REFERENCES "branch" ("id");
ALTER TABLE "relational_profile" ADD FOREIGN KEY ("id_profile") REFERENCES "profile" ("id");
ALTER TABLE "relational_profile" ADD FOREIGN KEY ("id_profile_other") REFERENCES "profile" ("id");
ALTER TABLE "relational_profile_status" ADD FOREIGN KEY ("id_relational_profile") REFERENCES "relational_profile" ("id");
ALTER TABLE "relational_profile_status" ADD FOREIGN KEY ("id_relational_status") REFERENCES "relational_situation" ("id");
ALTER TABLE "profile_card" ADD FOREIGN KEY ("id_profile") REFERENCES "profile" ("id");
ALTER TABLE "profile_card" ADD FOREIGN KEY ("id_card") REFERENCES "card" ("id");
ALTER TABLE "profile_photo" ADD FOREIGN KEY ("id_profile") REFERENCES "profile" ("id");
ALTER TABLE "profile_photo" ADD FOREIGN KEY ("id_photo") REFERENCES "photo" ("id");
ALTER TABLE "branch" ADD FOREIGN KEY ("id_branch") REFERENCES "branch" ("id");
ALTER TABLE "branch" ADD FOREIGN KEY ("id_company") REFERENCES "company" ("id");
ALTER TABLE "profile_company" ADD FOREIGN KEY ("id_profile") REFERENCES "profile" ("id");
ALTER TABLE "profile_company" ADD FOREIGN KEY ("id_company") REFERENCES "company" ("id");
ALTER TABLE "company_password" ADD FOREIGN KEY ("id_company") REFERENCES "company" ("id");
ALTER TABLE "company_password" ADD FOREIGN KEY ("id_password") REFERENCES "password" ("id");
ALTER TABLE "profile_mail" ADD FOREIGN KEY ("id_profile") REFERENCES "profile" ("id");
ALTER TABLE "profile_mail" ADD FOREIGN KEY ("id_mail") REFERENCES "mail" ("id");

