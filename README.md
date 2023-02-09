# IEEE_LAT-ID_7618
Cluster-based algorithm to identify the theft of electrical energy outside electricity metering cabinets

Algoritmo de agrupamiento basado en el Framework presentado en:
Qi Qi Duan. Testing Framework, DensityClust, Intercambio de archivos central de MATLAB. noviembre de 2015.

Los datos se han obtenido de simulaciones de un modelo AMI-Modular real para identificar robos de energía eléctrica.
A los 60 días se simula un robo de 100W.

Después de ejecutar el programa con el Gaussian Kernel (progrma rincipal), se deben seleccionar los puntos con mayor (delta).
Si se selecciona el punto de mayor magnitud (delta), se generará un solo clúster. 
Si se selecciona el punto con el segundo valor máximo (delta), se generarán dos clústeres.
Si se selecciona el tercer valor más grande (delta), se generarán tres clústeres y así sucesivamente.
