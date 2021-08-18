
import 'package:plantdiseasedetector/models/diseasemodel.dart';
import 'package:plantdiseasedetector/utils/datagenerator.dart';

List<DiseasesModel> diseaseList;

Future<void> fetchList() async {
  diseaseList = getDiseases();
}