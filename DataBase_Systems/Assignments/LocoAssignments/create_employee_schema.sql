DROP DATABASE IF EXISTS employee;
CREATE DATABASE employee;
use employee;
DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS jobs;
DROP TABLE IF EXISTS job_history;
DROP TABLE IF EXISTS staffs;

create table locations(
	locationID int primary key,
    postalCode int,
    city varchar(25),
    countryID int
);

create table departments(
	departmentID int primary key,
    departmentName varchar (25),
    managerID int,
    locationID int,
    
    foreign key (locationID) references locations(locationID) 
);
create table jobs(
	jobID int primary key,
    jobTitle varchar (25),
    minSalary int,
    maxSalary int
);

create table staffs(
	employeeID int primary key,
    lastName varchar(25),
    firstName varchar(25),
    email varchar (30),
    hireDate date,
    jobID int,
    salary int,
    managerID int,
    departmentID int,
    
    foreign key (jobId) references jobs(jobID),
    foreign key (managerID) references staffs(employeeID),
    foreign key (departmentID) references departments(departmentID)
);
create table job_history(
	employeeID int ,
    startDate date ,
    endDate date,
    jobID int,
    departmentID int,
    primary key(employeeID, startDate),
    foreign key (employeeID) references staffs(employeeID),
    foreign key (jobID) references jobs(JobID)
    
    
);

