# Arhitekture paketskih čvorišta - Konverter paketa u ćelije

## Uvod

Ovaj projekat ima za cilj dizajniranje i implementaciju konvertera paketa u ćelije koristeći Avalon ST interfejs. Takav sistem omogućava bolje upravljanje podacima, preciznije vremensko usklađivanje i prilagođavanje specifičnim mrežnim protokolima. Posebna pažnja posvećena je mehanizmima za upravljanje backpressure-om i zero padding-om, čime se obezbjeđuje pouzdana i efikasna obrada podataka u realnim scenarijima.

Implementacija konvertera oslanja se na korištenje VHDL jezika za hardverski dizajn, što omogućava visoke performanse i fleksibilnost. U okviru projekta korišteni su softverski alati kao što su ModelSim za simulaciju i vizualizaciju testbench scenarija i Quartus Prime Lite za sintezu i analizu digitalnog dizajna. Pored toga, prikazani su WaveDrom dijagrami i FSM modeli koji omogućavaju detaljnu vizualizaciju toka podataka i ponašanja sistema.

---

## Opis projekta

Cilj ovog projekta je modeliranje i implementacija sklopa za konverziju paketa u ćelije.
Projekat koristi 8-bitni Avalon ST interfejs za prijem Ethernet okvira proizvoljne dužine (64 - 1500 bajta) i generiše izlazni tok fiksnih ćelija dužine 64 bajta.

### Specifikacija:

| Stavka | Opis |
| -------- | ------ |
| **Ulaz:** | 8-bitni Avalon ST interfejs koji prima Ethernet pakete. |
| **Izlaz:** | 8-bitni Avalon ST interfejs koji generiše niz ćelija fiksne dužine (64 bajta). |
| **Proces:** | Paket se dijeli na ćelije od 64 bajta.<br> Broj ćelija, \(N\), definisan je kao \(N\) = {[Veličina paketa] / 64} <br> Svaka ćelija prenosi dijelove paketa sa ulaznog interfejsa. <br> Posljednja ćelija se dopunjava nulama (zero padding) do dužine od 64 bajta. |
| **Signalizacija:** | Početak i kraj ćelije označeni su signalima `sop` (start of packet) i `eop` (end of packet). <br> Paralelno sa podacima, izlazni interfejs prenosi `channel` signal koji sadrži: <ul><li>Redni broj paketa,</li><li>Redni broj ćelije unutar paketa.</li></ul> |

---

## Avalon ST interfejs

**Avalon streaming interfejs (Avalon ST)** je interfejs koji podržava jednosmjerni tok podataka, uključujući multipleksirane tokove, pakete i DSP podatke. [^1]

Tipični sistem koji koristi Avalon ST interfejse kombinira više funkcionalnih modula, koji se zovu komponente. "System designer" omogućava konfigurisanje komponenata i njihovo povezivanje kako bi se implementirao sistem. [^1]

---

## WaveDrom

### Konverter paketa u ćelije

*WaveDrom signali Avalon ST konvertera paketa u ćelije prikazani su na slici 1:*

<p align="center">
<img src="WaveDrom/Packet to cell conversion/Packet_to_cell_conversion.png" alt="Packet_to_cell_conversion"></img>
<br>
<em>Slika 1: Konverter paketa u ćelije</em>
</p>

Dvije vijugave linije na ovom i ostalim graficima označavaju skokove, tj. radi pojednostavljenja grafika se ne prikazuju svi podaci koji se prenose. Kod `source_channel` signala možemo vidjeti tri vrijednosti koje su različito obojene. Žuta boja predstavlja prvi kanal, plava predstavlja drugi kanal.

### Signali grafika konvertera paketa u ćelije:

*WaveDrom grafik 8-bitnog Avalon ST interfejsa koji konvertuje pakete u ćelije se sastoji od sljedećih signala:*

- `clk` - Takt signal sistema koji usklađuje sve operacije;
- `reset` - Signal za resetiranje koji sistem vraća u početno stanje;
- `sink_valid` - Označava da su ulazni podaci validni;
- `sink_ready` - Označava da je "sink" modul spreman primiti podatke;
- `sink_data[7:0]` - 8-bitni podatkovni signal na "sink" strani Avalon ST interfejsa. Služi za prijenos payload-a tokom svakog takta;
- `sink_sop` - Ovaj signal označava prvi takt podatkovnog paketa koji ulazi u interfejs, tj. početak paketa;
- `sink_eop` - Ovo je posljednji takt podatkovnog paketa, označava gdje se završava paket;
- `source_cell` - Prenosi podatke u formatu ćelija koje su kreirane iz ulaznih paketa;
- `source_soc` - Ovaj signal označava početak generisane ćelije;
- `source_eoc` - Ovaj signal označava kraj generisane ćelije;
- `source_channel` - Omogućava višekanalni prijenos podataka. To je signal koji označava identifikator kanala sa kojeg podaci dolaze;
- `source_valid` - Označava da su izlazni podaci spremni za prijenos;
- `source_ready` - Označava da je izlazni interfejs spreman primiti nove podatke;
- `byte_counter[7:0]` - 8-bitni signal koji je brojač bajta i prati broj prenesenih bajta;
- `state` - Trenutno stanje FSM-a (Idle, SENDING_CELL);
- `bit_counter` - Brojač bita koji prati broj prenesenih bita.
- `cell_incomplete` - Ovaj signal označava da trenutna ćelija (bilo paket ili blok podataka) još nije u potpunosti popunjena te da je potrebna dodatna obrada ili unos podataka za njezino dovršavanje.
- `padding_complete` - Ovaj signal označava da je postupak dopunjavanja zadnje ćelije, koja prirodno nije ispunjena svim potrebnim podacima, završen, odnosno da su ubačeni potrebni dodatni podaci (najčešće nule ili unaprijed definirani uzorak) kako bi se osigurala fiksna veličina ćelije te pripremila za daljnju obradu ili slanje.

### Zero padding

 **Zero padding** je tehnika koja se obično koristi u obradi digitalnih signala kako bi se standardizirale dimenzije, osigurale optimalne performanse i očuvale prvobitna struktura ulaznih podataka. Ova tehnika podrazumijeva dodavanje nula ulaznim podacima kako bi se osiguralo da podaci imaju specifičan oblik koji je pogodan za daljnju obradu. Iako ova tehnika dodatno opterećuje procesor, to je gotovo neznatno i prednosti kao što su očuvanje veličine podataka i povećana preciznost analize podataka čine ovu tehniku neophodnom. [^2]

*WaveDrom signali za zero padding 1B su prikazani na slici 2:*

<p align="center">
<img src="WaveDrom/Zero padding/1B/Zero_padding_1B.png" alt="Zero_padding_1B"></img>
<em>Slika 2: Zero padding 1B</em>
<br>
</p>

*WaveDrom signali za zero padding 63B su prikazani na slici 3:*

<p align="center">
<img src="WaveDrom/Zero padding/63B/Zero_padding_63B.png" alt="Zero_padding_63B"></img>
<em>Slika 3: Zero padding 63B</em>
<br>
</p>

### Backpressure

**Backpressure** je mehanizam u kojem dolazi do signaliziranja od strane izlaznog interfejsa prema ulaznom interfejsu i signalizira se da je potrebno privremeno zaustavljanje slanja podataka jer izlazni interfejs nije spreman za obradu podataka. U Avalon ST Splitter jezgri, backpressure-om se upravlja na način da ako izlazni signal promijeni vrijednost `ready` signala sa 1 na 0, tada ulazni signal prima taj signal promijenjene vrijednosti i podaci se prestaju slati, čime se osigurava sinhronizacija toka podataka. [^3] 

*WaveDrom signali za backpressure slučaj su prikazani na slici 4:*

<p align="center">
<img src="WaveDrom/Backpressure/Backpressure.png" alt="Backpressure"></img>
<em>Slika 4: Wavedrom grafik - Backpressure</em>
<br>
</p>

---

## FSM - Finite State Machine

Blok "Finite State Machine" dodaje "state machine" u DSP Builder dizajn. Finite State Machine se može opisati koristeći FSM specifikacijski jezik, koji se unosi u tekstualnu datoteku. Zatim, ta tekstualna datoteka se učita koristeći Finite State Machine blok i povezuju se ulazni i izlazni portovi bloka FSM-a s ostatkom dizajna. DSP Builder zatim generiše odgovarajuće loop (ForLoop) i lookup-table (LUT) strukture za implementaciju state-machine-a opisanog u tekstualnoj datoteci. Međutim, ti ForLoop i LUT blokovi nisu vidljivi u DSP Builder dizajnu. DSP Builder prevodi ForLoop i LUT blokove u RTL s automatskim mapiranjem uređaja i balansiranjem latencije s ostatkom DSP Builder dizajna. DSP Builder pruža primjer dizajna konačnog automata, demo_fsm.mdl, koji pokazuje kako koristiti blok Finite State Machine za filtriranje specifičnih numeričkih vrijednosti iz ulaznog toka. [^4]    

Kao pomoć pri kreiranju dijagrama FSM-a, može se koristiti **FSM state viewer** u **Quartus Prime Lite** softveru kojem se može pristuputi klikom na **Tools** -> **Netlist viewers** -> **State Machine Viewer**.

*FSM state viewer je prikazan na slici 5:*

<p align="center">
<img src="VHDL/Slike/FSM_state_viewer.png" alt="FSM_state_viewer"></img>
<br>
<em>Slika 5: FSM - Finite State Machine</em>
</p>

*FSM Avalon-ST Konvertera paketa u ćelije je prikazan na slici 6:*

<p align="center">
<img src="FSM/FSM.png" alt="FSM"></img>
<em>Slika 6: FSM - Finite State Machine</em>
<br>
</p>

---

## RTL viewer

RTL (Register Transfer Level) prikazuje kako je HDL kod (VHDL ili Verilog) preveden u hardverske komponente kao što su registri, multiplekseri i druge digitalne komponente. U suštini, RTL prikazuje grafičku reprezentaciju digitalnog dizajna na nivou registara i logičkih operacija.

RTL viewer-u se može pristuputi klikom na **Tools** -> **Netlist viewers** -> **RTL Viewer**.

<p align="center">
<img src="VHDL/Slike/RTL_state_viewer.png" alt="RTL_state_viewer"></img>
<em>Slika 7: RTL - Register Transfer Level</em>
<br>
</p>

---

## VHDL

VHDL je jezik za opis hardvera koji se koristi za modeliranje, dizajn i verifikaciju digitalnih sistema. Omogućava inženjerima da opišu strukturu i ponašanje digitalnih kola na visokom nivou apstrakcije. Koristi se za dizajn integrisanih kola (IC), FPGA uređaja i drugih digitalnih sistema.

### ModelSim

ModelSim je korišten kako bi se prikazali signali za slučaj bez backpressure-a i bez zero padding-a, slučaj sa zero padding-om i slučaj sa backpressure-om. 

Sljedeći signali su prikazani u heksadecimalnom formatu radi bolje čitljivosti:
- `sink_data`,
- `source_cell`,
- `source_channel`,
- `byte_counter`,
- `state_out`,
- `bit_counter`.

#### Packet-to-cell converter

<p align="center">
<img src="VHDL/Slike/tb_packet_to_cell.png" alt="tb_packet_to_cell"></img>
<em>Slika 8: ModelSim - Packet-to-cell converter</em>
<br>
</p>

#### Backpressure

<p align="center">
<img src="VHDL/Slike/tb_packet_to_cell_backpressure.png" alt="tb_packet_to_cell_backpressure"></img>
<em>Slika 9: ModelSim - Backpressure</em>
<br>
</p>

#### Zero padding

<p align="center">
<img src="VHDL/Slike/tb_packet_to_cell_zero_padding.png" alt="tb_packet_to_cell_zero_padding"></img> 
<em>Slika 10: ModelSim - Zero padding</em>
<br>
</p>

### Compilation report

<p align="center">
<img src="VHDL/Slike/compilation_report.png" alt="compilation_report"></img>
<br>
<em>Slika 11 Compilation report</em>
</p> 

---

## Zaključak

Ovaj projekat implementira konverter paketa u ćelije u VHDL-u, uključujući testbench-ove za testiranje posebnih scenarija. Također, projekat jasno pokazuje uspješnu implementaciju kao i testiranje konvertera paketa u ćelije, koristeći VHDL. Dizajn uključuje Avalon interfejs, a postoje testbench-ovi za scenarije backpressure-a i zero padding-a. Projekat također uključuje WaveDrom dijagrame za vizualizaciju konverzije paketa u ćelije, backpressure-a i funkcionalnosti popunjavanja nulama. FSM dijagram nam pomaže vizualizirati stanja konvertera paketa u ćelije, dok nam RTL prikazuje digitalni dizajn na nivou registara i logičkih operacija.

Primjena Avalon ST interfejsa omogućava fleksibilnu integraciju i optimizaciju toka podataka, dok testbench-ovi pružaju validaciju ispravnog rada u različitim scenarijima kao što su backpressure i zero padding. 

Sveobuhvatno testiranje kroz ModelSim simulacije i uspješan prikaz signala potvrđuju funkcionalnost i pouzdanost dizajna. Projekat predstavlja značajan korak u arhitekturi paketskih čvorišta, pružajući modularno i prilagodljivo rješenje koje može naći široku primjenu u mrežnim i komunikacionim sistemima.

---

## Reference

[^1]: Intel Corporation. [Intel Avalon-ST Interface](https://www.intel.com/content/www/us/en/docs/programmable/683647/18-0/avalon-st-interface.html)
[^2]: GeeksForGeeks Sanchhaya Education Private Limited, (17 Sep, 2024). [GeeksForGeeks - Zero Padding in Deep Learing and Signal Processing](https://www.geeksforgeeks.org/zero-padding-in-deep-learning-and-signal-processing/)
[^3]: Intel Corporation. [Embedded Peripherals IP User Guide](https://www.intel.com/content/www/us/en/docs/programmable/683130/22-2/backpressure.html)
[^4]: Intel Corporation. [DSP Builder for Intel® FPGAs](https://www.intel.com/content/www/us/en/docs/programmable/683337/22-2/finite-state-machine.html)
