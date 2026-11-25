import 'package:json_annotation/json_annotation.dart';

part 'education.g.dart';

/// Portfolio education synchronized with the Django REST Framework API.
@JsonSerializable(fieldRename: FieldRename.snake)
class Education {
  const Education({
    required this.id,
    required this.title,
    required this.category,
    required this.institution,
    required this.yearStart,
    required this.yearEnd,
  });

  // Converts JSON data into an Education object.
  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);

  @JsonKey(includeToJson: false)
  final String? id;

  final String title;
  final String category;
  final String institution;
  final String yearStart;
  final String yearEnd;

  // Converts an Education object into JSON data.
  Map<String, dynamic> toJson() => _$EducationToJson(this);
}