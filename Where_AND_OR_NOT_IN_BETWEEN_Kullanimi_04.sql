use kendicalismalarim;

 /*  
========================  SORU-1 ========================
 Kisiler tablosundan 29 yaşından büyük olan ve Ankara'da yaşayan kişileri listeleyiniz.
=========================================================
 */
 
  SELECT * FROM kisilerOguz
 WHERE yas > 29 AND sehir = 'Ankara';
 
  /*  
========================  SORU-2 ========================
 Kisiler tablosundan Adı 'Fatma' olan ve Bursa'da yaşayan kişilerin yasini listeleyiniz.
=========================================================
 */
 
 SELECT yas FROM kisilerOguz
 WHERE isim = 'Fatma' AND sehir = 'Bursa';
 
  /*  
========================  SORU-3 ========================
 Kisiler tablosundan ismi 'Ayse' ve soyismi 'Kaya' olan kişileri listeleyiniz.
=========================================================
 */ 
 
 
SELECT * FROM kisilerOguz
WHERE isim = 'ayse' AND soyisim = 'kaya';

 /*  
 ========================  SORU-4 ========================
 Kisiler tablosundan yaşı 25 ile 35 arasında olan kişileri listeleyiniz.
 =========================================================
 */
 
 SELECT * FROM kisilerOguz
 WHERE yas BETWEEN 25 AND 35;
 
  /*  
========================  SORU-5 ========================
 Kisiler tablosundan yaşı 25 ile 35 arasında olan ve Ankara'da yaşayan kişileri listeleyiniz.
=========================================================
 */ 
 
 SELECT * FROM kisilerOguz
 WHERE yas BETWEEN 25 AND 35
 AND sehir = 'Ankara';
 
  /*  
 ======================== SORU ========================
   Kisiler tablosundan ismi Adem ile Aylin arasında olan ve 
   Ankara'da yaşayan kişileri listeleyiniz.
 =========================================================
 */
 
 SELECT * FROM kisilerOguz
 WHERE isim BETWEEN 'Adem' AND 'Aylin'
 AND sehir = 'Ankara';
 
 -- BETWEEN yerine iki tane kucuk buyuk isareti Kullanilabilir mi ?
 
 SELECT * FROM kisilerOguz
 WHERE isim >= 'Adem' AND isim<= 'Aylin'
 AND sehir = 'Ankara';
 
 

/*  
========================  SORU-6 ========================
 Kisiler tablosundan yaşı 22 veya 35 olan kişileri listeleyiniz.
=========================================================
 */
 
SELECT * FROM kisilerOguz
WHERE yas=22 OR yas=35;

  /*  
========================  SORU-7 ========================
 Kisiler tablosundan 29 yaşından büyük olan veya Ankara'da yaşayan kişileri listeleyiniz.
=========================================================
 */
 
 SELECT * FROM kisilerOguz
 WHERE yas > 29 OR sehir = 'Ankara';
 
  /*  
========================  SORU-8 ========================
 Kisiler tablosundan İstanbul, Ankara veya İzmir'de yaşayan kişileri listeleyiniz.
=========================================================
 */
 
 SELECT * FROM kisilerOguz
 WHERE sehir = 'Ankara' OR sehir = 'Istanbul' OR sehir = 'Izmir';
 
 
 /*  
========================  SORU-9 ========================
 Kisiler tablosundan İstanbul, Ankara veya İzmir'de yaşayan kişileri listeleyiniz.
=========================================================
 */
 
 SELECT * FROM kisilerOguz
 WHERE sehir IN ('Istanbul', 'Ankara', 'Izmir');
 
  /*  
========================  SORU-10 ========================
    Kisiler tablosundan adı 'Ahmet', 'Mehmet' veya 'Ayşe' olan kişileri listeleyiniz.
=========================================================
 */
 
 SELECT * FROM kisilerOguz
 WHERE isim IN ('Ahmet', 'Mehmet', 'Ayşe');
 
 /*
 
 /*  
========================  SORU-11 ========================
 Kisiler tablosundan  İstanbul'da yaşamayan kişileri listeleyiniz.
=========================================================
 */
 
  SELECT * FROM kisilerOguz
 WHERE sehir != 'istanbul';
 
 SELECT * FROM kisilerOguz
 WHERE sehir <> 'istanbul';
 
 SELECT * FROM kisilerOguz
 WHERE NOT sehir = 'istanbul';
 
  /*  
========================  SORU-12 ========================
 Kisiler tablosundan  İstanbul, Izmir veya Ankara'da yaşamayan kişileri listeleyiniz.
=========================================================
 */
 
 SELECT * FROM kisilerOguz
 WHERE NOT sehir IN ('Ankara', 'Istanbul', 'Izmir');
 
  
 /*  
========================  SORU-13 ========================
 Kisiler tablosundan 30 yaşından büyük olmayan kişileri listeleyiniz.
=========================================================
 */

SELECT * FROM kisilerOguz
WHERE NOT yas >30;


 /*  
 ========================  SORU-14 ========================
 Kisiler tablosundan soyadı 'Yılmaz' veya 'Kara' olmayan kişileri listeleyiniz.
 =========================================================
 */
 
 SELECT * FROM kisilerOguz
 WHERE NOT soyisim IN ('Yılmaz','Kara');
 
 
 