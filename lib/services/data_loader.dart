library smairu.services.data_loader;

import 'dart:html' show HttpRequest, HtmlElement;
import 'package:angular2/angular2.dart';
import 'package:html/parser.dart' as html;
import 'package:quiver/iterables.dart' show zip;

@Injectable()
class DataLoader {
    String _siteUrl = 'http://kaomoji.ru';

    void process() async {
        var data = await _loadPage();
        var compiledData = _compile(data);

        return compiledData;
    }

    Iterable<List<HtmlElement>> _loadPage() async {
        var data = await HttpRequest.getString(_siteUrl);
        var document = html.parse(data);
        var h3Collection = document.querySelectorAll('h3');
        var tableCollection = document.querySelectorAll('.table_kaomoji');

        return zip([h3Collection, tableCollection]);
    }

    List<Map<String>> _compile(Iterable<List> data) {
        return data.map((List<Element> zipped) {
            var name = zipped[0].children[0].attributes['name'];

            if (name != 'special') {
                return { 
                    'category': _capitalize(name),
                    'data': zipped[1]
                        .querySelectorAll('td')
                        .map((HtmlElement td) => td.text)
                        .toList()
                };
            } else {
                return {
                    'category': _capitalize(name),
                    'data': zipped[1]
                        .querySelectorAll('tr')
                        .map((HtmlElement tr) => tr.children[0].text)
                        .toList()
                };
            }
        }).toList();
    }

    String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}
