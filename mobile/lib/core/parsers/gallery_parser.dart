
import 'package:inkino/core/models/event.dart';
import 'package:inkino/core/networking/image_url_rewriter.dart';
import 'package:inkino/core/utils/xml_utils.dart';
import 'package:kt_dart/collection.dart';
import 'package:xml/xml.dart';

class GalleryParser {
  static KtList<GalleryImage> parse(Iterable<XmlElement> roots) {
    if (roots == null || roots.isEmpty) {
      return emptyList();
    }

    var galleryImage = listFrom(roots).first().findElements('GalleryImage');
    return listFrom(galleryImage).map((node) {
      return GalleryImage(
        thumbnailLocation:
            rewriteImageUrl(tagContents(node, 'ThumbnailLocation')),
        location: rewriteImageUrl(tagContents(node, 'Location')),
      );
    });
  }
}
