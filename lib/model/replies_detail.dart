// To parse this JSON data, do
//
//     final repliesDetail = repliesDetailFromJson(jsonString);

import 'dart:convert';

class RepliesDetail {
  RepliesDetail({
    required this.code,
    required this.message,
    required this.ttl,
    required this.repliesData,
  });

  final int code;
  final String message;
  final int ttl;
  final RepliesData repliesData;

  bool get success => code == 0;
  String get errorMessage {
    if (success) {
      return '成功';
    } else if (code == 400) {
      return '请求错误';
    } else if (code == 404) {
      return '无此项';
    } else if (code == 12002) {
      return '评论区已关闭';
    } else if (code == 12009) {
      return '评论主体的type不合法';
    } else {
      return '未知错误';
    }
  }

  factory RepliesDetail.fromRawJson(String str) =>
      RepliesDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RepliesDetail.fromJson(Map<String, dynamic> json) => RepliesDetail(
        code: json["code"],
        message: json["message"],
        ttl: json["ttl"],
        repliesData: RepliesData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "ttl": ttl,
        "data": repliesData.toJson(),
      };
}

class RepliesData {
  RepliesData({
    required this.replies,
  });

  final List<Reply> replies;

  factory RepliesData.fromRawJson(String str) =>
      RepliesData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RepliesData.fromJson(Map<String, dynamic> json) => RepliesData(
        replies:
            List<Reply>.from(json["replies"].map((x) => Reply.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "replies": List<dynamic>.from(replies.map((x) => x.toJson())),
      };
}

class Reply {
  Reply({
    required this.rpid,
    required this.oid,
    required this.type,
    required this.mid,
    required this.root,
    required this.parent,
    required this.dialog,
    required this.count,
    required this.rcount,
    required this.state,
    required this.fansgrade,
    required this.attr,
    required this.ctime,
    required this.rpidStr,
    required this.rootStr,
    required this.parentStr,
    required this.like,
    required this.action,
    required this.member,
    required this.content,
    required this.replies,
    required this.replyControl,
  });

  final int rpid;
  final int oid;
  final int type;
  final int mid;
  final int root;
  final int parent;
  final int dialog;
  final int count;
  final int rcount;
  final int state;
  final int fansgrade;
  final int attr;
  final int ctime;
  final String rpidStr;
  final String rootStr;
  final String parentStr;
  final int like;
  final int action;
  final Member member;
  final Content content;
  final dynamic replies;
  final ReplyControl replyControl;

  factory Reply.fromRawJson(String str) => Reply.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Reply.fromJson(Map<String, dynamic> json) => Reply(
        rpid: json["rpid"],
        oid: json["oid"],
        type: json["type"],
        mid: json["mid"],
        root: json["root"],
        parent: json["parent"],
        dialog: json["dialog"],
        count: json["count"],
        rcount: json["rcount"],
        state: json["state"],
        fansgrade: json["fansgrade"],
        attr: json["attr"],
        ctime: json["ctime"],
        rpidStr: json["rpid_str"],
        rootStr: json["root_str"],
        parentStr: json["parent_str"],
        like: json["like"],
        action: json["action"],
        member: Member.fromJson(json["member"]),
        content: Content.fromJson(json["content"]),
        replies: json["replies"],
        replyControl: ReplyControl.fromJson(json["reply_control"]),
      );

  Map<String, dynamic> toJson() => {
        "rpid": rpid,
        "oid": oid,
        "type": type,
        "mid": mid,
        "root": root,
        "parent": parent,
        "dialog": dialog,
        "count": count,
        "rcount": rcount,
        "state": state,
        "fansgrade": fansgrade,
        "attr": attr,
        "ctime": ctime,
        "rpid_str": rpidStr,
        "root_str": rootStr,
        "parent_str": parentStr,
        "like": like,
        "action": action,
        "member": member.toJson(),
        "content": content.toJson(),
        "replies": replies,
        "reply_control": replyControl.toJson(),
      };
}

class Content {
  Content({
    required this.message,
    required this.members,
    required this.jumpUrl,
    required this.maxLine,
    required this.emote,
  });

  final String message;
  final List<dynamic> members;
  final JumpUrl jumpUrl;
  final int maxLine;
  final Map<String, Emote>? emote;

  factory Content.fromRawJson(String str) => Content.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        message: json["message"],
        members: List<dynamic>.from(json["members"].map((x) => x)),
        jumpUrl: JumpUrl.fromJson(json["jump_url"]),
        maxLine: json["max_line"],
        emote: json["emote"] == null
            ? null
            : Map.from(json["emote"])
                .map((k, v) => MapEntry<String, Emote>(k, Emote.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "members": List<dynamic>.from(members.map((x) => x)),
        "jump_url": jumpUrl.toJson(),
        "max_line": maxLine,
        "emote": emote,
      };
}

class Emote {
  Emote({
    required this.id,
    required this.packageId,
    required this.state,
    required this.type,
    required this.attr,
    required this.text,
    required this.url,
    required this.mtime,
    required this.jumpTitle,
  });

  final int id;
  final int packageId;
  final int state;
  final int type;
  final int attr;
  final String text;
  final String url;
  final int mtime;
  final String jumpTitle;

  factory Emote.fromRawJson(String str) => Emote.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Emote.fromJson(Map<String, dynamic> json) => Emote(
        id: json["id"],
        packageId: json["package_id"],
        state: json["state"],
        type: json["type"],
        attr: json["attr"],
        text: json["text"],
        url: json["url"],
        mtime: json["mtime"],
        jumpTitle: json["jump_title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "package_id": packageId,
        "state": state,
        "type": type,
        "attr": attr,
        "text": text,
        "url": url,
        "mtime": mtime,
        "jump_title": jumpTitle,
      };
}

class JumpUrl {
  JumpUrl();

  factory JumpUrl.fromRawJson(String str) => JumpUrl.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory JumpUrl.fromJson(Map<String, dynamic> json) => JumpUrl();

  Map<String, dynamic> toJson() => {};
}

class Member {
  Member({
    required this.mid,
    required this.uname,
    required this.sex,
    required this.sign,
    required this.avatar,
    required this.rank,
    required this.faceNftNew,
    required this.isSeniorMember,
    required this.levelInfo,
    required this.pendant,
    required this.nameplate,
    required this.vip,
  });

  final String mid;
  final String uname;
  final String sex;
  final String sign;
  final String avatar;
  final String rank;
  final int faceNftNew;
  final int isSeniorMember;
  final LevelInfo levelInfo;
  final MemberPendant pendant;
  final Nameplate nameplate;
  final Vip vip;

  factory Member.fromRawJson(String str) => Member.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        mid: json["mid"],
        uname: json["uname"],
        sex: json["sex"],
        sign: json["sign"],
        avatar: json["avatar"],
        rank: json["rank"],
        faceNftNew: json["face_nft_new"],
        isSeniorMember: json["is_senior_member"],
        levelInfo: LevelInfo.fromJson(json["level_info"]),
        pendant: MemberPendant.fromJson(json["pendant"]),
        nameplate: Nameplate.fromJson(json["nameplate"]),
        vip: Vip.fromJson(json["vip"]),
      );

  Map<String, dynamic> toJson() => {
        "mid": mid,
        "uname": uname,
        "sex": sex,
        "sign": sign,
        "avatar": avatar,
        "rank": rank,
        "face_nft_new": faceNftNew,
        "is_senior_member": isSeniorMember,
        "level_info": levelInfo.toJson(),
        "pendant": pendant.toJson(),
        "nameplate": nameplate.toJson(),
        "vip": vip.toJson(),
      };
}

class LevelInfo {
  LevelInfo({
    required this.currentLevel,
    required this.currentMin,
    required this.currentExp,
    required this.nextExp,
  });

  final int currentLevel;
  final int currentMin;
  final int currentExp;
  final int nextExp;

  factory LevelInfo.fromRawJson(String str) =>
      LevelInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LevelInfo.fromJson(Map<String, dynamic> json) => LevelInfo(
        currentLevel: json["current_level"],
        currentMin: json["current_min"],
        currentExp: json["current_exp"],
        nextExp: json["next_exp"],
      );

  Map<String, dynamic> toJson() => {
        "current_level": currentLevel,
        "current_min": currentMin,
        "current_exp": currentExp,
        "next_exp": nextExp,
      };
}

class Nameplate {
  Nameplate({
    required this.nid,
    required this.name,
    required this.image,
    required this.imageSmall,
    required this.level,
    required this.condition,
  });

  final int nid;
  final String name;
  final String image;
  final String imageSmall;
  final String level;
  final String condition;

  factory Nameplate.fromRawJson(String str) =>
      Nameplate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Nameplate.fromJson(Map<String, dynamic> json) => Nameplate(
        nid: json["nid"],
        name: json["name"],
        image: json["image"],
        imageSmall: json["image_small"],
        level: json["level"],
        condition: json["condition"],
      );

  Map<String, dynamic> toJson() => {
        "nid": nid,
        "name": name,
        "image": image,
        "image_small": imageSmall,
        "level": level,
        "condition": condition,
      };
}

class MemberPendant {
  MemberPendant({
    required this.pid,
    required this.name,
    required this.image,
    required this.expire,
    required this.imageEnhance,
    required this.imageEnhanceFrame,
  });

  final int pid;
  final String name;
  final String image;
  final int expire;
  final String imageEnhance;
  final String imageEnhanceFrame;

  factory MemberPendant.fromRawJson(String str) =>
      MemberPendant.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MemberPendant.fromJson(Map<String, dynamic> json) => MemberPendant(
        pid: json["pid"],
        name: json["name"],
        image: json["image"],
        expire: json["expire"],
        imageEnhance: json["image_enhance"],
        imageEnhanceFrame: json["image_enhance_frame"],
      );

  Map<String, dynamic> toJson() => {
        "pid": pid,
        "name": name,
        "image": image,
        "expire": expire,
        "image_enhance": imageEnhance,
        "image_enhance_frame": imageEnhanceFrame,
      };
}

class UserSailing {
  UserSailing({
    required this.pendant,
    required this.cardbg,
    required this.cardbgWithFocus,
  });

  final UserSailingPendant pendant;
  final Cardbg cardbg;
  final dynamic cardbgWithFocus;

  factory UserSailing.fromRawJson(String str) =>
      UserSailing.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserSailing.fromJson(Map<String, dynamic> json) => UserSailing(
        pendant: UserSailingPendant.fromJson(json["pendant"]),
        cardbg: Cardbg.fromJson(json["cardbg"]),
        cardbgWithFocus: json["cardbg_with_focus"],
      );

  Map<String, dynamic> toJson() => {
        "pendant": pendant.toJson(),
        "cardbg": cardbg.toJson(),
        "cardbg_with_focus": cardbgWithFocus,
      };
}

class Cardbg {
  Cardbg({
    required this.id,
    required this.name,
    required this.image,
    required this.jumpUrl,
    required this.fan,
    required this.type,
  });

  final int id;
  final String name;
  final String image;
  final String jumpUrl;
  final Fan fan;
  final String type;

  factory Cardbg.fromRawJson(String str) => Cardbg.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cardbg.fromJson(Map<String, dynamic> json) => Cardbg(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        jumpUrl: json["jump_url"],
        fan: Fan.fromJson(json["fan"]),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "jump_url": jumpUrl,
        "fan": fan.toJson(),
        "type": type,
      };
}

class Fan {
  Fan({
    required this.isFan,
    required this.number,
    required this.color,
    required this.name,
    required this.numDesc,
  });

  final int isFan;
  final int number;
  final String color;
  final String name;
  final String numDesc;

  factory Fan.fromRawJson(String str) => Fan.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Fan.fromJson(Map<String, dynamic> json) => Fan(
        isFan: json["is_fan"],
        number: json["number"],
        color: json["color"],
        name: json["name"],
        numDesc: json["num_desc"],
      );

  Map<String, dynamic> toJson() => {
        "is_fan": isFan,
        "number": number,
        "color": color,
        "name": name,
        "num_desc": numDesc,
      };
}

class UserSailingPendant {
  UserSailingPendant({
    required this.id,
    required this.name,
    required this.image,
    required this.jumpUrl,
    required this.type,
    required this.imageEnhance,
    required this.imageEnhanceFrame,
  });

  final int id;
  final String name;
  final String image;
  final String jumpUrl;
  final String type;
  final String imageEnhance;
  final String imageEnhanceFrame;

  factory UserSailingPendant.fromRawJson(String str) =>
      UserSailingPendant.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserSailingPendant.fromJson(Map<String, dynamic> json) =>
      UserSailingPendant(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        jumpUrl: json["jump_url"],
        type: json["type"],
        imageEnhance: json["image_enhance"],
        imageEnhanceFrame: json["image_enhance_frame"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "jump_url": jumpUrl,
        "type": type,
        "image_enhance": imageEnhance,
        "image_enhance_frame": imageEnhanceFrame,
      };
}

class Vip {
  Vip({
    required this.vipType,
    required this.vipDueDate,
    required this.dueRemark,
    required this.accessStatus,
    required this.vipStatus,
    required this.vipStatusWarn,
    required this.themeType,
    required this.label,
    required this.avatarSubscript,
    required this.nicknameColor,
  });

  final int vipType;
  final int vipDueDate;
  final String dueRemark;
  final int accessStatus;
  final int vipStatus;
  final String vipStatusWarn;
  final int themeType;
  final Label label;
  final int avatarSubscript;
  final String nicknameColor;

  factory Vip.fromRawJson(String str) => Vip.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Vip.fromJson(Map<String, dynamic> json) => Vip(
        vipType: json["vipType"],
        vipDueDate: json["vipDueDate"],
        dueRemark: json["dueRemark"],
        accessStatus: json["accessStatus"],
        vipStatus: json["vipStatus"],
        vipStatusWarn: json["vipStatusWarn"],
        themeType: json["themeType"],
        label: Label.fromJson(json["label"]),
        avatarSubscript: json["avatar_subscript"],
        nicknameColor: json["nickname_color"],
      );

  Map<String, dynamic> toJson() => {
        "vipType": vipType,
        "vipDueDate": vipDueDate,
        "dueRemark": dueRemark,
        "accessStatus": accessStatus,
        "vipStatus": vipStatus,
        "vipStatusWarn": vipStatusWarn,
        "themeType": themeType,
        "label": label.toJson(),
        "avatar_subscript": avatarSubscript,
        "nickname_color": nicknameColor,
      };
}

class Label {
  Label({
    required this.path,
    required this.text,
    required this.labelTheme,
    required this.textColor,
    required this.bgStyle,
    required this.bgColor,
    required this.borderColor,
    required this.useImgLabel,
    required this.imgLabelUriHans,
    required this.imgLabelUriHant,
    required this.imgLabelUriHansStatic,
    required this.imgLabelUriHantStatic,
  });

  final String path;
  final String text;
  final String labelTheme;
  final String textColor;
  final int bgStyle;
  final String bgColor;
  final String borderColor;
  final bool useImgLabel;
  final String imgLabelUriHans;
  final String imgLabelUriHant;
  final String imgLabelUriHansStatic;
  final String imgLabelUriHantStatic;

  factory Label.fromRawJson(String str) => Label.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Label.fromJson(Map<String, dynamic> json) => Label(
        path: json["path"],
        text: json["text"],
        labelTheme: json["label_theme"],
        textColor: json["text_color"],
        bgStyle: json["bg_style"],
        bgColor: json["bg_color"],
        borderColor: json["border_color"],
        useImgLabel: json["use_img_label"],
        imgLabelUriHans: json["img_label_uri_hans"],
        imgLabelUriHant: json["img_label_uri_hant"],
        imgLabelUriHansStatic: json["img_label_uri_hans_static"],
        imgLabelUriHantStatic: json["img_label_uri_hant_static"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "text": text,
        "label_theme": labelTheme,
        "text_color": textColor,
        "bg_style": bgStyle,
        "bg_color": bgColor,
        "border_color": borderColor,
        "use_img_label": useImgLabel,
        "img_label_uri_hans": imgLabelUriHans,
        "img_label_uri_hant": imgLabelUriHant,
        "img_label_uri_hans_static": imgLabelUriHansStatic,
        "img_label_uri_hant_static": imgLabelUriHantStatic,
      };
}

class ReplyControl {
  ReplyControl({
    required this.maxLine,
    required this.timeDesc,
    required this.location,
  });

  final int? maxLine;
  final String? timeDesc;
  final String? location;

  factory ReplyControl.fromRawJson(String str) =>
      ReplyControl.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReplyControl.fromJson(Map<String, dynamic> json) => ReplyControl(
        maxLine: json["max_line"],
        timeDesc: json["time_desc"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "max_line": maxLine,
        "time_desc": timeDesc,
        "location": location,
      };
}
