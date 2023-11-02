CREATE TABLE `books` (
  `code` int NOT NULL AUTO_INCREMENT,
  `bookName` varchar(20) NOT NULL,
  `bookPrice` double NOT NULL,
  `bookType` varchar(10) NOT NULL,
  PRIMARY KEY (`code`)
);

CREATE TABLE `books_sell` (
  `bookCode` int NOT NULL,
  `bookSellPrice` double NOT NULL,
  `bookType` varchar(10) NOT NULL,
  PRIMARY KEY (`bookCode`)
);


DELIMITER $$
CREATE PROCEDURE INSERT_BOOK
(  IN _BOOKNAME VARCHAR(20), /* 전달 받을 파라미터 */
   _BOOKPRICE DOUBLE,        /* IN이 없어도 파라미터 전달 받을 수 있음 */
   _BOOKTYPE VARCHAR(10),    
   OUT RESULT INT            /* 결과를 반환할 파라미터  */
 )
 BEGIN 
   
   /* 변수 선언 */
   DECLARE SELL_PRICE DOUBLE;
   DECLARE INSERTID INT;
   
   /* SQL에러 발생시 ROLLBACK */
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
     BEGIN
        ROLLBACK;
        SET RESULT = -1;
     END;
     
     /* 트랜잭션 시작 */
     START TRANSACTION;
     
     /* books table에 insert */
     INSERT INTO books(bookName, bookPrice, bookType) VALUE(_BOOKNAME, _BOOKPRICE, _BOOKTYPE);
     
     /* books table에 insert한 key 반환 */
     SET INSERTID = LAST_INSERT_ID(); 
     
     IF _BOOKTYPE = 'novel' THEN
       SET SELL_PRICE = _BOOKPRICE + _BOOKPRICE * (10/100);
     ELSEIF _BOOKTYPE = 'art' THEN
       SET SELL_PRICE = _BOOKPRICE + _BOOKPRICE * (15/100);
     ELSE
       SET SELL_PRICE = _BOOKPRICE + _BOOKPRICE * (20/100);
     END IF;
     
     INSERT INTO books_sell(bookCode, bookSellPrice, bookType) VALUE(INSERTID, SELL_PRICE, _BOOKTYPE);
   
   /* 커밋 */
   COMMIT;
   
   /* 잘되면 1 반환 */
   SET RESULT = 1;
   
END $$
DELIMITER ;

-- 프로시저에서는 값을 정상 삽입했는지 확인가능하다. 여러 SQL문을 실행할수 있다.
CALL INSERT_BOOK('홀길동전', 10000, 'novel', @RESULT);
SELECT @RESULT;

CALL INSERT_BOOK('이솝우화', 15000, 'art', @RESULT);
SELECT @RESULT;

CALL INSERT_BOOK('검정고무신', 20000, 'action', @RESULT);
SELECT @RESULT;

select * from books;
select * from books_sell;

