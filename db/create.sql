create database boradois_development;

create database boradois_test;

create database boradois_production;

grant all on boradois_development.* to 'iuri'@'localhost';

grant all on boradois_test.* to 'iuri'@'localhost';

grant all on boradois_production.* to 'prod'@'localhost' identified by 'wibble';
