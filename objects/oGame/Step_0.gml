// oGame: Step event (마우스 입력 처리 부분만 변경)

if (mouse_check_button_pressed(mb_left)) {
    var grid_x = mouse_x div grid_size;
    var grid_y = mouse_y div grid_size;
    
    if (grid_x < map_width && grid_y < map_height) {
        if (grid_map[grid_x, grid_y] == 0) {
            // 빈 공간 클릭 시
            with (oGUI) {
                clear_selection();
                show_build_menu();
            }
        } else {
            // 건물 클릭 시
            var building = grid_map[grid_x, grid_y];
            if (building != noone && instance_exists(building)) {
                with (oGUI) {
                    select_building(building);
                    show_building_options(building);
                }
            } else {
                with (oGUI) {
                    clear_selection();
                }
            }
        }
    }
}


// 시설 효과 처리
for (var i = 0; i < map_width; i++) {
    for (var j = 0; j < map_height; j++) {
        if (grid_map[i, j] != 0) {
            var building = grid_map[i, j]; // grid_map 배열에서 객체 ID 가져옴
            if (building != noone && instance_exists(building)) {
                with (building) {
                    apply_effects(); // 각 건물의 효과를 적용
                }
            }
        }
    }
}

if (keyboard_check_pressed(vk_escape)) {
    game_paused = !game_paused;
    with (oGUI) {
        menu_visible = game_paused;
    }
}
