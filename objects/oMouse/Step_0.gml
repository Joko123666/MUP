
x = mouse_x;
y = mouse_y;

// 화면 확대/축소
if (mouse_wheel_up()) {
    oGame.zoom = clamp(oGame.zoom + 0.1, oGame.zoom_min, oGame.zoom_max);
} else if (mouse_wheel_down()) {
    oGame.zoom = clamp(oGame.zoom - 0.1, oGame.zoom_min, oGame.zoom_max);
}

// 마우스 위치에 따른 화면 이동
if (mouse_x < scroll_margin) {
    oGame.view_x -= scroll_speed;
} else if (mouse_x > display_get_width() - scroll_margin) {
    oGame.view_x += scroll_speed;
}

if (mouse_y < scroll_margin) {
    oGame.view_y -= scroll_speed;
} else if (mouse_y > display_get_height() - scroll_margin) {
    oGame.view_y += scroll_speed;
}

// WASD 키보드 입력에 따른 화면 이동
if (keyboard_check(ord("W"))) {
    oGame.view_y -= scroll_speed;
}
if (keyboard_check(ord("S"))) {
    oGame.view_y += scroll_speed;
}
if (keyboard_check(ord("A"))) {
    oGame.view_x -= scroll_speed;
}
if (keyboard_check(ord("D"))) {
    oGame.view_x += scroll_speed;
}

// 화면 이동 제한 (맵 밖으로 나가지 않게)
oGame.view_x = clamp(oGame.view_x, 0, oGame.map_width * oGame.grid_size * oGame.zoom - display_get_width());
oGame.view_y = clamp(oGame.view_y, 0, oGame.map_height * oGame.grid_size * oGame.zoom - display_get_height());