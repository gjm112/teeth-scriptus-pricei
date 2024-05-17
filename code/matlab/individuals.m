cd('/Users/nastaranghorbani/Documents/shape/code/matlab');


folderPath = '/Users/nastaranghorbani/Documents/shape/data/individuals/LM1_pricei/';
numFiles = 19; 


q_representations = cell(numFiles, 1);
centered_curves = cell(numFiles, 1);


for i = 1:numFiles
    
    fileName = fullfile(folderPath, sprintf('data_LM1_pricei_%d.csv', i));
    
   
    
    
    data = csvread(fileName, 1, 0); 

    
    q_representations{i} = curve_to_q(data);
    curves{i} = q_to_curve(q_representations{i});

    
    centered_curves{i}(1,:) = curves{i}(1,:) - mean(curves{i}(1,:)); % Center x-coordinates
    centered_curves{i}(2,:) = curves{i}(2,:) - mean(curves{i}(2,:)); % Center y-coordinates
end


figure; hold on;
colors = lines(numFiles); 
for i = 1:numFiles
    plot(centered_curves{i}(1,:), centered_curves{i}(2,:), 'Color', colors(i,:));
end
hold off;
title('Comparison');
xlabel('X Coordinate');
ylabel('Y Coordinate');
legend(arrayfun(@(x) sprintf('Curve %d', x), 1:numFiles, 'UniformOutput', false));
