import 'package:cloud_firestore/cloud_firestore.dart';

class PairingModel {
  final String code;
  final String familyId;
  final String parentUid;
  final String? childUid;
  final bool used;
  final Timestamp expiresAt;

  PairingModel({
    required this.code,
    required this.familyId,
    required this.parentUid,
    this.childUid,
    required this.used,
    required this.expiresAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'familyId': familyId,
      'parentUid': parentUid,
      'childUid': childUid,
      'used': used,
      'expiresAt': expiresAt,
    };
  }

  factory PairingModel.fromMap(Map<String, dynamic> map) {
    return PairingModel(
      code: map['code'],
      familyId: map['familyId'],
      parentUid: map['parentUid'],
      childUid: map['childUid'],
      used: map['used'],
      expiresAt: map['expiresAt'],
    );
  }
}