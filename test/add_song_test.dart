import 'package:flutter_test/flutter_test.dart';
import 'package:musicproject/song.dart';

// this test makes sure the user can enter data into the text fields and the dropdown menu. It DOES NOT TEST FOR INSERTING DATA INTO THE LIST. insert_data_test.dart tests for that.
void main() {
  test('testing the newSong() method', () {
    //setup
    List<Song> songList = [];
    Song newSong = Song(
      title: 'test title',
      artist: 'test artist',
      genre: 'test genre',
    );
    Song.addSong(newSong, songList);
  });
}
