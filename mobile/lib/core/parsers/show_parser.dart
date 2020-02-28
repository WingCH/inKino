import 'package:inkino/core/models/show.dart';
import 'package:inkino/core/networking/image_url_rewriter.dart';
import 'package:inkino/core/parsers/content_descriptor_parser.dart';
import 'package:inkino/core/parsers/event_parser.dart';
import 'package:inkino/core/utils/event_name_cleaner.dart';
import 'package:inkino/core/utils/xml_utils.dart';
import 'package:kt_dart/collection.dart';
import 'package:xml/xml.dart' as xml;

class ShowParser {
  static KtList<Show> parse(String xmlString) {
    final document = xml.parse(xmlString);
    final shows = document.findAllElements('Show');

    return listFrom(shows).map((node) {
      final title = tagContents(node, 'Title');
      final originalTitle = tagContents(node, 'OriginalTitle');

      return Show(
        id: tagContents(node, 'ID'),
        eventId: tagContents(node, 'EventID'),
        title: EventNameCleaner.cleanup(title),
        originalTitle: EventNameCleaner.cleanup(originalTitle),
        ageRating: tagContentsOrNull(node, 'Rating'),
        ageRatingUrl:
            rewriteImageUrl(tagContentsOrNull(node, 'RatingImageUrl')),
        url: tagContents(node, 'ShowURL'),
        presentationMethod: tagContents(node, 'PresentationMethod'),
        theaterAndAuditorium: tagContents(node, 'TheatreAndAuditorium'),
        start: DateTime.parse(tagContents(node, 'dttmShowStart')),
        end: DateTime.parse(tagContents(node, 'dttmShowEnd')),
        images: EventImageDataParser.parse(node.findElements('Images')),
        contentDescriptors: ContentDescriptorParser.parse(
            node.findElements('ContentDescriptors')),
      );
    });
  }
}
