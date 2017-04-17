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
