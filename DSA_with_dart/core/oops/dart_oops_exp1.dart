import 'dart:math';

// ===================================================================
// Pillar 1: Abstraction
// We define a contract for anything that can be rendered. We don't care HOW
// it renders, just that it CAN be rendered. This hides the complexity.
// ===================================================================
abstract class Renderable {
  String get name;
  Duration get duration;
  void render(); // Abstract method: subclasses MUST implement this.
}

// ===================================================================
// Pillar 2: Inheritance
// We create a base class for file-based media that shares common properties.
// VideoFile and AudioFile will INHERIT these common properties.
// ===================================================================
class MediaFile {
  final String filePath;
  MediaFile(this.filePath);
}

// VideoFile is both a MediaFile (by inheritance) and Renderable (by implementation).
class VideoFile extends MediaFile implements Renderable {
  @override
  final String name;
  @override
  final Duration duration;
  final String resolution;

  VideoFile(this.name, this.duration, this.resolution, String filePath)
    : super(filePath);

  @override
  void render() {
    print('🎬 Rendering VIDEO: "$name" ($resolution) from $filePath');
    // Imagine complex video processing logic here...
  }
}

// AudioFile is another type of Renderable media.
class AudioFile implements Renderable {
  @override
  final String name;
  @override
  final Duration duration;
  final int bitrate;

  AudioFile(this.name, this.duration, this.bitrate);

  @override
  void render() {
    print('🎵 Rendering AUDIO: "$name" (${bitrate}kbps)');
    // Imagine complex audio mixing logic here...
  }
}

// ===================================================================
// Pillar 3: Encapsulation
// The RenderEngine bundles data (_queue, _outputFormat) and methods together.
// It hides its internal workings (e.g., _processQueue) from the outside.
// You interact with it through a clean public API (addToTimeline, export).
// ===================================================================
class RenderEngine {
  // Private properties, hidden from outside the class.
  final List<Renderable> _timeline = [];
  final String _outputFormat;

  // A public "getter" to safely see the timeline without being able to modify it.
  List<Renderable> get timeline => List.unmodifiable(_timeline);

  RenderEngine(this._outputFormat);

  void addToTimeline(Renderable item) {
    if (item.duration.inSeconds > 0) {
      _timeline.add(item);
      print('✅ Added "${item.name}" to the timeline.');
    } else {
      print('❌ Cannot add "${item.name}", duration is zero.');
    }
  }

  // The main public method to start the process.
  void export() {
    print('\n🚀 Starting export to $_outputFormat...');
    _prepareEngine();
    _processQueue(); // Call the private method.
    print('✨ Export complete!');
  }

  // Private methods that contain the complex internal logic.
  void _prepareEngine() {
    print('🔧 Preparing render engine for $_outputFormat...');
    // Simulating some prep work
    Future.delayed(Duration(seconds: 1));
  }

  // ===================================================================
  // Pillar 4: Polymorphism
  // This method takes a list of 'Renderable' objects. It doesn't care if
  // an item is a VideoFile or an AudioFile. It just calls item.render(),
  // and Dart executes the correct version for each object.
  // ===================================================================
  void _processQueue() {
    for (final item in _timeline) {
      // POLYMORPHISM IN ACTION:
      // The same line of code behaves differently depending on the
      // actual type of 'item' (VideoFile, AudioFile, etc.).
      item.render();
    }
  }
}

void main() {
  // 1. Create the engine (Encapsulation)
  var myRenderEngine = RenderEngine('MP4');

  // 2. Create different types of media objects (using inherited classes)
  var mainVideo = VideoFile(
    'Mountain_Trip.mov',
    Duration(minutes: 2, seconds: 30),
    '4K',
    '/vids/trip.mov',
  );
  var backgroundMusic = AudioFile(
    'Upbeat_Song.mp3',
    Duration(minutes: 3, seconds: 15),
    320,
  );
  var invalidMedia = VideoFile(
    'empty.mov',
    Duration.zero,
    '1080p',
    '/vids/empty.mov',
  );

  // 3. Add items to the timeline using the engine's public API
  myRenderEngine.addToTimeline(mainVideo);
  myRenderEngine.addToTimeline(backgroundMusic);
  myRenderEngine.addToTimeline(invalidMedia); // The engine will reject this.

  // 4. Export the final video. The engine handles the complex process.
  myRenderEngine.export();
}
