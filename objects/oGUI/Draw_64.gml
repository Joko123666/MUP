// oGUI: Draw event

// 오른쪽 UI 공간 배경 그리기
draw_set_color(c_black);
draw_rectangle(room_width - ui_width, 0, room_width, room_height, false);

// 현재 자원 표시
draw_set_color(c_white);
draw_text(room_width - ui_width + 10, 10, "Money: " + string(oGame.resources.money));
draw_text(room_width - ui_width + 10, 30, "Population: " + string(oGame.resources.population));
draw_text(room_width - ui_width + 10, 50, "Happiness: " + string(oGame.resources.happiness));

// 메뉴 표시
if (menu_visible) {
    var menu_x = current_menu_position[0] * oGame.grid_size;
    var menu_y = current_menu_position[1] * oGame.grid_size;
    
    for (var i = 0; i < array_length(menu_items); i++) {
        draw_text(menu_x + 10, menu_y + (i * 20), menu_items[i]);
    }
}

// 건물 옵션 표시
if (building_options_visible && oGame.selected_building != noone) {
    draw_text(room_width - ui_width + 10, 100, "Building Options:");
    // 여기에 추가 옵션 표시 가능 (업그레이드, 파괴 등)
}
// oGUI: Draw event (추가)
if (build_menu_visible) {
    // 건설 가능한 건물 목록 표시
    for (var i = 0; i < array_length(menu_items); i++) {
        draw_text(room_width - 200 + 10, 100 + i * 20, menu_items[i]);
        if (mouse_check_button_pressed(mb_left) && mouse_x > room_width - 200 + 10 && mouse_x < room_width - 200 + 110 && mouse_y > 100 + i * 20 && mouse_y < 100 + (i + 1) * 20) {
            selected_menu_item = menu_items[i];
            build_selected_item();
        }
    }
}