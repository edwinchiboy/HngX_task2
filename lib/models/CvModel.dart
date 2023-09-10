class CvModel {
  CvModel({
    String? name,
    String? githubUrl,
    String? slackName,
    String? personalBio,
  }) {
    _name = name;
    _githubUrl = githubUrl;
    _slackName = slackName;
    _personalBio = personalBio;
  }

  CvModel.fromJson(dynamic json) {
    _name = json['name'];
    _githubUrl = json['githubUrl'];
    _slackName = json['slackName'];
    _personalBio = json['personalBio'];
  }

  String? _name;
  String? _githubUrl;
  String? _slackName;
  String? _personalBio;

  CvModel copyWith({
    String? name,
    String? githubUrl,
    String? slackName,
    String? personalBio,
  }) =>
      CvModel(
        name: name ?? _name,
        githubUrl: githubUrl ?? _githubUrl,
        slackName: slackName ?? _slackName,
        personalBio: personalBio ?? _personalBio,
      );

  String? get name => _name;

  String? get githubUrl => _githubUrl;

  String? get slackName => _slackName;

  String? get personalBio => _personalBio;

  set setName(name) {
    _name = name;
  }

  set setGithubUrl(githubUrl) {
    _githubUrl = githubUrl;
  }

  set setSlackName(slackName) {
    _slackName = slackName;
  }

  set setPersonalBio(personalBio) {
    _personalBio = personalBio;
  }

  bool checkIfAnyIsNull() {
    List searchProperties = [name, githubUrl, slackName, personalBio];
    return searchProperties.contains(null) || searchProperties.contains("");
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['githubUrl'] = _githubUrl;
    map['slackName'] = _slackName;
    map['personalBio'] = _personalBio;
    return map;
  }
}
