use kendicalismalarim;

/*  
========================  SORU-1 ========================
 Kitaplar tablosuna sayfa sayisi column'i ekleyiniz.
=========================================================
 */
 
 SELECT* FROM kitaplarOguz;
 
 ALTER TABLE kitaplarOguz ADD sayfa_sayisi INT;
 
  /*  
========================  SORU-2 ========================
 Kitaplar tablosuna fiyat column'i ekleyiniz.
=========================================================
 */ 
 
 ALTER TABLE kitaplarOguz ADD fiyat INT;
 
 
 /*  
========================  SORU-3 ========================
  Personel tablosundaki maas column'inin data type'ini degistiriniz .
=========================================================
 */ 
 
 ALTER TABLE personelOguz MODIFY COLUMN maas DOUBLE;
 
 SELECT * FROM personelOguz;
 
 /*  
========================  SORU-4 ========================
 Personel tablosundaki pozisyon column'in adini sorumluluk olarak degistiriniz.
=========================================================
 */
 
 ALTER TABLE personelOguz
 RENAME COLUMN pozisyon TO sorumluluk ;
 SELECT * FROM personelOguz;
 
  /*  
========================  SORU-5 ========================
 personel tablosundaki soyadi column'in adini lastname olarak degistiriniz.
=========================================================
 */
 
 ALTER TABLE personelOguz
 RENAME COLUMN soyadi TO lastname ;
 SELECT * FROM personelOguz;
 
  /*  
========================  SORU-6 ========================
 Personel tablosundaki ogrenci maas column'ini siliniz.
=========================================================
 */
 
 ALTER TABLE personelOguz
 DROP COLUMN maas;
 
  
/*  
========================  SORU-7 ========================
      Kitaplar tablosundaki sayfa sayisi column'ini siliniz.
=========================================================
 */
 
  ALTER TABLE kitaplarOguz
 DROP COLUMN sayfa_sayisi;
 
 SELECT * FROM kitaplarOguz;
 
 
 
 