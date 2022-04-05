import 'package:clone_olx/stores/page_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_it/get_it.dart';

class CreateAdButton extends StatefulWidget {
  const CreateAdButton({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  State<CreateAdButton> createState() => _CreateAdButtonState();
}

class _CreateAdButtonState extends State<CreateAdButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> buttonAnimation;

  final double buttonPosition = 50;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    buttonAnimation = Tween<double>(
      begin: 0,
      end: buttonPosition + 16,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.4,
          0.6,
        ),
      ),
    );

    widget.scrollController.addListener(scrollChanged);
  }

  void scrollChanged() {
    final scrollPosition = widget.scrollController.position;
    if (scrollPosition.userScrollDirection == ScrollDirection.forward) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: (buttonPosition * (-1)),
      left: 0,
      right: 0,
      child: AnimatedBuilder(
        animation: buttonAnimation,
        builder: (_, __) {
          return FractionallySizedBox(
            widthFactor: 0.6,
            child: Container(
              height: buttonPosition,
              margin: EdgeInsets.only(bottom: buttonAnimation.value),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {
                  GetIt.I<PageStore>().setPage(1);
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        'Anunciar agora',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
