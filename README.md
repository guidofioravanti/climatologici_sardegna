# Climatologici Sardegna

Creazione di una climatologia (temperatura e precipitazione) per il periodo 1981-2010 per la regione Sardegna.

## Regole del WMO per il calcolo dei valori climatologici

Le regole del WMO sono [qui](./md/WMO.md) sintetizzate

## Serie giornaliere di temperatura

Le serie sono state sottoposte ai controlli di qualita’:

* di autoconsistenza 
* controlli spaziali (corroboration e regression test) 

Per quanto riguarda la ricerca di valori ripetuti all’interno della serie, si e’ abbassata la soglia di tolleranza da 20 a 10 valori (?? ricontrollare nel codice). Diverse serie di temperatura massima e minima identificate da Michele sono state invalidate per la presenza di valori ripetuti che sfuggono ai controlli di qualita'.

### Omogeneizzazione delle serie giornaliere

L'identificazione e l'omogeneizzazione dei breakpoints e' stata eseguita mediante il pacchetto R `Climatol`.

L’omogeneizzazione ha coinvolto anche serie di temperatura "brevi" (lunghezza minima dieci anni), ovvero con un numero di dati non adatto al calcolo del valore climatologico. Per le serie piu’ lunghe di dieci anni si e’ ammessa la presenza di un buco di 3 anni di dati. Questo per avere un set di serie abbastanza robuste (in termini di continuita’ e completezza) da utilizzare per l’omogeneizzazione. A livello giornaliero si e’ utilizzata la regola del 5/10 del WMO (ovvero sono stati considerati validi i mesi con 10 giorni mancanti e con al massimo un blocco continuo di 5 NA).

### Temperatura massima (Tmax)

Risultati omogeneizzazione

### Temperatura minima (Tmin)

Risultati omogeneizzazione

## Serie giornaliere di precipitazione

Le serie sono state sottoposte ai controlli di qualita’ di autoconsistenza. Non sono stati invece applicati i controlli spaziali che, nel caso della precipitazione, sono piu’ difficili da automatizzare e i cui risultati richiederebbero un controllo manuale.
