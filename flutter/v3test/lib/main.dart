import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ContrastAwareColorPicker extends StatefulWidget {
  final Color initialColor;
  final double minContrastRatio;

  const ContrastAwareColorPicker({
    Key? key,
    required this.initialColor,
    required this.minContrastRatio,
  }) : super(key: key);

  @override
  _ContrastAwareColorPickerState createState() => _ContrastAwareColorPickerState();
}

class _ContrastAwareColorPickerState extends State<ContrastAwareColorPicker> {
  Color _currentColor;

  _ContrastAwareColorPickerState() : _currentColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.initialColor;
  }

  // Function to calculate the contrast ratio between two colors
  double _calculateContrastRatio(Color color1, Color color2) {
    final double luminance1 = color1.computeLuminance();
    final double luminance2 = color2.computeLuminance();
    final double lighter = luminance1 > luminance2 ? luminance1 : luminance2;
    final double darker = luminance1 > luminance2 ? luminance2 : luminance1;
    return (lighter + 0.05) / (darker + 0.05);
  }

  // Function to check if a color meets the minimum contrast ratio
  bool _meetsContrastRatio(Color color) {
    return _calculateContrastRatio(_currentColor, color) >= widget.minContrastRatio;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ColorPicker(
          pickerColor: _currentColor,
          onColorChanged: (color) {
            setState(() {
              _currentColor = color;
            });
          },
          enableAlpha: false,
          displayThumbColor: true,
          paletteType: PaletteType.hsvWithHue,
          pickerAreaHeightPercent: 0.8,
          labelTypes: const [],
          colorPickerWidth: 300,
          pickerAreaBorderRadius: BorderRadius.circular(10),
          // Customize the color wheel to disable colors that don't meet the contrast ratio
          colorPickerBuilder: (BuildContext context, Color pickerColor, ValueChanged<Color> onColorChanged) {
            return HueRingPicker(
              pickerColor: pickerColor,
              onColorChanged: onColorChanged,
              enableAlpha: false,
              displayThumbColor: true,
              // Disable colors that don't meet the contrast ratio
              colorPickerWidth: 300,
              pickerAreaHeightPercent: 0.8,
              paletteType: PaletteType.hsvWithHue,
              labelTypes: const [],
              pickerAreaBorderRadius: BorderRadius.circular(10),
              // Customize the color wheel to dim colors that don't meet the contrast ratio
              colorPickerBuilder: (BuildContext context, Color color, ValueChanged<Color> onColorChanged) {
                final bool isDisabled = !_meetsContrastRatio(color);
                return GestureDetector(
                  onTap: isDisabled ? null : () => onColorChanged(color),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: color.withOpacity(isDisabled ? 0.3 : 1.0),
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              },
            );
          },
        ),
        const SizedBox(height: 20),
        Text(
          'Selected Color: ${_currentColor.value.toRadixString(16)}',
          style: TextStyle(
            color: _currentColor,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Contrast-Aware Color Picker')),
      body: Center(
        child: ContrastAwareColorPicker(
          initialColor: Colors.blue,
          minContrastRatio: 4.5, // WCAG AA standard for normal text
        ),
      ),
    ),
  ));
}