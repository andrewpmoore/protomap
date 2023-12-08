// To parse this JSON data, do
//
//     final content = contentFromJson(jsonString);

import 'dart:convert';

List<Content> contentFromJson(String str) => List<Content>.from(json.decode(str).map((x) => Content.fromJson(x)));

String contentToJson(List<Content> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Content {
  Content({
    required this.id,
    this.title,
    this.subtitle,
    this.body,
    required this.locale,
    required this.publishedAt,
    required this.createdAt,
    required this.updatedAt,
    this.headerImage,
    this.contributors,
    this.localizations,
  });

  final int id;
  final String? title;
  final String? subtitle;
  final String? body;
  final String locale;
  final DateTime publishedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final RImage? headerImage;
  final List<Contributor>? contributors;
  final List<Localization>? localizations;

  Content copyWith({
    required int id,
    String? title,
    String? subtitle,
    String? body,
    required String locale,
    required DateTime publishedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    RImage? headerImage,
    List<Contributor>? contributors,
    List<Localization>? localizations,
  }) =>
      Content(
        id: id,
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        body: body ?? this.body,
        locale: locale,
        publishedAt: publishedAt,
        createdAt: createdAt,
        updatedAt: updatedAt,
        headerImage: headerImage ?? this.headerImage,
        contributors: contributors ?? this.contributors,
        localizations: localizations ?? this.localizations,
      );

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    subtitle: json["subtitle"] == null ? null : json["subtitle"],
    body: json["body"] == null ? null : json["body"],
    locale: json["locale"] == null ? null : json["locale"],
    publishedAt: DateTime.parse(json["published_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    headerImage: json["header_image"] == null ? null : RImage.fromJson(json["header_image"]),
    contributors: json["contributors"] == null ? null : List<Contributor>.from(json["contributors"].map((x) => Contributor.fromJson(x))),
    localizations: json["localizations"] == null ? null : List<Localization>.from(json["localizations"].map((x) => Localization.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title == null ? null : title,
    "subtitle": subtitle == null ? null : subtitle,
    "body": body == null ? null : body,
    "locale": locale,
    "published_at": publishedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "header_image": headerImage == null ? null : headerImage!.toJson(),
    "contributors": contributors == null ? null : List<dynamic>.from(contributors!.map((x) => x.toJson())),
    "localizations": localizations == null ? null : List<dynamic>.from(localizations!.map((x) => x.toJson())),
  };
}

class Contributor {
  Contributor({
    required this.id,
    required this.name,
    required this.email,
    this.bio,
    required this.publishedAt,
    required this.createdAt,
    required this.updatedAt,
    this.avatarImage,
  });

  final int id;
  final String name;
  final String email;
  final String? bio;
  final DateTime publishedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<RImage>? avatarImage;

  Contributor copyWith({
    required int id,
    required String name,
    required String email,
    String? bio,
    required DateTime publishedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    List<RImage>? avatarImage,
  }) =>
      Contributor(
        id: id,
        name: name,
        email: email,
        bio: bio ?? this.bio,
        publishedAt: publishedAt,
        createdAt: createdAt,
        updatedAt: updatedAt,
        avatarImage: avatarImage ?? this.avatarImage,
      );

  factory Contributor.fromJson(Map<String, dynamic> json) => Contributor(
    id: json["id"] == null ? null : json["id"],
    name: json["Name"] == null ? null : json["Name"],
    email: json["email"] == null ? null : json["email"],
    bio: json["bio"] == null ? null : json["bio"],
    publishedAt: DateTime.parse(json["published_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    avatarImage: json["avatar_image"] == null ? null : List<RImage>.from(json["avatar_image"].map((x) => RImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "Name": name,
    "email": email,
    "bio": bio == null ? null : bio,
    "published_at": publishedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "avatar_image": avatarImage == null ? null : List<dynamic>.from(avatarImage!.map((x) => x.toJson())),
  };
}

class RImage {
  RImage({
    required this.id,
    this.name,
    this.alternativeText,
    this.caption,
    required this.width,
    required this.height,
    required this.formats,
    required this.hash,
    required this.ext,
    required this.mime,
    required this.size,
    required this.url,
    this.previewUrl,
    required this.provider,
    this.providerMetadata,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String? name;
  final String? alternativeText;
  final String? caption;
  final int width;
  final int height;
  final Formats formats;
  final String hash;
  final String ext;
  final String mime;
  final double size;
  final String url;
  final dynamic previewUrl;
  final String provider;
  final dynamic providerMetadata;
  final DateTime createdAt;
  final DateTime updatedAt;

  RImage copyWith({
    required int id,
    String? name,
    String? alternativeText,
    String? caption,
    required int width,
    required int height,
    required Formats formats,
    required String hash,
    required String ext,
    required String mime,
    required double size,
    required String url,
    required dynamic previewUrl,
    required String provider,
    required dynamic providerMetadata,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) =>
      RImage(
        id: id,
        name: name ?? this.name,
        alternativeText: alternativeText ?? this.alternativeText,
        caption: caption ?? this.caption,
        width: width,
        height: height,
        formats: formats,
        hash: hash,
        ext: ext,
        mime: mime,
        size: size,
        url: url,
        previewUrl: previewUrl ?? this.previewUrl,
        provider: provider,
        providerMetadata: providerMetadata ?? this.providerMetadata,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  factory RImage.fromJson(Map<String, dynamic> json) => RImage(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    alternativeText: json["alternativeText"] == null ? null : json["alternativeText"],
    caption: json["caption"] == null ? null : json["caption"],
    width: json["width"] == null ? null : json["width"],
    height: json["height"] == null ? null : json["height"],
    formats: Formats.fromJson(json["formats"]),
    hash: json["hash"] == null ? null : json["hash"],
    ext: json["ext"] == null ? null : json["ext"],
    mime: json["mime"] == null ? null : json["mime"],
    size: json["size"] == null ? null : json["size"].toDouble(),
    url: json["url"] == null ? null : json["url"],
    previewUrl: json["previewUrl"],
    provider: json["provider"] == null ? null : json["provider"],
    providerMetadata: json["provider_metadata"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name == null ? null : name,
    "alternativeText": alternativeText == null ? null : alternativeText,
    "caption": caption == null ? null : caption,
    "width": width,
    "height": height,
    "formats": formats.toJson(),
    "hash": hash,
    "ext": ext,
    "mime": mime,
    "size": size,
    "url": url,
    "previewUrl": previewUrl,
    "provider": provider,
    "provider_metadata": providerMetadata,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Formats {
  Formats({
    required this.thumbnail,
    required this.small,
  });

  final Small thumbnail;
  final Small small;

  Formats copyWith({
    required Small thumbnail,
    required Small small,
  }) =>
      Formats(
        thumbnail: thumbnail,
        small: small,
      );

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
    thumbnail: Small.fromJson(json["thumbnail"]),
    small: Small.fromJson(json["small"]),
  );

  Map<String, dynamic> toJson() => {
    "thumbnail": thumbnail.toJson(),
    "small": small.toJson(),
  };
}

class Small {
  Small({
    required this.name,
    required     this.hash,
    required this.ext,
    required this.mime,
    required this.width,
    required this.height,
    required this.size,
    required this.path,
    required this.url,
  });

  final String name;
  final String hash;
  final String ext;
  final String mime;
  final int width;
  final int height;
  final double size;
  final dynamic path;
  final String url;

  Small copyWith({
    required String name,
    required String hash,
    required String ext,
    required String mime,
    required int width,
    required int height,
    required double size,
    required dynamic path,
    required String url,
  }) =>
      Small(
        name: name,
        hash: hash,
        ext: ext,
        mime: mime,
        width: width,
        height: height,
        size: size,
        path: path,
        url: url,
      );

  factory Small.fromJson(Map<String, dynamic> json) => Small(
    name: json["name"] == null ? null : json["name"],
    hash: json["hash"] == null ? null : json["hash"],
    ext: json["ext"] == null ? null : json["ext"],
    mime: json["mime"] == null ? null : json["mime"],
    width: json["width"] == null ? null : json["width"],
    height: json["height"] == null ? null : json["height"],
    size: json["size"] == null ? null : json["size"].toDouble(),
    path: json["path"],
    url: json["url"] == null ? null : json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "hash": hash,
    "ext": ext,
    "mime": mime,
    "width": width,
    "height": height,
    "size": size,
    "path": path,
    "url": url,
  };
}

class Localization {
  Localization({
    required this.id,
    required this.locale,
    required this.publishedAt,
  });

  final int id;
  final String locale;
  final DateTime publishedAt;

  Localization copyWith({
    required int id,
    required  String locale,
    required  DateTime publishedAt,
  }) =>
      Localization(
        id: id,
        locale: locale,
        publishedAt: publishedAt,
      );

  factory Localization.fromJson(Map<String, dynamic> json) => Localization(
    id: json["id"] == null ? null : json["id"],
    locale: json["locale"] == null ? null : json["locale"],
    publishedAt: DateTime.parse(json["published_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "locale": locale,
    "published_at": publishedAt.toIso8601String(),
  };
}
