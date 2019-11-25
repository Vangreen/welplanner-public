
import 'network.dart';
const String planAPIURL = 'http://championships.ringo.org.pl/event.json';

class PlanAPI {
  Future<dynamic> getPlan() async {
    Network network = Network('$planAPIURL');
    var planData = await network.getData();
    return planData;
  }
}
