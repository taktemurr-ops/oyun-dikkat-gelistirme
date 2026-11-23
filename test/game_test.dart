import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_dikkat_gelistirme/oyun_dikkat_gelistirme.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(dikkatConfig.title.length, 33);
    expect(dikkatConfig.tagline.length, 33);
    for (final s in dikkatConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(dikkatConfig.gameId, dikkatId);
    expect(dikkatRules.gameId, dikkatId);
    expect(dikkatConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(dikkatRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: dikkatId, optionalMechanics: dikkatRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(dikkatRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
