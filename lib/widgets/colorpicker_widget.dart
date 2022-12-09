import 'package:flutter/material.dart';

class ColorPickerWidget extends StatefulWidget {
  Function onSelectColor;

  // List of pickable colors
  List<Color> availableColors;

  // The default picked color
  Color initialColor;

  // Determnie shapes of color cells
  bool circleItem;

  ColorPickerWidget(
      {super.key,
      required this.onSelectColor,
      required this.availableColors,
      required this.initialColor,
      required this.circleItem});

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  late Color _pickedColor;

  @override
  void initState() {
    _pickedColor = widget.initialColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 30,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.availableColors.length,
          itemBuilder: (context, index) {
            final itemColor = widget.availableColors[index];
            return InkWell(
              onTap: () {
                widget.onSelectColor(itemColor);
                setState(() {
                  _pickedColor = itemColor;
                });
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: itemColor,
                    shape: widget.circleItem == true
                        ? BoxShape.circle
                        : BoxShape.rectangle,
                    border: Border.all(width: 1, color: Colors.grey.shade300)),
                child: itemColor == _pickedColor
                    ? const Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      )
                    : Container(),
              ),
            );
          },
        ));
  }
}
