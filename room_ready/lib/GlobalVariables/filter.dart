import 'global_variables.dart';

class Filter {
  static List<String> specialTags = ['sprklii', 'anyseason', 'anywhere'];
  static List<String> seasonalTags = ['xmas', 'spooky', 'easter'];

  static String? checkLocation(bool value, String? location) {
    if (value) {
      if ((location ?? '').isNotEmpty) {
        return location;
      }
    }
    return null;
  }

  static List filterIdeas(List<Map<String, dynamic>> ideas,
      {bool nocorny = false, //Removes ideas with tag "corny"
      bool seasonal = true, //Filters by relevant seasons
      bool standard = false, //Removes Apologies and Thoughtful Ideas
      bool original = false, //Only shows Sprklii ideas
      bool andor = false, //Only requires one category requirement be met
      List<String>? categoryWhitelist, //Categories allowed/required
      List<String>? categoryBlacklist, //Categories prohibited
      List<String>? cost, //Price Range; min/max or value
      List<String>? time, //Time Range; min/max or value
      List<String>? seasons, //Seasons required; sets seasonal to false
      String textSearch = '', //Search title and description of idea
      String? location, //Filter by location (two letter state)
        String? holidayTags
      }) {
    List filtered = []; //result

    categoryWhitelist ??= [];
    categoryBlacklist ??= [];
    cost ??= [];
    time ??= [];
    seasons ??= [];
    if (seasons.isNotEmpty) {
      seasonal = false;
    }

    List season = GlobalVariables.getSeason();

    for (int i = 0; i < ideas.length; i++) {
      bool include = true;
      bool pushTags = false;
      if (include) {
        if (nocorny) {
          if (ideas[i]['hiddenTags'].contains('corny')) {
            include = false;
          }
        }
      } //Filters corny
      if (include) {
        if (seasonal) {
          if (ideas[i]['when'] != null) {
            bool matchSeason = false;
            for (int e = 0; e < season.length; e++) {
              if ((ideas[i]['when'].toLowerCase().contains(season[e])) ||
                  (ideas[i]['when'].toLowerCase().contains('all'))) {
                matchSeason = true;
                break;
              }
            }
            include = matchSeason;
          }
        }
      } //Filters seasonal
      if (include) {
        if (standard) {
          if ((ideas[i]['category'].contains('Apologies')) ||
              (ideas[i]['category'].contains('Little Things'))) {
            include = false;
          }
        }
      } //Filters standard ideas
      if (include) {
        if (original) {
          if (!ideas[i]['hiddenTags'].contains('Sprklii')) {
            include = false;
          }
        }
      } //Filters Sprklii ideas
      if (include) {
        if (categoryWhitelist.isNotEmpty) {
          bool tagsMatch = !andor;
          if (ideas[i]['category'] != null) {
            for (int e = 0; e < categoryWhitelist.length; e++) {
              if (andor) {
                if (ideas[i]['category']
                    .replaceAll(' ', '')
                    .toLowerCase()
                    .contains(categoryWhitelist[e]
                        .replaceAll(' ', '')
                        .toLowerCase())) {
                  tagsMatch = true;
                  break;
                }
              } else {
                if (!ideas[i]['category']
                    .replaceAll(' ', '')
                    .toLowerCase()
                    .contains(categoryWhitelist[e]
                        .replaceAll(' ', '')
                        .toLowerCase())) {
                  tagsMatch = false;
                  break;
                }
              }
            }
          } else {
            tagsMatch = false;
          }
          include = tagsMatch;
        }
      } //Filters categories by whitelist
      if (include) {
        if (categoryBlacklist.isNotEmpty) {
          for (int e = 0; e < categoryBlacklist.length; e++) {
            if ((ideas[i]['category'] ?? '')
                .replaceAll(' ', '')
                .toLowerCase()
                .contains(
                    categoryBlacklist[e].replaceAll(' ', '').toLowerCase())) {
              include = false;
            }
          }
        }
      } //Filters categories by blacklist
      if (include) {
        if (cost.isNotEmpty) {
          if (cost.length == 1) {
            if (!(GlobalVariables.priceConvert[cost[0]] ==
                GlobalVariables
                    .priceConvert[ideas[i]['cost'].replaceAll(' ', '')])) {
              include = false;
            }
          } else {
            if ((GlobalVariables.priceConvert[cost[1]] <
                    GlobalVariables
                        .priceConvert[ideas[i]['cost'].replaceAll(' ', '')]) ||
                (GlobalVariables.priceConvert[cost[0]] >
                    GlobalVariables
                        .priceConvert[ideas[i]['cost'].replaceAll(' ', '')])) {
              include = false;
            }
          }
        }
      } //Filters cost
      if (include) {
        if (time.isNotEmpty) {
          if (ideas[i]['time'] != null) {
            List<double> tagTime;
            if (time.length == 1) {
              tagTime = GlobalVariables.timeConvert(time[0]);
            } else {
              tagTime = GlobalVariables.timeConvert('${time[0]}-${time[1]}');
            }
            List<double> ideaTime =
                GlobalVariables.timeConvert(ideas[i]['time']);
            bool timesMatch = false;
            if (tagTime.isNotEmpty) {
              if (ideaTime.length > 1) {
                if (tagTime.length > 1) {
                  if ((ideaTime[0] <= tagTime[0]) &&
                      (tagTime[0] <= ideaTime[1])) {
                    timesMatch = true;
                  }
                  if ((ideaTime[0] <= tagTime[1]) &&
                      (tagTime[1] <= ideaTime[1])) {
                    timesMatch = true;
                  }
                  if ((tagTime[0] <= ideaTime[0]) &&
                      (ideaTime[0] <= tagTime[1])) {
                    timesMatch = true;
                  }
                }
                if ((ideaTime[0] <= tagTime[0]) &&
                    (tagTime[0] <= ideaTime[1])) {
                  timesMatch = true;
                }
              }
              if (tagTime.length > 1) {
                if ((tagTime[0] <= ideaTime[0]) &&
                    (ideaTime[0] <= tagTime[1])) {
                  timesMatch = true;
                }
              }
              if (ideaTime[0] == tagTime[0]) {
                timesMatch = true;
              }
            } else {
              include = false;
            }
            if (!timesMatch) {
              include = false;
            }
          } else {
            include = false;
          }
        }
      } //Filters price
      if (include) {
        if (ideas[i]['when'] != null) {
          for (int e = 0; e < seasons.length; e++) {
            bool seasonsMatch = false;
            //returns value with specific season of all season
            if (include) {
              if (ideas[i]['when']
                  .toLowerCase()
                  .contains(seasons[e].toLowerCase())) {
                seasonsMatch = true;
              }
              if (ideas[i]['when'] == 'All') {
                if ((seasons[e].toLowerCase() == 'summer') ||
                    (seasons[e].toLowerCase() == 'winter') ||
                    (seasons[e].toLowerCase() == 'spring') ||
                    (seasons[e].toLowerCase() == 'fall') ||
                    (seasons[e].toLowerCase().replaceAll('_', '') ==
                        'allseason')) {
                  seasonsMatch = true;
                }
              }
              if (!seasonsMatch) {
                include = false;
              }
            }
          }
        }
      } //Filters season
      if (include) {
        if (textSearch.isNotEmpty) {
          if ((!(ideas[i]['dateIdea'] ?? '')
                  .toLowerCase()
                  .contains(textSearch.toLowerCase())) &&
              (!(ideas[i]['dateDescription'] ?? '')
                  .toLowerCase()
                  .contains(textSearch.toLowerCase()))) {
            include = false;
          }
        }
      } //Filters text
      if (include) {
        if (location != null) {
          if (ideas[i]['location'] != null) {
            if (!ideas[i]['location'].contains(location)) {
              include = false;
            }
          }
        }
      } //Filters location
      if (include) {
        if (holidayTags != null) {
          bool? match;
          List<String> holidayList = ideas[i]['hiddenTags'].split(',');
          for (int e = 0; e < holidayList.length; e++) {
            if (seasonalTags.toString().contains(holidayList[e])) {
              if (holidayTags.contains(holidayList[e])) {
                match = true;
              } else {
                match ??= false;
              }
            }
          }
          if (match != null) {
            if (match) {
              pushTags = true;
            } else {
              include = false;
            }
          }
        }
      } //Filters Holidays
      if (include) {
        if(pushTags){
          filtered.insert(0, ideas[i]['pkey']);
        } else {
          filtered.add(ideas[i]['pkey']);
        }
      }
    }
    return filtered;
  }
}
