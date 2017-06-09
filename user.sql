create user scientist_ninja identified by scientist_ninja
default tablespace users temporary tablespace temp
quota unlimited on users;
grant create session, create table, create procedure, create type to scientist_ninja;
grant create any context to scientist_ninja;
exit;
