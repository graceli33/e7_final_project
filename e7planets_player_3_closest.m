function [direction] = e7planets_player_3_closest(map)

    grid = map.grid;
    [num_rows, num_cols] = size(grid);

    num_scraps = numel(map.scraps);
    
    point_row = map.player.location(end, 1);
    point_col = map.player.location(end, 2);
    
    scrap_distance = zeros(1, num_scraps);
    
    for i = 1:num_scraps
        
        scrap_distance(i) = calc_distance(num_rows, num_cols, point_row, point_col, map.scraps(i).location(end, 1), map.scraps(i).location(end, 2))
        
    end
    
    [min_distance, closest_scrap] = min(scrap_distance);
    
    closest_scrap_row = map.scraps(closest_scrap).location(end, 1);
    closest_scrap_col = map.scraps(closest_scrap).location(end, 2);
    
    direction = calc_path(num_rows, num_cols, point_row, point_col, closest_scrap_row, closest_scrap_col);

end

function [direction] = calc_path(num_rows, num_cols, point_row, point_col, scrap_row, scrap_col)

    row_dist_normal = abs(point_row - scrap_row);
    row_dist_wrap = num_rows - row_dist_normal;
        
    col_dist_normal = abs(point_col - scrap_col);
    col_dist_wrap = num_cols - col_dist_normal;
    
    if point_row ~= scrap_row
        
        no_wrap = (row_dist_normal <= row_dist_wrap);
        
        no_wrap_direction = point_row - scrap_row;
        
        if no_wrap
            
            if no_wrap_direction > 0
                direction = 'U';
                return;
            else
                direction = 'D';
                return;
            end
            
        else
            
            if no_wrap_direction > 0
                direction = 'D';
                return;
            else
                direction = 'U';
                return;
            end
            
        end
            
    else
        
        no_wrap = (col_dist_normal <= col_dist_wrap);
        
        no_wrap_direction = scrap_col - point_col;
        
        if no_wrap
            
            if no_wrap_direction > 0
                direction = 'R';
                return;
            else
                direction = 'L';
                return;
            end
            
        else
            
            if no_wrap_direction > 0
                direction = 'L';
                return;
            else
                direction = 'R';
                return;
            end
            
        end
        
    end
    
end

function [distance] = calc_distance(num_rows, num_cols, point_x, point_y, scrap_x, scrap_y)

    x_dist_normal = abs(point_x - scrap_x);
    x_dist_wrap = num_rows - x_dist_normal;
        
    y_dist_normal = abs(point_y - scrap_y);
    y_dist_wrap = num_cols - y_dist_normal;
    
    distance = min(x_dist_normal, x_dist_wrap) + min(y_dist_normal, y_dist_wrap);

end