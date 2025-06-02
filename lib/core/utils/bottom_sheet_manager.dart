class BottomSheetManager {
  static final BottomSheetManager _instance = BottomSheetManager._();
  BottomSheetManager._();
  static BottomSheetManager get instance => _instance;

  bool isOpen = false;
}