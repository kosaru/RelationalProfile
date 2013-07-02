


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
"id_profile" INTEGER ,
"id_password" INTEGER ,
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
"id_profile" INTEGER ,
"id_note" INTEGER ,
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
"id_profile" INTEGER ,
"id_Company" INTEGER ,
"timestamp" DATE ,
PRIMARY KEY ("id")
);

ALTER TABLE "profile_password" ADD FOREIGN KEY ("id_profile") REFERENCES "profile" ("id");
ALTER TABLE "profile_password" ADD FOREIGN KEY ("id_password") REFERENCES "password" ("id");
ALTER TABLE "profile_note" ADD FOREIGN KEY ("id_profile") REFERENCES "profile" ("id");
ALTER TABLE "profile_note" ADD FOREIGN KEY ("id_note") REFERENCES "note" ("id");
ALTER TABLE "profile_company" ADD FOREIGN KEY ("id_profile") REFERENCES "profile" ("id");
ALTER TABLE "profile_company" ADD FOREIGN KEY ("id_Company") REFERENCES "Company" ("id");

