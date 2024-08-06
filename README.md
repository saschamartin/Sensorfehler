# Sensorfehler
Berücksichtigung von Sensorfehlern bei der aktiven Unterdrückung von Flattern

Dieses Repository beinhaltet den Code und das Modell für die Bachelorarbeit.
Eingebunden ist der Ordner PMtools mit vielen Hilfsbausteinen zur Unterstützung der Analyse.
Der Ordner kann bei [pusch-research](https://github.com/pusch-research/PMtools/tree/c8bbd8e408e388d3cad19726091cbc2220a16454) gefunden werden.

| Dateien | Erklärung |
|---------|-----------|
| Approximation.slx | Simulinkmodell |
| Ausschlag_accel_vel_pos.m | Visualisierung der Flügelzustände einer Schwingung |
| OutputPlot.m | Darstellung der Graphen bei Auslenkung des Systems |
| PZMaps.m | Original von PMtools |
| SensorLoss.m | Simulation von Sensorausfällen |
| loadSystem.m | Einlesen von Systemdateien und einlesen des benötigen Systems |
| main.m | Hauptfunktion; Aufrufen von benötigten Funktionen und Dateien |
| modeforms.m | Darstellung der Schwingungsformen bei einseitig eingespanntem Balken |
| plotgewicht.m | Visualisierung Gewichtung von Regler-Eingangsmatrix |
| signalgenerierung.m | Generierung des Anregungsignals durch Parameter von testausschlaege.m |
| testausschläge.m | Simulation des Systems unter Anregung |


## Für die Simulation benötigt
1. main.m
2. loadSystem.m
3. Approximation.slx



