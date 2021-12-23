class WorkModel {
  WorkModel({required this.jobId, required this.site});

  WorkModel.fromJson(Map<String, Object?> json)
      : this(
          jobId: json['JobId']! as String,
          site: json['Site']! as String,
        );

  final String jobId;
  final String site;

  Map<String, Object?> toJson() {
    return {
      'jobId': jobId,
      'site': site,
    };
  }
}
