# Arhitekture-paketskih-čvorišta
 Projekat : Konverter paketa u ćelije
## Opis projekta

Cilj ovog projekta je modeliranje i implementacija sklopa za konverziju paketa u ćelije. 
Projekat koristi 8-bitni Avalon ST interfejs za prijem Ethernet okvira proizvoljne dužine (64-1500 bajta) i generiše izlazni tok fiksnih ćelija dužine 64 bajta. 

### Specifikacija:
- **Ulaz:** 8-bitni Avalon ST interfejs koji prima Ethernet pakete.
- **Izlaz:** 8-bitni Avalon ST interfejs koji generiše niz ćelija fiksne dužine (64 bajta).
- **Proces:**
  - Paket se dijeli na ćelije od 64 bajta.
  - Broj ćelija, \( N \), definisan je kao \( N = [{Veličina paketa} / 64 ]
  - Svaka ćelija prenosi dijelove paketa sa ulaznog interfejsa.
  - Posljednja ćelija se dopunjava nulama (zero padding) do dužine od 64 bajta.
- **Signalizacija:**
  - Početak i kraj ćelije označeni su signalima `sop` (start of packet) i `eop` (end of packet).
  - Paralelno sa podacima, izlazni interfejs prenosi `channel` signal koji sadrži:
    - Redni broj paketa.
    - Redni broj ćelije unutar paketa.
