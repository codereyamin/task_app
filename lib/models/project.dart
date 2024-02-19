class Project {
  int? id;
  String? startDate;
  String? endDate;
  int? startDayOfYear;
  int? endDayOfYear;
  String? projectName;
  String? projectUpdate;
  String? assignedEngineer;
  String? assignedTechnician;
  int? duration;

  Project(
      {this.id,
      this.startDate,
      this.endDate,
      this.startDayOfYear,
      this.endDayOfYear,
      this.projectName,
      this.projectUpdate,
      this.assignedEngineer,
      this.assignedTechnician,
      this.duration});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    startDayOfYear = json['start_day_of_year'];
    endDayOfYear = json['end_day_of_year'];
    projectName = json['project_name'];
    projectUpdate = json['project_update'];
    assignedEngineer = json['assigned_engineer'];
    assignedTechnician = json['assigned_technician'];
    duration = json['duration'];
  }
}
