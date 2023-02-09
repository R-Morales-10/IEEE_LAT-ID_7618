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



Resultados 
Gráfico de decisión
<img width="886" alt="Gráfico de decisión" src="https://user-images.githubusercontent.com/124928447/217936819-685ead1d-2dc7-40a6-ac7d-5961a7de3fe8.png">

2 Clústeres
<img width="882" alt="2 Clústeres" src="https://user-images.githubusercontent.com/124928447/217936898-d498e7dd-2581-468c-85f1-30ba35c890d9.png">

3 Clústeres
<img width="907" alt="3 Clústeres" src="https://user-images.githubusercontent.com/124928447/217936945-8d48e456-53d8-41c0-b64d-1e5f02530a79.png">
