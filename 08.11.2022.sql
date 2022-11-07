CREATE TABLE mart
(
urun_id int,
musteri_isim varchar(50), urun_isim varchar(50)
);
10:08
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');
10:08
CREATE TABLE nisan
(
urun_id int ,
musteri_isim varchar(50), urun_isim varchar(50)
);
10:08
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

-- vergi_no’su 102 olan tedarikcinin firma ismini 'Vestel' olarak güncelleyeniz.
10:45
CREATE TABLE tedarikciler4 -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
INSERT INTO tedarikciler4 VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler4 VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler4 VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler4 VALUES (104, 'Apple', 'Adam Eve');

CREATE TABLE urunler4 -- child
(
ted_vergino int,
urun_id int,
urun_isim VARCHAR(50),
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler4(vergi_no)
on delete cascade
);
INSERT INTO urunler4 VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler4 VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler4 VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler4 VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler4 VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler4 VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler4 VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

select * from tedarikciler4
select *from urunler4

-- vergi no'su 102 olan tedarikcinin firma ismini vestel olarak degiştir --
UPDATE tedarikciler4
SET firma_ismi='Vestel' WHERE vergi_no=102;

-- vergi no'su 101 olan tedarikçinin firma ismini casper ve 
UPDATE tedarikciler4
SET firma_ismi='Casper',irtibat_ismi='Ali Veli' WHERE vergi_no=101;

UPDATE urunler4
SET urun_isim='Telefon'
WHERE urun_isim='Phone'

-- urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.

UPDATE urunler4
SET urun_id = urun_id+1
WHERE urun_id>1004

select *from urunler4

-- urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino sutun değerleri ile toplayarak güncelleyiniz.

UPDATE urunler4
SET urun_id = urun_id + ted_vergino

select *from urunler4

DELETE FROM urunler4
delete from tedarikciler4
select *from urunler4
select * from tedarikciler4

--urunler tablosundaki tüm urun isimlerini , müsteri isimleri ile birleştirerek update edelim.
UPDATE urunler4
SET urun_isim = CONCAT(urun_isim, '-',musteri_isim)

-- Tabloda iki string field'i bir biri ile birleştirmek için bu yolu kullanabiliriz
UPDATE urunler4
SET urun_isim = urun_isim || '-' || musteri_isim

select * from urunler4
--urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci tablosunda irtibat_ismi
--'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.

UPDATE urunler4
SET urun_isim = (SELECT firma_ismi FROM tedarikciler4 WHERE irtibat_ismi='Adam Eve')-->Apple
WHERE musteri_isim = 'Ali Bak'
select * from urunler4

--Urunler tablosunda laptop satin alan musterilerin ismini, firma_ismi Apple’in irtibat_isim'i ile degistirin.
UPDATE urunler4
SET musteri_isim=(SELECT irtibat_ismi FROM tedarikciler4 WHERE firma_ismi='Apple')
WHERE urun_isim='Laptop'
select * from urunler4

--Allies
SELECT urun_id AS id, urun_isim AS isim from urunler4

SELECT urun_id AS id, urun_isim ||' '|| musteri_isim AS urun_isim_musteri_isim
FROM urunler4

CREATE TABLE insanlar2
(
ssn char(9),
name varchar(50), adres varchar(50)
);


INSERT INTO insanlar2 VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO insanlar2 VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO insanlar2 VALUES(345678901, 'Mine Bulut', 'Izmir');
INSERT INTO insanlar2 (ssn, adres) VALUES(456789012, 'Bursa');
INSERT INTO insanlar2 (ssn, adres) VALUES(567890123, 'Denizli');

SELECT * FROM insanlar2

SELECT * FROM insanlar2 WHERE name IS NULL
SELECT * FROM insanlar2 WHERE name IS NOT NULL
