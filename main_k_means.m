clc;
clear;

% load data
my_data = load('seeds_dataset.txt');
data_size = size(my_data);
num = data_size(1);
data = my_data(:, 1:7);
label = my_data(:, 8);

% normalize data
epsilon = 0.01;
data_mean = mean(data);
data_mean = repmat(data_mean, [num,1]);
data_var = var(data);
data_var = repmat(data_var, [num,1]);
data = (data - data_mean)./sqrt(data_var + epsilon);

% perform k_means algorithm
clusters = 3;
[cluster_label, step] = k_means(data, clusters, num);

% evaluate the clutter result according to given label
eval = zeros(3, clusters);
for i = 1:3
    for j = 1:clusters
        for k = 1:num
            if ((label(k)==i) && (cluster_label(k)==j))
                eval(i, j) = eval(i, j) + 1;
            end
        end
    end
end