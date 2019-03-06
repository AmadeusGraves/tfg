enum Authority{
  admin, user
}
abstract class Actor {
  String name;
  String surname;
  String userName;
  String passWord;
  Authority authority;
  Actor(this.name, this.surname, this.userName, this.passWord, this.authority);

}

class User extends Actor{
  DateTime bornDate;
  final int days = 365;
  User(String name, String surname, String userName, String passWord , {this.bornDate}) : super(name, surname, userName, passWord, Authority.user);

  List<ReserveRestaurant> restaurantsReserve = new List();
  List<Restaurant> restaurantsFavourite = new List();

  List<ReserveEvent> eventsReserve = new List();
  List<Event> eventsFavourite = new List();

  List<Block> blocks =new List();

  List<ReserveRestaurant> get reservesofrestaurants{
    return this.restaurantsReserve;
  }
  
  List<ReserveEvent> get reservesofevents{
      return this.reservesofevents;
    }
  
  List<Restaurant> get favouriteResntaurants{
      return this.restaurantsFavourite;
    }

  List<Event> get favouriteEvents{
        return this.eventsFavourite;
      }

  List<Block> get blocksagenda{
          return this.blocks;
        }
        
  double get age {
        var d = new DateTime.now();
        return d.difference(bornDate).inDays / days;
      }
}
  


class Admin extends Actor{
  Admin(String name, String surname, String userName, String passWord ) : super(name, surname, userName, passWord, Authority.admin);
  
  List<Restaurant> myRestaurants = new List();
  List<Event> myEvents = new List();
  List<Session> sessions = new List();
  List<Tag> tags =new List();

  List<Restaurant> get restaurantsCreated{
    return this.myRestaurants;
  }
  
  List<Event> get eventsCreated{
      return this.myEvents;
    }
  
  List<Session> get sessionsCreated{
      return this.sessions;
    }

  List<Tag> get myTags{
        return this.tags;
      }

}


class Block {
  DateTime dia;
  Block(){
    this.dia =DateTime.now();
  }

  User user;
  List<ReserveEvent> eventsReserve = new List();
  List<ReserveRestaurant> restaurantsReserve = new List();

  User get owner{
    return this.user;
  }

  List<ReserveRestaurant> get reservesofrestaurants{
    return this.restaurantsReserve;
  }
  
  List<ReserveEvent> get reservesofevents{
      return this.reservesofevents;
    }

}
  
class Event {
  String title;
  String description;
  String localization;
  String image;
   
  Event(this.title, this.description, this.localization, this.image);


  Admin creator;
  List<User> favouriteUsers;
  List<Tag> tags;
  List<Session> sessions;

  List<User> get favsUsers{
    return this.favouriteUsers;

  }

  List<Tag> get tagsEvent{
    return this.tags;
  }

  List<Session> get sessionsEvent{
    return this.sessions;
  }

  Admin get creatorEvent{
    return this.creator;
  }

}
  
class ReserveEvent {
  Session session;
  User user;
  Block block;

  ReserveEvent(this.session, this.user, this.block);

  Session get sessionEvent{
    return this.session;
  }

  User get client{
    return this.user;
  }

  Block get blockSpace{
    return this.block;
  }

}

class Restaurant {
  String name;
  String description;
  String localization;
  String image;
   
  Restaurant(this.name, this.description, this.localization, this.image);


  Admin creator;
  List<User> favouriteUsers;
  List<Tag> tags;
  List<ReserveRestaurant> reserves;

  List<User> get favsUsers{
    return this.favouriteUsers;

  }

  List<Tag> get tagsRestaurant{
    return this.tags;
  }

  List<ReserveRestaurant> get reserverRestaurant{
    return this.reserves;
  }

  Admin get creatorEvent{
    return this.creator;
  }
}
  
class ReserveRestaurant {
  Restaurant restaurant;
  User user;
  Block block;

  ReserveRestaurant(this.restaurant, this.user, this.block);

  Restaurant get selectRestaurant{
    return this.restaurant;
  }

  User get client{
    return this.user;
  }

  Block get blockSpace{
    return this.block;
  }

}
//TODO
class Tag {
  String name;


  Admin admin;
  List<Restaurant> restaurants;
  List<Event> events;


}
//TODO
class Session {

}
