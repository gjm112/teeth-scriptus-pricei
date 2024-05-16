%Rotate and scale one mean onto the other mean.  
cd /Users/gregorymatthews/Dropbox/teeth-scriptus-pricei-size/code/matlab_size/

toothtype = {"LM1","LM2","LM3","UM1","UM2","UM3"}
species = {"pricei", "scriptus"}
t = 1
outbeta = table2array(readtable("/Users/gregorymatthews/Dropbox/teeth-scriptus-pricei-size/data/matlab/nas/out_beta_" + toothtype(t) + "_combined.csv"))
outbeta_scriptus = table2array(readtable("/Users/gregorymatthews/Dropbox/teeth-scriptus-pricei-size/data/matlab/nas/out_beta_"+toothtype(t)+"_scriptus.csv"))
outbeta_pricei = table2array(readtable("/Users/gregorymatthews/Dropbox/teeth-scriptus-pricei-size/data/matlab/nas/out_beta_"+toothtype(t)+"_pricei.csv"))

outbeta = ReSampleCurve(outbeta,100);
outbeta_scriptus = ReSampleCurve(outbeta_scriptus,100);
outbeta_pricei = ReSampleCurve(outbeta_pricei ,100);

%Now rotate one onto the other:
q_combined = curve_to_q(outbeta)
q_scriptus = curve_to_q(outbeta_scriptus)
q_pricei = curve_to_q(outbeta_pricei)

[qnew_pricei, R] = Find_Rotation_and_Seed_unique(q_combined, q_pricei,1)
[qnew_scriptus, R] = Find_Rotation_and_Seed_unique(q_combined, q_scriptus,1)

outbetanew_combined = q_to_curve(q_combined)
outbetanew_pricei= q_to_curve(qnew_pricei)
outbetanew_scriptus= q_to_curve(qnew_scriptus)




figure(1),clf
plot(outbeta(1,:) - mean(outbeta(1,:)) , outbeta(2,:) - mean(outbeta(2,:)), "black");
hold on;
plot(outbetanew_scriptus(1,:) - mean(outbetanew_scriptus(1,:)), outbetanew_scriptus(2,:)- mean(outbetanew_scriptus(2,:)),"blue");
hold on;
plot(outbetanew_pricei(1,:)- mean(outbetanew_pricei(1,:)), outbetanew_pricei(2,:)- mean(outbetanew_pricei(2,:)), "green");
%plot(outbeta_pricei(1,:), outbeta_pricei(2,:), col = "red");

