import 'dart:io';
import 'dart:convert'; // Required for decoding the error stream
import 'package:ffmpeg_cli/ffmpeg_cli.dart';

Future<void> main() async {
  // Define the input and output file paths
  final videoInput = 'video_clip.mp4' ;
  final audioInput = 'music.mp3' ;
  final finalOutput = 'final_movie.mp4' ;

  // Create dummy input files for the example to run
  if (!await File(videoInput).exists()) {
    await File(videoInput).writeAsString('dummy video');
    print('Created dummy file: $videoInput');
  }
  if (!await File(audioInput).exists()) {
    await File(audioInput).writeAsString('dummy audio');
    print('Created dummy file: $audioInput');
  }

  print('🎬 Starting video creation with ffmpeg_cli...');

  final ffmpeg = Ffmpeg();

  // THE FINAL FIX: This is the new, correct way to build the command.
  final command = FfmpegCommand.simple(
    // 'inputs' is now a simple List of file path strings.
    inputs: [
      FfmpegInput.asset(videoInput),
      FfmpegInput.asset(audioInput),
    ],
    // 'outputFilepath' is a required named parameter for the output.
    outputFilepath: finalOutput,
    // 'args' are for all other FFmpeg arguments.
    args: [
      CliArg(name: '-y'), // Overwrite output
      CliArg(name: '-c:v', value: 'copy'),
      CliArg(name: '-c:a', value: 'aac'),
      CliArg(name: '-shortest'),
    ],
  );

  // THE FINAL FIX: Run the command without the onProgress callback, as it's not supported.
  final process = await ffmpeg.run(
    command,
  );

  if (await process.exitCode == 0) {
    print('✅ Success! Video created at: $finalOutput');
  } else {
    print('❌ FFmpeg error occurred. Check the logs for details.');
    // THE FINAL FIX: Correctly read the error stream.
    final errorLogs = await process.stderr.transform(utf8.decoder).join();
    print('FFmpeg Error Log:\n$errorLogs');
  }
}
