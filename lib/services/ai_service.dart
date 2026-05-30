import 'package:google_generative_ai/google_generative_ai.dart';

class AIService {
  static const String _apiKey = "YOUR_GEMINI_KEY"; // Replace with key
  final _model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: _apiKey);

  Future<String> processQuery(String query) async {
    try {
      final prompt = "Convert this to a math expression. Reply ONLY with the expression: $query";
      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);
      return response.text?.trim() ?? "Error";
    } catch (e) {
      return "Error";
    }
  }
}
