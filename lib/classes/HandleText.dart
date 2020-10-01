class HandleText {
  
  static const List<String> opcoes = [
    'Selecione',
    'Reverso',
    'MAÍUSCULAS',
    'minúsculas',
  ];

  convertText(String switchCase, String str) {
    switch (switchCase) {
      case 'Reverso':
        return textReversed(str);
        break;
      case 'MAÍUSCULAS':
        return textToUpper(str);
        break;
      case 'minúsculas':
        return textToLower(str);
        break;
    }
  }

  textToUpper(String str) {
    return str.toUpperCase();
  }

  textToLower(String str) {
    return str.toLowerCase();
  }

  textReversed(String str) {
    return str.split('').reversed.join();
  }
}