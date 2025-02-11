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






