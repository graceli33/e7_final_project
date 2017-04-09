function [best_path, points] = e7planets_player_nodes_no_obstacles(map)

%Takes the best nodes and returns how to get to them
grid = map.grid;
location = map.player.location(end,:);
scraps = map.scraps.location;
scraps_value = map.scraps.value;
nodes = numel(scraps);
max_moves = map.remaining_turns;
num_moves = 0;

end

function [distance_array] = distance_calculator(map)

%Returns an array of the distances of all the possible path between nodes
%Also included distance from starting point to node, but not the other way
grid = map.grid;
location = map.player.location(end,:);
scraps = map.scraps.location;
scraps_value = map.scraps.value;
nodes = numel(scraps);
distance_array = zeros(nodes+1,nodes);
%Calculate distance from starting point to each node.
%Distance_array will have the starting point distance appended to the top

for starting_point = 1:nodes
    for destination = 1:nodes
    end
end
end

function [best_nodes, max_num_nodes] = num_nodes_calculator(distance_array,num_turns)

%Returns which nodes you should go to


