library eth_abi_codec_test.multicall_decode_test;

import 'dart:convert';
import 'dart:io';

import 'package:convert/convert.dart';
import 'package:test/test.dart';
import 'package:eth_abi_codec/eth_abi_codec.dart';

void main() {
  var abi_file = File('./test_abi/MULTICALL.json');
  
  var abi = ContractABI.fromJson(
              jsonDecode(abi_file.readAsStringSync()));
  
  test('Multicall decode aggregate', () {
    var data = hex.decode('252dba420000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000700000000000000000000000000000000000000000000000000000000000000e00000000000000000000000000000000000000000000000000000000000000180000000000000000000000000000000000000000000000000000000000000024000000000000000000000000000000000000000000000000000000000000002e0000000000000000000000000000000000000000000000000000000000000036000000000000000000000000000000000000000000000000000000000000003e000000000000000000000000000000000000000000000000000000000000004800000000000000000000000001bed2e134365055d76072642c3328f4899249a890000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000002470a08231000000000000000000000000621b2b1e5e1364fb014c5232e2bc9d30dd46c1f0000000000000000000000000000000000000000000000000000000000000000000000000000000001bed2e134365055d76072642c3328f4899249a8900000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000044dd62ed3e000000000000000000000000621b2b1e5e1364fb014c5232e2bc9d30dd46c1f00000000000000000000000002f6b51a02367561a1d484ab5b006e7640d953c8b000000000000000000000000000000000000000000000000000000000000000000000000000000001f9840a85d5af5bf1d1762f925bdaddc4201f9840000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000002470a08231000000000000000000000000621b2b1e5e1364fb014c5232e2bc9d30dd46c1f00000000000000000000000000000000000000000000000000000000000000000000000000000000026d6e49f3f335a9e6dc4a3a57569f406687dd61b000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000040902f1ac0000000000000000000000000000000000000000000000000000000000000000000000000000000042ad527de7d4e9d9d011ac45b31d8551f8fe9821000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000040f28c97d0000000000000000000000000000000000000000000000000000000000000000000000000000000042ad527de7d4e9d9d011ac45b31d8551f8fe9821000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000244d2301cc000000000000000000000000621b2b1e5e1364fb014c5232e2bc9d30dd46c1f000000000000000000000000000000000000000000000000000000000000000000000000000000000516d4dfa0b83114f4f19faf672b9a3d5e22ce102000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000240178b8bfc8485cc9d9d6e082fbf95eedb54a338198ce7dbbd24795ad2d8548b27d07b34200000000000000000000000000000000000000000000000000000000');
    var call = abi.decomposeCall(data);
    expect(call.functionName, 'aggregate');
    expect(call.callParams['calls'] is List, true);
    expect(call.callParams['calls'][6][0], '516d4dfa0b83114f4f19faf672b9a3d5e22ce102');
  });
}