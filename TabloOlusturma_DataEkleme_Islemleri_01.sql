CREATE SCHEMA KendiCalismalarim;



CREATE TABLE kitaplarOguz (
kitap_id INT,
kitap_adi VARCHAR(50),
yazar_adi VARCHAR(40),
yayin_yili INT,
kategori VARCHAR(30)

);

SELECT * FROM kitaplarOguz;

CREATE TABLE personelOguz (

personel_id INT,
adi VARCHAR(30),
soyadi VARCHAR(30),
dogum_tarihi DATE,
pozisyon VARCHAR(30),
maas INT

);

SELECT * FROM personelOguz;

SELECT soyadi,personel_id FROM personelOguz;

SELECT * FROM kitaplarOguz;

INSERT INTO kitaplarOguz()
VALUES (1,'savaş ve barış','Lev Tolstoy','1869','Tarihi');

INSERT INTO kitaplarOguz()
VALUES (1,'savaş ve barış','Lev Tolstoy','1869','Tarihi');

INSERT INTO kitaplarOguz(kitap_id,kitap_adi)
VALUES ( 2,'Araba Sevdası');



/*  
========================  SORU ========================
 Kitaplar tablosuna null deger olmadan coklu veri girisi saglayiniz.
=========================================================
 */
INSERT INTO kitaplarOguz ()
VALUES  (1,	'Savaş ve Barış',	'Lev Tolstoy',	1869,	'Tarihi' ),
		(2,	'Suç ve Ceza',	'Fyodor Dostoyevski',	1866, 	'Psikolojik'),
		(3,	'Anna Karenina',	'Lev Tolstoy',	1877,	'Aşk'),
		(4,	'1984',	'George Orwell',	1949,	'Politik'),
		(5,	'Büyük Umutlar',	'Charles Dickens',	1861,	'Dram'),
		(6,	'Don Kişot',	'Miguel de Cervantes',	1605,	'Macera'),
		(7,	'Gurur ve Önyargı',	'Jane Austen',	1813,	'Dram'),
		(8,	'Monte Kristo Kontu',	'Alexandre Dumas',	1844,	'Macera'),
		(9,	'Faust',	'Johann Wolfgang von Goethe',	1808,	'Felsefi'),
		(10,	'Ulysses',	'James Joyce',	1922,	'Modernist');
        
SELECT * FROM kitaplarOguz;        


/*  
========================  SORU ========================
 Personel tablosuna null deger olmadan coklu veri girisi saglayiniz.
=========================================================
 */
 
 INSERT INTO personelOguz() 
 VALUES ( 1, 'Ahmet','CELIK','1988-10-06','Muhasebeci','45000'),
		(2, 'Ayse', 'DEMİR', '1988-12-06', 'Mudur', 55000);
        
 SELECT * FROM personeloguz;       
 
 
/*  
    ========================  SORU ========================
    Icerisinde urun id, musteri isim ve urun isim columnlari
    olan bir musteriler tablosu create ediniz. 
    =========================================================
 */
 
 
 CREATE TABLE musterilerOguz(
	urun_id INT,
    musteri_isim VARCHAR(40),
    urun_isim VARCHAR(40)
);
SELECT * FROM musterilerOguz;

INSERT INTO musterilerOguz VALUES (10, 'Mark', 'Orange');
INSERT INTO musterilerOguz  VALUES (10, 'Mark', 'Orange');
INSERT INTO musterilerOguz VALUES (20, 'John', 'Apple');
INSERT INTO musterilerOguz VALUES (30, 'Amy', 'Palm');
INSERT INTO musterilerOguz VALUES (10, 'Adem', 'Orange');
INSERT INTO musterilerOguz VALUES (40, 'John', 'Apricot');
INSERT INTO musterilerOguz VALUES (20, 'Eddie', 'Apple');

-- musteriler tablosundaki musteri_isim lerini listeleyin

SELECT musteri_isim FROM musterilerOguz;

 /*  
    ========================  SORU ========================
    Icerisinde ulke_adi, ulke_adi_uzun_yazilis, ISO_Kodu, 
    ulke_kodu, baskent_turkce ve baskent_ingilizce columnlari 
    olan bir ulkeler tablosu create ediniz. 
    =========================================================
 */
 
 CREATE TABLE ulkelerOguz(
 
 	ulke_adi VARCHAR(50), 
    ulke_adi_uzun_yazilis VARCHAR(50), 
    ISO_Kodu CHAR(3), 
    ulke_kodu CHAR(2), 
    baskent_turkce VARCHAR(50),
    baskent_ingilizce VARCHAR(50)
 

 );
 
  SELECT * FROM ulkelerOguz;
  
  insert into ulkelerOguz values('Afganistan', 'Afganistan İslam Cumhuriyeti', 'AFG', 'AF', 'Kâbil', 'Kabul');
insert into ulkelerOguz values('Almanya', 'Almanya Federal Cumhuriyeti', 'DEU', 'DE', 'Berlin', 'Berlin');
insert into ulkelerOguz values('Andora', 'Andora Prensliği', 'AND', 'AD', 'Andora La Vella', 'Andorra la Vella');
insert into ulkelerOguz values('Arjantin', 'Arjantin Cumhuriyeti', 'ARC', 'AR', 'Buenos Aires', 'Buenos Aires');
insert into ulkelerOguz values('Arnavutluk', 'Arnavutluk Cumhuriyeti', 'ALB', 'AL', 'Tiran', 'Tiran');
insert into ulkelerOguz values('Azerbaycan', 'Azerbaycan Cumhuriyeti', 'AZE', 'AZ', 'Bakü', 'Baku');
insert into ulkelerOguz values('Bahama Adaları', 'Bahama Milletler Topluluğu', 'BHS', 'BS', 'Nassau', 'Nassau');
insert into ulkelerOguz values('Bahreyn', 'Bahreyn Krallığı', 'BHR', 'BH', 'Manama', 'Manama');
insert into ulkelerOguz values('Bangladeş', 'Bangladeş Halk Cumhuriyeti', 'BGD', 'BD', 'Dakka', 'Dhaka');
insert into ulkelerOguz values('Belçika', 'Belçika Krallığı', 'BEL', 'BE', 'Brüksel', 'Brussels');


-- ulke adi ve ulke kodu sutunlarini listeleyin
SELECT ulke_adi,ulke_kodu FROM ulkelerOguz;

-- ulke baskent isimlerini turkce ve ingilizce olarak listeleyin
SELECT baskent_turkce ,baskent_ingilizce FROM ulkelerOguz;

/*  
    ========================  SORU  ========================
    Icerisinde ulke_adi, baskent_turkce ve baskent_nufusu columnlari olan 
    bir baskentler tablosu create ediniz. 
    =========================================================
 */
 
CREATE TABLE baskentlerOguz (
	ulke_adi VARCHAR(50), 
    baskent_turkce VARCHAR(50),
    baskent_nufusu INT
 );
 
  -- tum tabloyu goruntuleyin
 SELECT * FROM baskentlerOguz;
 
  /*  
========================  SORU ========================
 baskentlerOguz tablosuna null deger olmadan coklu veri girisi saglayiniz.
=========================================================
 */


insert into baskentlerOguz values('Afganistan', 'Kâbil', '3140853');
insert into baskentlerOguz values('Almanya', 'Berlin', '3520000');
insert into baskentlerOguz values('Andora', 'Andora La Vella', '22884');
insert into baskentlerOguz values('Arjantin', 'Buenos Aires', '2891082');
insert into baskentlerOguz values('Arnavutluk', 'Tiran', '763634');
insert into baskentlerOguz values('Azerbaycan', 'Bakü', '2204200');
insert into baskentlerOguz values('Bahama Adaları', 'Nassau', '248948');
insert into baskentlerOguz values('Bahreyn', 'Manama', '140616');
insert into baskentlerOguz values('Bangladeş', 'Dakka', '8906000');
insert into baskentlerOguz values('Belçika', 'Brüksel', '1080790');



