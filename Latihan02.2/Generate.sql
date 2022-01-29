-- Generator

CREATE DATABASE bank;
use bank;

CREATE TABLE branch (
    `branch-name` VARCHAR(250),
    `branch-city` VARCHAR(250),
    `assets`      TEXT,
    PRIMARY KEY (`branch-name`)
);

CREATE TABLE loan (
    `loan-number`   INT AUTO_INCREMENT,
    `branch-name`   VARCHAR(250),
    `amount`        INT,
    CONSTRAINT fk_branchName FOREIGN KEY
        (`branch-name`) REFERENCES branch(`branch-name`),
    PRIMARY KEY (`loan-number`)
);

CREATE TABLE account (
    `account-number`  INT AUTO_INCREMENT,
    `branch-name`     VARCHAR(250),
    balance           INT,
    PRIMARY KEY (`account-number`),
    CONSTRAINT fk_branchNameAcc  FOREIGN KEY
        (`branch-name`) REFERENCES branch(`branch-name`)
);

CREATE TABLE customer (
    `customer-name`   VARCHAR(250),
    `customer-street` TEXT,
    `customer-city`   BIGINT,
    PRIMARY KEY (`customer-name`)
);

CREATE TABLE borrower (
    `customer-name` VARCHAR(250),
    `loan-number`   INT,
    CONSTRAINT fk_borrowerCustomerName
        FOREIGN KEY (`customer-name`) REFERENCES customer(`customer-name`),
    CONSTRAINT fk_borrowerLoanNumberr
        FOREIGN KEY (`loan-number`) REFERENCES loan(`loan-number`)
);

CREATE TABLE depositor (
    `customer-name`     VARCHAR(250),
    `account-number`    INT,
    CONSTRAINT fk_depositorCustomerName
        FOREIGN KEY (`customer-name`) REFERENCES customer(`customer-name`),
    CONSTRAINT fk_accountNumber
        FOREIGN KEY (`account-number`) REFERENCES account(`account-number`)
)