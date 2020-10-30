# Calcolo dei Valori Climatologici, Sardegna

Creazione di una climatologia (temperatura e precipitazione) per il periodo 1981-2010 per la regione Sardegna.

## Regole del WMO per il calcolo dei valori climatologici

Le regole del WMO sono [qui](./md/WMO.md) sintetizzate

## Considerazioni sull'omogeneita' delle serie

Il volume del WMO discute il perche' le serie debbono essere omogenee, si veda [qui](./md/homogeneity.md)

## Numero di anni necessari per il calcolo di valori normali

La sezione **Use of shorter averaging periods** del WMO Guidelines on the Calculation of Climate Normals (pagina 17) 
discute la possibilita' di calcolare dei valori di riferimenti per periodi inferiori al trentennio. Questi valori non 
debbono essere intesi come valori climatologi standard ma comunque possono essere utili agli utilizzatori finali. 

```
In The Role of Climatological Normals in a Changing Climate (WMO, 2007), it was found that, for most mean and 
sum parameters (not extreme parameters or higher-order statistical properties such as quantiles), 10–12 years 
of data provided a predictive skill similar to that from a standard 30-year period. 
```

Ad esempio:
- Il Canada pubblica on-line valori normali ammettendo anche 15 anni di dati mancanti
- I valori 1981-2010 degli U.S. richiedono che per ogni mese dell'anno ci siano almeno 10 valori disponibili 
(ovvero ammette fino a 20 anni di dati mancanti). Si veda [questo](https://journals.ametsoc.org/bams/article/93/11/1687/60140/NOAA-s-1981-2010-U-S-Climate-Normals-An-Overview) articolo, in cui si parla anche di valori normali per gli eventi estremi.

# Serie giornaliere di temperatura (Tmax e Tmin)

Le serie sono state sottoposte ai controlli di qualita’:

* di autoconsistenza 
* controlli spaziali (corroboration e regression test) 

I controlli di qualita' sono descritti in [Fioravanti et al.](https://rmets.onlinelibrary.wiley.com/doi/abs/10.1002/joc.6177), un'implementazione dei controlli 
di Durre et al. 2010 (Comprehensive Automated Quality Assurance of Daily Surface Observations).

Per quanto riguarda la ricerca di valori ripetuti all’interno della serie, si e’ abbassata la soglia di tolleranza da 20 a 10 valori (?? ricontrollare nel codice). Diverse serie di temperatura massima e minima identificate da Michele sono state invalidate per la presenza di valori ripetuti che sfuggono ai controlli di qualita'.

### Omogeneizzazione delle serie giornaliere

L'identificazione e l'omogeneizzazione dei breakpoints e' stata eseguita mediante il pacchetto R `Climatol`.

L’omogeneizzazione ha coinvolto anche serie di temperatura "brevi" (lunghezza minima dieci anni), ovvero con un numero di dati non adatto al calcolo del valore climatologico. Per le serie piu’ lunghe di dieci anni si e’ ammessa la presenza di un buco di 3 anni di dati. Questo per avere un set di serie abbastanza robuste (in termini di continuita’ e completezza) da utilizzare per l’omogeneizzazione. A livello giornaliero si e’ utilizzata la regola del 5/10 del WMO (ovvero sono stati considerati validi i mesi con 10 giorni mancanti e con al massimo un blocco continuo di 5 NA).

### Temperatura massima (Tmax)

Risultati omogeneizzazione

### Temperatura minima (Tmin)

Risultati omogeneizzazione

### Valori climatologici

Esempi di valori climatologici estremi:
  - [Svizzera](https://www.meteoswiss.admin.ch/home/climate/swiss-climate-in-detail/climate-normals/normal-values-per-measured-parameter.html)

## Serie giornaliere di precipitazione

Le serie sono state sottoposte ai controlli di qualita’ di autoconsistenza. Non sono stati invece applicati i controlli spaziali che, nel caso della precipitazione, sono piu’ difficili da automatizzare e i cui risultati richiederebbero un controllo manuale.

Numero di serie di precipitazione: **370**

| Numero anni mancanti trentennio | Numero stazioni con valore climatologico annuale | Useful | Doubtful | Suspect | Numero stazioni potenziali per calcolare il valore climatologico | Numero serie per test omogeneità, serie Wet Days | 
| --- | --- | --- | --- |--- | --- | --- |
| 6 | 169 | 160 | 9 | 13 | 196 | 182 |
| 10 | 169 | 160 | 9 | 13 | 225 | 182 | 
| 15 | 169 | 160 | 9 | 13 | 246 | 182 |

# Cose da fare

Lista di cose da fare:

- Ricalcolare i valori climatologici normali della temperatura (il criterio del WMO 10/5 richiede al piu' 4 giorni NA continui, 
mentre quelli adesso calcolati assumono al piu' 5 giorni NA continui). **FATTO e INVIATO RISULTATI A MICHELE (23 settembre)**
- Calcolare i valori climatologici della temperatura media **FATTO e INVIATO RISULTATI A MICHELE (25 settembre)**
- Calcolare i valori climatologici della diurnal temperature range (DTR) **FATTO e INVIATO RISULTATI A MICHELE (25 settembre)**
- Definire il numero di anni mancanti nel trentennio per calcolare dei valori di riferimenti NON standard **FATTO: 10 e 15 anni**
- Indici ESTREMI: calcolati. Calcolarne il valore climatologico.
- Dati di precipitazione **Calcolati come per la precipitazione per tre valori di dati mancanti: 6, 10 e 15***

# Bibliografia

### Documenti utili per il calcolo dei valori normali:

- [WMO Guidelines on the Calculation of Climate Normals](https://library.wmo.int/doc_num.php?explnum_id=4166)
- [THE ROLE OF CLIMATOLOGICAL NORMALS IN A CHANGING CLIMATE](https://library.wmo.int/doc_num.php?explnum_id=4546)
- The Definition of the Standard WMO Climate Normal: The Key to Deriving Alternative Climate Normals. 2011, Arguez and Vose, Bulletin of the American Meteorological Society 92
- [U.S. Climate Normals](https://www.ncdc.noaa.gov/data-access/land-based-station-data/land-based-datasets/climate-normals/1981-2010-normals-data)
- [Canadian Climate Normals 1981-2010](https://climate.weather.gc.ca/doc/Canadian_Climate_Normals_1981_2010_Calculation_Information.pdf) 
- [CRAN web page](https://cran.r-project.org/web/packages/weathercan/vignettes/glossary_normals.html) 

### Regola del 5/3 e 10/5

- [Accounting for missing data in monthly temperature series: Testing rule-of-thumb omission of months with missing values](https://rmets.onlinelibrary.wiley.com/doi/pdf/10.1002/joc.5801)
