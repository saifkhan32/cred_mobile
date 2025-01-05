class ItemData {
  List<Items>? items;

  ItemData({this.items});

  ItemData.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  OpenState? openState;
  ClosedState? closedState;
  String? ctaText;

  Items({this.openState, this.closedState, this.ctaText});

  Items.fromJson(Map<String, dynamic> json) {
    openState = json['open_state'] != null
        ?  OpenState.fromJson(json['open_state'])
        : null;
    closedState = json['closed_state'] != null
        ? ClosedState.fromJson(json['closed_state'])
        : null;
    ctaText = json['cta_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (openState != null) {
      data['open_state'] = openState!.toJson();
    }
    if (closedState != null) {
      data['closed_state'] = closedState!.toJson();
    }
    data['cta_text'] = ctaText;
    return data;
  }
}

class OpenState {
  Body? body;

  OpenState({this.body});

  OpenState.fromJson(Map<String, dynamic> json) {
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (body != null) {
      data['body'] = body!.toJson();
    }
    return data;
  }
}
class ClosedState {
  Body2? body;

  ClosedState({this.body});

  ClosedState.fromJson(Map<String, dynamic> json) {
    body = json['body'] != null ? new Body2.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (body != null) {
      data['body'] = body!.toJson();
    }
    return data;
  }
}
class Body {
  String? title;
  String? subtitle;
  Cards? card;
  String? footer;
  List<Items2>? items;
  Body({this.title, this.subtitle, this.card, this.footer,this.items });

  Body.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
    card = json['card'] != null ? Cards.fromJson(json['card']) : null;
    footer = json['footer'];
      if (json['items'] != null) {
      items = <Items2>[];
      json['items'].forEach((v) {
        items!.add(Items2.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = title;
    data['subtitle'] = subtitle;
    if (card != null) {
      data['card'] = card!.toJson();
    }
    data['footer'] = footer;
  if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cards {
  String? header;
  String? description;
  int? maxRange;
  int? minRange;

  Cards({this.header, this.description, this.maxRange, this.minRange});

  Cards.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    description = json['description'];
    maxRange = json['max_range'];
    minRange = json['min_range'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = header;
    data['description'] = description;
    data['max_range'] = maxRange;
    data['min_range'] = minRange;
    return data;
  }
}


class Body2 {
  String? key1;
  String? key2;

  Body2({this.key1, this.key2});

  Body2.fromJson(Map<String, dynamic> json) {
    key1 = json['key1'];
    key2 = json['key2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['key1'] = key1;
    data['key2'] = key2;
    return data;
  }

}
  class Items2 {
  String? emi;
  String? duration;
  String? title;
  String? subtitle;
  String? tag;
  String? icon;

  Items2(
      {this.emi,
      this.duration,
      this.title,
      this.subtitle,
      this.tag,
      this.icon});

  Items2.fromJson(Map<String, dynamic> json) {
    emi = json['emi'];
    duration = json['duration'];
    title = json['title'];
    subtitle = json['subtitle'].toString();
    tag = json['tag'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['emi'] = emi;
    data['duration'] = duration;
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['tag'] = tag;
    data['icon'] = icon;
    return data;
  }
}