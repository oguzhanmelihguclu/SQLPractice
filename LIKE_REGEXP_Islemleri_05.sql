use kendicalismalarim;

CREATE TABLE maaslarOguz(
id CHAR(5),
isim VARCHAR(50),
maas INT
);

INSERT INTO maaslarOguz VALUES('10001','Ahmet Aslan',7000);
INSERT INTO maaslarOguz VALUES('10002','Mehmet Yilmaz',12000);
INSERT INTO maaslarOguz VALUES('10003','Meryem',7215);
INSERT INTO maaslarOguz VALUES('10004','Veli Han',5000);
INSERT INTO maaslarOguz VALUES('10005','Mustafa Ali',5500);
INSERT INTO maaslarOguz VALUES('10006','Ayse Can',5600);
INSERT INTO maaslarOguz VALUES('10010','Ayse',4700);
INSERT INTO maaslarOguz VALUES('10009','Ayse Cemile',4000);
INSERT INTO maaslarOguz VALUES('10008','Ayse Fatma',4300);
INSERT INTO maaslarOguz VALUES('10007','Beyza Ayse',7700);
INSERT INTO maaslarOguz VALUES('10011','Yeliz Alina',12700);

SELECT * FROM maaslarOguz;


/*  
=============================  SORU-1 =============================
    maaslarOguz tablosundan dort harfli personeli listeleyiniz.
===================================================================
 */
 
  
 SELECT * FROM maaslarOguz
 WHERE isim LIKE  '____';
 
  /*  
=============================  SORU-2 =============================
    maaslarOguz tablosundan isminde a bulunan personeli listeleyiniz.
===================================================================
 */
 
 SELECT * FROM maaslarOguz
 WHERE isim LIKE '%a%';
 
   /*  
=============================  SORU-3 =============================
    maaslarOguz tablosundan ismi Ayse olan personeli listeleyiniz.
===================================================================
 */

SELECT * FROM maaslarOguz
WHERE isim LIKE '%Ayse%'; 

/*  
=============================  SORU-4 =============================
    maaslarOguz tablosundan ismi 'a' ile biten personeli listeleyiniz.
===================================================================
 */
 
SELECT * FROM maaslarOguz
WHERE isim LIKE '%A';

/*  
=============================  SORU-5 =============================
    maaslarOguz tablosundan isminin 2. harfi 'e' olan personeli listeleyiniz
===================================================================
 */ 
 
SELECT * FROM maaslarOguz
WHERE isim LIKE '_e%';

/*  
=============================  SORU-6 =============================
    maaslarOguz tablosundan Isminin 2. harfi 'e' olup diger harflerinde 'y' 
    olan personeli listeleyiniz
===================================================================
 */
 
SELECT * FROM maaslarOguz
WHERE isim LIKE '_e%' AND isim LIKE '%y%';

 /*  
=============================  SORU-7 =============================
    maaslarOguz tablosundan maasi 5 haneli olan personel isimlerini listeleyiniz
===================================================================
 */
 
 SELECT isim FROM maaslarOguz
 WHERE maas LIKE '_____';
 
  
/*  
=============================  SORU-8 =============================
    maaslarOguz tablosundan isminin 1. harfi 'a' ve 7. harfi 'a' olan 
    personeli listeleyiniz
===================================================================
 */
 
 SELECT * FROM maaslarOguz
 WHERE isim LIKE 'a%' AND isim LIKE '______a%';
 
 
 SELECT * FROM maaslarOguz
 WHERE isim LIKE 'a_____a%';
 
 
  /* 
===============================================
		   REGEXP_LIKE OPERATORU 
===============================================

1- "REGEXP_LIKE" (veya bazen "RLIKE" olarak da bilinir), daha karmaşık ve 
   güçlü bir arama yapmak için düzenli ifadeleri (regular expressions) kullanır.
2- Düzenli ifadeler, metin içindeki PATERN'leri tanımlamak için kullanılan bir dil 
   veya sözdizimidir.
3- "REGEXP" operatörü, çok daha spesifik ve esnek aramalar yapmanıza olanak tanır.
4- [!-~] = Butun karakterleri karsilayan tek bir karakteri ifade eder.
   [a-zA-Z0-9] = Harf ve rakamlari temsil eden bir karakteri ifade eder.
5- '^' isareti baslangici belirtir.
6- '$' isareti bitisi belirtir.  
7- '|' karakteri veya anlaminda kullanilir.
8- '.' herhangi bir tek karakter anlamina gelir'

 
Örneğin, "REGEXP '^J.*son$'" ifadesi "J" ile başlayıp "son" ile biten tüm metin değerlerini bulur
 (örn. "Jason" ama "Wilson" değil).
*/

/*
*************** SYNTAX ***************
 SELECT sutun1,sutun2,...
 FROM tablo_adi
 WHERE REGEXP_LIKE(sutun_adi, 'pattern[]');
*/



CREATE TABLE kelimelerOguz
    (
        id int UNIQUE,
        kelime VARCHAR(50),
        harf_sayisi int
    );

INSERT INTO kelimelerOguz VALUES 
    (1001, 'hot', 3),
	(1002, 'hat', 3),
	(1003, 'hit', 3),
	(1004, 'hbt', 3),
	(1005, 'hct', 3),
    (1006, 'adem', 4),
    (1007, 'selim', 5),
    (1008, 'yusuf', 5),
    (1009, 'hip', 3),
    (1010, 'HOT', 3),
    (1011, 'hOt', 3),
    (1012, 'h9t', 3),
    (1013, 'hoot', 4),
    (1014, 'haaat', 5),
    (1015, 'hooooot', 7),
	(1016, 'h-t', 3),
    (1017, 'h?t', 3),
    (1018, 'hOOOt', 5),
    (1019, 'O', 1);
    
    SELECT * FROM kelimelerOguz;
    
    /*  
=============================  SORU-9 =============================
    Kelimeler tablosundan icerisinde 'ot' veya 'at' bulunan kelimeleri
    listeleyiniz
===================================================================
 */
 SELECT kelime FROM kelimelerOguz
 WHERE kelime LIKE '%ot%' OR  kelime LIKE '%at%' ;
 
  SELECT kelime FROM kelimelerOguz
 WHERE REGEXP_LIKE (kelime, 'ot|at'); 
 
 /*  
=============================  SORU-10 =============================
    Kelimeler tablosundan icerisinde 'ot' veya 'at' bulunan kelimeleri
    case-sensitive'e dikkat ederek listeleyiniz.
===================================================================
 */ 
 -- hic bir sey soylemezsek, default olarak case sensitive olmadan arama yapar  
SELECT kelime FROM kelimelerOguz
WHERE REGEXP_LIKE (kelime, 'ot|at'); 

-- case sensitive onemli oldugunda
SELECT kelime FROM kelimelerOguz
WHERE REGEXP_LIKE (kelime, 'ot|at', 'c'); 

-- case sensitive OLMADIGINI vurgulamak isterseniz
SELECT kelime FROM kelimelerOguz
WHERE REGEXP_LIKE (kelime, 'ot|at', 'i'); 

/*  
=============================  SORU-11 =============================
    Kelimeler tablosunda icinde 'ho' veya 'hi' gecen kelimeleri 
    case-sensitive'e dikkat etmeksizin listeleyiniz.
===================================================================
 */ 
 
 SELECT kelime FROM kelimelerOguz
 WHERE REGEXP_LIKE (kelime, 'ho|hi','i');

 
 /*  
=============================  SORU-12 =============================
    Kelimeler tablosundan sonu 't' veya 'm' ile bitenleri 
    case-sensitive'e dikkat etmeksizin listeleyiniz.
===================================================================
 */
 
 SELECT kelime FROM kelimelerOguz
 WHERE REGEXP_LIKE (kelime, 't$|m$','i');
 
  /*  
=============================  SORU-10 =============================
    Kelimeler tablosundan sonu 't' veya 'm' ile bitenleri 
    case-sensitive'e dikkat etmeksizin listeleyiniz.
===================================================================
 */
 
 SELECT kelime FROM kelimelerOguz
 WHERE REGEXP_LIKE (kelime, 't$|m$','i');
 
 /*  
=============================  SORU-11 =============================
    Kelimeler tablosundan h ile baslayip t ile biten 3 harfli kelimeleri 
    (h ile t kucuk harfli olanlari) listeleyiniz.
===================================================================
 */
 
 SELECT kelime FROM kelimelerOguz
 WHERE kelime LIKE 'h_t'; 
 
 
 
 
 /*  
=============================  SORU-12 =============================
    Kelimeler tablosundan 'h' ile baslayip 't' ile biten 2. karakteri rakam 
    olan 3 harfli kelimeleri (h ile t kucuk harfli olanlari) listeleyiniz
===================================================================
 */
 
 
  SELECT kelime FROM kelimelerOguz
 WHERE REGEXP_LIKE (kelime,'^h[0-9]t$','c');
 
 
 
 /*  
=============================  SORU-13 =============================
    Kelimeler tablosundan 'h' ile baslayip 't' ile biten 2. karakteri buyuk 
    harf olan 3 harfli kelimeleri (h ile t kucuk harfli olanlari) listeleyiniz
===================================================================
 */
   SELECT kelime FROM kelimelerOguz
 WHERE REGEXP_LIKE (kelime,'^h[A-Z]t$','c');
 
 
 
 /*  
=============================  SORU-14 =============================
    Kelimeler tablosundan 2. harfi 'O' (buyuk O harfli) olan 3 karakterli 
    kelimeleri ve id'lerini listeleyiniz
===================================================================
 */
 
  
SELECT kelime, id FROM kelimelerOguz
WHERE  REGEXP_LIKE (kelime,'^.O.$','c');



 
 
