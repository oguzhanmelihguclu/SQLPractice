

use kendicalismalarim;

/* 
===============================================
		           GROUP BY
===============================================
*/

/*
 GROUP BY SQL ifadesi, veritabanı sorgularında belirli bir veya 
 birden fazla sütuna göre satırları gruplandırmak için kullanılır. 
 Genellikle aggregate (gruplama) fonksiyonlar 
 (COUNT(), SUM(), AVG(), MIN(), MAX() vb.) ile birlikte kullanılır. 
 GROUP BY ifadesi, belirtilen sütunlardaki değerlere göre benzersiz 
 gruplar oluşturur ve her grup için aggregate fonksiyonların sonuçlarını
 döndürür. Bu, veriler üzerinde özetlemeler ve analizler yapmayı sağlar.
*/

/*
 Notlar
GROUP BY kullanılırken, SELECT ifadesinde belirtilen sütunların ya gruplandırma
ifadesinde (GROUP BY kısmında) belirtilmiş olması ya da bir agregate fonksiyonunun
parçası olması gerekir.
Birden fazla sütun üzerinde gruplandırma yapılabilir. Bu durumda, sütunlar virgül
ile ayrılarak GROUP BY ifadesine eklenir.
*/

/*
*************** SYNTAX ***************
SELECT sutun_adi, SUM(adet) AS toplam_adet
FROM tablo_adi
GROUP BY sutun_adi(gruplanacak verilerin oldugu);
*/

CREATE TABLE manavOguz (
    id INT ,
    urun_adi VARCHAR(50),
    miktar_kg DECIMAL(5, 2),
    satis_fiyati DECIMAL(7, 2),
    satis_tarihi DATE,
    kategori VARCHAR(50)
);

INSERT INTO manavOguz () VALUES
					(1, 'Elma', 10.5, 35.00, '2023-01-10', 'Meyve'),
					(2, 'Muz', 20.0, 30.00, '2023-01-12', 'Meyve'),
					(3, 'Portakal', 15.75, 42.50, '2023-01-14', 'Meyve'),
					(4, 'Domates', 25.0, 25.00, '2023-01-16', 'Sebze'),
					(5, 'Biber', 10.0, 30.00, '2023-01-18', 'Sebze'),
					(6, 'Patlıcan', 13.5, 22.50, '2023-01-20', 'Sebze'),
					(7, 'Salatalık', 17.0, 17.00, '2023-01-22', 'Sebze'),
					(8, 'Üzüm', 22.0, 60.00, '2023-01-24', 'Meyve'),
					(9, 'Kavun', 30.0, 45.00, '2023-01-26', 'Meyve'),
					(10, 'Karpuz', 50.0, 50.00, '2023-01-28', 'Meyve'),
					(11,'Elma', 2.5, 35.00, '2023-01-12', 'Meyve'),
					(12,'Muz', 2.0, 30.00, '2023-01-12', 'Meyve'),
					(13,'Portakal', 3.0, 15.00, '2023-01-12', 'Meyve'),
					(14,'Domates', 4.0, 25.00, '2023-01-12', 'Sebze'),
					(15,'Biber', 1.5, 25.00, '2023-01-12', 'Sebze'),
					(16,'Patlıcan', 2.0, 20.00, '2023-01-12', 'Sebze'),
					(17,'Salatalık', 3.0, 15.00, '2023-01-12', 'Sebze'),
					(18,'Üzüm', 2.5, 50.00, '2023-01-12', 'Meyve'),
					(19,'Kavun', 3.5, 40.00, '2023-01-12', 'Meyve'),
					(20,'Karpuz', 5.0, 45.00, '2023-01-12', 'Meyve');
                    
SELECT * FROM manavOguz;                    

-- manav tablosundaki urunleri listeleyin
SELECT urun_adi FROM manavOguz; 

-- manav tablosundaki urunleri tekrarsiz olarak listeleyin
SELECT DISTINCT urun_adi FROM manavOguz;

-- manav tablosundaki urunleri ve her bir urunun toplam satis miktarini(kg) listeleyin

SELECT urun_adi, SUM( miktar_kg) AS  urunlerin_toplam_satis_miktari_kg
FROM manavOguz
GROUP BY  urun_adi; 

/*  
=============================  SORU-2 =============================
    Manav tablosundaki her bir kategori icin toplam gelir nedir?   
===================================================================
*/

SELECT kategori, SUM( miktar_kg *satis_fiyati) AS  urunlerin_toplam_geliri
FROM manavOguz
GROUP BY  kategori;


/*  
=============================  SORU-3 =============================
    Manav tablosundaki en cok satilan urun nedir?   
===================================================================
*/

SELECT urun_adi, SUM( miktar_kg) AS  urunlerin_toplam_satis_miktari_kg
FROM manavOguz
GROUP BY  urun_adi
ORDER BY urunlerin_toplam_satis_miktari_kg DESC
LIMIT 1;


/*  
=============================  SORU-5 =============================
    Manav tablosundaki her bir gun icin ortalama birim fiyati nedir?   
===================================================================
*/

SELECT satis_tarihi , AVG(satis_fiyati) AS gunluk_ortalama_kg_satis_fiyati
FROM manavOguz
GROUP BY satis_tarihi;



/*  
=============================  SORU-6 =============================
    Manav tablosundaki satilan en pahali urunun bilgileri nelerdir?   
===================================================================
*/

SELECT * FROM manavOguz
ORDER BY satis_fiyati DESC
LIMIT 1;

/*  
=============================  SORU-7 =============================
    Manav tablosunda bulunan meyve kategorisindeki urunlerin toplam satis miktari nedir?   
===================================================================
*/

SELECT SUM(miktar_kg) AS meyve_toplam_satis_kg
FROM manavOguz
WHERE kategori = 'Meyve';

/*  
=============================  SORU-8 =============================
    Manav tablosundaki her urun icin ortalama satis fiyati nedir?   
===================================================================
*/

SELECT urun_adi , AVG(satis_fiyati) AS  ortalama_satis_fiyati
FROM manavOguz
GROUP By urun_adi;


/*  
=============================  SORU-09 =============================
    Manav tablosundaki her bir kategorideki en yüksek birim fiyat nedir? 
===================================================================
*/

SELECT kategori, MAX(satis_fiyati) AS  en_yuksek_birim_fiyat
FROM manavOguz
GROUP By kategori;






	