// To parse this JSON data, do
//
//     final vedioModel = vimeoModelFromJson(jsonString);

import 'dart:convert';

VimeoModel vimeoModelFromJson(String str) =>
    VimeoModel.fromJson(json.decode(str));

String vedioModelToJson(VimeoModel data) => json.encode(data.toJson());

class VimeoModel {
  VimeoModel({
    this.total,
    this.page,
    this.perPage,
    this.paging,
    this.data,
  });

  int? total;
  int? page;
  int? perPage;
  Paging? paging;
  List<Datum>? data;

  factory VimeoModel.fromJson(Map<String, dynamic> json) => VimeoModel(
        total: json["total"],
        page: json["page"],
        perPage: json["per_page"],
        paging: Paging.fromJson(json["paging"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "page": page,
        "per_page": perPage,
        "paging": paging?.toJson(),
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ClipToPlayLive {
  ClipToPlayLive({
    this.id,
    this.link,
    this.rtmpsLink,
    this.key,
    this.activeTime,
    this.endedTime,
    this.archivedTime,
    this.status,
    this.scheduledStartTime,
    this.secondsRemaining,
    this.sessionId,
    this.rtmpPreview,
    this.recurringEvent,
    this.chat,
  });

  int? id;
  Link? link;
  RtmpsLink? rtmpsLink;
  String? key;
  DateTime? activeTime;
  DateTime? endedTime;
  DateTime? archivedTime;
  String? status;
  DateTime? scheduledStartTime;
  int? secondsRemaining;
  String? sessionId;
  int? rtmpPreview;
  Datum? recurringEvent;
  Chat? chat;

  factory ClipToPlayLive.fromJson(Map<String, dynamic> json) => ClipToPlayLive(
        id: json["id"],
        link: linkValues.map[json["link"]],
        rtmpsLink: rtmpsLinkValues.map[json["rtmps_link"]],
        key: json["key"],
        activeTime: json["active_time"] == null
            ? null
            : DateTime.parse(json["active_time"]),
        endedTime: json["ended_time"] == null
            ? null
            : DateTime.parse(json["ended_time"]),
        archivedTime: json["archived_time"] == null
            ? null
            : DateTime.parse(json["archived_time"]),
        status: json["status"],
        scheduledStartTime: json["scheduled_start_time"] == null
            ? null
            : DateTime.parse(json["scheduled_start_time"]),
        secondsRemaining: json["seconds_remaining"],
        sessionId: json["session_id"] == null ? null : json["session_id"],
        rtmpPreview: json["rtmp_preview"],
        recurringEvent: Datum.fromJson(json["recurring_event"]),
        chat: Chat.fromJson(json["chat"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "link": linkValues.reverse[link],
        "rtmps_link": rtmpsLinkValues.reverse[rtmpsLink],
        "key": key,
        "active_time":
            activeTime == null ? null : activeTime?.toIso8601String(),
        "ended_time": endedTime == null ? null : endedTime?.toIso8601String(),
        "archived_time":
            archivedTime == null ? null : archivedTime?.toIso8601String(),
        "status": liveStatusValues.reverse[status],
        "scheduled_start_time": scheduledStartTime == null
            ? null
            : scheduledStartTime?.toIso8601String(),
        "seconds_remaining": secondsRemaining,
        "session_id": sessionId == null ? null : sessionId,
        "rtmp_preview": rtmpPreview,
        "recurring_event": recurringEvent?.toJson(),
        "chat": chat?.toJson(),
      };
}

class ClipToPlay {
  ClipToPlay({
    this.uri,
    this.name,
    this.description,
    this.type,
    this.link,
    this.duration,
    this.width,
    this.language,
    this.height,
    this.embed,
    this.createdTime,
    this.modifiedTime,
    this.releaseTime,
    this.contentRating,
    this.contentRatingClass,
    this.ratingModLocked,
    this.license,
    this.privacy,
    this.pictures,
    this.tags,
    this.stats,
    this.categories,
    this.uploader,
    this.metadata,
    this.manageLink,
    this.user,
    this.parentFolder,
    this.lastUserActionEventDate,
    this.reviewPage,
    this.app,
    this.status,
    this.resourceKey,
    this.live,
    this.upload,
    this.transcode,
    this.isPlayable,
    this.hasAudio,
  });

  String? uri;
  String? name;
  String? description;
  ClipToPlayType? type;
  String? link;
  int? duration;
  int? width;
  dynamic language;
  int? height;
  ClipToPlayEmbed? embed;
  DateTime? createdTime;
  DateTime? modifiedTime;
  DateTime? releaseTime;
  List<ContentRatingClass>? contentRating;
  ContentRatingClass? contentRatingClass;
  bool? ratingModLocked;
  dynamic license;
  Privacy? privacy;
  UserPictures? pictures;
  List<dynamic>? tags;
  Stats? stats;
  List<dynamic>? categories;
  Uploader? uploader;
  ClipToPlayMetadata? metadata;
  String? manageLink;
  DatumUser? user;
  dynamic parentFolder;
  DateTime? lastUserActionEventDate;
  ReviewPage? reviewPage;
  App? app;
  PreLiveVideoStatus? status;
  String? resourceKey;
  ClipToPlayLive? live;
  Upload? upload;
  Transcode? transcode;
  bool? isPlayable;
  bool? hasAudio;

  factory ClipToPlay.fromJson(Map<String, dynamic> json) => ClipToPlay(
        uri: json["uri"],
        name: json["name"],
        description: json["description"] == null ? null : json["description"],
        type: clipToPlayTypeValues.map[json["type"]],
        link: json["link"],
        duration: json["duration"],
        width: json["width"],
        language: json["language"],
        height: json["height"],
        embed: ClipToPlayEmbed.fromJson(json["embed"]),
        createdTime: DateTime.parse(json["created_time"]),
        modifiedTime: DateTime.parse(json["modified_time"]),
        releaseTime: DateTime.parse(json["release_time"]),
        contentRating: List<ContentRatingClass>.from(
            json["content_rating"].map((x) => contentRatingClassValues.map[x])),
        contentRatingClass:
            contentRatingClassValues.map[json["content_rating_class"]],
        ratingModLocked: json["rating_mod_locked"],
        license: json["license"],
        privacy: Privacy.fromJson(json["privacy"]),
        pictures: UserPictures.fromJson(json["pictures"]),
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        stats: Stats.fromJson(json["stats"]),
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        uploader: Uploader.fromJson(json["uploader"]),
        metadata: ClipToPlayMetadata.fromJson(json["metadata"]),
        manageLink: json["manage_link"],
        user: DatumUser.fromJson(json["user"]),
        parentFolder: json["parent_folder"],
        lastUserActionEventDate:
            DateTime.parse(json["last_user_action_event_date"]),
        reviewPage: ReviewPage.fromJson(json["review_page"]),
        app: App.fromJson(json["app"]),
        status: preLiveVideoStatusValues.map[json["status"]],
        resourceKey: json["resource_key"],
        live: ClipToPlayLive.fromJson(json["live"]),
        upload: Upload.fromJson(json["upload"]),
        transcode: Transcode.fromJson(json["transcode"]),
        isPlayable: json["is_playable"],
        hasAudio: json["has_audio"],
      );

  Map<String, dynamic> toJson() => {
        "uri": uri,
        "name": name,
        "description": description == null ? null : description,
        "type": clipToPlayTypeValues.reverse[type],
        "link": link,
        "duration": duration,
        "width": width,
        "language": language,
        "height": height,
        "embed": embed?.toJson(),
        "created_time": createdTime?.toIso8601String(),
        "modified_time": modifiedTime?.toIso8601String(),
        "release_time": releaseTime?.toIso8601String(),
        "content_rating": List<dynamic>.from(
            contentRating!.map((x) => contentRatingClassValues.reverse[x])),
        "content_rating_class":
            contentRatingClassValues.reverse[contentRatingClass],
        "rating_mod_locked": ratingModLocked,
        "license": license,
        "privacy": privacy?.toJson(),
        "pictures": pictures?.toJson(),
        "tags": List<dynamic>.from(tags!.map((x) => x)),
        "stats": stats?.toJson(),
        "categories": List<dynamic>.from(categories!.map((x) => x)),
        "uploader": uploader?.toJson(),
        "metadata": metadata?.toJson(),
        "manage_link": manageLink,
        "user": user?.toJson(),
        "parent_folder": parentFolder,
        "last_user_action_event_date":
            lastUserActionEventDate?.toIso8601String(),
        "review_page": reviewPage?.toJson(),
        "app": app?.toJson(),
        "status": preLiveVideoStatusValues.reverse[status],
        "resource_key": resourceKey,
        "live": live?.toJson(),
        "upload": upload?.toJson(),
        "transcode": transcode?.toJson(),
        "is_playable": isPlayable,
        "has_audio": hasAudio,
      };
}

class Datum {
  Datum({
    this.uri,
    this.link,
    this.createdTime,
    this.title,
    this.automaticallyTitleStream,
    this.streamTitle,
    this.streamDescription,
    this.rtmpLink,
    this.rtmpsLink,
    this.streamKey,
    this.streamPrivacy,
    this.streamPassword,
    this.timeZone,
    this.playlistSort,
    this.chatEnabled,
    this.unlimitedDuration,
    this.schedule,
    this.streamableClip,
    this.clipToPlay,
    this.nextOccurrenceTime,
    this.metadata,
    this.user,
    this.pictures,
    this.embed,
    this.liveDestinations,
    this.fromShowcase,
    this.album,
    this.liveClips,
    this.autoCcEnabled,
    this.autoCcKeywords,
    this.autoCcRemaining,
    this.autoCcLanguage,
    this.unlimitedAutoCc,
    this.lowLatency,
    this.fromPrivateToMeFolder,
  });

  String? uri;
  String? link;
  DateTime? createdTime;
  String? title;
  bool? automaticallyTitleStream;
  String? streamTitle;
  String? streamDescription;
  Link? rtmpLink;
  RtmpsLink? rtmpsLink;
  String? streamKey;
  StreamPrivacy? streamPrivacy;
  dynamic streamPassword;
  TimeZone? timeZone;
  PlaylistSort? playlistSort;
  bool? chatEnabled;
  bool? unlimitedDuration;
  Schedule? schedule;
  ClipToPlay? streamableClip;
  ClipToPlay? clipToPlay;
  DateTime? nextOccurrenceTime;
  DatumMetadata? metadata;
  DatumUser? user;
  UserPictures? pictures;
  DatumEmbed? embed;
  dynamic liveDestinations;
  bool? fromShowcase;
  dynamic album;
  List<LiveClip>? liveClips;
  int? autoCcEnabled;
  dynamic autoCcKeywords;
  int? autoCcRemaining;
  AutoCcLanguage? autoCcLanguage;
  bool? unlimitedAutoCc;
  bool? lowLatency;
  dynamic fromPrivateToMeFolder;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        uri: json["uri"],
        link: json["link"],
        createdTime: DateTime.parse(json["created_time"]),
        title: json["title"],
        automaticallyTitleStream: json["automatically_title_stream"],
        streamTitle: json["stream_title"],
        streamDescription: json["stream_description"] == null
            ? null
            : json["stream_description"],
        rtmpLink: linkValues.map[json["rtmp_link"]],
        rtmpsLink: rtmpsLinkValues.map[json["rtmps_link"]],
        streamKey: json["stream_key"],
        streamPrivacy: StreamPrivacy.fromJson(json["stream_privacy"]),
        streamPassword: json["stream_password"],
        timeZone: timeZoneValues.map[json["time_zone"]],
        playlistSort: json["playlist_sort"] == null
            ? null
            : playlistSortValues.map[json["playlist_sort"]],
        chatEnabled: json["chat_enabled"],
        unlimitedDuration: json["unlimited_duration"],
        schedule: json["schedule"] == null
            ? null
            : Schedule.fromJson(json["schedule"]),
        streamableClip: json["streamable_clip"] == null
            ? null
            : ClipToPlay.fromJson(json["streamable_clip"]),
        clipToPlay: json["clip_to_play"] == null
            ? null
            : ClipToPlay.fromJson(json["clip_to_play"]),
        nextOccurrenceTime: json["next_occurrence_time"] == null
            ? null
            : DateTime.parse(json["next_occurrence_time"]),
        metadata: DatumMetadata.fromJson(json["metadata"]),
        user: DatumUser.fromJson(json["user"]),
        pictures: UserPictures.fromJson(json["pictures"]),
        embed: DatumEmbed.fromJson(json["embed"]),
        liveDestinations: json["live_destinations"],
        fromShowcase: json["from_showcase"],
        album: json["album"],
        liveClips: List<LiveClip>.from(
            json["live_clips"].map((x) => LiveClip.fromJson(x))),
        autoCcEnabled: json["auto_cc_enabled"],
        autoCcKeywords: json["auto_cc_keywords"],
        autoCcRemaining: json["auto_cc_remaining"],
        autoCcLanguage: autoCcLanguageValues.map[json["auto_cc_language"]],
        unlimitedAutoCc: json["unlimited_auto_cc"],
        lowLatency: json["low_latency"],
        fromPrivateToMeFolder: json["from_private_to_me_folder"],
      );

  Map<String, dynamic> toJson() => {
        "uri": uri,
        "link": link,
        "created_time": createdTime?.toIso8601String(),
        "title": title,
        "automatically_title_stream": automaticallyTitleStream,
        "stream_title": streamTitle,
        "stream_description":
            streamDescription == null ? null : streamDescription,
        "rtmp_link": linkValues.reverse[rtmpLink],
        "rtmps_link": rtmpsLinkValues.reverse[rtmpsLink],
        "stream_key": streamKey,
        "stream_privacy": streamPrivacy?.toJson(),
        "stream_password": streamPassword,
        "time_zone": timeZoneValues.reverse[timeZone],
        "playlist_sort": playlistSort == null
            ? null
            : playlistSortValues.reverse[playlistSort],
        "chat_enabled": chatEnabled,
        "unlimited_duration": unlimitedDuration,
        "schedule": schedule == null ? null : schedule?.toJson(),
        "streamable_clip":
            streamableClip == null ? null : streamableClip?.toJson(),
        "clip_to_play": clipToPlay == null ? null : clipToPlay?.toJson(),
        "next_occurrence_time": nextOccurrenceTime == null
            ? null
            : nextOccurrenceTime?.toIso8601String(),
        "metadata": metadata?.toJson(),
        "user": user?.toJson(),
        "pictures": pictures?.toJson(),
        "embed": embed?.toJson(),
        "live_destinations": liveDestinations,
        "from_showcase": fromShowcase,
        "album": album,
        "live_clips": List<dynamic>.from(liveClips!.map((x) => x.toJson())),
        "auto_cc_enabled": autoCcEnabled,
        "auto_cc_keywords": autoCcKeywords,
        "auto_cc_remaining": autoCcRemaining,
        "auto_cc_language": autoCcLanguageValues.reverse[autoCcLanguage],
        "unlimited_auto_cc": unlimitedAutoCc,
        "low_latency": lowLatency,
        "from_private_to_me_folder": fromPrivateToMeFolder,
      };
}

class Chat {
  Chat({
    this.roomId,
    this.token,
    this.user,
  });

  int? roomId;
  String? token;
  ChatUser? user;

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        roomId: json["room_id"],
        token: json["token"],
        user: ChatUser.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "room_id": roomId,
        "token": token,
        "user": user?.toJson(),
      };
}

class ChatUser {
  ChatUser({
    this.uri,
    this.id,
    this.name,
    this.account,
    this.isStaff,
    this.isCreator,
    this.pictures,
    this.link,
  });

  UserUri? uri;
  int? id;
  UserName? name;
  Account? account;
  bool? isStaff;
  bool? isCreator;
  UserPictures? pictures;
  String? link;

  factory ChatUser.fromJson(Map<String, dynamic> json) => ChatUser(
        uri: userUriValues.map[json["uri"]],
        id: json["id"],
        name: userNameValues.map[json["name"]],
        account: accountValues.map[json["account"]],
        isStaff: json["is_staff"],
        isCreator: json["is_creator"],
        pictures: UserPictures.fromJson(json["pictures"]),
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "uri": userUriValues.reverse[uri],
        "id": id,
        "name": userNameValues.reverse[name],
        "account": accountValues.reverse[account],
        "is_staff": isStaff,
        "is_creator": isCreator,
        "pictures": pictures?.toJson(),
        "link": link,
      };
}

enum Account { ENTERPRISE }

final accountValues = EnumValues({"enterprise": Account.ENTERPRISE});

enum UserName { DIE_FRIEDLICHE_GEBURT }

final userNameValues =
    EnumValues({"Die Friedliche Geburt": UserName.DIE_FRIEDLICHE_GEBURT});

class UserPictures {
  UserPictures({
    this.uri,
    this.active,
    this.type,
    this.baseLink,
    this.sizes,
    this.resourceKey,
    this.defaultPicture,
  });

  String? uri;
  bool? active;
  PicturesType? type;
  String? baseLink;
  List<Size>? sizes;
  String? resourceKey;
  bool? defaultPicture;

  factory UserPictures.fromJson(Map<String, dynamic> json) => UserPictures(
        uri: json["uri"] == null ? null : json["uri"],
        active: json["active"],
        type: picturesTypeValues.map[json["type"]],
        baseLink: json["base_link"],
        sizes: List<Size>.from(json["sizes"].map((x) => Size.fromJson(x))),
        resourceKey: json["resource_key"],
        defaultPicture: json["default_picture"],
      );

  Map<String, dynamic> toJson() => {
        "uri": uri == null ? null : uri,
        "active": active,
        "type": picturesTypeValues.reverse[type],
        "base_link": baseLink,
        "sizes": List<dynamic>.from(sizes!.map((x) => x.toJson())),
        "resource_key": resourceKey,
        "default_picture": defaultPicture,
      };
}

class Size {
  Size({
    this.width,
    this.height,
    this.link,
    this.linkWithPlayButton,
  });

  int? width;
  int? height;
  String? link;
  String? linkWithPlayButton;

  factory Size.fromJson(Map<String, dynamic> json) => Size(
        width: json["width"],
        height: json["height"],
        link: json["link"],
        linkWithPlayButton: json["link_with_play_button"] == null
            ? null
            : json["link_with_play_button"],
      );

  Map<String?, dynamic> toJson() => {
        "width": width,
        "height": height,
        "link": link,
        "link_with_play_button":
            linkWithPlayButton == null ? null : linkWithPlayButton,
      };
}

enum PicturesType { CUSTOM, DEFAULT }

final picturesTypeValues = EnumValues(
    {"custom": PicturesType.CUSTOM, "default": PicturesType.DEFAULT});

enum UserUri { USERS_89681631 }

final userUriValues = EnumValues({"/users/89681631": UserUri.USERS_89681631});

enum Link { RTMP_RTMP_GLOBAL_CLOUD_VIMEO_COM_LIVE }

final linkValues = EnumValues({
  "rtmp://rtmp-global.cloud.vimeo.com/live":
      Link.RTMP_RTMP_GLOBAL_CLOUD_VIMEO_COM_LIVE
});

enum RtmpsLink { RTMPS_RTMP_GLOBAL_CLOUD_VIMEO_COM_443_LIVE }

final rtmpsLinkValues = EnumValues({
  "rtmps://rtmp-global.cloud.vimeo.com:443/live":
      RtmpsLink.RTMPS_RTMP_GLOBAL_CLOUD_VIMEO_COM_443_LIVE
});

enum LiveStatus { UNAVAILABLE, DONE }

final liveStatusValues = EnumValues(
    {"done": LiveStatus.DONE, "unavailable": LiveStatus.UNAVAILABLE});

class App {
  App({
    this.name,
    this.uri,
  });

  AppName? name;
  AppUri? uri;

  factory App.fromJson(Map<String, dynamic> json) => App(
        name: appNameValues.map[json["name"]],
        uri: appUriValues.map[json["uri"]],
      );

  Map<String, dynamic> toJson() => {
        "name": appNameValues.reverse[name],
        "uri": appUriValues.reverse[uri],
      };
}

enum AppName { VIMEO_LIVE }

final appNameValues = EnumValues({"Vimeo Live": AppName.VIMEO_LIVE});

enum AppUri { APPS_101940 }

final appUriValues = EnumValues({"/apps/101940": AppUri.APPS_101940});

enum ContentRatingClass {
  UNRATED,
  LANGUAGE,
  DRUGS,
  VIOLENCE,
  NUDITY,
  ADVERTISEMENT,
  SAFE
}

final contentRatingClassValues = EnumValues({
  "advertisement": ContentRatingClass.ADVERTISEMENT,
  "drugs": ContentRatingClass.DRUGS,
  "language": ContentRatingClass.LANGUAGE,
  "nudity": ContentRatingClass.NUDITY,
  "safe": ContentRatingClass.SAFE,
  "unrated": ContentRatingClass.UNRATED,
  "violence": ContentRatingClass.VIOLENCE
});

class ClipToPlayEmbed {
  ClipToPlayEmbed({
    this.buttons,
    this.logos,
    this.title,
    this.endScreen,
    this.playbar,
    this.volume,
    this.speed,
    this.color,
    this.eventSchedule,
    this.uri,
    this.html,
    this.badges,
  });

  Buttons? buttons;
  Logos? logos;
  Title? title;
  EndScreen? endScreen;
  bool? playbar;
  bool? volume;
  bool? speed;
  PurpleColor? color;
  bool? eventSchedule;
  EmbedUri? uri;
  String? html;
  Badges? badges;

  factory ClipToPlayEmbed.fromJson(Map<String, dynamic> json) =>
      ClipToPlayEmbed(
        buttons: Buttons.fromJson(json["buttons"]),
        logos: Logos.fromJson(json["logos"]),
        title: Title.fromJson(json["title"]),
        endScreen: EndScreen.fromJson(json["end_screen"]),
        playbar: json["playbar"],
        volume: json["volume"],
        speed: json["speed"],
        color: purpleColorValues.map[json["color"]],
        eventSchedule: json["event_schedule"],
        uri: json["uri"] == null ? null : embedUriValues.map[json["uri"]],
        html: json["html"],
        badges: Badges.fromJson(json["badges"]),
      );

  Map<String, dynamic> toJson() => {
        "buttons": buttons?.toJson(),
        "logos": logos?.toJson(),
        "title": title?.toJson(),
        "end_screen": endScreen?.toJson(),
        "playbar": playbar,
        "volume": volume,
        "speed": speed,
        "color": purpleColorValues.reverse[color],
        "event_schedule": eventSchedule,
        "uri": uri == null ? null : embedUriValues.reverse[uri],
        "html": html,
        "badges": badges?.toJson(),
      };
}

class Badges {
  Badges({
    this.hdr,
    this.live,
    this.staffPick,
    this.vod,
    this.weekendChallenge,
  });

  bool? hdr;
  BadgesLive? live;
  StaffPick? staffPick;
  bool? vod;
  bool? weekendChallenge;

  factory Badges.fromJson(Map<String, dynamic> json) => Badges(
        hdr: json["hdr"],
        live: BadgesLive.fromJson(json["live"]),
        staffPick: StaffPick.fromJson(json["staff_pick"]),
        vod: json["vod"],
        weekendChallenge: json["weekend_challenge"],
      );

  Map<String, dynamic> toJson() => {
        "hdr": hdr,
        "live": live?.toJson(),
        "staff_pick": staffPick?.toJson(),
        "vod": vod,
        "weekend_challenge": weekendChallenge,
      };
}

class BadgesLive {
  BadgesLive({
    this.streaming,
    this.archived,
  });

  bool? streaming;
  bool? archived;

  factory BadgesLive.fromJson(Map<String, dynamic> json) => BadgesLive(
        streaming: json["streaming"],
        archived: json["archived"],
      );

  Map<String, dynamic> toJson() => {
        "streaming": streaming,
        "archived": archived,
      };
}

class StaffPick {
  StaffPick({
    this.normal,
    this.bestOfTheMonth,
    this.bestOfTheYear,
    this.premiere,
  });

  bool? normal;
  bool? bestOfTheMonth;
  bool? bestOfTheYear;
  bool? premiere;

  factory StaffPick.fromJson(Map<String, dynamic> json) => StaffPick(
        normal: json["normal"],
        bestOfTheMonth: json["best_of_the_month"],
        bestOfTheYear: json["best_of_the_year"],
        premiere: json["premiere"],
      );

  Map<String, dynamic> toJson() => {
        "normal": normal,
        "best_of_the_month": bestOfTheMonth,
        "best_of_the_year": bestOfTheYear,
        "premiere": premiere,
      };
}

class Buttons {
  Buttons({
    this.like,
    this.watchlater,
    this.share,
    this.embed,
    this.hd,
    this.fullscreen,
    this.scaling,
  });

  bool? like;
  bool? watchlater;
  bool? share;
  bool? embed;
  bool? hd;
  bool? fullscreen;
  bool? scaling;

  factory Buttons.fromJson(Map<String, dynamic> json) => Buttons(
        like: json["like"],
        watchlater: json["watchlater"],
        share: json["share"],
        embed: json["embed"],
        hd: json["hd"],
        fullscreen: json["fullscreen"],
        scaling: json["scaling"],
      );

  Map<String, dynamic> toJson() => {
        "like": like,
        "watchlater": watchlater,
        "share": share,
        "embed": embed,
        "hd": hd,
        "fullscreen": fullscreen,
        "scaling": scaling,
      };
}

enum PurpleColor { B07_B8_B, FFFCEC }

final purpleColorValues =
    EnumValues({"b07b8b": PurpleColor.B07_B8_B, "fffcec": PurpleColor.FFFCEC});

class EndScreen {
  EndScreen({
    this.type,
  });

  EndScreenType? type;

  factory EndScreen.fromJson(Map<String, dynamic> json) => EndScreen(
        type: endScreenTypeValues.map[json["type"]],
      );

  Map<String, dynamic> toJson() => {
        "type": endScreenTypeValues.reverse[type],
      };
}

enum EndScreenType { THUMBNAIL, EMPTY }

final endScreenTypeValues = EnumValues(
    {"empty": EndScreenType.EMPTY, "thumbnail": EndScreenType.THUMBNAIL});

class Logos {
  Logos({
    this.vimeo,
    this.custom,
  });

  bool? vimeo;
  Custom? custom;

  factory Logos.fromJson(Map<String, dynamic> json) => Logos(
        vimeo: json["vimeo"],
        custom: Custom.fromJson(json["custom"]),
      );

  Map<String, dynamic> toJson() => {
        "vimeo": vimeo,
        "custom": custom?.toJson(),
      };
}

class Custom {
  Custom({
    this.active,
    this.url,
    this.link,
    this.sticky,
    this.useLink,
  });

  bool? active;
  String? url;
  dynamic link;
  bool? sticky;
  bool? useLink;

  factory Custom.fromJson(Map<String, dynamic> json) => Custom(
        active: json["active"],
        url: json["url"] == null ? null : json["url"],
        link: json["link"],
        sticky: json["sticky"],
        useLink: json["use_link"] == null ? null : json["use_link"],
      );

  Map<String, dynamic> toJson() => {
        "active": active,
        "url": url == null ? null : url,
        "link": link,
        "sticky": sticky,
        "use_link": useLink == null ? null : useLink,
      };
}

class Title {
  Title({
    this.name,
    this.owner,
    this.portrait,
  });

  OwnerEnum? name;
  OwnerEnum? owner;
  OwnerEnum? portrait;

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        name: ownerEnumValues.map[json["name"]],
        owner: ownerEnumValues.map[json["owner"]],
        portrait: ownerEnumValues.map[json["portrait"]],
      );

  Map<String, dynamic> toJson() => {
        "name": ownerEnumValues.reverse[name],
        "owner": ownerEnumValues.reverse[owner],
        "portrait": ownerEnumValues.reverse[portrait],
      };
}

enum OwnerEnum { HIDE }

final ownerEnumValues = EnumValues({"hide": OwnerEnum.HIDE});

enum EmbedUri { PRESETS_120774155, PRESETS_120696561 }

final embedUriValues = EnumValues({
  "/presets/120696561": EmbedUri.PRESETS_120696561,
  "/presets/120774155": EmbedUri.PRESETS_120774155
});

class ClipToPlayMetadata {
  ClipToPlayMetadata({
    this.connections,
    this.interactions,
    this.isVimeoCreate,
    this.isScreenRecord,
  });

  PurpleConnections? connections;
  PurpleInteractions? interactions;
  bool? isVimeoCreate;
  bool? isScreenRecord;

  factory ClipToPlayMetadata.fromJson(Map<String, dynamic> json) =>
      ClipToPlayMetadata(
        connections: PurpleConnections.fromJson(json["connections"]),
        interactions: PurpleInteractions.fromJson(json["interactions"]),
        isVimeoCreate: json["is_vimeo_create"],
        isScreenRecord: json["is_screen_record"],
      );

  Map<String, dynamic> toJson() => {
        "connections": connections?.toJson(),
        "interactions": interactions?.toJson(),
        "is_vimeo_create": isVimeoCreate,
        "is_screen_record": isScreenRecord,
      };
}

class PurpleConnections {
  PurpleConnections({
    this.comments,
    this.credits,
    this.likes,
    this.pictures,
    this.texttracks,
    this.related,
    this.recommendations,
    this.albums,
    this.availableAlbums,
    this.availableChannels,
    this.liveStats,
    this.versions,
  });

  AlbumsClass? comments;
  AlbumsClass? credits;
  AlbumsClass? likes;
  AlbumsClass? pictures;
  AlbumsClass? texttracks;
  ActivateClass? related;
  ActivateClass? recommendations;
  AlbumsClass? albums;
  AlbumsClass? availableAlbums;
  AlbumsClass? availableChannels;
  ActivateClass? liveStats;
  Versions? versions;

  factory PurpleConnections.fromJson(Map<String, dynamic> json) =>
      PurpleConnections(
        comments: AlbumsClass.fromJson(json["comments"]),
        credits: json["credits"] == null
            ? null
            : AlbumsClass.fromJson(json["credits"]),
        likes: AlbumsClass.fromJson(json["likes"]),
        pictures: AlbumsClass.fromJson(json["pictures"]),
        texttracks: AlbumsClass.fromJson(json["texttracks"]),
        related: ActivateClass.fromJson(json["related"]),
        recommendations: json["recommendations"] == null
            ? null
            : ActivateClass.fromJson(json["recommendations"]),
        albums: AlbumsClass.fromJson(json["albums"]),
        availableAlbums: AlbumsClass.fromJson(json["available_albums"]),
        availableChannels: json["available_channels"] == null
            ? null
            : AlbumsClass.fromJson(json["available_channels"]),
        liveStats: ActivateClass.fromJson(json["live_stats"]),
        versions: json["versions"] == null
            ? null
            : Versions.fromJson(json["versions"]),
      );

  Map<String, dynamic> toJson() => {
        "comments": comments?.toJson(),
        "credits": credits == null ? null : credits?.toJson(),
        "likes": likes?.toJson(),
        "pictures": pictures?.toJson(),
        "texttracks": texttracks?.toJson(),
        "related": related?.toJson(),
        "recommendations":
            recommendations == null ? null : recommendations?.toJson(),
        "albums": albums?.toJson(),
        "available_albums": availableAlbums?.toJson(),
        "available_channels":
            availableChannels == null ? null : availableChannels?.toJson(),
        "live_stats": liveStats?.toJson(),
        "versions": versions == null ? null : versions?.toJson(),
      };
}

class AlbumsClass {
  AlbumsClass({
    this.uri,
    this.options,
    this.total,
  });

  String? uri;
  List<PicturesOption>? options;
  int? total;

  factory AlbumsClass.fromJson(Map<String, dynamic> json) => AlbumsClass(
        uri: json["uri"],
        options: List<PicturesOption>.from(
            json["options"].map((x) => picturesOptionValues.map[x])),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "uri": uri,
        "options": List<dynamic>.from(
            options!.map((x) => picturesOptionValues.reverse[x])),
        "total": total,
      };
}

enum PicturesOption { GET, POST, DELETE, PATCH }

final picturesOptionValues = EnumValues({
  "DELETE": PicturesOption.DELETE,
  "GET": PicturesOption.GET,
  "PATCH": PicturesOption.PATCH,
  "POST": PicturesOption.POST
});

class ActivateClass {
  ActivateClass({
    this.uri,
    this.options,
  });

  String? uri;
  List<PicturesOption>? options;

  factory ActivateClass.fromJson(Map<String, dynamic> json) => ActivateClass(
        uri: json["uri"],
        options: List<PicturesOption>.from(
            json["options"].map((x) => picturesOptionValues.map[x])),
      );

  Map<String, dynamic> toJson() => {
        "uri": uri,
        "options": List<dynamic>.from(
            options!.map((x) => picturesOptionValues.reverse[x])),
      };
}

class Versions {
  Versions({
    this.uri,
    this.options,
    this.total,
    this.currentUri,
    this.resourceKey,
  });

  String? uri;
  List<PicturesOption>? options;
  int? total;
  String? currentUri;
  String? resourceKey;

  factory Versions.fromJson(Map<String, dynamic> json) => Versions(
        uri: json["uri"],
        options: List<PicturesOption>.from(
            json["options"].map((x) => picturesOptionValues.map[x])),
        total: json["total"],
        currentUri: json["current_uri"],
        resourceKey: json["resource_key"],
      );

  Map<String, dynamic> toJson() => {
        "uri": uri,
        "options": List<dynamic>.from(
            options!.map((x) => picturesOptionValues.reverse[x])),
        "total": total,
        "current_uri": currentUri,
        "resource_key": resourceKey,
      };
}

class PurpleInteractions {
  PurpleInteractions({
    this.watchlater,
    this.report,
    this.viewTeamMembers,
    this.edit,
    this.editContentRating,
    this.editPrivacy,
    this.delete,
    this.canUpdatePrivacyToPublic,
    this.trim,
  });

  Watchlater? watchlater;
  Report? report;
  ActivateClass? viewTeamMembers;
  ActivateClass? edit;
  EditContentRating? editContentRating;
  EditPrivacy? editPrivacy;
  ActivateClass? delete;
  ActivateClass? canUpdatePrivacyToPublic;
  ActivateClass? trim;

  factory PurpleInteractions.fromJson(Map<String, dynamic> json) =>
      PurpleInteractions(
        watchlater: Watchlater.fromJson(json["watchlater"]),
        report: Report.fromJson(json["report"]),
        viewTeamMembers: ActivateClass.fromJson(json["view_team_members"]),
        edit: ActivateClass.fromJson(json["edit"]),
        editContentRating:
            EditContentRating.fromJson(json["edit_content_rating"]),
        editPrivacy: EditPrivacy.fromJson(json["edit_privacy"]),
        delete: ActivateClass.fromJson(json["delete"]),
        canUpdatePrivacyToPublic:
            ActivateClass.fromJson(json["can_update_privacy_to_public"]),
        trim: ActivateClass.fromJson(json["trim"]),
      );

  Map<String, dynamic> toJson() => {
        "watchlater": watchlater?.toJson(),
        "report": report?.toJson(),
        "view_team_members": viewTeamMembers?.toJson(),
        "edit": edit?.toJson(),
        "edit_content_rating": editContentRating?.toJson(),
        "edit_privacy": editPrivacy?.toJson(),
        "delete": delete?.toJson(),
        "can_update_privacy_to_public": canUpdatePrivacyToPublic?.toJson(),
        "trim": trim?.toJson(),
      };
}

class EditContentRating {
  EditContentRating({
    this.uri,
    this.options,
    this.contentRating,
  });

  String? uri;
  List<PicturesOption>? options;
  List<ContentRatingClass>? contentRating;

  factory EditContentRating.fromJson(Map<String, dynamic> json) =>
      EditContentRating(
        uri: json["uri"],
        options: List<PicturesOption>.from(
            json["options"].map((x) => picturesOptionValues.map[x])),
        contentRating: List<ContentRatingClass>.from(
            json["content_rating"].map((x) => contentRatingClassValues.map[x])),
      );

  Map<String, dynamic> toJson() => {
        "uri": uri,
        "options": List<dynamic>.from(
            options!.map((x) => picturesOptionValues.reverse[x])),
        "content_rating": List<dynamic>.from(
            contentRating!.map((x) => contentRatingClassValues.reverse[x])),
      };
}

class EditPrivacy {
  EditPrivacy({
    this.uri,
    this.options,
    this.contentType,
    this.properties,
  });

  String? uri;
  List<PicturesOption>? options;
  ContentType? contentType;
  List<Property>? properties;

  factory EditPrivacy.fromJson(Map<String, dynamic> json) => EditPrivacy(
        uri: json["uri"],
        options: List<PicturesOption>.from(
            json["options"].map((x) => picturesOptionValues.map[x])),
        contentType: contentTypeValues.map[json["content_type"]],
        properties: List<Property>.from(
            json["properties"].map((x) => Property.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uri": uri,
        "options": List<dynamic>.from(
            options!.map((x) => picturesOptionValues.reverse[x])),
        "content_type": contentTypeValues.reverse[contentType],
        "properties": List<dynamic>.from(properties!.map((x) => x.toJson())),
      };
}

enum ContentType { APPLICATION_VND_VIMEO_VIDEO }

final contentTypeValues = EnumValues(
    {"application/vnd.vimeo.video": ContentType.APPLICATION_VND_VIMEO_VIDEO});

class Property {
  Property({
    this.name,
    this.required,
    this.options,
  });

  PropertyName? name;
  bool? required;
  List<View>? options;

  factory Property.fromJson(Map<String, dynamic> json) => Property(
        name: propertyNameValues.map[json["name"]],
        required: json["required"],
        options: List<View>.from(json["options"].map((x) => viewValues.map[x])),
      );

  Map<String, dynamic> toJson() => {
        "name": propertyNameValues.reverse[name],
        "required": required,
        "options":
            List<dynamic>.from(options!.map((x) => viewValues.reverse[x])),
      };
}

enum PropertyName { PRIVACY_VIEW }

final propertyNameValues =
    EnumValues({"privacy.view": PropertyName.PRIVACY_VIEW});

enum View { ANYBODY, NOBODY, PASSWORD, DISABLE, UNLISTED }

final viewValues = EnumValues({
  "anybody": View.ANYBODY,
  "disable": View.DISABLE,
  "nobody": View.NOBODY,
  "password": View.PASSWORD,
  "unlisted": View.UNLISTED
});

class Report {
  Report({
    this.uri,
    this.options,
    this.reason,
  });

  String? uri;
  List<PicturesOption>? options;
  List<Reason>? reason;

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        uri: json["uri"],
        options: List<PicturesOption>.from(
            json["options"].map((x) => picturesOptionValues.map[x])),
        reason:
            List<Reason>.from(json["reason"].map((x) => reasonValues.map[x])),
      );

  Map<String, dynamic> toJson() => {
        "uri": uri,
        "options": List<dynamic>.from(
            options!.map((x) => picturesOptionValues.reverse[x])),
        "reason":
            List<dynamic>.from(reason!.map((x) => reasonValues.reverse[x])),
      };
}

enum Reason {
  PORNOGRAPHIC,
  HARASSMENT,
  RIPOFF,
  INCORRECT_RATING,
  SPAM,
  CAUSES_HARM,
  CSAM
}

final reasonValues = EnumValues({
  "causes harm": Reason.CAUSES_HARM,
  "csam": Reason.CSAM,
  "harassment": Reason.HARASSMENT,
  "incorrect rating": Reason.INCORRECT_RATING,
  "pornographic": Reason.PORNOGRAPHIC,
  "ripoff": Reason.RIPOFF,
  "spam": Reason.SPAM
});

class Watchlater {
  Watchlater({
    this.uri,
    this.options,
    this.added,
    this.addedTime,
  });

  String? uri;
  List<PurpleOption>? options;
  bool? added;
  dynamic addedTime;

  factory Watchlater.fromJson(Map<String, dynamic> json) => Watchlater(
        uri: json["uri"],
        options: List<PurpleOption>.from(
            json["options"].map((x) => purpleOptionValues.map[x])),
        added: json["added"],
        addedTime: json["added_time"],
      );

  Map<String, dynamic> toJson() => {
        "uri": uri,
        "options": List<dynamic>.from(
            options!.map((x) => purpleOptionValues.reverse[x])),
        "added": added,
        "added_time": addedTime,
      };
}

enum PurpleOption { GET, PUT, DELETE }

final purpleOptionValues = EnumValues({
  "DELETE": PurpleOption.DELETE,
  "GET": PurpleOption.GET,
  "PUT": PurpleOption.PUT
});

class Privacy {
  Privacy({
    this.view,
    this.comments,
    this.embed,
    this.download,
    this.add,
  });

  View? view;
  View? comments;
  EmbedEnum? embed;
  bool? download;
  bool? add;

  factory Privacy.fromJson(Map<String, dynamic> json) => Privacy(
        view: viewValues.map[json["view"]],
        comments: viewValues.map[json["comments"]],
        embed: embedEnumValues.map[json["embed"]],
        download: json["download"],
        add: json["add"],
      );

  Map<String, dynamic> toJson() => {
        "view": viewValues.reverse[view],
        "comments": viewValues.reverse[comments],
        "embed": embedEnumValues.reverse[embed],
        "download": download,
        "add": add,
      };
}

enum EmbedEnum { PUBLIC }

final embedEnumValues = EnumValues({"public": EmbedEnum.PUBLIC});

class ReviewPage {
  ReviewPage({
    this.active,
    this.link,
  });

  bool? active;
  String? link;

  factory ReviewPage.fromJson(Map<String, dynamic> json) => ReviewPage(
        active: json["active"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "active": active,
        "link": link,
      };
}

class Stats {
  Stats({
    this.plays,
  });

  int? plays;

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        plays: json["plays"],
      );

  Map<String, dynamic> toJson() => {
        "plays": plays,
      };
}

enum PreLiveVideoStatus { AVAILABLE, UNAVAILABLE }

final preLiveVideoStatusValues = EnumValues({
  "available": PreLiveVideoStatus.AVAILABLE,
  "unavailable": PreLiveVideoStatus.UNAVAILABLE
});

class Transcode {
  Transcode({
    this.status,
  });

  TranscodeStatus? status;

  factory Transcode.fromJson(Map<String, dynamic> json) => Transcode(
        status: transcodeStatusValues.map[json["status"]],
      );

  Map<String, dynamic> toJson() => {
        "status": transcodeStatusValues.reverse[status],
      };
}

enum TranscodeStatus { IN_PROGRESS, COMPLETE }

final transcodeStatusValues = EnumValues({
  "complete": TranscodeStatus.COMPLETE,
  "in_progress": TranscodeStatus.IN_PROGRESS
});

enum ClipToPlayType { LIVE }

final clipToPlayTypeValues = EnumValues({"live": ClipToPlayType.LIVE});

class Upload {
  Upload({
    this.status,
    this.link,
    this.uploadLink,
    this.completeUri,
    this.form,
    this.approach,
    this.size,
    this.redirectUrl,
  });

  dynamic status;
  dynamic link;
  dynamic uploadLink;
  dynamic completeUri;
  dynamic form;
  dynamic approach;
  dynamic size;
  dynamic redirectUrl;

  factory Upload.fromJson(Map<String, dynamic> json) => Upload(
        status: json["status"],
        link: json["link"],
        uploadLink: json["upload_link"],
        completeUri: json["complete_uri"],
        form: json["form"],
        approach: json["approach"],
        size: json["size"],
        redirectUrl: json["redirect_url"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "link": link,
        "upload_link": uploadLink,
        "complete_uri": completeUri,
        "form": form,
        "approach": approach,
        "size": size,
        "redirect_url": redirectUrl,
      };
}

class Uploader {
  Uploader({
    this.pictures,
  });

  UserPictures? pictures;

  factory Uploader.fromJson(Map<String, dynamic> json) => Uploader(
        pictures: UserPictures.fromJson(json["pictures"]),
      );

  Map<String, dynamic> toJson() => {
        "pictures": pictures?.toJson(),
      };
}

class DatumUser {
  DatumUser({
    this.uri,
    this.name,
    this.link,
    this.capabilities,
    this.location,
    this.gender,
    this.bio,
    this.shortBio,
    this.createdTime,
    this.pictures,
    this.websites,
    this.metadata,
    this.locationDetails,
    this.skills,
    this.availableForHire,
    this.canWorkRemotely,
    this.preferences,
    this.contentFilter,
    this.liveQuota,
    this.resourceKey,
    this.account,
  });

  UserUri? uri;
  UserName? name;
  String? link;
  Capabilities? capabilities;
  Location? location;
  Gender? gender;
  dynamic bio;
  dynamic shortBio;
  DateTime? createdTime;
  UserPictures? pictures;
  List<Website>? websites;
  UserMetadata? metadata;
  LocationDetails? locationDetails;
  List<dynamic>? skills;
  bool? availableForHire;
  bool? canWorkRemotely;
  Preferences? preferences;
  List<ContentRatingClass>? contentFilter;
  LiveQuota? liveQuota;
  ResourceKey? resourceKey;
  Account? account;

  factory DatumUser.fromJson(Map<String, dynamic> json) => DatumUser(
        uri: userUriValues.map[json["uri"]],
        name: userNameValues.map[json["name"]],
        link: json["link"],
        capabilities: Capabilities.fromJson(json["capabilities"]),
        location: locationValues.map[json["location"]],
        gender: genderValues.map[json["gender"]],
        bio: json["bio"],
        shortBio: json["short_bio"],
        createdTime: DateTime.parse(json["created_time"]),
        pictures: UserPictures.fromJson(json["pictures"]),
        websites: List<Website>.from(
            json["websites"].map((x) => Website.fromJson(x))),
        metadata: UserMetadata.fromJson(json["metadata"]),
        locationDetails: LocationDetails.fromJson(json["location_details"]),
        skills: List<dynamic>.from(json["skills"].map((x) => x)),
        availableForHire: json["available_for_hire"],
        canWorkRemotely: json["can_work_remotely"],
        preferences: Preferences.fromJson(json["preferences"]),
        contentFilter: List<ContentRatingClass>.from(
            json["content_filter"].map((x) => contentRatingClassValues.map[x])),
        liveQuota: LiveQuota.fromJson(json["live_quota"]),
        resourceKey: resourceKeyValues.map[json["resource_key"]],
        account: accountValues.map[json["account"]],
      );

  Map<String, dynamic> toJson() => {
        "uri": userUriValues.reverse[uri],
        "name": userNameValues.reverse[name],
        "link": link,
        "capabilities": capabilities?.toJson(),
        "location": locationValues.reverse[location],
        "gender": genderValues.reverse[gender],
        "bio": bio,
        "short_bio": shortBio,
        "created_time": createdTime?.toIso8601String(),
        "pictures": pictures?.toJson(),
        "websites": List<dynamic>.from(websites!.map((x) => x.toJson())),
        "metadata": metadata?.toJson(),
        "location_details": locationDetails?.toJson(),
        "skills": List<dynamic>.from(skills!.map((x) => x)),
        "available_for_hire": availableForHire,
        "can_work_remotely": canWorkRemotely,
        "preferences": preferences?.toJson(),
        "content_filter": List<dynamic>.from(
            contentFilter!.map((x) => contentRatingClassValues.reverse[x])),
        "live_quota": liveQuota?.toJson(),
        "resource_key": resourceKeyValues.reverse[resourceKey],
        "account": accountValues.reverse[account],
      };
}

class Capabilities {
  Capabilities({
    this.hasLiveSubscription,
    this.hasEnterpriseLihp,
    this.hasSvvTimecodedComments,
  });

  bool? hasLiveSubscription;
  bool? hasEnterpriseLihp;
  bool? hasSvvTimecodedComments;

  factory Capabilities.fromJson(Map<String, dynamic> json) => Capabilities(
        hasLiveSubscription: json["hasLiveSubscription"],
        hasEnterpriseLihp: json["hasEnterpriseLihp"],
        hasSvvTimecodedComments: json["hasSvvTimecodedComments"],
      );

  Map<String, dynamic> toJson() => {
        "hasLiveSubscription": hasLiveSubscription,
        "hasEnterpriseLihp": hasEnterpriseLihp,
        "hasSvvTimecodedComments": hasSvvTimecodedComments,
      };
}

enum Gender { F }

final genderValues = EnumValues({"f": Gender.F});

class LiveQuota {
  LiveQuota({
    this.status,
    this.time,
    this.streams,
    this.studioSeats,
  });

  PreLiveVideoStatus? status;
  Time? time;
  Streams? streams;
  int? studioSeats;

  factory LiveQuota.fromJson(Map<String, dynamic> json) => LiveQuota(
        status: preLiveVideoStatusValues.map[json["status"]],
        time: Time.fromJson(json["time"]),
        streams: Streams.fromJson(json["streams"]),
        studioSeats: json["studio_seats"],
      );

  Map<String, dynamic> toJson() => {
        "status": preLiveVideoStatusValues.reverse[status],
        "time": time?.toJson(),
        "streams": streams?.toJson(),
        "studio_seats": studioSeats,
      };
}

class Streams {
  Streams({
    this.remaining,
    this.maximum,
  });

  int? remaining;
  int? maximum;

  factory Streams.fromJson(Map<String, dynamic> json) => Streams(
        remaining: json["remaining"],
        maximum: json["maximum"],
      );

  Map<String, dynamic> toJson() => {
        "remaining": remaining,
        "maximum": maximum,
      };
}

class Time {
  Time({
    this.monthlyRemaining,
    this.monthlyMaximum,
    this.eventMaximum,
  });

  double? monthlyRemaining;
  double? monthlyMaximum;
  int? eventMaximum;

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        monthlyRemaining: json["monthly_remaining"].toDouble(),
        monthlyMaximum: json["monthly_maximum"].toDouble(),
        eventMaximum: json["event_maximum"],
      );

  Map<String, dynamic> toJson() => {
        "monthly_remaining": monthlyRemaining,
        "monthly_maximum": monthlyMaximum,
        "event_maximum": eventMaximum,
      };
}

enum Location { BERLIN_DEUTSCHLAND }

final locationValues =
    EnumValues({"Berlin, Deutschland": Location.BERLIN_DEUTSCHLAND});

class LocationDetails {
  LocationDetails({
    this.formattedAddress,
    this.latitude,
    this.longitude,
    this.city,
    this.state,
    this.neighborhood,
    this.subLocality,
    this.stateIsoCode,
    this.country,
    this.countryIsoCode,
  });

  Location? formattedAddress;
  double? latitude;
  double? longitude;
  City? city;
  City? state;
  dynamic neighborhood;
  dynamic subLocality;
  dynamic stateIsoCode;
  Country? country;
  CountryIsoCode? countryIsoCode;

  factory LocationDetails.fromJson(Map<String, dynamic> json) =>
      LocationDetails(
        formattedAddress: locationValues.map[json["formatted_address"]],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        city: cityValues.map[json["city"]],
        state: cityValues.map[json["state"]],
        neighborhood: json["neighborhood"],
        subLocality: json["sub_locality"],
        stateIsoCode: json["state_iso_code"],
        country: countryValues.map[json["country"]],
        countryIsoCode: countryIsoCodeValues.map[json["country_iso_code"]],
      );

  Map<String, dynamic> toJson() => {
        "formatted_address": locationValues.reverse[formattedAddress],
        "latitude": latitude,
        "longitude": longitude,
        "city": cityValues.reverse[city],
        "state": cityValues.reverse[state],
        "neighborhood": neighborhood,
        "sub_locality": subLocality,
        "state_iso_code": stateIsoCode,
        "country": countryValues.reverse[country],
        "country_iso_code": countryIsoCodeValues.reverse[countryIsoCode],
      };
}

enum City { BERLIN }

final cityValues = EnumValues({"Berlin": City.BERLIN});

enum Country { DEUTSCHLAND }

final countryValues = EnumValues({"Deutschland": Country.DEUTSCHLAND});

enum CountryIsoCode { DE }

final countryIsoCodeValues = EnumValues({"DE": CountryIsoCode.DE});

class UserMetadata {
  UserMetadata({
    this.connections,
  });

  FluffyConnections? connections;

  factory UserMetadata.fromJson(Map<String, dynamic> json) => UserMetadata(
        connections: FluffyConnections.fromJson(json["connections"]),
      );

  Map<String, dynamic> toJson() => {
        "connections": connections?.toJson(),
      };
}

class FluffyConnections {
  FluffyConnections({
    this.albums,
    this.appearances,
    this.categories,
    this.channels,
    this.feed,
    this.followers,
    this.following,
    this.groups,
    this.likes,
    this.membership,
    this.moderatedChannels,
    this.portfolios,
    this.videos,
    this.watchlater,
    this.shared,
    this.pictures,
    this.watchedVideos,
    this.foldersRoot,
    this.folders,
    this.teams,
    this.permissionPolicies,
    this.block,
  });

  AlbumsClass? albums;
  AlbumsClass? appearances;
  AlbumsClass? categories;
  AlbumsClass? channels;
  ActivateClass? feed;
  AlbumsClass? followers;
  AlbumsClass? following;
  AlbumsClass? groups;
  AlbumsClass? likes;
  ActivateClass? membership;
  AlbumsClass? moderatedChannels;
  AlbumsClass? portfolios;
  AlbumsClass? videos;
  AlbumsClass? watchlater;
  AlbumsClass? shared;
  AlbumsClass? pictures;
  AlbumsClass? watchedVideos;
  ActivateClass? foldersRoot;
  AlbumsClass? folders;
  AlbumsClass? teams;
  AlbumsClass? permissionPolicies;
  AlbumsClass? block;

  factory FluffyConnections.fromJson(Map<String, dynamic> json) =>
      FluffyConnections(
        albums: AlbumsClass.fromJson(json["albums"]),
        appearances: AlbumsClass.fromJson(json["appearances"]),
        categories: AlbumsClass.fromJson(json["categories"]),
        channels: AlbumsClass.fromJson(json["channels"]),
        feed: ActivateClass.fromJson(json["feed"]),
        followers: AlbumsClass.fromJson(json["followers"]),
        following: AlbumsClass.fromJson(json["following"]),
        groups: AlbumsClass.fromJson(json["groups"]),
        likes: AlbumsClass.fromJson(json["likes"]),
        membership: ActivateClass.fromJson(json["membership"]),
        moderatedChannels: AlbumsClass.fromJson(json["moderated_channels"]),
        portfolios: AlbumsClass.fromJson(json["portfolios"]),
        videos: AlbumsClass.fromJson(json["videos"]),
        watchlater: AlbumsClass.fromJson(json["watchlater"]),
        shared: AlbumsClass.fromJson(json["shared"]),
        pictures: AlbumsClass.fromJson(json["pictures"]),
        watchedVideos: AlbumsClass.fromJson(json["watched_videos"]),
        foldersRoot: ActivateClass.fromJson(json["folders_root"]),
        folders: AlbumsClass.fromJson(json["folders"]),
        teams: AlbumsClass.fromJson(json["teams"]),
        permissionPolicies: AlbumsClass.fromJson(json["permission_policies"]),
        block: AlbumsClass.fromJson(json["block"]),
      );

  Map<String, dynamic> toJson() => {
        "albums": albums?.toJson(),
        "appearances": appearances?.toJson(),
        "categories": categories?.toJson(),
        "channels": channels?.toJson(),
        "feed": feed?.toJson(),
        "followers": followers?.toJson(),
        "following": following?.toJson(),
        "groups": groups?.toJson(),
        "likes": likes?.toJson(),
        "membership": membership?.toJson(),
        "moderated_channels": moderatedChannels?.toJson(),
        "portfolios": portfolios?.toJson(),
        "videos": videos?.toJson(),
        "watchlater": watchlater?.toJson(),
        "shared": shared?.toJson(),
        "pictures": pictures?.toJson(),
        "watched_videos": watchedVideos?.toJson(),
        "folders_root": foldersRoot?.toJson(),
        "folders": folders?.toJson(),
        "teams": teams?.toJson(),
        "permission_policies": permissionPolicies?.toJson(),
        "block": block?.toJson(),
      };
}

class Preferences {
  Preferences({
    this.videos,
  });

  PreferencesVideos? videos;

  factory Preferences.fromJson(Map<String, dynamic> json) => Preferences(
        videos: PreferencesVideos.fromJson(json["videos"]),
      );

  Map<String, dynamic> toJson() => {
        "videos": videos?.toJson(),
      };
}

class PreferencesVideos {
  PreferencesVideos({
    this.rating,
    this.privacy,
  });

  List<ContentRatingClass>? rating;
  Privacy? privacy;

  factory PreferencesVideos.fromJson(Map<String, dynamic> json) =>
      PreferencesVideos(
        rating: List<ContentRatingClass>.from(
            json["rating"].map((x) => contentRatingClassValues.map[x])),
        privacy: Privacy.fromJson(json["privacy"]),
      );

  Map<String, dynamic> toJson() => {
        "rating": List<dynamic>.from(
            rating!.map((x) => contentRatingClassValues.reverse[x])),
        "privacy": privacy?.toJson(),
      };
}

enum ResourceKey { THE_62_DA535_E021112_E5_CB28102_FA7_B504_BCD1_A470_C9 }

final resourceKeyValues = EnumValues({
  "62da535e021112e5cb28102fa7b504bcd1a470c9":
      ResourceKey.THE_62_DA535_E021112_E5_CB28102_FA7_B504_BCD1_A470_C9
});

class Website {
  Website({
    this.uri,
    this.name,
    this.link,
    this.type,
    this.description,
  });

  WebsiteUri? uri;
  UserName? name;
  String? link;
  WebsiteType? type;
  Description? description;

  factory Website.fromJson(Map<String, dynamic> json) => Website(
        uri: websiteUriValues.map[json["uri"]],
        name: userNameValues.map[json["name"]],
        link: json["link"],
        type: websiteTypeValues.map[json["type"]],
        description: descriptionValues.map[json["description"]],
      );

  Map<String, dynamic> toJson() => {
        "uri": websiteUriValues.reverse[uri],
        "name": userNameValues.reverse[name],
        "link": link,
        "type": websiteTypeValues.reverse[type],
        "description": descriptionValues.reverse[description],
      };
}

enum Description { POSITIVE_GEBURTSVORBEREITUNG }

final descriptionValues = EnumValues(
    {"Positive Geburtsvorbereitung": Description.POSITIVE_GEBURTSVORBEREITUNG});

enum WebsiteType { LINK }

final websiteTypeValues = EnumValues({"link": WebsiteType.LINK});

enum WebsiteUri { USERS_89681631_LINKS_6108908 }

final websiteUriValues = EnumValues(
    {"/users/89681631/links/6108908": WebsiteUri.USERS_89681631_LINKS_6108908});

enum AutoCcLanguage { EN_US }

final autoCcLanguageValues = EnumValues({"en-US": AutoCcLanguage.EN_US});

class DatumEmbed {
  DatumEmbed({
    this.logos,
    this.color,
    this.useColor,
    this.playlist,
    this.schedule,
    this.autoplay,
    this.loop,
    this.playbar,
    this.volume,
    this.fullscreenButton,
    this.likeButton,
    this.title,
    this.showLatestArchivedClip,
    this.eventSchedule,
    this.byline,
    this.portrait,
    this.hideViewerCount,
    this.html,
    this.responsiveHtml,
    this.embedProperties,
    this.availablePlayerLogos,
    this.chatEmbedCode,
    this.chatEmbedSource,
  });

  Logos? logos;
  FluffyColor? color;
  bool? useColor;
  bool? playlist;
  bool? schedule;
  bool? autoplay;
  bool? loop;
  bool? playbar;
  bool? volume;
  bool? fullscreenButton;
  bool? likeButton;
  bool? title;
  bool? showLatestArchivedClip;
  bool? eventSchedule;
  bool? byline;
  bool? portrait;
  bool? hideViewerCount;
  String? html;
  String? responsiveHtml;
  EmbedProperties? embedProperties;
  List<AvailablePlayerLogo>? availablePlayerLogos;
  String? chatEmbedCode;
  String? chatEmbedSource;

  factory DatumEmbed.fromJson(Map<String, dynamic> json) => DatumEmbed(
        logos: Logos.fromJson(json["logos"]),
        color: fluffyColorValues.map[json["color"]],
        useColor: json["use_color"],
        playlist: json["playlist"],
        schedule: json["schedule"],
        autoplay: json["autoplay"],
        loop: json["loop"],
        playbar: json["playbar"],
        volume: json["volume"],
        fullscreenButton: json["fullscreen_button"],
        likeButton: json["like_button"],
        title: json["title"],
        showLatestArchivedClip: json["show_latest_archived_clip"],
        eventSchedule: json["event_schedule"],
        byline: json["byline"],
        portrait: json["portrait"],
        hideViewerCount: json["hide_viewer_count"],
        html: json["html"],
        responsiveHtml: json["responsive_html"],
        embedProperties: EmbedProperties.fromJson(json["embed_properties"]),
        availablePlayerLogos: List<AvailablePlayerLogo>.from(
            json["available_player_logos"]
                .map((x) => AvailablePlayerLogo.fromJson(x))),
        chatEmbedCode: json["chat_embed_code"],
        chatEmbedSource: json["chat_embed_source"],
      );

  Map<String, dynamic> toJson() => {
        "logos": logos?.toJson(),
        "color": fluffyColorValues.reverse[color],
        "use_color": useColor,
        "playlist": playlist,
        "schedule": schedule,
        "autoplay": autoplay,
        "loop": loop,
        "playbar": playbar,
        "volume": volume,
        "fullscreen_button": fullscreenButton,
        "like_button": likeButton,
        "title": title,
        "show_latest_archived_clip": showLatestArchivedClip,
        "event_schedule": eventSchedule,
        "byline": byline,
        "portrait": portrait,
        "hide_viewer_count": hideViewerCount,
        "html": html,
        "responsive_html": responsiveHtml,
        "embed_properties": embedProperties?.toJson(),
        "available_player_logos":
            List<dynamic>.from(availablePlayerLogos!.map((x) => x.toJson())),
        "chat_embed_code": chatEmbedCode,
        "chat_embed_source": chatEmbedSource,
      };
}

class AvailablePlayerLogo {
  AvailablePlayerLogo({
    this.id,
    this.url,
  });

  int? id;
  String? url;

  factory AvailablePlayerLogo.fromJson(Map<String, dynamic> json) =>
      AvailablePlayerLogo(
        id: json["id"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
      };
}

enum FluffyColor { THE_00_ADEF }

final fluffyColorValues = EnumValues({"00adef": FluffyColor.THE_00_ADEF});

class EmbedProperties {
  EmbedProperties({
    this.height,
    this.width,
    this.sourceUrl,
  });

  int? height;
  int? width;
  String? sourceUrl;

  factory EmbedProperties.fromJson(Map<String, dynamic> json) =>
      EmbedProperties(
        height: json["height"],
        width: json["width"],
        sourceUrl: json["source_url"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "width": width,
        "source_url": sourceUrl,
      };
}

class LiveClip {
  LiveClip({
    this.clipId,
    this.streamingOn,
  });

  int? clipId;
  int? streamingOn;

  factory LiveClip.fromJson(Map<String, dynamic> json) => LiveClip(
        clipId: json["clip_id"],
        streamingOn: json["streaming_on"],
      );

  Map<String, dynamic> toJson() => {
        "clip_id": clipId,
        "streaming_on": streamingOn,
      };
}

class DatumMetadata {
  DatumMetadata({
    this.connections,
    this.interactions,
  });

  TentacledConnections? connections;
  FluffyInteractions? interactions;

  factory DatumMetadata.fromJson(Map<String, dynamic> json) => DatumMetadata(
        connections: TentacledConnections.fromJson(json["connections"]),
        interactions: FluffyInteractions.fromJson(json["interactions"]),
      );

  Map<String, dynamic> toJson() => {
        "connections": connections?.toJson(),
        "interactions": interactions?.toJson(),
      };
}

class TentacledConnections {
  TentacledConnections({
    this.pictures,
    this.videos,
    this.liveVideo,
    this.preLiveVideo,
    this.teamMember,
  });

  ActivateClass? pictures;
  AlbumsClass? videos;
  dynamic liveVideo;
  PreLiveVideo? preLiveVideo;
  dynamic teamMember;

  factory TentacledConnections.fromJson(Map<String, dynamic> json) =>
      TentacledConnections(
        pictures: ActivateClass.fromJson(json["pictures"]),
        videos: AlbumsClass.fromJson(json["videos"]),
        liveVideo: json["live_video"],
        preLiveVideo: json["pre_live_video"] == null
            ? null
            : PreLiveVideo.fromJson(json["pre_live_video"]),
        teamMember: json["team_member"],
      );

  Map<String, dynamic> toJson() => {
        "pictures": pictures?.toJson(),
        "videos": videos?.toJson(),
        "live_video": liveVideo,
        "pre_live_video": preLiveVideo == null ? null : preLiveVideo?.toJson(),
        "team_member": teamMember,
      };
}

class PreLiveVideo {
  PreLiveVideo({
    this.uri,
    this.options,
    this.status,
  });

  String? uri;
  List<PicturesOption>? options;
  PreLiveVideoStatus? status;

  factory PreLiveVideo.fromJson(Map<String, dynamic> json) => PreLiveVideo(
        uri: json["uri"],
        options: List<PicturesOption>.from(
            json["options"].map((x) => picturesOptionValues.map[x])),
        status: preLiveVideoStatusValues.map[json["status"]],
      );

  Map<String, dynamic> toJson() => {
        "uri": uri,
        "options": List<dynamic>.from(
            options!.map((x) => picturesOptionValues.reverse[x])),
        "status": preLiveVideoStatusValues.reverse[status],
      };
}

class FluffyInteractions {
  FluffyInteractions({
    this.delete,
    this.edit,
    this.activate,
  });

  ActivateClass? delete;
  ActivateClass? edit;
  ActivateClass? activate;

  factory FluffyInteractions.fromJson(Map<String, dynamic> json) =>
      FluffyInteractions(
        delete: ActivateClass.fromJson(json["delete"]),
        edit: ActivateClass.fromJson(json["edit"]),
        activate: ActivateClass.fromJson(json["activate"]),
      );

  Map<String, dynamic> toJson() => {
        "delete": delete?.toJson(),
        "edit": edit?.toJson(),
        "activate": activate?.toJson(),
      };
}

enum PlaylistSort { ADDED_FIRST }

final playlistSortValues =
    EnumValues({"added_first": PlaylistSort.ADDED_FIRST});

class Schedule {
  Schedule({
    this.type,
    this.startTime,
  });

  String? type;
  DateTime? startTime;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        type: json["type"],
        startTime: DateTime.parse(json["start_time"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "start_time": startTime?.toIso8601String(),
      };
}

class StreamPrivacy {
  StreamPrivacy({
    this.view,
    this.embed,
    this.unlistedHash,
  });

  View? view;
  EmbedEnum? embed;
  String? unlistedHash;

  factory StreamPrivacy.fromJson(Map<String, dynamic> json) => StreamPrivacy(
        view: viewValues.map[json["view"]],
        embed: embedEnumValues.map[json["embed"]],
        unlistedHash:
            json["unlisted_hash"] == null ? null : json["unlisted_hash"],
      );

  Map<String, dynamic> toJson() => {
        "view": viewValues.reverse[view],
        "embed": embedEnumValues.reverse[embed],
        "unlisted_hash": unlistedHash == null ? null : unlistedHash,
      };
}

enum TimeZone { UTC, EUROPE_BERLIN }

final timeZoneValues =
    EnumValues({"Europe/Berlin": TimeZone.EUROPE_BERLIN, "UTC": TimeZone.UTC});

class Paging {
  Paging({
    this.next,
    this.previous,
    this.first,
    this.last,
  });

  dynamic next;
  dynamic previous;
  String? first;
  String? last;

  factory Paging.fromJson(Map<String, dynamic> json) => Paging(
        next: json["next"],
        previous: json["previous"],
        first: json["first"],
        last: json["last"],
      );

  Map<String, dynamic> toJson() => {
        "next": next,
        "previous": previous,
        "first": first,
        "last": last,
      };
}

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
