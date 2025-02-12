use kendicalismalarim;

/* ===============================================
		       AGGREGATE FUNCTIONS
   ===============================================*/


/*
 Aggregate fonksiyonlar, SQL'de bir grup satır üzerinde belirli
 bir işlemi gerçekleştiren ve tek bir değer döndüren fonksiyonlardır.

 Bu tür fonksiyonlar, veri analizi yaparken veya raporlar hazırlarken
 veri setleri üzerinden özet bilgiler elde etmek için sıklıkla kullanılır.

 Aggregate fonksiyonlar, birden fazla satırın bilgilerini toplayarak, 
 bunların ortalamasını almak, en büyük veya en küçük değerlerini bulmak
 gibi işlemleri kolaylikla yapabilir.
*/

/*
				 Yaygın Kullanılan Aggregate Fonksiyonlar
COUNT(): Belirli bir kriteri karşılayan satırların sayısını döndürür.
Örneğin, bir tabloda kaç tane farklı kayıt olduğunu bulmak için kullanılır.

SUM(): Sayısal bir sütundaki tüm değerlerin toplamını hesaplar. 
Örneğin, bir satış tablosundaki tüm satışların toplam gelirini hesaplamak için 
kullanılabilir.

AVG(): Sayısal bir sütundaki değerlerin ortalamasını hesaplar. 
Örneğin, öğrencilerin sınav puanlarının ortalamasını bulmak için kullanılır.

MIN() ve MAX(): Bir sütundaki en küçük ve en büyük değerleri bulur. 
Örneğin, bir ürünün satış fiyatları arasından en düşük ve en yüksek fiyatı 
bulmak için kullanılabilir.
*/


CREATE TABLE satis_raporuOguz (
    id INT ,
    urun_adi VARCHAR(100),
    satis_miktari INT,
    birim_fiyati DECIMAL(10, 2),
    satis_tarihi DATE
);

INSERT INTO satis_raporuOguz VALUES
(1, 'Laptop', 10, 5000.00, '2023-01-01'),
(2, 'Akıllı Telefon', 15, 3000.00, '2023-01-03'),
(3, 'Tablet', 12, 2500.00, '2023-01-05'),
(4, 'Kulaklık', 40, 150.00, '2023-01-07'),
(5, 'Masaüstü Bilgisayar', 8, 7000.00, '2023-01-09'),
(6, 'Kamera', 5, 4500.00, '2023-01-11'),
(7, 'Mouse', 50, 100.00, '2023-01-13'),
(8, 'Klavye', 30, 200.00, '2023-01-15'),
(9, 'Monitor', 10, 1500.00, '2023-01-17'),
(10, 'Yazıcı', 7, 1000.00, '2023-01-19');

SELECT * FROM satis_raporuOguz;

/* ===============================================
		       AGGREGATE FUNCTIONS / COUNT()
   ===============================================*/

/*
*************** SYNTAX ***************
SELECT COUNT(sütun_adı) 
FROM tablo_adı;
*/

/*  
=============================  SORU-1 =============================
    Satis raporu tablosundaki toplam urun cesidi sayisi nedir.
===================================================================
 */

INSERT INTO satis_raporuOguz VALUES
(1, 'Laptop', 10, 5000.00, '2023-01-01');

-- tablodaki urun adlari listesi
SELECT urun_adi FROM satis_raporuOguz;

-- tablodaki urun adlarinin tekrarsiz listesi
SELECT DISTINCT urun_adi FROM satis_raporuOguz;

-- tablodaki urun adi sayisi
SELECT COUNT(urun_adi) FROM satis_raporuOguz;

-- tablodaki tekrarsiz urun adi sayisi
SELECT COUNT(DISTINCT urun_adi) FROM satis_raporuOguz;

/* 
======================== ALIASES ===========================
   Bir tablo goruntulerken
   Tablodaki sutun basliklarini degil de bizim belirleyecegimiz ozel bir degeri kullanmak istersek
   ALIASES kullaniriz
   
   Aliases kodu ile tablo yazdirilirken, 
   field isimleri sadece o cikti icin degistirilebilir.
===============================================================
*/


-- tablodaki urun_adi sutununu BASLIGI Satilan Urunler olacak sekilde listeleyin

SELECT urun_adi AS Satilan_Urunler FROM satis_raporuOguz;


-- tablodaki urun adi sayisini basligi "Urun_Sayisi" olarak goruntuleyin
SELECT COUNT(urun_adi) AS "Urun_Sayisi" FROM satis_raporuOguz;

-- tablodaki tekrarsiz urun adi sayisi
-- basligi "Tekrarsiz Urun Sayisi" olarak goruntuleyin
SELECT COUNT(DISTINCT urun_adi) AS Tekrarsiz_Urun_Sayisi FROM satis_raporuOguz;


 /*  
=============================  SORU-2 =============================
    Satis raporu tablosundaki satisi yapilan toplam urun sayisi nedir.
===================================================================
 */
 
SELECT COUNT(id) AS toplam_urun_sayisi
FROM satis_raporuOguz;


/*  
=============================  SORU-3 =============================
    Satis raporu tablosundaki fiyati 1000 den az olan urunlerin sayisi nedir.
===================================================================
*/

SELECT COUNT(urun_adi) AS 1000_den_ucuz_urun_adedi 
FROM satis_raporuOguz
WHERE birim_fiyati < 1000;

/* 
===============================================
		       AGGREGATE FUNCTIONS / SUM()
===============================================
*/

/*
*************** SYNTAX ***************
SELECT SUM(sütun_adı) 
FROM tablo_adı;
*/

/*  
=============================  SORU-4 =============================
    Satis raporu tablosundaki toplam satis miktari nedir?
===================================================================
*/

SELECT SUM(satis_miktari) AS toplam_satilan_urun_sayisi
FROM satis_raporuOguz;

/*  
=============================  SORU-5 =============================
    Satis raporu tablosundaki laptoplarin toplam satis geliri nedir?
===================================================================
*/

SELECT SUM(satis_miktari * birim_fiyati) AS Laptop_satis_toplami
FROM satis_raporuOguz
WHERE urun_adi = 'Laptop';


/*  
=============================  SORU-6 =============================
    Satis raporu tablosundaki 2023 Ocak ayinda yapilan toplam satis 
    geliri nedir?
===================================================================
*/

SELECT SUM(satis_miktari * birim_fiyati) AS ocak_2023_toplam_gelir
FROM satis_raporuOguz
WHERE satis_tarihi BETWEEN '2023-01-01' AND '2023-01-31';


-- alternatif Yol olarak satis_tarihinden year ve mont degerleri filtrelenebilir
SELECT SUM(satis_miktari * birim_fiyati) AS ocak_2023_toplam_gelir
FROM satis_raporuOguz
WHERE  YEAR(satis_tarihi) = 2023 AND MONTH(satis_tarihi) = 1;

/* 
===============================================
		       AGGREGATE FUNCTIONS / AVG()
===============================================
*/

/*
*************** SYNTAX ***************
SELECT AVG(sütun_adı) 
FROM tablo_adı;
*/

/*  
=============================  SORU-7 =============================
    Satis raporu tablosundaki urunlerin ortalama birim fiyati nedir?
===================================================================
*/

SELECT AVG(birim_fiyati) AS ortalama_birim_fiyati 
FROM satis_raporuOguz;

/*  
=============================  SORU-8 =============================
    Satis raporu tablosundaki laptop ve tabletlerin ortalama 
    birim fiyati nedir?
===================================================================
*/

SELECT AVG(birim_fiyati) AS ortalama_birim_fiyati
FROM satis_raporuOguz
WHERE urun_adi IN ('Laptop','Tablet');


/* 
===============================================
	    AGGREGATE FUNCTIONS / MAX() & MIN()
===============================================*/
   
  /*
*************** SYNTAX ***************
SELECT MAX(sütun_adı) / MIN(sütun_adı)
FROM tablo_adı;
*/ 

/*  
=============================  SORU-10 =============================
    Satis raporu tablosundaki en dusuk birim fiyati nedir ? 
===================================================================
*/

SELECT MIN(birim_fiyati) AS en_dusuk_birim_fiyati
FROM satis_raporuOguz;


/*  
=============================  SORU-11 =============================
    Satis raporu tablosundaki en eski ve en yeni satis tarihleri nelerdir?   
===================================================================
*/

-- urun_adi ve satis_miktari sutunlarini yazdirin
SELECT urun_adi , satis_miktari FROM satis_raporuOguz;

-- satis_tarihi ve satis_tarihi sutunlarini yazdirin
SELECT satis_tarihi , satis_tarihi FROM satis_raporuOguz;


SELECT MAX(satis_tarihi) AS en_yeni_satis_tarihi , MIN(satis_tarihi) AS en_eski_satis_tarihi
FROM satis_raporuOguz;


/*  
=============================  SORU-12 =============================
    Satis raporu tablosundaki en fazla satilan urun miktari nedir?   
===================================================================
*/

SELECT MAX(satis_miktari) AS satis_miktari_en_fazla_olan_urun
FROM satis_raporuOguz;