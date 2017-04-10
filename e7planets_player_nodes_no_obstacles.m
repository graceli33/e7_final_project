function [best_path, points] = e7planets_player_nodes_no_obstacles(map)

%Takes the best nodes and returns how to get to them
%%Create variables
grid = map.grid;
location = map.player.location(end,:);
nodes = size(map.scraps,1);
scraps = zeros(nodes,2);
scraps_value = zeros(nodes,1);
for current_scrap = 1:nodes
    scraps(current_scrap,:) = map.scraps(current_scrap).location;
    scraps_value = map.scraps(current_scrap).value;
end
num_turns = map.remaining_turns;

%%Start calculating things
distance_array = distance_calculator(grid,nodes,scraps,location);
[best_nodes, max_num_nodes] = num_nodes_calculator(distance_array,num_turns);

end

function [distance_array] = distance_calculator(grid,nodes,scraps,location)

%Returns an array of the distances of all the possible path between nodes
%Also included distance from starting point to node, but not the other way

scraps = [scraps;location];
distance_array = zeros(nodes,nodes);

%Last row is distance from starting point to each node
%Everything else is the distance between the nodes
for starting_point = 1:(nodes+1)
    for destination = 1:nodes
        if starting_point == destination
            %Distance is 0 between a point and itself, array is
            %preallocated with zeros
            continue
        end
        x_distance = abs(scraps(starting_point,1) - scraps(destination,1));
        wrap_x_distance = size(grid,1) - x_distance;
        ideal_x_distance = min(x_distance,wrap_x_distance);
        y_distance = abs(scraps(starting_point,2) - scraps(destination,2));
        wrap_y_distance = size(grid,2) - y_distance;
        ideal_y_distance = min(y_distance,wrap_y_distance);
        distance_array(starting_point,destination) = ideal_x_distance + ideal_y_distance;
    end
end

end

function [best_nodes, max_num_nodes] = num_nodes_calculator(distance_array,num_turns)

%Returns which nodes you should go to
for x = 1:10
    disp(no)
end

end
