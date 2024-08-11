
function build_selected_item() {
    if (selected_menu_item != "" && oGame.resources.money >= 100) { // 비용 확인
        var building_instance = instance_create_layer(current_menu_position[0] * oGame.grid_size, current_menu_position[1] * oGame.grid_size, "Instances", oFacility);
        building_instance.facility_type = selected_menu_item;
        
        // grid_map에 객체 ID 저장
        oGame.grid_map[current_menu_position[0], current_menu_position[1]] = building_instance.id;
        
        oGame.resources.money -= 100;
        menu_visible = false;
    }
}


/// @desc 건물 선택 메서드
function select_building(building) {
    selected_building = building;
    building_options_visible = true;
    build_menu_visible = false;
}

/// @desc 선택 해제 메서드
function clear_selection() {
    selected_building = noone;
    building_options_visible = false;
    build_menu_visible = false;
}

/// @desc 건물 옵션을 표시하는 메서드
function show_building_options(building) {
    if (selected_building != noone) {
        // 선택된 건물의 이름과 기능을 표시
        var building_name = selected_building.facility_type;
        draw_text(room_width - 200 + 10, 100, "Building: " + building_name);
        
        switch(building_name) {
            case "House":
                draw_text(room_width - 200 + 10, 120, "Increases population.");
                break;
            case "Factory":
                draw_text(room_width - 200 + 10, 120, "Increases money but decreases happiness.");
                break;
            case "Park":
                draw_text(room_width - 200 + 10, 120, "Increases happiness.");
                break;
        }
    }
}

/// @desc 건설 메뉴를 표시하는 메서드
function show_build_menu() {
    clear_selection();  // 기존 선택 해제
    build_menu_visible = true;
    building_options_visible = false;
}