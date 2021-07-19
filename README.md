[![Version](https://img.shields.io/github/v/release/tjurczyk/arkadia?label=version&color=%23438f57)](https://github.com/tjurczyk/arkadia/releases)
![Verify config.md](https://github.com/tjurczyk/arkadia/workflows/Verify%20config.md/badge.svg)

## Arkadia Skrypty

Pomoc dostępna pod `/skrypty`<br>
Pomoc do mappera znajduje się [tutaj](README_MAPPER.md) \
Wersja, której używasz: sprawdź nagłówek komendy `/skrypty`.

### INSTALACJA

**W celu poprawnego działania skryptów, w ustawieniach trzeba włączyć obsługę GMCP! Bez tego skrypty nie będą działać poprawnie.
Przed instalacją koniecznie włącz opcję _Enable GMCP_ w ustawieniach (Settings) Mudleta i zrestartuj go.**

#### Mudlet 4.11+
---
Przeciągnij poniższy link na okienko Mudleta.
[https://github.com/tjurczyk/arkadia/releases/latest/download/ArkadiaScriptsInstaller.xml](https://github.com/tjurczyk/arkadia/releases/latest/download/ArkadiaScriptsInstaller.xml)

#### Mudlet 4.6+ i moduł LUA
---
Wystarczy wkleić poniższą komendę:

```lua
lua local a="https://github.com/tjurczyk/arkadia/releases/latest/download/ArkadiaScriptsInstaller.xml"local b=getMudletHomeDir().."ArkadiaScriptsInstaller.xml"downloadFile(b,a)cecho("\n<CadetBlue>(skrypty)<tomato>: Rozpoczynam instalacje skryptow\n")registerAnonymousEventHandler("sysDownloadDone",function(c,d)if d~=b then return true end;installPackage(b)end,true)clearCmdLine()
```

#### Alternatywny sposób instalacji
---
Należy pobrać plik:

[https://github.com/tjurczyk/arkadia/releases/latest/download/ArkadiaScriptsInstaller.xml](https://github.com/tjurczyk/arkadia/releases/latest/download/ArkadiaScriptsInstaller.xml)

Po jego pobraniu przeciągamy go na otwarte okno Mudleta.

Lub 
1. W Mudlecie w górnym pasku wybieramy `Package Manager`
2. Wybieramy na dole `Install`
3. Wybieramy pobrany plik

#### Ręczna instalacja
---
Po pobraniu paczki należy rozpakować ją bezpośrednio do katalogu z profilem i zmienić nazwę rozpakowanego katalogu na `arkadia`
Po czym wykonujemy jeszcze instalację samej paczki w mudlecie

1. W Mudlecie w górnym pasku wybieramy `Package Manager`
2. Wybieramy na dole `Install`
3. Z katalogu z profilem wybieramy plik `arkadia/Arkadia.xml`
4. Odinstalowujemy pakiet `generic_maper`
4. Restartujemy Mudleta.

Aktualizacja skryptów już po instalacji to: `/aktualizuj_skrypty`.

Od teraz, w `Triggers`, `Aliases`, `Scripts` oraz `Keys` (z górnego paska) mamy katalog `arkadia`. Tego folderu **nie wolno ruszać**. Z każdą aktualizacją, ten katalog jest usuwany i jest instalowany nowy, dlatego też jeśli chce się mieć jakieś własne triggery, aliasy, skrypty i key bindy to **koniecznie** trzeba to robić poza katalogiem `arkadia`. Na przykład na poniższym screenshocie widać, że mam dwa aliasy. Są one równoległe do skryptów, a nie w folderze _arkadia_.

![Własne aliasy](http://kamerdyner.net/~george/img/wlasne_aliasy.png)

Mając zainstalowane skrypty, można przystąpić do dodania swoich ustawień; ten punkt jest opcjonalny jeśli chcemy mieć możliwość modyfikowania ustawień typu:

- co znajduje się na dolnej belce;
- kolorowanie członków poszczególnych gildii;
- szerokość i długość okna z kondycjami;

i tym podobne.

#### Sugerowane kolory Arkadiowe (opcjonalnie)

Przygotowany został startowy zestaw kolorów do Arkadii, czyli tekstów, które Arkadia wysyła od razu pokolorowanych. Jest on przyzwoity i stonowany, dzięki czemu gra jest przyjemniesza. Wystarczy poniższe linie przekleić do Mudleta i wysłać do Arkadii:

```
kolor tekst 248
kolor pozostali 144

kolor cel ataku 218
kolor cel obrony 248
kolor druzyna 189
kolor przeciwnik 218
kolor wrogowie 248
kolor mowa 123
kolor krzyk 123
kolor szept 153
kolor opisy walki 239
kolor krotki opis noca 147
kolor krotki opis dniem 229
kolor opis wyjsc z lokacji 49
kolor emocje do mnie 225

kolor niskie zadane obrazenia 243
kolor srednie zadane obrazenia 243
kolor wysokie zadane obrazenia 243

kolor brak otrzymanych obrazen 243
kolor niskie otrzymane obrazenia 243
kolor srednie otrzymane obrazenia 243
kolor wysokie otrzymane obrazenia 139

kolor niski poziom stanu 208
kolor sredni poziom stanu 11
kolor wysoki poziom stanu 156
```

---

## USTAWIENIA

Skrypty mają swoje ustawienia, które można załadować za pomocą `/laduj imie`
Komenda `/laduj imie` ładuje plik o nazwie `imie.json` z katalogu profilu Mudleta.

Pierwszej konfiguracji można również dokonań za pomocą kreatora, który w przypadku pierwszego uruchomienia pojawi się automatycznie.
Konfigurator można przywołać komendą `/konfiguruj`.

#### KATALOG PROFILU
Aby dowiedzieć się gdzie siedzi katalog profilu, należy w linii komend w Mudlecie wykonać komendę:

`lua getMudletHomeDir()`

Zobaczymy coś pokroju:

`/Users/nazwa_uzytkownika/.config/mudlet/profiles/Arkadia`

Z racji różnic Windows, Linux i OS X, profile są w innych miejscach
i trzeba sobie samemu sprawdzić gdzie dany profil się znajduje.

#### Podstawowa konfiguracjia
Aby stworzyć podstawową konfigurację wystarczy wpisać `/init imie imie_w_wolaczu` np. 
```
/init Adremen Adremenie
```
Trigger do ładowania automatycznego podczas logowania zostanie automatycznie utworzony, a właściwy plik zostanie utworzony w katalogu profilu.

Pomoc dotyczaca konfiguracji dostepna jest dostępna pod adresem: http://arkadia.kamerdyner.net/config.html 

Dodatkowo opis kluczy konfiguracyjnych dostępny [tutaj](config.md)

##### UWAGA: 
Czasami jest tak, że tekst wygląda lekko _rozjechany_. To znaczy, można to poznać po tym, że widać, że odstępy między tekstem są większe niż normalnie, wtedy podczas zaznaczania tekstu, tekst 'zsuwa' się ze sobą i odstępy są normalne. Jest to błąd Mudletowy. Wystarczy wtedy chwycić za tekst i zaznaczając go przeciagnac na sam dół aby najechać na dolny pasek - wtedy tekst _dosunie się_ i będzie już równo. Po wykonaniu `/ui_restart`, trzeba zawsze takie coś wykonać.

---

## WALKA

Pomoc znajduje się pod `/walka` wraz z opisem kompletnego zestawu bindów oraz klikalnych akcji. Prawe górne okno to okno kondycji, gdzie drukowani są wszyscy na lokacji, jeden wiersz na jedną osobę. Pierwszy wiersz to Ty, kolejni to (jeśli jesteś w) drużyna, kolejni to wrogowie i na końcu neutralni. Kolorowanie dość intuicyjne: zieloni to Twoi, fioletowi to wrogowie Twoi/drużyny, czerwony to aktualnie bity przez Ciebie, biali to neutralni. Czerwony znacznik `>>` przy osobie wskazuje, że ta osoba to cel ataku, zielony znacznik `>>` to cel obrony.

Opis wiersza wroga:

`[ 1][#######] Postac Z -> [@,A,B]`

Najpierw jest ID postaci używane w bindach (patrz `/walka`), później pasek życia, później imię/short, później identyfikatory postaci z drużyny, które biją tę postać (drużynowi są oznaczani `A`, `B`, `C`..., `@` to JA). 

Wiersz członków drużyny wygląda tak:

`[ C][#######] Postac Y -> [2,3,4]`

Tutaj inne znaczenie ma jedynie ostatni kawałek - oznacza to, że naszego kolegę/koleżankę z drużyny biją wrogowie o ID `2`, `3` i `4`.

W oknie kondycji (prawy górny róg) numerowani (pierwsza kolumna) są domyślnie tylko aktualni przeciwnicy. Czyli, praktycznie wszystkie bindy ataku typu `/z 2` itp. będą działały tylko na wrogach, z którymi aktualnie już walczymy. Można to zmienić, aby numerować wszystkich (ale wtedy należy uwazać, bo bindy + klikalne akcje na oknie działają na wszystkich). Aby zmienić to należy użyć opcji `/numeruj` w kliencie. Aby zmienić domyślne ustawienie wraz ze startem Mudleta, w pliku ustawień trzeba zmienić opcję `ateam.all_numbering`

---

## EKWIPUNEK

Pomoc znajduje się w '/ekwipunek'. W skryptach jest wsparcie lampy - liczenie butelek, przypominanie o dopełnieniu lampy (z bindem). Są też manualne bindy '/zb' i '/zb!'

---

## ZIOŁA

Pomoc znajduje się w `/ziola`
Skrypt potrafi wydrukować wypis co jest w woreczku po `zajrzeniu do niego`. Potrafi też zbudować bazeę ziół - rozpozna co jest w którym woreczku i będą działały bindy do brania ziół z odpowiednich woreczków (skrypt będzie 
więdział w których jest ile którego zioła).
Jest również komenda do pakowania ziół: 

`/zapakuj [numer_woreczka] [ziolo]`

Czyli przykładowo, mając przy pasie/w ręce 7 woreczków, budujemy sobie bazę. 
Skrypt rozpozna wszystkie zioła w woreczkach (puste będzie widział jako puste). Załóżmy, że mamy zioła w woreczkach `1`, `3`, `4`, `6`, `7` i chcemy zapakować komuś cały woreczek delion. Możemy wykonać:

`/zapakuj 2 deliona`

_drugi_ woreczek jest pusty. 

#### UWAGA
Po każdej zmianie liczebników woreczków (przykładowo po wzieciu któregoś z plecaka/kupieniu jakiegoś/odłożeniu któregoś) skrypt ma w bazie nieprawidłowe przypisania liczebników woreczków (pierwszy, drugi...) do ziół. Dlatego, przy 
każdej takiej zmianie trzeba po prostu uruchomić `/ziola_buduj` - wtedy skrypt pozbiera i zbuduje mapę ziół na nowo.

Do poprawnego działania polecenie `/ziola_buduj` istotne jest też aby na Arkadii ustawić opcję szerokości tekstu na 0: `opcje szerokosc 0`.

Skrypt wspiera sytuacje, kiedy mamy przykladowo 10 woreczków, ale tylko 6 z nich przy sobie, czyli przy pasie/w rece (reszta w plecaku), baze zbuduje tylko z tych 6.

Przy ziołach są dwa ważne ustawienia w pliku z ustawieniami. Pierwsza to:

`herbs["many_to_int"] = 25`

skrypt widząc _wiele zoltych jasnych kwiatow_ w woreczku musi przypisać temu _wiele_ jakąś liczbę. Ustawiam tutaj domyślną liczbę 25, ale można ją dowolnie zmienić (czyli trzeba sprawdzić ile postać widzi w liczebniku, a od jakiej 
ilości zaczyna się _wiele_). Druga opcja to:

`herbs["full_bag_amount"] = 44`

sluży to do pakowania woreczków. Definicja ile to oznacza pełny woreczek, czyli ile ziół zapakuje podczas komendy `/zapakuj`.

---

## UI

Pomoc znajduje się w `/ui`.
UI to dolna belka oraz okno stanów (prawy górny róg). Należy przejrzeć `/ui`, jest tam wszystko wyjaśnione.

Poza tym, w pliku z ustawieniami można sobie zdefiniować co ma być gagowane (dodawane [tagi]), co usuwane, a co zostawione tak jak przychodzi z Arkadii.

---

## BINDY

Pomoc znajduje się w `/bindy`. Kilka przydatnych bindów do wycinania, medytacji, masowej oceny kamieni (czyli 
zsumuje wartosc wszystkich), kowala itp.

---

## BRONIE

Pomoc znajduje się w `/bronie`. Można sobie ustawić do trzech pojemników na bronie (lub na tarczę, będzie to pojemnik _other_ albo plecy (opcja gz...)). Ustawienia wszystkich pojemników wraz ze szczegółami jak to zrobić jest w pliku konfiguracyjnym txt.

---

## STATYSTYKI

Są dostępne statystyki parowań, otrzymamych ciosów itp., Statystyki dostępne w `/stat`.

---

## LICZNIKI

**Liczniki zabitych**

`/zabici` - pokazuje zabitych,
<br>
`/zabici_reset` - resetuje licznik zabitych.
<br>
`/zabici2` - globalni zabici od ostatniego resetu licznika,
<br>
`/zabici2!` - globalni zabici z uwzglednieniem zabitych/dzien,
<br>
`/zabici2 [data]` - log zabitych z [dnia]. Przykładowo: `/zabici2 2017/1/22`.
<br>
`/zabici2_reset` - resetuje globalny licznik zabitych.
<br><br>
**Liczniki postępów**
<br>
`/postepy` - pokazuje postępy (czas, wrogowie itp),
<br>
`/postepy_reset` - resetuje licznik postępów.
<br>
`/postepy2` - globalny licznik postępów od ostatniego resetu,
<br>
`/postepy2+` - dodaje jeden postep do globalnego licznika,
<br>
`/postepy2+ [ile]` - dodaje [ile] postepow do globalnego licznika. Przykładowo: `/postepy2+ 4` doda 4 postepy,
<br>
`/postepy2- [id]` - usuwa wpis z globalnego licznika o tym _id_. _id_ można znaleźć jako pierwsza kolumna od lewej w `/postepy2`,
<br>
`/postepy2_reset` - resetuje globalny licznik postepow. 
<br><br>
**Licznik poziomu** 
<br>
`/cechy` - wyswietla cechy i poziom postaci (minilevele)

---

## ZBIERANIE Z CIAŁ

Pomoc dostępna w `/zbieranie`

Domyślnie ustawiona jest opcja, która sprawia, że będzie drukowane powiadomienie kiedy kogoś zabijemy i żeby użyc binda w celu zebrania monet + kamieni. Aby zmienić to należy użyć opcji `/zbieranie [numer_opcji]` w Mudlecie. Aby zmienić domyślne ustawienie wraz ze startem Mudleta, w pliku ustawień trzeba zmienić opcję: 

`scripts.inv.collect.current_mode = 3`

Dolny pasek zawiera też element `Collect`, który można klikać i zmieniać opcje.

---

## STATKI/DYLIŻANSE

Działają wszystkie statki. Przy wejściu będzie bind będzie brał pieniądze z pojemnika `money`, kupował bilet, wsiadał na statek oraz wkładał monety do pojemnika `money`; przy dopłynięciu zbindowane będzie zejście.
Dyliżanse w Imperium działają, wozy/powozy w Ishtar nie wszystkie.

Bindowany jest klawisz `[`.

---

## POJEMNIKI

[Instrukcja konfiguracji pojemników](http://arkadia.kamerdyner.net/pojemniki.html)

Komenda `/pojemniki` pokaże aktualną konfigurację pojemników. 

jak na razie dostępne bindy to `wem`/`/wlm` (branie/wkładanie monet) oraz `wep`/`wlp` (branie/wkładanie paczki).

---

## BAZA

W skryptach znajduje się wsparcie bazy postaci. W katalogu profilu jest plik: Database_scripts.db
Ten plik zawiera baze.

Wszystkie komendy i pomoc jest opisana pod `/baza`.
Bazę można pobrać korzystając z komendy `/pobierz_baze`.

Baza jest budowana następująco:

- jest możliwość zapisywania/aktualizowania wszystkich osób przedstawiających się na Arkadii. Domyślnie jest to wyłączone, aby włączyć trzeba sobie ustawić `scripts.people["updating_names"] = true` w ustawieniach;
- zapisywane jest `id` lokacji, na której dana osoba się przedstawiła;
- do NPCów na poczcie jest GPS: po 'obejrzyj tablice' na zielono podświetlą nam się na zielono osoby z paczkami, których lokacje są w bazie. Jest też możliwy kolor pomarańczowy. Znaczy to, ze w bazie jest więcej niż jedna postać pasujaca. Można zrobić `/przeszukaj [imie]`.
- wraz ze startem Mudleta, ładowane są triggery pokazujące imiona wszystkich graczy zgildiowanych (za wyjątkiem GP). NPC + osoby GP pojawią się gdy zostaną zobaczone w grze, wtedy jest ładowany ich trigger z bazy danych.

---


## ROZSZERZNIE SKRYPTÓW

W łatwy sposób można również dodać dodatkowe skrypty ładowane razem ze niniejszą paczką.
W katalog profilu, skrypty tworzą katalog `plugins`, należy w nim umieścić plik z paczka zawierającą plik `init.lua` z listą plików do załadowania.

Dodatkowo opcjonalnie można załączyc plik mudletowy .xml o nazwie odpowiadającej nazwie katalogu wtyczki

Rowniez opcjonalnie mozna zalaczy plik `config_schema.json`. Zaktualizuje on istniejaca scheme ustawien. Struktura powinna byc identyczna jak pliku z glownej paczki.

*Poprawna* paczka, *poprawnie* umieszczona zostanie automatycznie załadowana tuż po plikach skryptów z podstawowej paczki.

##### Przykład struktury
```
 .
 |____ katalog profilu
   |____ plugins
      |____ nasz_plugin
        |____ init.lua
        |____ nasz_plugin.xml
        |____ dodatkowe.lua
        |____ skrypty.lua
        |____ config_schema.json
```

##### _init.lua_
```
    return {
        "dodatkowe",
        "skrypty"
    }
```

## KONTAKT

1. Na forum: [@Adremen](http://arkadia.rpg.pl/forum/memberlist.php?mode=viewprofile&u=1084)
2. [Temat](https://arkadia.rpg.pl/forum/viewtopic.php?f=15&t=1023), w którym można uzyskać pomoc na forum
3. [Discord](https://discord.gg/76yaZnw)
