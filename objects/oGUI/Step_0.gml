// oGUI: Step event

// 메뉴가 표시될 때, 클릭된 메뉴 항목을 선택합니다.
if (menu_visible) {
    var menu_x = current_menu_position[0] * oGame.grid_size;
    var menu_y = current_menu_position[1] * oGame.grid_size;

    for (var i = 0; i < array_length(menu_items); i++) {
        var item_y_pos = menu_y + (i * 20);
        if (mouse_x >= menu_x && mouse_x <= menu_x + 100 && mouse_y >= item_y_pos && mouse_y <= item_y_pos + 20) {
            if (mouse_check_button_pressed(mb_left)) {
                selected_menu_item = menu_items[i];
                build_selected_item();
            }
        }
    }
}