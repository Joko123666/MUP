// oGame: Create event
grid_size = 32;
map_width = 20;
map_height = 15;

grid_map = array_create(map_width, array_create(map_height, 0));

// 화면 이동 및 확대/축소 설정
view_x = 128;  // 화면 시작 X 위치
view_y = 128;  // 화면 시작 Y 위치
zoom = 1;    // 확대/축소 비율
zoom_min = 0.5;
zoom_max = 2.0;

resources = {
    money: 1000,
    population: 100,
    happiness: 50
};

// 선택된 건물 초기화
selected_building = noone;

//Pause game
game_paused = false;  // 게임 일시정지 여부


// 격자 중앙 정렬
view_x = (map_width * grid_size * zoom - display_get_width()) / 2;
view_y = (map_height * grid_size * zoom - display_get_height()) / 2;

//Start Create instances
instance_create_layer(0, 0, "Hud", oGUI);
instance_create_layer(0, 0, "Hud", oMouse);
instance_create_layer(0, 0, "Instances", oFacility);
