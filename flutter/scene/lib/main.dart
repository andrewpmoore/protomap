import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: BackdropScene(lng: 5, lat: 20, paddingTop: 50, conditionCode: 'ScatteredThunderstorms', snowRate: 100, cloudCover: 0, rainRate: 100, tempDateTime: DateTime.now(), windSpeed: 3),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}









class Star{
  final double x;
  final double y;
  final double starSize;
  final double opacity;

  Star(this.x, this.y, this.starSize, this.opacity);
}

class Raindrop {
  double x;
  double y;
  double height;
  double opacity;

  Raindrop({required this.x, required this.y, required this.opacity, required this.height});
}

class Snowflake {
  double x;
  double y;
  double size;
  double fallSpeed;
  double angle;

  Snowflake({required this.x, required this.y, required this.size, required this.fallSpeed, required this.angle});
}


class BackdropScene extends StatefulWidget {
  // final Hour currentWeather;
  final double paddingTop;
  final DateTime? tempDateTime;
  // final ForecastHourly? forecastHourly;
  final double lat;
  final double lng;
  final double? rainRate;
  final double? snowRate;
  final double? cloudCover;
  final double? windSpeed;
  final String? conditionCode;

  const BackdropScene({Key? key,  required this.paddingTop, this.tempDateTime,  required this.lat, required this.lng, this.rainRate, this.snowRate, this.cloudCover, this.windSpeed, this.conditionCode, }) : super(key: key);

  @override
  State<BackdropScene> createState() => _BackdropSceneState();
}

class Hour{
  double temperature;
  double precipitationChance;

  Hour(this.temperature, this.precipitationChance);
}

class _BackdropSceneState extends State<BackdropScene> with SingleTickerProviderStateMixin {
  // final int activeRaindrops = 100;
  final int numberOfStars = 400;
  final Random random = Random();
  List<Star> stars = [];
  List<Hour> hoursList = [];

  double lat = 0;
  double lng = 0;

  DateTime? dayAtLocation;

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < numberOfStars; i++) {
      final double x = ((random.nextDouble() * 200) - 100);
      final double y = ((random.nextDouble() * 200) - 100);
      final double starSize = random.nextDouble() * 0.1 + 0.3;
      final double opacity = random.nextDouble() * 0.7 + 0.3;
      stars.add(Star(x, y, starSize, opacity));
    }
    dayAtLocation = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    hoursList = setHoursList();

    // hoursList.forEach((element) {print('xyhour ${element.forecastStart} temp: ${element.temperature}');});


  }

  @override
  Widget build(BuildContext context) {
    double rainRate = 0;
    rainRate = widget.rainRate!;

    double snowRate = 0;
    snowRate = widget.snowRate!;

    double cloudCover = 0;
    cloudCover = widget.cloudCover!;

    double windSpeed = 0;
    windSpeed = widget.windSpeed!;

    bool showThunder = false;
    if (widget.conditionCode=='IsolatedThunderstorms'||widget.conditionCode=='ScatteredThunderstorms'||widget.conditionCode=='StrongStorms'||widget.conditionCode=='Thunderstorms'){
      showThunder = true;
    }

    String conditionCode = widget.conditionCode!;

    // print('rainRate ${rainRate} snowRate ${snowRate}');




    Color night1 =  const Color(0xff010208);
    Color night2 = const Color(0xff05407a);

    Color temp1 = const Color(0xff010714);
    Color temp2 = const Color(0xff061b4a);

    List<Color> skyColors = [night1, night2,const Color(0xffa8c1ee),const Color(0xff5e749c),const Color(0xff2c3549),const Color(0xffb87754),const Color(0xff7180aa),const Color(0xffb25364),];
    List<Color> mountainColors = [temp1, temp2, const Color(0xff172a37), const Color(0xff284264), const Color(0xff341f39), const Color(0xff5a2837), const Color(0xff2c1f37), const Color(0xff0d101c)];
    List<Color> mountainColorsRain = darkenColorsByPercent(mountainColors, 30);
    List<Color> mountainColorsBackground = lightenColorsByPercent(desaturateColorsByPercent(mountainColors, 30), 5);


    List<Color> starColors = [Colors.white, Colors.white, Colors.white.withOpacity(0.0), Colors.white.withOpacity(0.0), Colors.white.withOpacity(0.5), Colors.white.withOpacity(0.5), Colors.white.withOpacity(0.5), Colors.white.withOpacity(0.5)];


    // print('currentWeatherTemp: ${widget.currentWeather.temperature}  cloud ${widget.currentWeather.cloudCover}');
    if (cloudCover>0){

      skyColors =  desaturateColorsByPercent(skyColors, cloudCover * 60);  //range is between 0 and 1 for cloud cover so desaturate up to 50%
      mountainColors = desaturateColorsByPercent(mountainColors, cloudCover * 60);
      mountainColorsRain = desaturateColorsByPercent(mountainColorsRain, cloudCover * 40);
      mountainColorsBackground = desaturateColorsByPercent(mountainColorsBackground, cloudCover * 60);
      starColors = opacityColorsByPercent(starColors, -(cloudCover * 50));
    }

    double percentageOfDayComplete = calculatePercentageOfDay(widget.tempDateTime!);


    Gradient mountainGradient = getSceneGradient(widget.tempDateTime, colorSet: mountainColors);
    Gradient mountainGradientRain = getSceneGradient(widget.tempDateTime, colorSet: mountainColorsRain);
    Gradient starGradient = getSceneGradient(widget.tempDateTime, colorSet: starColors);
    Gradient mountainGradientBackground = getSceneGradient(widget.tempDateTime,  colorSet: mountainColorsBackground);

    double widgetHeight =  widget.paddingTop + 470;
    return SizedBox(
      height: widgetHeight,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(height: widgetHeight,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(gradient: getSceneGradient(widget.tempDateTime, colorSet: skyColors )),),
          if (showThunder) RepaintBoundary(
            child: SizedBox(
              height: widgetHeight,
              width: MediaQuery.of(context).size.width,
              child: const LightningWidget(),),
          ),
          SizedBox(
            height: widgetHeight,
            width: MediaQuery.of(context).size.width,
            key: const ValueKey('sceneX-Y'),
            // decoration: BoxDecoration(gradient: getSceneGradient(widget.tempDateTime??widget.currentWeather.forecastStart!.getDateTimeAtLocation(dd.weatherLocation?.lat ?? 0, dd.weatherLocation?.lng ?? 0), dd.weatherLocation!, colorSet: skyColors )),
            child: RepaintBoundary(
              child: CustomPaint(
                painter: ScenePainter(
                  mountainGradient: mountainGradient,
                  hoursList: hoursList,
                  mountainGradientRain: mountainGradientRain,
                  mountainGradientBackground: mountainGradientBackground,
                  stars: stars,
                  percentageOfDayComplete: percentageOfDayComplete,
                  starGradient: starGradient,
                  conditionCode: conditionCode,
                ),
                child: Container(),
              ),
            ),
          ),
          RepaintBoundary(
            child: SizedBox(
                height: widgetHeight,
                width: MediaQuery.of(context).size.width,
                child: WindTurbine(windSpeed: windSpeed, color: mountainGradientBackground.colors.first, size: widgetHeight)),
          ),
          if (widget.conditionCode == 'Foggy' || widget.conditionCode == 'Haze' || widget.conditionCode == 'BlowingDust' || widget.conditionCode == 'Smoky') SizedBox(height: widgetHeight,
            width: MediaQuery.of(context).size.width,
            child: FogLayer(conditionCode),
          ),
          if (snowRate>0.02) SizedBox(
              height: widgetHeight,
              width: MediaQuery.of(context).size.width,
              child: Snowfall(snowRate)),
          if (rainRate>0.02) SizedBox(
              height: widgetHeight,
              width: MediaQuery.of(context).size.width,
              child: Rainfall(rainRate))

        ],
      ),
    );
  }

  List<Hour> setHoursList() {
    lat = widget.lat;
    lng = widget.lng;

    List<Hour> list = [];
    list.add(Hour(15, 0));
    list.add(Hour(14, 0));
    list.add(Hour(13, 0));
    list.add(Hour(12.5, 0));
    list.add(Hour(12, 0));
    list.add(Hour(13, 0));
    list.add(Hour(13.5, 0));
    list.add(Hour(14, 0));
    list.add(Hour(15, 0));
    list.add(Hour(15.5, 0));
    list.add(Hour(16, 0));
    list.add(Hour(17, 0));
    list.add(Hour(17.5, 0));
    list.add(Hour(17.7, 0));
    list.add(Hour(17, 0));
    list.add(Hour(16.5, 0));
    list.add(Hour(16, 0));
    list.add(Hour(16.2, 0));
    list.add(Hour(15.5, 0));
    list.add(Hour(15.3, 0));
    list.add(Hour(15.1, 0));
    list.add(Hour(14.5, 0));
    list.add(Hour(15.2, 0));
    list.add(Hour(15, 0));

    return list;
  }

  Gradient getSceneGradient(DateTime? tempDateTime, {required List<Color> colorSet}) {
    return LinearGradient(
      colors: [colorSet[2], colorSet[3]],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

  }


}

double calculatePercentageOfDay(DateTime dateTime) {
  int totalSecondsInDay = 24 * 60 * 60; // Total seconds in a day (24 hours * 60 minutes * 60 seconds)
  int totalSecondsElapsed =
      dateTime.hour * 3600 + dateTime.minute * 60 + dateTime.second; // Calculate total seconds elapsed in the day
  double percentage = totalSecondsElapsed / totalSecondsInDay;
  return percentage.clamp(0.0, 1.0); // Ensure the percentage stays within the valid range [0, 1].
}


class ScenePainter extends CustomPainter {

  Gradient mountainGradient;
  Gradient mountainGradientRain;
  Gradient starGradient;
  Gradient mountainGradientBackground;
  List<Hour> hoursList;
  List<Star> stars;
  double percentageOfDayComplete;
  String conditionCode;

  // final List<Raindrop> raindrops;
  // final Animation<double> animation;

  ScenePainter({required this.mountainGradient, required this.hoursList, required this.mountainGradientRain, required this.stars, required this.percentageOfDayComplete, required this.starGradient, required this.mountainGradientBackground, required this.conditionCode, });

  double variance = 0;

  double getRandomValueAroundOriginal(double originalValue) {
    // Create an instance of Random class.
    final random = Random();

    // Generate a random number between -3 and 3 (inclusive).
    double randomOffset = (random.nextDouble() * 2) - 1;

    // Add the random offset to the original value.
    double result = originalValue + randomOffset;

    return result;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // print('size.width ${size.width} height: ${size.height}');
    // final Paint paint = Paint()
    //   ..color = Colors.black // You can set the color of the mountains here
    //   ..style = PaintingStyle.fill;

    final Paint paint = Paint()
      ..shader = LinearGradient(colors: mountainGradient.colors, begin: Alignment.topCenter, end: Alignment.bottomCenter).createShader(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width));

    final Paint paintRain = Paint()
      ..shader = LinearGradient(colors: mountainGradientRain.colors, begin: Alignment.topCenter, end: Alignment.bottomCenter).createShader(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width));

    final Paint paintBackground = Paint()
      ..shader = LinearGradient(colors: mountainGradientBackground.colors, begin: Alignment.topCenter, end: Alignment.bottomCenter).createShader(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width));


    final double centerX = size.width / 2;
    final double bottomY = size.height;
    const double maxRotation = pi / 4; // 45 degrees in radians
    // print('percentage of day complete $percentageOfDayComplete');
    double rotationAngle = maxRotation * percentageOfDayComplete;


    Path pathBackground = Path();
    Path pathTemperature = Path();
    Path pathRain = Path();

    // Define the silhouette of the mountain range using a series of points
    // You can adjust the coordinates and number of points to customize the mountains.
    List<Offset> backgroundPoints = [];
    List<Offset> temperaturePoints = [];
    List<Offset> rainProbabilityPoints = [];

    double increment = size.width/23;
    double xPos = 0;


    double lowestTemp = double.infinity;
    double highestTemp = double.negativeInfinity;

    // Loop through the list of Offsets to find the lowest and highest dy values
    for (var hour in hoursList) {
      double temp = hour.temperature;
      if (temp < lowestTemp) {
        lowestTemp = temp;
      }
      if (temp > highestTemp) {
        highestTemp = temp;
      }
    }

    // set boundaries on widget for drawing mountains
    double minPosTemp = 0.55;
    double maxPosTemp = 0.8;

    double minPosRain = 0.85;
    double maxPosRain = 0.95;

    bool hasRain = false;




    //calculate data and points
    int hourNumber = 0;
    for (Hour hour in hoursList){
      double yPosRatioTemperature = convertRangeDouble(oldMin: lowestTemp, oldMax: highestTemp, newMin: minPosTemp, newMax: maxPosTemp, oldValue: hour.temperature);
      // double yPosRatioTemperatureBackground = convertRangeDouble(oldMin: lowestTemp, oldMax: highestTemp, newMin: minPosTemp, newMax: maxPosTemp, oldValue: getRandomValueAroundOriginal(hour.temperature));
      // print('yPosRatioTemperatureBackground $yPosRatioTemperatureBackground');

      temperaturePoints.add(Offset(xPos, size.height * ((maxPosTemp+minPosTemp)-yPosRatioTemperature)));
      backgroundPoints.add(Offset(xPos, size.height * ((maxPosTemp+minPosTemp)-_getBackgroundValue(hourNumber))));

      if (hour.precipitationChance>0){
        hasRain = true;
      }
      double yPosRatioRain = convertRangeDouble(oldMin: 0, oldMax: 1, newMin: minPosRain, newMax: maxPosRain, oldValue: hour.precipitationChance);
      rainProbabilityPoints.add(Offset(xPos, size.height * ((maxPosRain+minPosRain)-yPosRatioRain)));
      xPos = xPos + increment;
      hourNumber++;
    }
    temperaturePoints.add(Offset(size.width, size.height));
    temperaturePoints.add(Offset(0, size.height));

    backgroundPoints.add(Offset(size.width, size.height));
    backgroundPoints.add(Offset(0, size.height));

    rainProbabilityPoints.add(Offset(size.width, size.height));
    rainProbabilityPoints.add(Offset(0, size.height));


    //draw stars
    for (Star star in stars) {
      final Paint starPaint = Paint()
        ..shader = LinearGradient(colors: starGradient.colors, begin: Alignment.topCenter, end: Alignment.bottomCenter).createShader(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width));

      double x = (star.x/100)*size.width;
      double y = (star.y/100)*size.height;

      // Apply rotation around bottom center axis
      final Offset rotatedOffset = Offset(centerX + (x - centerX) * cos(rotationAngle) + (bottomY - y) * sin(rotationAngle),
          bottomY - ((centerX - x) * sin(rotationAngle) + (bottomY - y) * cos(rotationAngle)));

      // Check if the star is inside the bounds of the canvas before drawing
      if (rotatedOffset.dx >= 0 && rotatedOffset.dx <= size.width && rotatedOffset.dy >= 0 && rotatedOffset.dy <= size.height) {
        canvas.drawCircle(rotatedOffset, star.starSize, starPaint);
      }

    }


    //draw background mountains
    pathBackground.moveTo(0, size.height);
    pathBackground.addPolygon(backgroundPoints, true);
    canvas.drawPath(pathBackground, paintBackground);

    //draw temperature mountains
    pathTemperature.moveTo(0, size.height);
    pathTemperature.addPolygon(temperaturePoints, true);
    canvas.drawPath(pathTemperature, paint);

    //draw rain mountains
    if (hasRain) {
      pathRain.moveTo(0, size.height);
      pathRain.addPolygon(rainProbabilityPoints, true);
      canvas.drawPath(pathRain, paintRain);
    }






    //draw day marker
    const double triangleSize = 8;
    final Paint paintMarker = Paint()..color = const Color(0xff5a6653);
    final double xMarkerPos = size.width * percentageOfDayComplete;
    final double bottomPadding  = (size.height*.02);
    final Path path = Path()
      ..moveTo(xMarkerPos, size.height - triangleSize - bottomPadding) // top center point
      ..lineTo(xMarkerPos - triangleSize / 2, size.height - bottomPadding) // bottom left point
      ..lineTo(xMarkerPos + triangleSize / 2, size.height - bottomPadding) // bottom right point
      ..close();

    canvas.drawPath(path, paintMarker);


  }

  @override
  bool shouldRepaint(ScenePainter oldDelegate) => false;


}






class Snowfall extends StatefulWidget {
  final double snowRate;
  const Snowfall(this.snowRate, {super.key});

  @override
  SnowfallState createState() => SnowfallState();
}

class SnowfallState extends State<Snowfall> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<Snowflake> _snowflakes = [];
  double snowRate = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(days: 1))..repeat();

    _controller.addListener(() {
      setState(() {
        _updateSnowflakes();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if (snowRate!=widget.snowRate){
      print('rate changed');
      _snowflakes = _initializeSnowflakes();

    }


    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          _updateSnowflakes();

          return RepaintBoundary(
            child: CustomPaint(
              painter: SnowfallPainter(snowflakes: _snowflakes),
            ),
          );
        }
    );
  }

  void _updateSnowflakes() {
    // Update snowflake positions
    for (int i = 0; i < _snowflakes.length; i++) {
      Snowflake snowflake = _snowflakes[i];
      snowflake.y += snowflake.fallSpeed;
      snowflake.x += sin(snowflake.angle) * 2; // Horizontal swaying motion
      if (snowflake.y > MediaQuery.of(context).size.height) {
        // Reset snowflake when it goes off the screen
        snowflake.y = -snowflake.size;
        snowflake.x = Random().nextInt(MediaQuery.of(context).size.width.toInt()).toDouble();
      }
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      _snowflakes = _initializeSnowflakes();
    });

  }

  List<Snowflake> _initializeSnowflakes() {
    snowRate = widget.snowRate;

    // Generate initial snowflake positions
    List<Snowflake> snowflakes = [];
    for (int i = 0; i < widget.snowRate*3; i++) {
      snowflakes.add(
        Snowflake(
          x: Random().nextInt(MediaQuery.of(context).size.width.toInt()).toDouble(),
          y: Random().nextInt(MediaQuery.of(context).size.height.toInt()).toDouble(),
          size: Random().nextInt(2).toDouble() + 1,
          fallSpeed: Random().nextInt(2).toDouble() + 1,
          angle: Random().nextDouble() * 2 * pi,
        ),
      );
    }
    return snowflakes;
  }
}


class SnowfallPainter extends CustomPainter {
  final List<Snowflake> snowflakes;
  final Paint painter;

  SnowfallPainter({required this.snowflakes})
      : painter = Paint()
    ..color = Colors.white.withOpacity(0.6)
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect visibleArea = Rect.fromLTWH(0, 0, size.width, size.height);

    // Draw snowflakes on the canvas
    for (var snowflake in snowflakes) {
      final Offset snowflakeOffset = Offset(snowflake.x, snowflake.y);

      // Skip snowflakes that are entirely outside the visible area
      if (!visibleArea.contains(snowflakeOffset)) {
        continue;
      }

      canvas.drawCircle(snowflakeOffset, snowflake.size, painter);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}


















class Rainfall extends StatefulWidget {
  final double rainRate;
  const Rainfall(this.rainRate, {super.key});

  @override
  RainfallState createState() => RainfallState();
}

class RainfallState extends State<Rainfall> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<Raindrop> _raindrops = [];
  double rainRate = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(days: 1))..repeat();

    // _controller.addListener(() {
    //   setState(() {
    //     _updateRaindrops();
    // });
    // });
  }



  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if (rainRate!=widget.rainRate){
      print('rate changed');
      _raindrops = _initializeRaindrops();

    }

    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          _updateRaindrops();
          return RepaintBoundary(
            child: CustomPaint(
              painter: RainfallPainter(raindrops: _raindrops),
            ),
          );
        }
    );
  }

  void _updateRaindrops() {


    double canvasHeight = MediaQuery.of(context).size.height;
    double canvasWidth = MediaQuery.of(context).size.width;

    // Update raindrop positions and opacity
    for (int i = 0; i < _raindrops.length; i++) {
      Raindrop raindrop = _raindrops[i];
      raindrop.y += 10; // Increase this value to control the speed of raindrops

      // If raindrop goes off the screen, reset its position and opacity
      if (raindrop.y > canvasHeight) {
        raindrop.y = -raindrop.height;
        raindrop.x = Random().nextDouble() * canvasWidth;
        raindrop.opacity = Random().nextDouble() * 0.6;
      }
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      _raindrops = _initializeRaindrops();
    });

  }

  List<Raindrop> _initializeRaindrops() {
    rainRate = widget.rainRate;
    double canvasWidth = MediaQuery.of(context).size.width;
    List<Raindrop> raindrops = [];
    // Generate initial raindrop positions and opacity
    for (int i = 0; i < widget.rainRate*3; i++) {
      raindrops.add(
        Raindrop(
          x: Random().nextDouble() * canvasWidth,
          y: Random().nextDouble() * MediaQuery.of(context).size.height,
          opacity: Random().nextDouble() * 0.6,
          height: Random().nextDouble() * (45 - 10) + 10,
        ),
      );
    }
    return raindrops;
  }
}


class RainfallPainter extends CustomPainter {
  final List<Raindrop> raindrops;
  final Paint _painter;
  final Gradient _gradient;

  RainfallPainter({required this.raindrops})
      : _painter = Paint()..style = PaintingStyle.fill,
        _gradient = const LinearGradient(
          colors: [Color(0x00ffffff), Color(0x55ffffff)],
          stops: [0.0, 1.0],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );

  @override
  void paint(Canvas canvas, Size size) {
    final Rect visibleArea = Rect.fromLTWH(0, 0, size.width, size.height-45);

    // Draw raindrops on the canvas
    for (var raindrop in raindrops) {
      final Rect raindropRect = Rect.fromLTWH(
        raindrop.x,
        raindrop.y,
        1,
        raindrop.height,
      );

      // Skip raindrops that are entirely outside the visible area
      if (!raindropRect.overlaps(visibleArea)) {
        continue;
      }

      _painter.shader = _gradient.createShader(raindropRect);
      canvas.drawRect(raindropRect, _painter);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}









class TurbinePainter extends CustomPainter {
  final Animation<double> animation;
  final Color color;
  final Paint bladePaint;

  TurbinePainter(this.animation, this.color)
      : bladePaint = Paint()..color = color,
        super(repaint: animation);

  final Path bladePath = Path();

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width * 0.15;
    final double centerY = size.height * 0.65;

    final double bladeLength = size.width * 0.05;
    final double bladeWidth = size.width * 0.007;

    canvas.save();
    canvas.translate(centerX, centerY);
    canvas.rotate(animation.value * 2 * 3.14);

    bladePath.reset();
    bladePath.moveTo(0, -bladeLength / 2);
    bladePath.lineTo(bladeWidth / 2, 0);
    bladePath.lineTo(bladeWidth, -bladeLength / 2);
    bladePath.close();

    for (int i = 0; i < 3; i++) {
      canvas.drawPath(bladePath, bladePaint);
      canvas.rotate(2 * 3.14 / 3);
    }

    canvas.restore();

    final double circleRadius = size.width * 0.005;
    final double triangleBottomOffset = size.height - size.height * 0.31;

    canvas.save();
    canvas.drawCircle(Offset(centerX, centerY), circleRadius, bladePaint);

    final double baseLength = size.width * 0.009;
    final Path trianglePath = Path();
    trianglePath.moveTo(centerX - baseLength / 2, triangleBottomOffset);
    trianglePath.lineTo(centerX + baseLength / 2, triangleBottomOffset);
    trianglePath.lineTo(centerX, centerY);
    trianglePath.close();
    canvas.drawPath(trianglePath, bladePaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(TurbinePainter oldDelegate) => false;
}


class WindTurbine extends StatefulWidget {
  final double windSpeed;
  final Color color;
  final double size;
  const WindTurbine({super.key, required this.windSpeed, required this.color, required this.size});

  @override
  WindTurbineState createState() => WindTurbineState();
}

class WindTurbineState extends State<WindTurbine> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  double rotationSpeedMilliseconds = 0.0; // Initial rotation speed in radians per second
  double windSpeed = 0;

  @override
  void initState() {

    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: mapWindSpeedToRotationTime(widget.windSpeed.round()),// Adjust the duration based on the desired speed,
    )..repeat();
    // _initSpeed();

  }

  void _initSpeed() {
    _animationController.duration = mapWindSpeedToRotationTime(widget.windSpeed.round());
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if (widget.windSpeed!=windSpeed){
      _initSpeed();
    }

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        rotationSpeedMilliseconds = _animationController.value * 2 * pi;
        return CustomPaint(
          painter: TurbinePainter(_animationController, widget.color), //rotationSpeed: rotationSpeed
        );
      },
    );
  }


}




Duration mapWindSpeedToRotationTime(int x) {

  switch (x){
    case 0 : return const Duration(hours: 1);
    case 1 : return const Duration(milliseconds: 5000);
    case 2 : return const Duration(milliseconds: 4500);
    case 3 : return const Duration(milliseconds: 4000);
    case 4 : return const Duration(milliseconds: 3500);
    case 5 : return const Duration(milliseconds: 3000);
    case 6 : return const Duration(milliseconds: 2800);
    case 7 : return const Duration(milliseconds: 2600);
    case 8 : return const Duration(milliseconds: 2400);
    case 9 : return const Duration(milliseconds: 2200);
    case 10 : return const Duration(milliseconds: 2000);
    case 11 : return const Duration(milliseconds: 1800);
    case 12 : return const Duration(milliseconds: 1600);
    case 13 : return const Duration(milliseconds: 1400);
    case 14 : return const Duration(milliseconds: 1200);
    case 15 : return const Duration(milliseconds: 1000);
    case 16 : return const Duration(milliseconds: 750);
    case 17 : return const Duration(milliseconds: 500);
    case 18 : return const Duration(milliseconds: 380);
    case 19 : return const Duration(milliseconds: 370);
    case 20 : return const Duration(milliseconds: 350);
    case 21 : return const Duration(milliseconds: 340);
    case 22 : return const Duration(milliseconds: 330);
    case 23 : return const Duration(milliseconds: 320);
    case 24 : return const Duration(milliseconds: 310);
    case 25 : return const Duration(milliseconds: 300);
    case 26 : return const Duration(milliseconds: 290);
    case 27 : return const Duration(milliseconds: 280);
    case 28 : return const Duration(milliseconds: 270);
    case 29 : return const Duration(milliseconds: 260);
    default: return const Duration(milliseconds: 250);
  }
}


num _getBackgroundValue(int hourNumber) {
  switch(hourNumber){
    case 0: return 0.65;
    case 1: return 0.67;
    case 2: return 0.66;
    case 3: return 0.67;
    case 4: return 0.66;
    case 5: return 0.66;
    case 6: return 0.65;
    case 7: return 0.64;
    case 8: return 0.63;
    case 9: return 0.62;
    case 10: return 0.61;
    case 11: return 0.60;
    case 12: return 0.59;
    case 13: return 0.58;
    case 14: return 0.59;
    case 15: return 0.60;
    case 16: return 0.60;
    case 17: return 0.62;
    case 18: return 0.63;
    case 19: return 0.62;
    case 20: return 0.63;
    case 21: return 0.64;
    case 22: return 0.64;
    case 23: return 0.63;
    default: return 0.62;
  }
}







class LightningStrikePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    final Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    final Random random = Random();

    // Draw multiple random lightning strikes
    for (int i = 0; i < 10; i++) {
      double startX = random.nextDouble() * width;
      double startY = 0;
      double endX = startX + (random.nextDouble() - 0.5) * width;
      double endY = height;

      double control1X = startX + (random.nextDouble() - 0.5) * width;
      double control1Y = random.nextDouble() * height * 0.5;
      double control2X = endX + (random.nextDouble() - 0.5) * width;
      double control2Y = random.nextDouble() * height * 0.5 + height * 0.5;

      Path path = Path()
        ..moveTo(startX, startY)
        ..cubicTo(control1X, control1Y, control2X, control2Y, endX, endY);

      canvas.drawPath(path, paint);
    }
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}




class FogLayer extends StatefulWidget {
  final String conditionCode;
  const FogLayer(this.conditionCode, {Key? key}) : super(key: key);

  @override
  State<FogLayer> createState() => _FogLayerState();
}

class _FogLayerState extends State<FogLayer> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 50), // You can adjust the animation duration here
    )..repeat(reverse: false);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: (widget.conditionCode == 'Foggy' || widget.conditionCode == 'Haze' || widget.conditionCode == 'BlowingDust' || widget.conditionCode == 'Smoky') ? 1 : 0,
      child: (widget.conditionCode == 'Foggy' || widget.conditionCode == 'Haze' || widget.conditionCode == 'BlowingDust' || widget.conditionCode == 'Smoky') ? AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return CustomPaint(
            painter: FogLayerPainter(animationValue: _animationController.value, conditionCode: widget.conditionCode),
            child: const SizedBox(),
          );
        },
      ) : const SizedBox(),
    );
  }


}




class FogLayerPainter extends CustomPainter {
  final double animationValue;
  final String conditionCode;

  FogLayerPainter({required this.animationValue, required this.conditionCode});

  @override
  void paint(Canvas canvas, Size size) {
    final fogPaint = Paint()
      ..shader = _createFogShader(size, conditionCode)
      ..style = PaintingStyle.fill;

    final bottomHeight = size.height * 0.10;
    const amplitude = 10.0; // Adjust the amplitude to reduce the movement

    final path = Path()
      ..moveTo(0, size.height - bottomHeight + amplitude * sin(animationValue * 2 * pi))
      ..quadraticBezierTo(
          size.width * 0.25, size.height - bottomHeight + amplitude, size.width * 0.5, size.height - bottomHeight)
      ..quadraticBezierTo(
          size.width * 0.75, size.height - bottomHeight - amplitude, size.width, size.height - bottomHeight + amplitude * sin(animationValue * 2 * pi))
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, fogPaint);
  }

  Shader _createFogShader(Size size, String conditionCode) {

    Color color = Colors.red;
    if (conditionCode=='Foggy'){
      color = const Color(0x66cccccc);
    }
    else if (conditionCode=='Haze'){
      color = Colors.grey;
    }
    else if (conditionCode=='BlowingDust'){
      color = Colors.orangeAccent;
    } else{
      color = Colors.blueGrey;
    }

    const numStops = 5;
    final colors = List<Color>.generate(
      numStops,
          (index) {
        final opacity = 0.1 + 0.2 * sin(animationValue * 2 * pi + 2 * pi * index / (numStops - 1));
        return color.withOpacity(opacity.clamp(0.01, 1));
      },
    );

    return LinearGradient(
      colors: colors,
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    ).createShader(Rect.fromLTWH(0, size.height - size.height * 0.15, size.width, size.height * 0.15));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true; // Always repaint to animate the fog
  }
}






class LightningPainter extends CustomPainter {

  bool isLightningVisible = false;

  LightningPainter({required this.isLightningVisible});

  final double centerRatio = 0.04;
  final double minSegmentHeightRatio = 0.05;
  final double groundHeightRatio = 0.96;
  final Color color = const Color.fromARGB(255, 204, 204, 255);
  final double roughness = 2;
  final double maxDifferenceRatio = 0.2;
  final int minForks = 5;
  final int maxForks = 20;
  List<Offset> lightning = [];

  @override
  void paint(Canvas canvas, Size size) {
    if (isLightningVisible) {
      final paint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = size.width * 0.006; // Adjust stroke width proportionally

      var centerOffset = Offset(size.width / 2, size.height * centerRatio);
      var random = Random();

      if (lightning.isEmpty) {
        lightning.add(centerOffset);
        lightning.add(Offset(random.nextDouble() * (size.width - size.width * 0.2) + size.width * 0.1,
            size.height * groundHeightRatio + (random.nextDouble() - 0.9) * size.height * 0.05));
      }

      var segmentHeight = size.height * groundHeightRatio - size.height * centerRatio;
      var currDiff = size.width * maxDifferenceRatio;
      var maxIterations = random.nextInt(maxForks - minForks + 1) + minForks;

      const double minSegmentLengthRatio = 0.5;
      const int maxSegments = 5;

      while (segmentHeight > size.height * minSegmentHeightRatio &&
          maxIterations > 0 &&
          lightning.length < maxSegments) {
        maxIterations--;
        var newSegments = <Offset>[];
        for (var i = 0; i < lightning.length - 1; i++) {
          var start = lightning[i];
          var end = lightning[i + 1];
          var midX = (start.dx + end.dx) / 2;
          var newX = midX + (random.nextDouble() * 2 - 1) * currDiff;
          newSegments.add(start);
          var midY = (start.dy + end.dy) / 2;
          var newY = midY + (random.nextDouble() - 0.5) * currDiff;
          if ((start - end).distance < size.width * minSegmentLengthRatio) {
            // Stop dividing segments if it's too short
            newSegments.add(end);
          } else {
            newSegments.add(Offset(newX, newY));
            newSegments.add(end);
          }
        }

        lightning = newSegments;

        currDiff /= roughness;
        segmentHeight /= 2;
      }

      var path = Path();
      path.moveTo(lightning.first.dx, lightning.first.dy);
      for (var i = 1; i < lightning.length; i++) {
        path.lineTo(lightning[i].dx, lightning[i].dy);
      }
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(LightningPainter oldDelegate) => false;
}


class LightningWidget extends StatefulWidget {
  const LightningWidget({super.key});

  @override
  LightningWidgetState createState() => LightningWidgetState();
}

class LightningWidgetState extends State<LightningWidget>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Timer? _timer;
  bool isLightningVisible = false;
  final Random _random = Random();


  void _startRandomTimer() {
    int minInterval = 2;
    int maxInterval = 10;

    int randomInterval = minInterval + _random.nextInt(maxInterval - minInterval + 1);
    Duration duration = Duration(seconds: randomInterval);

    _timer = Timer(duration, () {
      if (_controller?.isAnimating == true) return;
      setState(() {
        isLightningVisible = true;
        _controller?.reset();
        _controller?.forward();


        int minLength = 300;
        int maxLength = 600;
        int randomLength = minLength + _random.nextInt(maxLength - minLength + 1);
        Duration durationLength = Duration(milliseconds: randomLength);

        Future.delayed(durationLength, () {
          setState(() {
            isLightningVisible = false;
          });
        });
      });
      _startRandomTimer(); // Trigger the timer again after the random interval
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _startRandomTimer();
  }

  @override
  void dispose() {
    _controller?.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return AnimatedContainer(
          color: isLightningVisible? Colors.white.withOpacity(0.2) : Colors.transparent,
          duration: const Duration(milliseconds: 300),
          child: CustomPaint(
            size: Size(constraints.maxWidth, constraints.maxHeight),
            painter: LightningPainter(isLightningVisible: isLightningVisible),
          ),
        );
      },
    );
  }
}






List<Color> darkenColorsByPercent(List<Color> colors, double percent) {
  return colors.map((color) => darkenColorByPercent(color, percent)).toList();
}

Color darkenColorByPercent(Color color, double percent) {
  assert(percent >= 0 && percent <= 100);

  int red = (color.red - color.red * percent / 100).round();
  int green = (color.green - color.green * percent / 100).round();
  int blue = (color.blue - color.blue * percent / 100).round();

  return Color.fromARGB(color.alpha, red, green, blue);
}


List<Color> lightenColorsByPercent(List<Color> colors, double percent) {
  return colors.map((color) => lightenColorByPercent(color, percent)).toList();
}

Color lightenColorByPercent(Color color, double percent) {
  assert(percent >= 0 && percent <= 100);

  int red = (color.red + (255 - color.red) * percent / 100).round();
  int green = (color.green + (255 - color.green) * percent / 100).round();
  int blue = (color.blue + (255 - color.blue) * percent / 100).round();

  return Color.fromARGB(color.alpha, red, green, blue);
}


List<Color> desaturateColorsByPercent(List<Color> colors, double percent) {
  return colors.map((color) => desaturateColorByPercent(color, percent)).toList();
}

Color desaturateColorByPercent(Color color, double percent) {
  assert(percent >= 0 && percent <= 100);

  HSLColor hslColor = HSLColor.fromColor(color);
  double desaturatedSaturation = hslColor.saturation - hslColor.saturation * percent / 100;
  desaturatedSaturation = desaturatedSaturation.clamp(0.0, 1.0); // Ensure the saturation stays within the valid range [0, 1].

  return hslColor.withSaturation(desaturatedSaturation).toColor();
}

List<Color> opacityColorsByPercent(List<Color> colors, double percent) {
  return colors.map((color) => opacityColorByPercent(color, percent)).toList();
}

Color opacityColorByPercent(Color color, double percent) {
  assert(percent >= -100 && percent <= 100);

  double opacityChange = percent / 100;
  double currentOpacity = color.opacity;

  double newOpacity = currentOpacity + opacityChange;

  // Ensure the opacity stays within the valid range [0, 1].
  newOpacity = newOpacity.clamp(0.0, 1.0);

  return color.withOpacity(newOpacity);
}



double convertRangeDouble({required double oldMin, required double oldMax, required double newMin, required double newMax, required double oldValue}){
  // print('convert min: $oldMin max: $oldMax value: $oldValue');

  double oldRange = (oldMax - oldMin);
  double newRange = (newMax - newMin);
  if (oldRange==0){
    return (newRange/2);
  }
  return ((((oldValue - oldMin) * newRange) / oldRange) + newMin);
}