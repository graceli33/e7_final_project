function [direction] = e7planets_player_2_brute(map)

    r_loc = map.player.location(end, 1);
    c_loc = map.player.location(end, 2);
    num_turns = map.remaining_turns;
    
    grid = map.grid;
    
    [rows, cols] = size(grid);
    
    for i=1:length(map.scraps)
        x_scrap = map.scraps(i).location(1);
        y_scrap = map.scraps(i).location(2);
        grid(x_scrap, y_scrap) = map.scraps(i).value;
    end
    
    [value, path] = brute_force(r_loc, c_loc, num_turns, grid, rows, cols);
    
    direction = path(1);
    
    return;

end

function [value, path] = brute_force(r_loc, c_loc, num_turns, grid, rows, cols)
        
    if num_turns == 0
        
        value = grid(r_loc, c_loc);
        path = '';
        
        return;
        
    end
        
    [u_val, path] = brute_force(mod(r_loc-2, rows)+1, c_loc, num_turns-1, grid, rows, cols);
    [d_val, path] = brute_force(mod(r_loc, rows)+1, c_loc, num_turns-1, grid, rows, cols);
    [l_val, path] = brute_force(r_loc, mod(c_loc-2, cols)+1, num_turns-1, grid, rows, cols);
    [r_val, path] = brute_force(r_loc, mod(c_loc, cols)+1, num_turns-1, grid, rows, cols);
        
    max_val = max([u_val, d_val, l_val, r_val]);
    
    if max_val == u_val
        
        value = grid(r_loc, c_loc) + u_val;
        path = ['U', path];
        
    elseif max_val == d_val
        
        value = grid(r_loc, c_loc) + d_val;
        path = ['D', path];
        
    elseif max_val == l_val
        
        value = grid(r_loc, c_loc) + l_val;
        path = ['L', path];
        
    elseif max_val == r_val
        
        value = grid(r_loc, c_loc) + r_val;
        path = ['R', path];
        
    end

end