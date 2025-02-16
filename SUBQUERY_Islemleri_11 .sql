
use kendicalismalarim;

/*
================================= SUBQUERY =================================
    Sorgu icinde calisan sorguya SUBQUERY (ALT SORGU) denir.
============================================================================
*/

CREATE TABLE calisanlarOguz
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);
INSERT INTO calisanlarOguz VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Honda');
INSERT INTO calisanlarOguz VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'Toyota');
INSERT INTO calisanlarOguz VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Honda');
INSERT INTO calisanlarOguz VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Ford');
INSERT INTO calisanlarOguz VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Hyundai');
INSERT INTO calisanlarOguz VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Ford');
INSERT INTO calisanlarOguz VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Honda');


CREATE TABLE sirketlerOguz
(
sirket_id int,
sirket varchar(20),
calisanlar_sayisi int
);
INSERT INTO sirketlerOguz VALUES(100, 'Honda', 12000);
INSERT INTO sirketlerOguz VALUES(101, 'Ford', 18000);
INSERT INTO sirketlerOguz VALUES(102, 'Hyundai', 10000);
INSERT INTO sirketlerOguz VALUES(103, 'Toyota', 21000);

SELECT * FROM calisanlarOguz;
SELECT * FROM sirketlerOguz;




-- Honda'da calisan personelin isimlerini listeleyin

SELECT isim FROM calisanlarOguz
WHERE sirket = 'Honda';


-- calisan sayisi 15000'den fazla olan sirket isimlerini listeleyin

SELECT sirket FROM sirketlerOguz
WHERE calisanlar_sayisi > 15000 ;


-- Ford ve Toyota'da calisan personelin isimlerini listeleyin

SELECT isim FROM calisanlarOguz
WHERE sirket IN ('Ford','Toyota');


-- calisan sayisi 15000'den fazla olan sirketlerde
-- calisan personelin isimlerini listeleyin

SELECT isim FROM calisanlarOguz
WHERE sirket IN ( 	SELECT sirket 
					FROM sirketlerOguz
					WHERE calisanlar_sayisi > 15000);
                    
                    
-- sirket id'si 100 olan sirkette 
-- calisan personel isimlerini listeleyin                    

SELECT isim 
FROM calisanlarOguz 
WHERE sirket IN ( 
    SELECT sirket 
    FROM sirketlerOguz 
    WHERE sirket_id = 100 
);

-- alt sorgu olarak sirket id'si 100 olan sirketin 
-- ismini getiren bir sorgu yazmaliyiz


/*
----------------------------------------------------------------                
  2) Veli Yilmaz isimli personelin calistigi sirketlerin sirket 
  ismini ve personel sayilarini listeleyiniz.
----------------------------------------------------------------
*/

SELECT sirket,calisanlar_sayisi
FROM sirketlerOguz
WHERE sirket IN ( 	SELECT sirket
					FROM calisanlarOguz
                    WHERE isim = 'Veli Yilmaz'
					);
                    
 /*
 ----------------------------------------------------------------                
  3) Ankara da calisani olan sirketlerin ID isim ve calisan sayilarini 
  listeleyiniz.
----------------------------------------------------------------
*/    

SELECT sirket_id,sirket,calisanlar_sayisi
FROM sirketlerOguz
WHERE sirket IN (SELECT sirket FROM calisanlarOguz
				 WHERE sehir = 'Ankara');

/*
----------------------------------------------------------------                
  4) ID'si 101 den yuksek olan sirketlerde calisanlarin maas sehir 
  sirket ismini listeleyiniz.
----------------------------------------------------------------
*/
SELECT maas,sehir,sirket
FROM calisanlarOguz
WHERE sirket IN ( SELECT sirket FROM sirketlerOguz
				  WHERE sirket_id > 101  );




/*
----------------------------------------------------------------                
  5) ID'si 100 olan sirketde calisanlarin maas ortalamasini listeleyiniz.
----------------------------------------------------------------
*/

SELECT AVG(maas) AS ortalama_maas
FROM calisanlarOguz
WHERE sirket IN (SELECT sirket FROM sirketlerOguz
				 WHERE sirket_id = 100);
                 
                 
/*
----------------------------------------------------------------                
  5) ID'si 100 veya 102 olan sirketde calisanlarin maas ortalamasini listeleyiniz.
----------------------------------------------------------------
*/


SELECT AVG(maas) AS ortalama_maas
FROM calisanlarOguz
WHERE sirket IN (SELECT sirket FROM sirketlerOguz
				 WHERE sirket_id IN (100,102)  );
                 
/*
	WHERE ile subquery yaptigimizda
    bilgiyi bir tablodan alip,
    diger tablodan listelenecek bilgilere ulasiriz
*/     


/* 
======================== SELECT ile SUBQUERY ===========================

SELECT ile SUBQUERY kullanimi :
  
-- SELECT -- hangi sutunlari(field) getirsin
-- FROM -- hangi tablodan(table) getirsin
-- WHERE -- hangi satirlari(record) getirsin
  
 * Yazdigimiz QUERY'lerde SELECT satirinda field isimleri kullaniyoruz.
  Dolayisiyla eger SELECT satirinda bir SUBQUERY yazacaksak sonucun
  tek bir field donmesi gerekir.
  
  * SELECT satirinda SUBQUERY yazacaksak SUM, COUNT, MIN, MAX ve AVG gibi 
  fonksiyonlar kullanilir. Bu fonksiyonlara AGGREGATE FUNCTION denir.
  
 => Interview Question : Subquery'i Select satirinda kullanirsaniz ne ile 
kullanmaniz gerekir?

=========================================================================\
*/ 

/*
----------------------------------------------------------------
 SORU 1- Her sirketin ismini, personel sayisini ve personelin 
         ortalama maasini listeleyen bir QUERY yazin.
----------------------------------------------------------------
*/


SELECT sirket,calisanlar_sayisi , (  SELECT AVG(maas)  
									 FROM calisanlarOguz 
                                     WHERE sirketlerOguz.sirket= calisanlarOguz.sirket) AS ortalama_maas
FROM sirketlerOguz;


-- calisanlar tablosundaki max maasi goruntuleyin

SELECT MAX(maas)
FROM calisanlarOguz
WHERE sirket = 'Honda'; 

/*
----------------------------------------------------------------
SORU 2- Her sirketin ismini ve personelin aldigi max. maasi 
        listeleyen bir QUERY yazin.
----------------------------------------------------------------
*/
 
 SELECT sirket , (	SELECT MAX(maas)
					FROM calisanlarOguz
					WHERE calisanlarOguz.sirket = sirketlerOguz.sirket)
 FROM sirketlerOguz;
   

/*
----------------------------------------------------------------
SORU 2- id'si 101'den buyuk olan sirketlerin
		ismini ve personelin aldigi max. maasi 
        listeleyen bir QUERY yazin.
----------------------------------------------------------------
*/

 SELECT sirket , (	SELECT MAX(maas)
					FROM calisanlarOguz
					WHERE calisanlarOguz.sirket = sirketlerOguz.sirket)
 FROM sirketlerOguz
 WHERE sirket_id > 101;
 
 

/*
----------------------------------------------------------------
SORU 3- Her sirketin id'sini, ismini ve toplam kac sehirde 
        bulundugunu listeleyen bir QUERY yaziniz.
----------------------------------------------------------------
*/

SELECT sirket_id , sirket , ( SELECT COUNT( DISTINCT sehir) 
							  FROM calisanlarOguz 
                              WHERE calisanlarOguz.sirket = sirketlerOguz.sirket  ) AS sehir_sayisi
FROM sirketlerOguz;


/*
----------------------------------------------------------------
SORU 4- ID'si 101'den buyuk olan sirketlerin id'sini, ismini ve 
toplam kac sehirde bulundugunu listeleyen bir QUERY yaziniz.
----------------------------------------------------------------
*/

SELECT sirket_id , sirket , ( SELECT COUNT( DISTINCT sehir) 
							  FROM calisanlarOguz 
                              WHERE calisanlarOguz.sirket = sirketlerOguz.sirket  ) AS sehir_sayisi
FROM sirketlerOguz
WHERE sirket_id > 101;


/*
----------------------------------------------------------------
SORU 5- Her sirketin ismini,personel sayisini ve personelin 
aldigi max. ve min. maasi listeleyen bir QUERY yazin.
----------------------------------------------------------------
*/ 


SELECT sirket, calisanlar_sayisi, 
								(SELECT MAX(maas)
								 FROM calisanlarOguz
								 WHERE calisanlarOguz.sirket = sirketlerOguz.sirket) AS max_maas , 
                                (SELECT MIN(maas)
								 FROM calisanlarOguz
								 WHERE calisanlarOguz.sirket = sirketlerOguz.sirket) AS min_maas
FROM sirketlerOguz;


/* 
======================== EXISTS CONDITION ===========================
EXISTS Condition subquery'ler ile kullanilir. IN ifadesinin kullanimina
benzer olarak, EXISTS ve NOT EXISTS ifadeleri de alt sorgudan getirilen 
degerlerin icerisinde bir degerin olmasi veya olmamasi durumunda islem 
yapilmasini saglar.
======================================================================
*/

CREATE TABLE mayis_satislarOguz
(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);

INSERT INTO mayis_satislarOguz VALUES (10, 'Mark', 'Honda');
INSERT INTO mayis_satislarOguz VALUES (10, 'Mark', 'Honda');
INSERT INTO mayis_satislarOguz VALUES (20, 'John', 'Toyota');
INSERT INTO mayis_satislarOguz VALUES (30, 'Amy', 'Ford');
INSERT INTO mayis_satislarOguz VALUES (20, 'Mark', 'Toyota');
INSERT INTO mayis_satislarOguz VALUES (10, 'Adem', 'Honda');
INSERT INTO mayis_satislarOguz VALUES (40, 'John', 'Hyundai');
INSERT INTO mayis_satislarOguz VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan_satislarOguz
(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);

INSERT INTO nisan_satislarOguz VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan_satislarOguz VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan_satislarOguz VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan_satislarOguz VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan_satislarOguz VALUES (20, 'Mine', 'Toyota');

SELECT * FROM mayis_satislarOguz;
SELECT * FROM nisan_satislarOguz;


/*
----------------------------------------------------------------
SORU 1 : Her iki ayda da ayni id ile satilan urunlerin urun_id'lerini
ve urunleri mayis ayinda alanlarin isimlerini getiren bir query yaziniz.
----------------------------------------------------------------
*/

SELECT urun_id, musteri_isim
FROM mayis_satislarOguz
WHERE urun_id  IN ( SELECT urun_id 
				   FROM nisan_satislar
                   WHERE nisan_satislarOguz.urun_id = mayis_satislarOguz.urun_id); 



SELECT urun_id, musteri_isim
FROM mayis_satislarOguz
WHERE EXISTS ( SELECT urun_id 
			   FROM nisan_satislarOguz
			   WHERE nisan_satislarOguz.urun_id = mayis_satislarOguz.urun_id); 


-- mayis ayinda olup, nisan ayinda olmayan id'leri goruntulemek icin
SELECT urun_id, musteri_isim
FROM mayis_satislarOguz
WHERE urun_id  NOT IN ( SELECT urun_id 
				        FROM nisan_satislarOguz
                        WHERE nisan_satislarOguz.urun_id = mayis_satislarOguz.urun_id); 


SELECT urun_id, musteri_isim
FROM mayis_satislarOguz
WHERE NOT EXISTS ( SELECT urun_id 
			       FROM nisan_satislarOguz
			       WHERE nisan_satislarOguz.urun_id = mayis_satislarOguz.urun_id); 