# 4IZ460 - Yelp Data Mining Úloha

## **Podmínky**

### **Obecné**

- Dvě nebo tři analytické otázky vedou na řešení typových úloh týkajících se důležitých a silných vztahů popsaných [**zde](https://lispminer.vse.cz/guhadi/doku.php?id=lm_guha_di_typy_uloh_dulezite_silne).**
- Další otázky vedou na řešení typových úloh týkajících se hledání výjimek a odlišností popsaných [**zde](https://lispminer.vse.cz/guhadi/doku.php?id=lm_guha_di_typy_uloh_vyjimky)** a typových úloh týkajících se hledání skupin objektů s podobným chováním popsaných [**zde](https://lispminer.vse.cz/guhadi/doku.php?id=lm_guha_di_typy_uloh_podobne).**

### **Technické**

- Na použití každé z procedur 4ft-Miner, CF-Miner, SD4ft-Miner, SDCF-Miner vedou nejméně 2 otázky.
- Na použití každé z procedur KL-Miner, a Ac4ft-Miner musí vést nejméně jedna z analytických otázek.
- Při aplikacích procedury 4ft-Miner je třeba nejméně jednou použít kvantifikátor PIM (p-implikace) a nejméně jednou AA-kvantifikátor.
- Nejméně dvě aplikace procedur CF-Miner a SDCF-Miner vedou na použití kvantifikátorů týkajících se schodů v histogramu
- Nejméně tři z aplikací GUHA procedur vedou na použití koeficientů typu sequence a/nebo cuts, každý z typů koeficientů je třeba použít alespoň jednou.

## **Data**

[https://www.kaggle.com/yelp-dataset/yelp-dataset](https://www.kaggle.com/yelp-dataset/yelp-dataset)

# **Analytické otázky**

Seznam analytických otázek k řešení v LISp-Mineru

- [Typove ulohy v lisp mineru](https://lispminer.vse.cz/guhadi/doku.php?id=lm_guha_di_typy_uloh_procedury)
- vyhledat takove vztahy, ktere by zlepsili recommendation algoritmus

## **CF-Miner [2]**

- [**Cf Miner - priklady**](https://lispminer.vse.cz/guhadi/doku.php?id=lm_guha_di_typul_cf#data_hotel_-_jedna_kategorie_vyrazne_prevazuje)
- CF miner - 2 a vice kategorii - den v tydnu a pocasi

### **CF - 1. Otazka**

- **Priklad**: Existuje segment hostu s rostouci urovni spokojenosti?
- **Otazka**: Existuje segment podniku u kterych je rostouci/klesajici hodnoceni spokojenosti?

### **CF - 2. Otazka**

- **Priklad**: Existuje skupina klientu a den v týdnu ve kterém převažují příjezdy klientů z této skupiny?
- **Otazka**: Existuje skupina podniku a den v tydnu ve kterem prevazuji review z toho podniku?

## **4ft-Miner [2 (1 PIM, 1 AA)]**

- [**Popis Metody**](https://lispminer.vse.cz/guhate/doku.php?id=lm_guha_te_sd4ft_proc)
- [**Priklady Aplikaci 4ft Miner**](https://lispminer.vse.cz/guhadi/doku.php?id=lm_guha_di_typul_4ft&fbclid=IwAR0cXX279BpRiP023rU7HN3kv9oufpoo7DBwX6J7JyYyPcOiQOrJ9iSrHOM)
- Typicke pobyty ci pocasi
- **AA -** kvantifikator Above Average

### **4ft - 1. Otazka**

- Pin - leva strana implikuje s confident
- **Priklad:** Existuje skupina pacientů definovaná pomocí osobních údajů, spotřeby alkoholu, cukru, kávy a čaje taková, že relativní četnost pacientů s rizikem obezity je v této skupině o 50 % větší než v celém souboru a zároveň počet pacientů ze skupiny s rizikem obezity je minimálně 30? ***[Podrobnosti k příkladu jsou zde.](https://lispminer.vse.cz/guhadi/lib/exe/fetch.php?media=4ft_03_stulong_above_average.pdf)***
- **Otazka:** Existuje nejaka kombinace typu rezervace, dress code, price range, ze jeji relativni cetnost je o X % vetsi nez v celem souboru a pocet podniku je vetsi nez X.

## **SD4ft-Miner [2]**

- Mezi kterými městskými částmi jsou významné rozdíly ohledně vztahů mezi charakteristikami zákazníků a parametry podniků?

## **SDCF-Miner [2]**

- Existuje segment podniků a dvojice městských částí tak, že pro tento segment jsou pro jednotlivé části měst trendy hodnocení opačné?
- Existuje segment zákazníků a dvojice městských částí tak, že pro tento segment jsou pro jednotlivé části měst trendy hodnocení opačné?

## **KL-Miner [1]**

- Segmentace podniku s cilem doporucovani podobnych podniku zakaznikum.

## **Ac4ft-Miner [1]**

- Změna čeho a u kterých podniků zvýší hodnocení?

# **Poznámky**

- Segmentace zákazníku vypývající z vazeb na podniky, které hodnotily. Preference drahé/levné podniky? Kuřák/nekuřák, pije/nepije alkohol, preference kuchyně, vyžaduje platbu karto, atd...