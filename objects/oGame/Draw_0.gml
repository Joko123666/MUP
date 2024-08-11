// oGame: Draw event
var scaled_grid_size = grid_size * zoom;

// 격자 그리기
for (var i = 0; i < map_width; i++) {
    for (var j = 0; j < map_height; j++) {
        var x_pos = view_x + i * scaled_grid_size;
        var y_pos = view_y + j * scaled_grid_size;
        
        // 스프라이트 이미지 인덱스 결정
        var _sprite_index = (i + j) mod 11; // 0~10번 이미지 사용
        draw_sprite_stretched(sBox, _sprite_index, x_pos, y_pos, scaled_grid_size, scaled_grid_size);
    }
}


if (game_paused) {
    draw_sprite_stretched(sBox, 0, view_x, view_y, display_get_width(), display_get_height());
    draw_text(view_x + 100, view_y + 100, "Game Paused");
    draw_text(view_x + 100, view_y + 140, "Resume Game");
    draw_text(view_x + 100, view_y + 180, "Save Game");
    draw_text(view_x + 100, view_y + 220, "Load Game");
    draw_text(view_x + 100, view_y + 260, "Settings");
    draw_text(view_x + 100, view_y + 300, "Exit Game");

    if (mouse_check_button_pressed(mb_left)) {
        if (mouse_y > view_y + 140 && mouse_y < view_y + 160) {
            game_paused = false; // 게임 재개
            with (oGUI) { menu_visible = false; }
        } else if (mouse_y > view_y + 180 && mouse_y < view_y + 200) {
            // 게임 저장 로직 추가
        } else if (mouse_y > view_y + 220 && mouse_y < view_y + 240) {
            // 게임 불러오기 로직 추가
        } else if (mouse_y > view_y + 260 && mouse_y < view_y + 280) {
            // 환경설정 로직 추가 (볼륨 조절 등)
        } else if (mouse_y > view_y + 300 && mouse_y < view_y + 320) {
            game_end(); // 게임 종료
        }
    }
}