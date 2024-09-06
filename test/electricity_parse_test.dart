import 'package:flutter_test/flutter_test.dart';
import 'package:kexie_app/ui/tools/electricity_query/electricity_query_controller.dart';

import 'package:xml/xml.dart';


void main() {
  group('parseXmlData', () {
    test('parses valid XML correctly', () {
      // 模拟 XML 字符串
      final xml = '''
        <root>
          <ds>
            <rdate>2024-09-01</rdate>
            <remain>50</remain>
          </ds>
          <ds>
            <rdate>2024-09-02</rdate>
            <remain>45</remain>
          </ds>
        </root>
      ''';

      // 调用要测试的函数
      final result = parseXmlData(xml);

      // 验证返回的结果
      expect(result.length, 2);

      expect(result[0].date, '2024-09-01');
      expect(result[0].electricity, '50');

      expect(result[1].date, '2024-09-02');
      expect(result[1].electricity, '45');
    });

    test('handles empty XML', () {
      // 模拟空的 XML 字符串
      final xml = '<root></root>';

      // 调用要测试的函数
      final result = parseXmlData(xml);

      // 验证返回空列表
      expect(result, isEmpty);
    });

    test('throws when XML is invalid', () {
      // 模拟无效的 XML 字符串
      final invalidXml = '<root><ds><rdate></rdate></ds>';

      // 期望解析无效 XML 时抛出异常
      expect(() => parseXmlData(invalidXml), throwsA(isA<XmlException>()));
    });
  });
}
