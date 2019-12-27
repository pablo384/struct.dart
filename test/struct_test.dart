import 'package:struct/struct.dart';
import 'package:struct/constants.dart';
import 'package:test/test.dart';

main() {
  test('pack and unpack max byte identity', () {
    var values = [unsignedByteMax];
    var buffer = pack('B', values);
    var unpacked = unpack('B', buffer);
    expect(unpacked.first, equals(unsignedByteMax));
  });

  test('pack and unpack min byte identity', () {
    var values = [unsignedByteMin];
    var buffer = pack('B', values);
    var unpacked = unpack('B', buffer);
    expect(unpacked.first, equals(unsignedByteMin));
  });

  test('unpack 4 bytes of 255 into unsigned integer', () {
    var values = [255, 255, 255, 255];
    var buffer = pack('BBBB', values);
    var unpacked = unpack('I', buffer);
    expect(unpacked[0], equals(unsignedIntMax));
  });

  test('unpack 1 byte of 127 and 3 bytes of 255 into signed integer', () {
    var values = [127, 255, 255, 255];
    var buffer = pack('BBBB', values);
    var unpacked = unpack('i', buffer);
    expect(unpacked[0], equals(signedIntMax));
  });

  test('unpack 4 bytes of 0 into unsigned integer', () {
    var values = [0, 0, 0, 0];
    var buffer = pack('BBBB', values);
    var unpacked = unpack('I', buffer);
    expect(unpacked[0], equals(0));
  });

  test('unpack 2 bytes into unsigned short', () {
    var values = [255, 255];
    var buffer = pack('BB', values);
    var unpacked = unpack('H', buffer);
    expect(unpacked[0], equals(unsignedShortMax));
  });

  test('unpack 8 bytes into unsigned long', () {
    var values = [255, 255, 255, 255, 255, 255, 255, 255];
    var buffer = pack('BBBBBBBB', values);
    var unpacked = unpack('L', buffer);
    expect(unpacked[0], equals(unsignedLongMax));
  });

  test('unpack 2 bytes into unsigned short in big endian (>)', () {
    var values = [1, 255];
    var buffer = pack('BB', values);
    var unpacked = unpack('>H', buffer);
    expect(unpacked[0], equals(511));
  });

  test('unpack 2 bytes into unsigned short in big endian (!)', () {
    var values = [1, 255];
    var buffer = pack('BB', values);
    var unpacked = unpack('!H', buffer);
    expect(unpacked[0], equals(511));
  });

  test('unpack 2 bytes into unsigned short in little endian (<)', () {
    var values = [1, 255];
    var buffer = pack('BB', values);
    var unpacked = unpack('<H', buffer);
    expect(unpacked[0], equals(65281));
  });

  test('unpack 2 bytes into unsigned short in host endian (@)', () {
    var values = [1, 255];
    var buffer = pack('BB', values);
    var unpacked = unpack('@H', buffer);
    expect(unpacked[0], equals(65281));
  });

  test('unpack 2 bytes into unsigned short in host endian (=)', () {
    var values = [1, 255];
    var buffer = pack('BB', values);
    var unpacked = unpack('=H', buffer);
    expect(unpacked[0], equals(65281));
  });
}
