function [label, step] = k_means(data, clusters, num)
   % initialize
   index = randperm(num, clusters);
   dis = zeros(num, clusters);
   label = zeros(num, 1);
   center = data(index, :);
   step = 0;
   
   while(1) 
       % save the centers for each clutters of last iteration
       pre_center = center;
       % calculate distance between data points and clutter centers
       for i = 1:num
           for j = 1:clusters
               dis(i, j) = norm(data(i,:) - center(j, :));
           end
       end
       % construct new clutters
       for i = 1:num
           label(i) = find(dis(i,:)==min(dis(i,:)));
       end
       % attain new centers
       for i = 1:clusters
           one_clutter = data(find(label==i), :);
           center(i, :) = mean(one_clutter);
       end
       % test the terminating condition
       if (center == pre_center)
           break;
       end
       step = step + 1;
   end
end