class StoppableService {
  //Services that needs to be stopped from running during different AppLifeCycles
  bool _servicestopped = false;
  bool get servicestopped => _servicestopped;

  void stop() {
    _servicestopped = true;
  }

  void start() {
    _servicestopped = false;
  }
}
