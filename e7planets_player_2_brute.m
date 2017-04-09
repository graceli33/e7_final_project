function [direction] = e7planets_player_2_brute(map)

    x_loc = map.player.location(end, 1);
    y_loc = map.player.location(end, 2);
    num_turns = map.remaining_turns;
    
    grid = map.grid;
    
    [y_grid, x_grid] = size(grid);
    
    for i=1:length(map.scraps)
        x_scrap = map.scraps(i).location(1);
        y_scrap = map.scraps(i).location(2);
        grid(x_scrap, y_scrap) = map.scraps(i).value;
    end
    
    grid

    direction = 'U';
    return;

end

function [value, path] = brute_force(x_loc, y_loc, num_turns, grid, x_grid, y_grid)
        
    if num_turns == 1
        up_val = grid(x_loc, mod(y_loc-1, y_grid));
        
    end

end