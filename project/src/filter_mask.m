function filtered_mask = filter_mask(A)
    % define filter
    filter = fspecial("average", 20);
    filtered_mask = filter2(filter, A);

    filtered_mask = filtered_mask > 0.3;

end
