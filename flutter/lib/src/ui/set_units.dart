import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gusty/main.dart';
import 'package:gusty/src/extensions/build_context_extensions.dart';
import 'package:gusty/src/models/units.dart';

class SetUnitsView extends ConsumerWidget {
  const SetUnitsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
        backgroundColor: context.colorScheme.background,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          // title: const Text('Units'),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Temperature',
                    style: context.style.bodyMedium,
                  ),
                  Expanded(child: SizedBox(),),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  _SingleOption(
                    text: 'Celcius °C',
                    thisOptionValue: 'c',
                    currentValue: ref.watch(settingsProvider).units.temperature,
                    onTap: () {
                      Units units = ref.read(settingsProvider).units;
                      units.temperature = 'c';
                      ref.read(settingsProvider).updateUnits(units);
                    },
                  ),
                  _SingleOption(
                    text: 'Fahrenheit  °F',
                    thisOptionValue: 'f',
                    currentValue: ref.watch(settingsProvider).units.temperature,
                    onTap: () {
                      Units units = ref.read(settingsProvider).units;
                      units.temperature = 'f';
                      ref.read(settingsProvider).updateUnits(units);
                    },
                  ),
                  // _SingleOption(
                  //   text: 'Kelvin K',
                  //   thisOptionValue: 'K',
                  //   currentValue: ref.watch(settingsProvider).units.temperature,
                  //   onTap: () {
                  //     Units units = ref.read(settingsProvider).units;
                  //     units.temperature = 'K';
                  //     ref.read(settingsProvider).updateUnits(units);
                  //   },
                  // ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Speed',
                style: context.style.bodyMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  _SingleOption(
                    text: 'km/h',
                    thisOptionValue: 'km/h',
                    currentValue: ref.watch(settingsProvider).units.speed,
                    onTap: () {
                      Units units = ref.read(settingsProvider).units;
                      units.speed = 'km/h';
                      ref.read(settingsProvider).updateUnits(units);
                    },
                  ),
                  _SingleOption(
                    text: 'mph',
                    thisOptionValue: 'mph',
                    currentValue: ref.watch(settingsProvider).units.speed,
                    onTap: () {
                      Units units = ref.read(settingsProvider).units;
                      units.speed = 'mph';
                      ref.read(settingsProvider).updateUnits(units);
                    },
                  ),
                  _SingleOption(
                    text: 'kts',
                    thisOptionValue: 'kts',
                    currentValue: ref.watch(settingsProvider).units.speed,
                    onTap: () {
                      Units units = ref.read(settingsProvider).units;
                      units.speed = 'kts';
                      ref.read(settingsProvider).updateUnits(units);
                    },
                  ),
                  _SingleOption(
                    text: 'm/s',
                    thisOptionValue: 'm/s',
                    currentValue: ref.watch(settingsProvider).units.speed,
                    onTap: () {
                      Units units = ref.read(settingsProvider).units;
                      units.speed = 'm/s';
                      ref.read(settingsProvider).updateUnits(units);
                    },
                  ),
                  _SingleOption(
                    text: 'Beaufort',
                    thisOptionValue: 'BFT',
                    currentValue: ref.watch(settingsProvider).units.speed,
                    onTap: () {
                      Units units = ref.read(settingsProvider).units;
                      units.speed = 'BFT';
                      ref.read(settingsProvider).updateUnits(units);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Rain',
                style: context.style.bodyMedium,
              ),
              const SizedBox(height: 20),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  _SingleOption(
                    text: 'mm',
                    thisOptionValue: 'mm',
                    currentValue: ref.read(settingsProvider).units.rain,
                    onTap: () {
                      Units units = ref.read(settingsProvider).units;
                      units.rain = 'mm';
                      ref.read(settingsProvider).updateUnits(units);
                    },
                  ),
                  _SingleOption(
                    text: 'in',
                    thisOptionValue: 'in',
                    currentValue: ref.read(settingsProvider).units.rain,
                    onTap: () {
                      Units units = ref.read(settingsProvider).units;
                      units.rain = 'in';
                      ref.read(settingsProvider).updateUnits(units);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Pressure',
                style: context.style.bodyMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  _SingleOption(
                    text: 'mbar',
                    thisOptionValue: 'mbar',
                    currentValue: ref.read(settingsProvider).units.pressure,
                    onTap: () {
                      Units units = ref.read(settingsProvider).units;
                      units.pressure = 'mbar';
                      ref.read(settingsProvider).updateUnits(units);
                    },
                  ),
                  _SingleOption(
                    text: 'inHg',
                    thisOptionValue: 'inHg',
                    currentValue: ref.read(settingsProvider).units.pressure,
                    onTap: () {
                      Units units = ref.read(settingsProvider).units;
                      units.pressure = 'inHg';
                      ref.read(settingsProvider).updateUnits(units);
                    },
                  ),
                  _SingleOption(
                    text: 'psi',
                    thisOptionValue: 'psi',
                    currentValue: ref.read(settingsProvider).units.pressure,
                    onTap: () {
                      Units units = ref.read(settingsProvider).units;
                      units.pressure = 'psi';
                      ref.read(settingsProvider).updateUnits(units);
                    },
                  ),
                  _SingleOption(
                    text: 'mmHg',
                    thisOptionValue: 'mmHg',
                    currentValue: ref.read(settingsProvider).units.pressure,
                    onTap: () {
                      Units units = ref.read(settingsProvider).units;
                      units.pressure = 'mmHg';
                      ref.read(settingsProvider).updateUnits(units);
                    },
                  ),
                  _SingleOption(
                    text: 'kPa',
                    thisOptionValue: 'kPa',
                    currentValue: ref.read(settingsProvider).units.pressure,
                    onTap: () {
                      Units units = ref.read(settingsProvider).units;
                      units.pressure = 'kPa';
                      ref.read(settingsProvider).updateUnits(units);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Distance',
                style: context.style.bodyMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  _SingleOption(
                    text: 'km',
                    thisOptionValue: 'km',
                    currentValue: ref.read(settingsProvider).units.distance,
                    onTap: () {
                      Units units = ref.read(settingsProvider).units;
                      units.distance = 'km';
                      ref.read(settingsProvider).updateUnits(units);
                    },
                  ),
                  _SingleOption(
                    text: 'mi',
                    thisOptionValue: 'mi',
                    currentValue: ref.read(settingsProvider).units.distance,
                    onTap: () {
                      Units units = ref.read(settingsProvider).units;
                      units.distance = 'mi';
                      ref.read(settingsProvider).updateUnits(units);
                    },
                  ),
                ],
              ),




              const SizedBox(
                height: 30,
              ),
              Text(
                'Time',
                style: context.style.bodyMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  _SingleOption(
                    text: '12h',
                    thisOptionValue: '12h',
                    currentValue: ref.read(settingsProvider).units.time,
                    onTap: () {
                      Units units = ref.read(settingsProvider).units;
                      units.time = '12h';
                      ref.read(settingsProvider).updateUnits(units);
                    },
                  ),
                  _SingleOption(
                    text: '24h',
                    thisOptionValue: '24h',
                    currentValue: ref.read(settingsProvider).units.time,
                    onTap: () {
                      Units units = ref.read(settingsProvider).units;
                      units.time = '24h';
                      ref.read(settingsProvider).updateUnits(units);
                    },
                  ),
                ],
              ),






              const SizedBox(
                height: 30,
              ),


              Text(
                'Air Quality',
                style: context.style.bodyMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  _SingleOption(
                    text: 'US - EPA',
                    thisOptionValue: 'us',
                    currentValue: ref.read(settingsProvider).units.airQuality,
                    onTap: () {
                      Units units = ref.read(settingsProvider).units;
                      units.airQuality = 'us';
                      ref.read(settingsProvider).updateUnits(units);
                    },
                  ),
                  _SingleOption(
                    text: 'UK Defra',
                    thisOptionValue: 'uk',
                    currentValue: ref.read(settingsProvider).units.airQuality,
                    onTap: () {
                      Units units = ref.read(settingsProvider).units;
                      units.airQuality = 'uk';
                      ref.read(settingsProvider).updateUnits(units);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),


              Text(
                'Air Quality Guidance Sensitivity',
                style: context.style.bodyMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  _SingleOption(
                    text: 'general population',
                    thisOptionValue: 'normal',
                    currentValue: ref.read(settingsProvider).units.airQualitySensitivity,
                    onTap: () {
                      Units units = ref.read(settingsProvider).units;
                      units.airQualitySensitivity = 'normal';
                      ref.read(settingsProvider).updateUnits(units);
                    },
                  ),
                  _SingleOption(
                    text: 'at risk population',
                    thisOptionValue: 'sensitive',
                    currentValue: ref.read(settingsProvider).units.airQualitySensitivity,
                    onTap: () {
                      Units units = ref.read(settingsProvider).units;
                      units.airQualitySensitivity = 'sensitive';
                      ref.read(settingsProvider).updateUnits(units);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),


            ],
          ),
        )));
  }
}

class _SingleOption extends ConsumerWidget {
  final String text;
  final String currentValue;
  final String thisOptionValue;
  final Function onTap;

  const _SingleOption({Key? key, required this.text, required this.currentValue, required this.thisOptionValue, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
          decoration: ShapeDecoration(
            color: thisOptionValue == currentValue ? context.colorScheme.secondaryContainer : context.colorScheme.primaryContainer,
            shape: const StadiumBorder(),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(text, style: context.style.bodyMedium),
          )),
    );
  }
}
