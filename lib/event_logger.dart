library EventLogger;

import "dart:math" as math;

class EventLogger {
  final Map<String, Event> _events = <String, Event>{};

  EventLogger();

  // Getters
  int get length => this._events.length;
  Function get forEach => this._events.forEach;
  Iterable<String> get keys => this._events.keys;
  Iterable<Event> get values => this._events.values;

  // Util

  /// Returns the ID of the newly created event
  String add([final Map data]) {
    final Event event = new Event(data);

    this._events[event.id] = event;

    return event.id;
  }

  bool remove(final String eventId) {
    try {
      if (this._events.containsKey(eventId)) {
        this._events.remove(eventId);
      }

      return true;
    } catch (err) {
      print(err);

      return false;
    }
  }

  void clear() {
    this._events.clear();
  }
}

class Event {
  String id;
  final DateTime createdDate;
  Map data;

  Event([final Map this.data]) :
    this.createdDate = new DateTime.now().toUtc()
  {
    this.id = this.createdDate.toString() + (new math.Random().nextInt(1000)).toString();
  }
}