create table myr_person (
  id character(36) primary key,
  nick character varying(24) not null,
  email character varying (255) not null,
  lang character(2) default 'de',
  last_login timestamp with time zone,
  created  timestamp with time zone DEFAULT ('now'::text)::timestamp with time zone,
  modified timestamp with time zone DEFAULT ('now'::text)::timestamp with time zone,
) 
with (oids = false);

create unique index myr_person_email on myr_person(email);
create unique index myr_person_nick on myr_person(nick);


create table myr_image(
  id character(36) primary key,
  person_id character(36) not null,
  created  timestamp with time zone DEFAULT ('now'::text)::timestamp with time zone,
  modified timestamp with time zone DEFAULT ('now'::text)::timestamp with time zone,
  img_title character varying (80) not null,
  img_description character varying(250),
  img_filesize integer,
  img_internalfilename character varying(40),
  img_type character varying(12),
  img_height integer,
  img_width integer
) 
with (oids = false);

ALTER TABLE ONLY myr_image
    ADD CONSTRAINT image_person_fk FOREIGN KEY (person_id) REFERENCES myr_person(id);


