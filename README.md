# IEEE_LAT-ID_7618

Additional resources and documentation for the manuscript "Modular Advanced Metering Infrastructure to Reduce Electricity Theft and a Cluster-Based Illegal Loads Detection" ID 6318 accepted for IEEE Latin America transactions.
The main code is in "Matlab" language. Named AMI_M and the data in the file AMI_M2

REQUIREMENTS

Matlab 2016a or later.


HOW DOES IT WORK

Cluster-based algorithm based on the Framework presented in:
Qi Qi Duan. Testing Framework, DensityClust, MATLAB Central File Exchange. November 2015.

The data has been obtained from simulations of a real AMI-Modular model to identify theft of electrical energy.
After 60 days, a 100W theft is simulated.

After executing the program with the Gaussian Kernel (main program), the points with the largest (delta) must be selected.
If the point of greatest magnitude (delta) is selected, a single cluster will be generated.
If the point with the second maximum value (delta) is selected, two clusters will be generated.
If the third largest value (delta) is selected, three clusters will be generated, and so on.


RESULTS


Decision graph

<img width="886" alt="Gráfico de decisión" src="https://user-images.githubusercontent.com/124928447/217936819-685ead1d-2dc7-40a6-ac7d-5961a7de3fe8.png">

Two Clusters

<img width="882" alt="2 Clústeres" src="https://user-images.githubusercontent.com/124928447/217936898-d498e7dd-2581-468c-85f1-30ba35c890d9.png">

Three Clusters

<img width="907" alt="3 Clústeres" src="https://user-images.githubusercontent.com/124928447/217936945-8d48e456-53d8-41c0-b64d-1e5f02530a79.png">
