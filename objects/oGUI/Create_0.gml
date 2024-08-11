// oGUI: Create event
ui_width = 200; // 오른쪽 UI 영역의 너비
menu_visible = false;
building_options_visible = false;
selected_building = noone;  // 선택된 건물 초기화
build_menu_visible = false;

// 현재 메뉴 상태 저장
current_menu_position = [-1, -1]; // 메뉴의 위치

// 선택된 메뉴 항목 (시설 타입)
selected_menu_item = "";

// 메뉴 항목 리스트 (건설 가능한 건물)
menu_items = ["House", "Factory", "Park"];

selected_building = noone;  // 선택된 건물 초기화