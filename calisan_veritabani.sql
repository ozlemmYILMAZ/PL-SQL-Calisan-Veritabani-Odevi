CREATE TABLE Calisanlar (
    calisan_id NUMBER PRIMARY KEY,
    isim VARCHAR2(100),
    pozisyon VARCHAR2(50),
    maas NUMBER
);
CREATE OR REPLACE PROCEDURE CalisanEkle(
    p_calisan_id IN NUMBER,
    p_isim IN VARCHAR2,
    p_pozisyon IN VARCHAR2,
    p_maas IN NUMBER
) IS
BEGIN
    INSERT INTO Calisanlar (calisan_id, isim, pozisyon, maas)
    VALUES (p_calisan_id, p_isim, p_pozisyon, p_maas);
    
    DBMS_OUTPUT.PUT_LINE('�al��an ba�ar�yla eklendi.');
END;
/
CREATE OR REPLACE PROCEDURE CalisanMaasGuncelle(
    p_calisan_id IN NUMBER,
    p_yeni_maas IN NUMBER
) IS
BEGIN
    UPDATE Calisanlar
    SET maas = p_yeni_maas
    WHERE calisan_id = p_calisan_id;
    
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('�al��an bulunamad�.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('�al��an�n maa�� g�ncellendi.');
    END IF;
END;
/
CREATE OR REPLACE PROCEDURE CalisanSil(
    p_calisan_id IN NUMBER
) IS
BEGIN
    DELETE FROM Calisanlar
    WHERE calisan_id = p_calisan_id;
    
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('�al��an bulunamad�.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('�al��an ba�ar�yla silindi.');
    END IF;
END;
/
SELECT * FROM Calisanlar;
EXEC CalisanEkle(1, 'Ahmet Y�lmaz', 'M�hendis', 5000);
EXEC CalisanMaasGuncelle(1, 5500);

EXEC CalisanEkle(2,'Elif G�n','��retmen',5500);
EXEC CalisanEkle(3,'Fatma �am','Hem�ire',6000);
EXEC CalisanEkle(4, 'Mehmet Demir', 'Doktor', 8000);
EXEC CalisanEkle(5, 'Ay�e Korkmaz', 'Muhasebeci', 4500);
EXEC CalisanEkle(6, 'Ali Kaya', 'Teknisyen', 4000);
EXEC CalisanEkle(7, 'Hakan Y�ld�z', 'M�d�r', 9000);
EXEC CalisanEkle(8, 'Zeynep Arslan', 'Sekreter', 3500);

SELECT * 
FROM Calisanlar
ORDER BY calisan_id;




