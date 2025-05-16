part of 'file_picker_bloc.dart';

sealed class FilePickerState extends Equatable {
  const FilePickerState();

  @override
  List<Object> get props => [];
}

class FilePickerInitialState extends FilePickerState {}

class FilePickerLoadingState extends FilePickerState {}

class FilePickerSuccessState extends FilePickerState {
  final List<File> files;

  const FilePickerSuccessState(this.files);
}

class FilePickerFailureState extends FilePickerState {
  final String error;

  const FilePickerFailureState(this.error);
}
