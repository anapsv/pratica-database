Criar database:

CREATE DATABASE "database_pratica";

Criar tabela transactions:

CREATE TYPE transactiontype AS ENUM ('deposit', 'withdraw');

CREATE TABLE "transactions" (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"(id),
	"amount" INTEGER NOT NULL,
	"type" transactiontype NOT NULL,
	"time" TIMESTAMP NOT NULL,
	"description" TEXT,
	"cancelled" BOOLEAN NOT NULL
);
	
CREATE TABLE "transactions" (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"(id),
	"amount" INTEGER NOT NULL,
	"type" transactiontype NOT NULL,
	"time" TIMESTAMP NOT NULL,
	"description" TEXT,
	"cancelled" BOOLEAN NOT NULL	
);

Criar tabela bankAccount:

CREATE TABLE "bankAccount" (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES customers(id),
	"accountNumber" TEXT NOT NULL UNIQUE,
	"agency" TEXT NOT NULL UNIQUE,
	"openDate" TIMESTAMP NOT NULL DEFAULT NOW(),
	"closeDate" TIMESTAMP
);

CREATE TABLE states (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"name" TEXT NOT NULL 
);

CREATE TABLE cities (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"name" TEXT NOT NULL,
	"stateId" INTEGER NOT NULL REFERENCES states(id)
);
	
CREATE TABLE customers (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"fullName" TEXT NOT NULL,
	"cpf" VARCHAR(11) NOT NULL UNIQUE,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL
);
	
CREATE TABLE "customerAddresses" (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES customers(id),
	"street" TEXT NOT NULL,
	"number" INTEGER NOT NULL,
	"complement" TEXT,
	"postalCode" VARCHAR(8) NOT NULL,
	"cityId" INTEGER NOT NULL REFERENCES cities(id)
);
	
CREATE TYPE phonetype AS ENUM ('landline','mobile');
	
CREATE TABLE "customerPhones" (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES customers(id),
	"number" INTEGER NOT NULL,
	"type" phonetype NOT NULL
);
	
	
