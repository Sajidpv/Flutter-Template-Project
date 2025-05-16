import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'file_picker_event.dart';
part 'file_picker_state.dart';

class FilePickerBloc extends Bloc<FilePickerEvent, FilePickerState> {
  FilePickerBloc() : super(FilePickerInitialState()) {
    const int maxImageLimit = 3;

    on<PickFileRequestedEvent>((event, emit) async {
      emit(FilePickerLoadingState());

      try {
        final result = await FilePicker.platform.pickFiles(
          allowMultiple: true,
          type: FileType.image,
        );
        List<File> allFiles = [];
        if (result != null && result.files.isNotEmpty) {
          final newFiles =
              result.files
                  .where((file) => file.path != null)
                  .map((file) => File(file.path!))
                  .toList();
          allFiles = [...event.existingFiles, ...newFiles];
          // Debug print after files are added
          debugPrint('Total picked files: ${allFiles.length.toString()}');

          // Check if the total number of files exceeds the maximum limit
          if (allFiles.length > maxImageLimit) {
            emit(
              FilePickerFailureState(
                "You can only select up to $maxImageLimit images.",
              ),
            );
          } else {
            emit(FilePickerSuccessState(allFiles));
          }
        } else {
          if (allFiles.isEmpty) {
            emit(FilePickerFailureState("No files selected"));
          }
        }
      } catch (e) {
        debugPrint(e.toString());
        emit(FilePickerFailureState("Failed to pick files: $e"));
      }
    });

    // Handle removing picked files
    on<RemovePickedFileEvent>((event, emit) {
      emit(FilePickerLoadingState());

      // Debug print to confirm event trigger
      debugPrint('RemovePickedFileEvent triggered with index: ${event.index}');

      try {
        // Ensure the index is valid
        if (event.index >= 0 && event.index < event.existingFiles.length) {
          event.existingFiles.removeAt(event.index);
          emit(FilePickerSuccessState(event.existingFiles));
        } else {
          // Handle invalid index (out of range)
          emit(FilePickerFailureState("Invalid index to remove file"));
        }
      } catch (e) {
        emit(FilePickerFailureState("Failed to remove file: $e"));
      }
    });
  }
}
