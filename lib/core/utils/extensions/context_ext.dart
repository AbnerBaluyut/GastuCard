import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gastu_card/core/utils/extensions/double_ext.dart';
import 'package:gastu_card/core/utils/extensions/int_ext.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../app/styles/custom_colors.dart';
import '../../../app/styles/dimension.dart';
import '../../../shared/widgets/common_elevated_button.dart';
import '../bottom_sheet_manager.dart';
import '../dialog_manager.dart';

extension ContextExtension on BuildContext {

  double screenWidth() => MediaQuery.sizeOf(this).width;
  double screenHeight() => MediaQuery.sizeOf(this).height;

  double dpToPixels(double dp) => dp * (screenWidth() / 720);

  void showAnimatedSuccessDialog({
    required String title,
    VoidCallback? onButtonPressed,
  }) {
    dismissDialog();
    if (!DialogManager.isDialogOpen) {
      DialogManager.isDialogOpen = true;
      showGeneralDialog(
        context: this,
        barrierDismissible: false,
        barrierLabel: MaterialLocalizations.of(this).modalBarrierDismissLabel,
        transitionDuration: 200.milliseconds(),
        pageBuilder: (context, animation, secondaryAnimation) {
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) {
              if (didPop) {
                return;
              }
            },
            child: Center(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.green.shade600,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundColor: Colors.green.shade400,
                          child: Icon(Icons.check, color: Colors.white, size: 40.0),
                        )
                      ),
                      Dimension.spacingLarge.height(),
                      Text(
                        "Success",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color:CustomColors.gray2,
                        ),
                      ),
                      Dimension.spacingSmall.height(),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color:CustomColors.gray2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Dimension.spacingMedium.height(),
                      CommonElevatedButton(
                        text: "OK",
                        fontColor: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        borderRadius: BorderRadius.circular(10.0),
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimension.paddingExtraLarge
                        ),
                        onButtonPressed: onButtonPressed ?? dismissDialog,
                      ),
                      Dimension.spacingMedium.height(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return ScaleTransition(
            scale: Tween<double>(begin: 0.8, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
            ),
            child: FadeTransition(
              opacity: animation,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: child
              ),
            ),
          );
        },
      ).then((_) {
        DialogManager.isDialogOpen = false;
      });
    }
  }

  void showAnimatedErrorDialog({
    required String title,
    String buttonText = "OK",
    VoidCallback? onButtonPressed,
  }) {
    dismissDialog();
    if (!DialogManager.isDialogOpen) {
      DialogManager.isDialogOpen = true;
      showGeneralDialog(
        context: this,
        barrierDismissible: false,
        barrierLabel: MaterialLocalizations.of(this).modalBarrierDismissLabel,
        transitionDuration: 200.milliseconds(),
        pageBuilder: (context, animation, secondaryAnimation) {
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) {
              if (didPop) {
                return;
              }
            },
            child: Center(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.red.shade600,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundColor: Colors.red.shade400,
                          child: Icon(Icons.error, color: Colors.white, size: 40.0),
                        )
                      ),
                      Dimension.spacingLarge.height(),
                      Text(
                        "Oops!",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: CustomColors.gray2,
                        ),
                      ),
                      Dimension.spacingSmall.height(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimension.paddingSmall
                        ),
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: CustomColors.gray2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Dimension.spacingMedium.height(),
                      CommonElevatedButton(
                        text: buttonText,
                        fontColor: Colors.white,
                        backgroundColor: Colors.red.shade600,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        borderRadius: BorderRadius.circular(10.0),
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimension.paddingExtraLarge
                        ),
                        onButtonPressed: onButtonPressed ?? dismissDialog,
                      ),
                      Dimension.spacingMedium.height(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return ScaleTransition(
            scale: Tween<double>(begin: 0.8, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
            ),
            child: FadeTransition(
              opacity: animation,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: child
              ),
            ),
          );
        },
      ).then((_) {
        DialogManager.isDialogOpen = false;
      });
    }
  }

  void showLoadingDialog({String text = "Please wait..."}) {
    dismissDialog();
    if (!DialogManager.isDialogOpen) {
      DialogManager.isDialogOpen = true;
      showGeneralDialog(
        context: this,
        barrierDismissible: false,
        barrierLabel: MaterialLocalizations.of(this).modalBarrierDismissLabel,
        transitionDuration: 200.milliseconds(),
        pageBuilder: (context, animation, secondaryAnimation) {
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) {
              if (didPop) {
                return;
              }
            },
            child: Center(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(Dimension.paddingMedium),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Dimension.spacingMedium.height(),
                      LoadingAnimationWidget.threeRotatingDots(
                        color: CustomColors.primaryColor,
                        size: 30.0,
                      ),
                      Dimension.spacingMedium.height(),
                      Text(
                        text,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: CustomColors.gray2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Dimension.spacingMedium.height(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return ScaleTransition(
            scale: Tween<double>(begin: 0.8, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
            ),
            child: FadeTransition(
              opacity: animation,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: child
              ),
            ),
          );
        },
      ).then((_){
        DialogManager.isDialogOpen = false;
      });
    }
  }

  void showAlertDialog({Widget? child}) {
    dismissDialog();
    if (!DialogManager.isDialogOpen) {
      DialogManager.isDialogOpen = true;
      showDialog(
        context: this, 
        barrierDismissible: true,
        barrierLabel: MaterialLocalizations.of(this).modalBarrierDismissLabel,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: AlertDialog(
              contentPadding: EdgeInsets.all(0),
              backgroundColor: Colors.transparent,
              content: Center(
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(Dimension.paddingMedium),
                    child: child
                  ),
                ),
              ),
            ),
          );
        },
      ).then((_) {
        DialogManager.isDialogOpen = false;
      });
    }
  }

  void showCustomDialog({Widget? child, bool canPop = false}) {
    dismissDialog();
    if (!DialogManager.isDialogOpen) {
      DialogManager.isDialogOpen = true;
      showGeneralDialog(
        context: this,
        barrierDismissible: false,
        barrierLabel: MaterialLocalizations.of(this).modalBarrierDismissLabel,
        transitionDuration: 200.milliseconds(),
        pageBuilder: (context, animation, secondaryAnimation) {
          return PopScope(
            canPop: canPop,
            onPopInvokedWithResult: (didPop, result) {
              if (didPop) {
                return;
              }
            },
            child: Center(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(Dimension.paddingMedium),
                  margin: EdgeInsets.all(Dimension.marginMedium),
                  child: child
                ),
              ),
            ),
          );
        },
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return ScaleTransition(
            scale: Tween<double>(begin: 0.8, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
            ),
            child: FadeTransition(
              opacity: animation,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: child
              ),
            ),
          );
        },
      ).then((_){
        DialogManager.isDialogOpen = false;
      });
    }
  }

  Future<void> showScrollableBottomSheet({Widget? child}) async {
    if (BottomSheetManager.instance.isOpen) return;

     BottomSheetManager.instance.isOpen = true;

    await showModalBottomSheet(
      context: this,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.5,  // Start at half the screen height (peeking)
          minChildSize: 0.5,      // Keep it peeking (can't be smaller than half screen)
          maxChildSize: 1.0,      // Allow full expansion if dragged
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: child,
                ),
              ),
            );
          },
        );
      },
    );

    BottomSheetManager.instance.isOpen = false;
  }

  void dismissBottomSheetIfOpen() {
    if (BottomSheetManager.instance.isOpen) {
      pop();
      BottomSheetManager.instance.isOpen = false;
    }
  }

  bool get isBottomSheetOpen => BottomSheetManager.instance.isOpen;

  void dismissDialog() {
    if (DialogManager.isDialogOpen) {
      pop();
      DialogManager.isDialogOpen = false;
    }
  }

  bool get isDialogCurrentlyOpen => DialogManager.isDialogOpen;
}