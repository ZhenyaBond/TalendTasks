--src_customers
BEGIN
    EXECUTE IMMEDIATE 'drop table src_customers';
EXCEPTION
    WHEN OTHERS THEN
        IF
            sqlcode !=-942
        THEN
            RAISE;
        END IF;
END;
/
create table src_customers(
    ID number(10),
    Name varchar2(50),
    Username varchar2(50),
    Email varchar2(50),
    DateOfBirth date,
    StreetAddress varchar2(100),
    City varchar2(50),
    Country varchar2(50),
    Zip varchar2(10),
    State varchar2(8),
    Phone varchar(15)
);

--src_products
BEGIN
    EXECUTE IMMEDIATE 'drop table src_products';
EXCEPTION
    WHEN OTHERS THEN
        IF
            sqlcode !=-942
        THEN
            RAISE;
        END IF;
END;
/
create table src_products(
    Products number(10),
    ProductName varchar2(100),
    CompanyName varchar2(100),
    Price float(6),
    WarehouseLocationState varchar2(8)
);

--src_purchases
BEGIN
    EXECUTE IMMEDIATE 'drop table src_purchases';
EXCEPTION
    WHEN OTHERS THEN
        IF
            sqlcode !=-942
        THEN
            RAISE;
        END IF;
END;
/
create table src_purchases(
    PaymentID number(10),
    CustomerID number(10),
    ProductID number(10),
    TransactionDate date,
    CreditCard varchar2(20),
    CreditCardNumber varchar2(20)
);

--check_table
BEGIN
    EXECUTE IMMEDIATE 'drop table check_table';
EXCEPTION
    WHEN OTHERS THEN
        IF
            sqlcode !=-942
        THEN
            RAISE;
        END IF;
END;
/
create table check_table(
    filename varchar2(50)
);


--cls_customers
BEGIN
    EXECUTE IMMEDIATE 'drop table cls_customers';
EXCEPTION
    WHEN OTHERS THEN
        IF
            sqlcode !=-942
        THEN
            RAISE;
        END IF;
END;
/
create table cls_customers(
    ID_surr number(10) primary key,
    ID_code number(10),
    Name varchar2(50),
    Username varchar2(50),
    Email varchar2(50),
    DateOfBirth date,
    StreetAddress varchar2(100),
    City varchar2(50),
    Country varchar2(50),
    Zip varchar2(10),
    State varchar2(8),
    Phone varchar(15)
);

--cls_products
BEGIN
    EXECUTE IMMEDIATE 'drop table cls_products';
EXCEPTION
    WHEN OTHERS THEN
        IF
            sqlcode !=-942
        THEN
            RAISE;
        END IF;
END;
/
create table cls_products(
    Products_surr number(10) primary key,
    Products_code number(10),
    ProductName varchar2(100),
    CompanyName varchar2(100),
    Price float(6),
    WarehouseLocationState varchar2(8)
);



--dim_customers
BEGIN
    EXECUTE IMMEDIATE 'drop table dim_customers';
EXCEPTION
    WHEN OTHERS THEN
        IF
            sqlcode !=-942
        THEN
            RAISE;
        END IF;
END;
/
create table dim_customers(
    ID_surr number(10) primary key,
    ID_code number(10),
    Name varchar2(50),
    Username varchar2(50),
    Email varchar2(50),
    DateOfBirth date,
    StreetAddress varchar2(100),
    City varchar2(50),
    Country varchar2(50),
    Zip varchar2(10),
    State varchar2(8),
    Phone varchar(15)
);

--dim_products
BEGIN
    EXECUTE IMMEDIATE 'drop table dim_products';
EXCEPTION
    WHEN OTHERS THEN
        IF
            sqlcode !=-942
        THEN
            RAISE;
        END IF;
END;
/
create table dim_products(
    Products_surr number(10) primary key,
    Products_code number(10),
    ProductName varchar2(100),
    CompanyName varchar2(100),
    Price float(6),
    WarehouseLocationState varchar2(8)
);

-- fct_purchases
BEGIN
    EXECUTE IMMEDIATE 'drop table fct_purchases';
EXCEPTION
    WHEN OTHERS THEN
        IF
            sqlcode !=-942
        THEN
            RAISE;
        END IF;
END;
/
create table fct_purchases(
    PaymentID number(10),
    CustomerID number(10),
    ProductID number(10),
    TransactionDate date,
    CreditCard varchar2(20),
    CreditCardNumber varchar2(20),
    isInterState varchar2(8)
);

-- customers_seq
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE customers_seq';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE != -2289 THEN
      RAISE;
    END IF;
END;
/
CREATE SEQUENCE customers_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

-- products_seq
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE products_seq';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE != -2289 THEN
      RAISE;
    END IF;
END;
/
CREATE SEQUENCE products_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;