CREATE TABLE "profile" (
"id"  SERIAL ,
"name" TEXT NOT NULL ,
"ruby" TEXT ,
"zip" TEXT ,
"address" TEXT ,
"tel" TEXT ,
"fax" TEXT ,
PRIMARY KEY ("id")
);

CREATE TABLE "password" (
"id"  SERIAL ,
"value" TEXT NOT NULL ,
PRIMARY KEY ("id")
);

CREATE TABLE "profile_password" (
"id"  SERIAL ,
"id_profile" INTEGER NOT NULL ,
"id_password" INTEGER NOT NULL ,
"timestamp" DATE NOT NULL ,
PRIMARY KEY ("id")
);

CREATE TABLE "note" (
"id"  SERIAL ,
"value" TEXT ,
PRIMARY KEY ("id")
);

CREATE TABLE "profile_note" (
"id"  SERIAL ,
"id_profile" INTEGER NOT NULL ,
"id_note" INTEGER NOT NULL ,
"timestamp" DATE ,
PRIMARY KEY ("id")
);

CREATE TABLE "Company" (
"id"  SERIAL ,
"name" TEXT ,
"brunch" TEXT ,
"post" TEXT ,
"tel" TEXT ,
"fax" TEXT ,
PRIMARY KEY ("id")
);

CREATE TABLE "profile_company" (
"id"  SERIAL ,
"id_profile" INTEGER NOT NULL ,
"id_Company" INTEGER NOT NULL ,
"timestamp" DATE ,
PRIMARY KEY ("id")
);

CREATE TABLE "profile_profile" (
"id"  SERIAL ,
"id_profile" INTEGER NOT NULL ,
"id_profile_other" INTEGER NOT NULL ,
"timestamp" DATE NOT NULL ,
"location" TEXT NOT NULL ,
"photo" BYTEA NOT NULL ,
PRIMARY KEY ("id")
);

ALTER TABLE "profile_password" ADD FOREIGN KEY ("id_profile") REFERENCES "profile" ("id");
ALTER TABLE "profile_password" ADD FOREIGN KEY ("id_password") REFERENCES "password" ("id");
ALTER TABLE "profile_note" ADD FOREIGN KEY ("id_profile") REFERENCES "profile" ("id");
ALTER TABLE "profile_note" ADD FOREIGN KEY ("id_note") REFERENCES "note" ("id");
ALTER TABLE "profile_company" ADD FOREIGN KEY ("id_profile") REFERENCES "profile" ("id");
ALTER TABLE "profile_company" ADD FOREIGN KEY ("id_Company") REFERENCES "Company" ("id");
ALTER TABLE "profile_profile" ADD FOREIGN KEY ("id_profile") REFERENCES "profile" ("id");
ALTER TABLE "profile_profile" ADD FOREIGN KEY ("id_profile_other") REFERENCES "profile" ("id");

