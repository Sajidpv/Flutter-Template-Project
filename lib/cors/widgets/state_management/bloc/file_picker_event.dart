part of 'file_picker_bloc.dart';

sealed class FilePickerEvent extends Equatable {
  const FilePickerEvent();

  @override
  List<Object> get props => [];
}

class PickFileRequestedEvent extends FilePickerEvent {
  final List<File> existingFiles;

  const PickFileRequestedEvent(this.existingFiles);
  @override
  List<Object> get props => [existingFiles];
}

class RemovePickedFileEvent extends FilePickerEvent {
  final int index; // or File file;
  final List<File> existingFiles;
  const RemovePickedFileEvent({
    required this.index,
    required this.existingFiles,
  });
  @override
  List<Object> get props => [index, existingFiles];
}
