class Event {
  int id;
  bool currentSemester;
  String dateEnd;
  String dateNotification;
  String dateStart;
  String description;
  String endDate;
  String groups;
  int lessonCount;
  String lessonName;
  String lessonType;
  String location;
  bool notification;
  String notificationDate;
  String startDate;
  String timeEnd;
  String timeNotification;
  String timeStart;
  int roomId;
  String color;
  String teacherId;
  Event(
      {this.id,
        this.currentSemester,
        this.dateEnd,
        this.dateNotification,
        this.dateStart,
        this.description,
        this.endDate,
        this.groups,
        this.lessonCount,
        this.lessonName,
        this.lessonType,
        this.location,
        this.notification,
        this.notificationDate,
        this.startDate,
        this.timeEnd,
        this.timeNotification,
        this.timeStart,
        this.roomId,
        this.color,
        this.teacherId});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    currentSemester = json['currentSemester'];
    dateEnd = json['dateEnd'];
    dateNotification = json['dateNotification'];
    dateStart = json['dateStart'];
    description = json['description'];
    endDate = json['endDate'];
    groups = json['groups'];
    lessonCount = json['lessonCount'];
    lessonName = json['lessonName'];
    lessonType = json['lessonType'];
    location = json['location'];
    notification = json['notification'];
    notificationDate = json['notificationDate'];
    startDate = json['startDate'];
    timeEnd = json['timeEnd'];
    timeNotification = json['timeNotification'];
    timeStart = json['timeStart'];
    roomId = json['roomId'];
    color = json['color'];
    teacherId = json['teacherId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['currentSemester'] = this.currentSemester;
    data['dateEnd'] = this.dateEnd;
    data['dateNotification'] = this.dateNotification;
    data['dateStart'] = this.dateStart;
    data['description'] = this.description;
    data['endDate'] = this.endDate;
    data['groups'] = this.groups;
    data['lessonCount'] = this.lessonCount;
    data['lessonName'] = this.lessonName;
    data['lessonType'] = this.lessonType;
    data['location'] = this.location;
    data['notification'] = this.notification;
    data['notificationDate'] = this.notificationDate;
    data['startDate'] = this.startDate;
    data['timeEnd'] = this.timeEnd;
    data['timeNotification'] = this.timeNotification;
    data['timeStart'] = this.timeStart;
    data['roomId'] = this.roomId;
    data['color'] = this.color;
    data['teacherId'] = this.teacherId;
    return data;
  }
}