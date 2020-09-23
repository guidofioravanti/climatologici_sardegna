# Climatologici Sardegna

Creazione di una climatologia (temperatura e precipitazione) per il periodo 1981-2010 per la regione Sardegna.

## Regole del WMO per il calcolo dei valori climatologici

Le regole del WMO sono [qui](./md/WMO.md) sintetizzate

## Considerazioni sull'omogeneita' delle serie

Il volume del WMO discute il perche' le serie debbono essere omogenee, si veda [qui](./md/homogeneity.md)

## Numero di anni necessari per il calcolo di valori normali

La sezione **Use of shorter averaging periods** del WMO Guidelines on the Calculation of Climate Normals (pagina 17) riporta:

```
In The Role of Climatological Normals in a Changing Climate (WMO, 2007), it was found that, for most mean and sum parameters 
(not extreme parameters or higher-order statistical properties such as quantiles), 10–12 years of data provided a predictive 
skill similar to that from a standard 30-year period. 
```

Sempre nella stessa pagina:

```
While such short periods cannot be considered to be climatological standard normals or reference normals, 
they are still useful to many users, and in many cases, there will be benefits to calculating such averages 
operationally. Readers are referred to section 7.2 of The Role of Climatological Normals in a Changing Climate 
(WMO, 2007) for further details and potential methods
```


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

### Bibliografia

Documenti utili per il calcolo dei valori normali:

- [WMO Guidelines on the Calculation of Climate Normals](https://library.wmo.int/doc_num.php?explnum_id=4166)
- [THE ROLE OF CLIMATOLOGICAL NORMALS IN A CHANGING CLIMATE](https://library.wmo.int/doc_num.php?explnum_id=4546)
- The Definition of the Standard WMO Climate Normal: The Key to Deriving Alternative Climate Normals. 2011, Arguez and Vose, Bulletin of the American Meteorological Society 92
- [Canadian Climate Normals 1981-2010](https://climate.weather.gc.ca/doc/Canadian_Climate_Normals_1981_2010_Calculation_Information.pdf) 
- [CRAN web page](https://cran.r-project.org/web/packages/weathercan/vignettes/glossary_normals.html) 
