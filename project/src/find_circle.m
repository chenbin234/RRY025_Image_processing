function new_mask = find_circle(add_all_image)
    % Find row and column indices of ones
    [rowIndices, colIndices] = find(add_all_image);

    % Calculate the center row and column
    centerRow = round(mean(rowIndices));
    centerCol = round(mean(colIndices));

    fprintf('Center of 1s is at row %f and column %f\n', centerRow, centerCol);

    
    % Initialize a variable to store the sum of distances
    sumDistances = 0;

    % Calculate the distance of each 1 to the center and sum them up
    for i = 1:length(rowIndices)
        distance = sqrt((rowIndices(i) - centerRow)^2 + (colIndices(i) - centerCol)^2);
        sumDistances = sumDistances + distance;
    end

    % Calculate the average distance
    averageDistance = sumDistances / length(rowIndices);
    
    fprintf('Average distance of 1s to the center is %f\n', averageDistance);
    
    new_mask = zeros(size(add_all_image));

     for j = 1:length(rowIndices)
         distance2 = sqrt((rowIndices(j) - centerRow)^2 + (colIndices(j) - centerCol)^2);
         if distance2 > averageDistance * 0.6
             new_mask(rowIndices(j), colIndices(j)) = 0;
         else 
             new_mask(rowIndices(j), colIndices(j)) = 1;
         end
     end

end