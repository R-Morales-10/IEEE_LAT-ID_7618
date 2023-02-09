% Clustering algorithm based on the framework presented in
% QiQi Duan. Testing Framework, DensityClust, MATLAB Central File Exchange. Nov. 2015.
%
% The data has been obtained from simulations of a real AMI-Modular model 
% to identify theft of electrical energy.
% After 60 days, a 100W theft is simulated.
%
% After running the program with the Gaussian Kernel, the points with the largest (delta) must be selected. 
% If the point with the highest magnitude (delta) is selected, a single cluster will be generated. 
% If the point with the second maximum value (delta) is selected, two clusters will be generated. 
% If the third largest value (delta) is selected, three clusters will be generated and so on.

close all
clear all

XY=load('AMI_M2');
N = size(XY,1);
dist = zeros(N,N);

for i = 1:N-1
    for j = i:N
        dist(i,j) = sqrt(sum((XY(i,1:end-1)-XY(j,1:end-1)).^2));
        dist(j,i) = sqrt(sum((XY(i,1:end-1)-XY(j,1:end-1)).^2));
    end
end
sorted_dist = sort(dist(:),'ascend');
d_c = sorted_dist(floor(N*N*0.02));


rho = zeros(N,1);
delta = zeros(N,1);
nn = zeros(N,1);
for i=1:N-1
    for j = i+1:N
        rho(i) = rho(i) + exp(-(dist(i,j)/d_c)^2);
        rho(j) = rho(j) + exp(-(dist(i,j)/d_c)^2);
    end
end

[rho_sorted, rho_index] = sort(rho,'descend');

for i = 2:N
    t_index = rho_index(1:i-1);
    [delta(rho_index(i)),min_idx] = min(dist(rho_index(i),rho_index(1:i-1)));
    nn(rho_index(i)) = t_index(min_idx);
    %x=rho(i)*delta(i);
    
   
end
delta(rho_index(1))=max(delta(2:end));
figure(1)
hold on
plot(rho,delta,'.k')
rho;
delta;
xlabel('\rho')
ylabel('\delta')
title('Decision graph')
axis([0,max(rho)*1.1,0,max(delta)*1.1])
threshold = ginput(1);



selected_center = (rho>threshold(1)) & (delta>threshold(2)); 
n_cluster = sum(selected_center);

cluster_result = zeros(N,1);
null_index = 1:N;
centroid_index=null_index(selected_center);
color_map = colormap('hsv');
for i = 1:n_cluster
    cluster_result(centroid_index(i)) = i;
    plot(rho(centroid_index(i)),delta(centroid_index(i)),'o','MarkerSize',4,'MarkerEdgeColor',color_map(ceil(i*64/(n_cluster+1)),:),'MarkerFaceColor',color_map(ceil(i*64/(n_cluster+1)),:))
end

for i = 1:N
    if cluster_result(rho_index(i))==0
        cluster_result(rho_index(i)) = cluster_result(nn(rho_index(i)));
    end
end
rho_border = zeros(n_cluster,1);
for i = 1:N-1
    for j = i+1:N
        if (cluster_result(i) ~= cluster_result(j)) && (dist(i,j) < d_c)
            rho_border(cluster_result(i)) = max(rho_border(cluster_result(i)),(rho(i)+rho(j))/2);
            rho_border(cluster_result(j)) = max(rho_border(cluster_result(j)),(rho(i)+rho(j))/2);
        end
    end
end
halo = logical(zeros(N,1));
for i = 1:N
    if rho(i) < rho_border(cluster_result(i))
        halo(i)=true;
    end
end



figure(2)
hold on
for i=1:n_cluster
    plot(XY(cluster_result==i,1),XY(cluster_result==i,2),'o','MarkerSize',2,'MarkerEdgeColor',color_map(floor(64*i/(n_cluster+1)),:),'MarkerFaceColor',color_map(round(64*i/(n_cluster+1)),:))
end
plot(XY(cluster_result<0,1),XY(cluster_result<0,2),'o','MarkerSize',2,'MarkerEdgeColor','k','MarkerFaceColor','k')
title('Cluster result')
%


for i=1:max(XY(:,end))
    cluster_index = mode(cluster_result(XY(:,end)==i));
    TP = (cluster_result == cluster_index) & (XY(:,end)==i);
    FP = (cluster_result == cluster_index) & (XY(:,end)~=i);
    TN = (cluster_result ~= cluster_index) & (XY(:,end)~=i);
    FN = (cluster_result ~= cluster_index) & (XY(:,end)==i);
    legend_str{i}=sprintf('[Cluster %d]: Recall rate : %.2f  Precision rate: %.2f',i,sum(TP)/(sum(TP)+sum(FN)),sum(TP)/(sum(TP)+sum(FP)));
   
    
end



hl = legend(legend_str);

set(hl,'Location','BestOutside')