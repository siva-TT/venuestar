

import 'package:equatable/equatable.dart';

class ProfileItems extends Equatable {
  String? ProfileHeader;
  String? Membershipheader;
  String? Membershipname;
  String? Membertier;
  int? memberid;
  int? phno;
  String? mailid;
  String? membershiprenew;
  String? membervalid;

  ProfileItems({
    this.ProfileHeader,
    this.Membershipheader,
    this.Membertier,
    this.memberid,
    this.phno,
    this.mailid,
    this.membershiprenew,
    this.Membershipname,
    this.membervalid,
  });

  ProfileItems.empty()
      : this(
          ProfileHeader: null,
          Membershipheader: null,
          Membertier: null,
          memberid: null,
          phno:null,
          mailid: null,
          membershiprenew: null,
          Membershipname: null,
          membervalid: null,
        );

  @override
  List<Object?> get props => [
        ProfileHeader,
        Membershipheader,
        memberid,
        Membertier,
        /* images */ membershiprenew,
        phno,
        mailid,
        Membershipname,
        membervalid,
      ];
}
