// oFacility: Create event
facility_type = ""; // 건설된 시설의 타입
grid_position = [x div oGame.grid_size, y div oGame.grid_size];
oGame.grid_map[grid_position[0], grid_position[1]] = id;

// 시설의 효과 적용
function apply_effects() {
    switch(facility_type) {
        case "House":
            oGame.resources.population += 1;
            break;
        case "Factory":
            oGame.resources.money += 10;
            oGame.resources.happiness -= 1;
            break;
        case "Park":
            oGame.resources.happiness += 2;
            break;
    }
}
