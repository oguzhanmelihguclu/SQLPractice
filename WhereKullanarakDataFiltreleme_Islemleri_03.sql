use kendicalismalarim;

-- kitaplar tablosunda Lev Tolstoy'a ait kitaplarin
-- ismini, yayin tarihini ve kategorisini listeleyin

SELECT * FROM kitaplarOguz;

SELECT kitap_adi,yayin_yili,kategori FROM kitaplarOguz
WHERE yazar_adi = 'Lev Tolstoy';


CREATE TABLE kisilerOguz
(
id INT,
isim VARCHAR(30),
soyisim VARCHAR(30),
yas INT,
sehir VARCHAR(20)
);

INSERT INTO kisilerOguz () VALUES (1,'Ahmet', 'Yılmaz', 30, 'Ankara');
INSERT INTO kisilerOguz () VALUES (2,'Mehmet', 'Kara', 25, 'İstanbul');
INSERT INTO kisilerOguz () VALUES (3,'Ayşe', 'Kaya', 22, 'İzmir');
INSERT INTO kisilerOguz () VALUES (4,'Fatma', 'Güneş', 28, 'Bursa');
INSERT INTO kisilerOguz () VALUES (5,'Ali', 'Çelik', 35, 'Antalya');
INSERT INTO kisilerOguz () VALUES (6,'Elif', 'Demir', 29, 'Ankara');
INSERT INTO kisilerOguz () VALUES (7,'Can', 'Özdemir', 33, 'İstanbul');
INSERT INTO kisilerOguz () VALUES (8,'Deniz', 'Arslan', 24, 'İzmir');
INSERT INTO kisilerOguz () VALUES (9,'Selin', 'Yıldız', 27, 'Bursa');
INSERT INTO kisilerOguz () VALUES (10,'Emre', 'Koç', 31, 'Antalya');
INSERT INTO kisilerOguz () VALUES (11,'Zeynep', 'Çınar', 26, 'Konya');
INSERT INTO kisilerOguz () VALUES (12,'Oğuz', 'Kaplan', 40, 'Samsun');
INSERT INTO kisilerOguz () VALUES (13,'Burcu', 'Ertuğrul', 22, 'Trabzon');
INSERT INTO kisilerOguz () VALUES (14,'Kaya', 'Durmaz', 35, 'Diyarbakır');
INSERT INTO kisilerOguz () VALUES (15,'Seda', 'Aydın', 28, 'Eskişehir');

SELECT * FROM kisilerOguz

-- kisiler tablosundan id kolonunu silin
ALTER TABLE kisilerOguz DROP COLUMN id;

/*  
========================  SORU-1 ========================
 Kisiler tablosundan isim ve soy isim bilgilerini listeleyiniz.
=========================================================
 */
 
SELECT isim,soyisim FROM kisilerOguz;

/*  
========================  SORU-2 ========================
 Kisiler tablosundaki sehir= antalya olan kisileri listeleyiniz.
=========================================================
 */


SELECT * FROM kisilerOguz
WHERE sehir ='antalya';

  /*  
 ========================  SORU-3 ========================
    Kisiler tablosundaki yasi 22 olan kisileri listeleyiniz.
 =========================================================
 */
 
 SELECT * FROM kisilerOguz
 WHERE yas =22;
 
   /*  
 ========================  SORU-4 ========================
    Kisiler tablosundaki sehri Ankara olanlarin yas, isim ve soyisim
    bilgilerini listeleyiniz.
 =========================================================
 */
 
 SELECT yas,isim,soyisim FROM kisilerOguz
 WHERE sehir ='Ankara';
 
 
/*  
========================  SORU-5 ========================
    Kisiler tablosundaki yasi 30 `dan buyuk olan kisilerin
    bilgilerini listeleyiniz.
=========================================================
 */
 
 SELECT * FROM kisilerOguz
 WHERE yas > 30;
 
 /*  
========================  SORU-6 ========================
    Kisiler tablosundaki ismi 'emre' den buyuk olan kisilerin
    isimlerini listeleyiniz.
=========================================================
 */

SELECT isim FROM kisilerOguz
WHERE isim > 'emre';

 /*  
========================  SORU-7 ========================
    Kisiler tablosundaki sehri 'D' den buyuk olan sehirlerde
    yasayan kisileri isim ve soyisim , sehir bilgilerini listeleyiniz.
=========================================================
 */
 
 SELECT isim,soyisim,sehir FROM kisilerOguz
 WHERE sehir > 'D';
 
   /*  
 ========================  SORU-8 ========================
    Kisiler tablosundaki yasi 35 den kucuk veya 35'e esit olan kisilerin
    bilgilerini listeleyiniz.
 =========================================================
 */
 
  SELECT * FROM kisilerOguz
 WHERE yas <= 35;
 
  /*  
 ========================  SORU-9 ========================
    Kisiler tablosundaki sehri Trabzon olmayan kisilerin
    bilgilerini listeleyiniz.
 =========================================================
 */
 
  SELECT * FROM kisilerOguz
 WHERE sehir != 'Trabzon';
 
  /*  
 ========================  SORU-10 ========================
    Kisiler tablosundaki soyismi Gunes olmayan kisilerin
    bilgilerini listeleyiniz.
 =========================================================
 */
 
  SELECT * FROM kisilerOguz
 WHERE soyisim <> 'Gunes';
 
 

 
 






