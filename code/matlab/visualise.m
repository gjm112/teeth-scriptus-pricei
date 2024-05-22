toothtype = "UM2"
dddd = readtable("/Users/gregorymatthews/Dropbox/teeth-scriptus-pricei/data/matlab/nas/pairwise_distances_" + toothtype + ".csv")
%dddd = readtable("/Users/gregorymatthews/Dropbox/teeth-scriptus-pricei/data/matlab/pairwise_distances_" + toothtype + ".csv")
dddd = table2array(dddd)
%$dddd(40,:) = []
%dddd(:,40) = []
size(dddd)

figure(1);clf
imagesc(ddd)
colorbar

y = mdscale(dddd, 2)
figure(1); clf
plot(y(1:39,1),y(1:39,2),'*r',LineWidth=5)
hold on;
plot(y(40:end,1),y(40:end,2),'*g',LineWidth=5)
