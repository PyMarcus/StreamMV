import 'package:flutter/material.dart';


class Video{

    String _id;
    String _title;
    String _description;
    String _image;
    String _channel;

    // constructor
    Video(this._id,
        this._title,
        this._description,
        this._image,
        this._channel
        );

    // getters
    String get id{
      return _id;
    }

    String get image{
      return _image;
    }

    String get title{
      return _title;
    }

    String get channel{
      return _channel;
    }

    String get description{
      return _description;
    }

}
