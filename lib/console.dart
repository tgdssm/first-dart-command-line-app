import 'dart:io';

final currentDir = Directory.current.path;

List<String> foldersInDomain = [
  "entities",
  "usecases",
  "errors",
  "repositories"
];
List<String> foldersInExternal = ["datasources"];
List<String> foldersInInfra = ["datasources", "models", "repositories"];
List<String> foldersInPresenter = ["pages", "controllers"];

Future<void> createCleanDartStructure() async {
  stdout.write("Enter the path to the new folder: ");
  final folderPath = stdin.readLineSync();

  stdout.write("Enter the folder name: ");
  final folderName = stdin.readLineSync();

  final newFolderAbsolutePath = "$currentDir/$folderPath/$folderName";
  try {
    Directory(newFolderAbsolutePath).create(recursive: true);

    stdout.write("Do you want to create the clean dart structure (Y/N)? ");
    final userResponse = stdin.readLineSync();

    if (userResponse?.toLowerCase() == "y") {
      createFoldersCleanDart(newFolderAbsolutePath);
      createFoldersInDomain(newFolderAbsolutePath);
      createFoldersInExternal(newFolderAbsolutePath);
      createFoldersInInfra(newFolderAbsolutePath);
      createFoldersInPresenter(newFolderAbsolutePath);
      stdout.write("successfully created structure!");
    } else {
      stdout.write("Finishing...");
    }
  } catch (e) {
    stdout.write("$e");
  }
}

void createFoldersCleanDart(String absolutePath) {
  Directory("$absolutePath/domain").create(recursive: true);
  Directory("$absolutePath/external").create(recursive: true);
  Directory("$absolutePath/infra").create(recursive: true);
  Directory("$absolutePath/presenter").create(recursive: true);
}

void createFoldersInDomain(String absolutePath) {
  for (String folder in foldersInDomain) {
    Directory("$absolutePath/domain/$folder").create(recursive: true);
  }
}

void createFoldersInExternal(String absolutePath) {
  for (String folder in foldersInExternal) {
    Directory("$absolutePath/external/$folder").create(recursive: true);
  }
}

void createFoldersInInfra(String absolutePath) {
  for (String folder in foldersInInfra) {
    Directory("$absolutePath/infra/$folder").create(recursive: true);
  }
}

void createFoldersInPresenter(String absolutePath) {
  for (String folder in foldersInPresenter) {
    Directory("$absolutePath/presenter/$folder").create(recursive: true);
  }
}
