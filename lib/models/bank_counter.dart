class BankCounter {
  final String name;
  String processingClient;
  List<String> processedClients;

  BankCounter({
    this.name,
    this.processingClient,
    this.processedClients,
  }) {
    processedClients = [];
  }

  void finishWork() {
    processedClients.add(processingClient);
    processingClient = null;
  }
}

extension StringListExtension on List<String> {
  String get text {
    var s = '';
    for (var i = 0; i < length; i++) {
      s += this[i];
      if (i != length - 1) s += ',';
    }
    return s;
  }
}

extension StringExtension on String {
  String get text {
    return isIdle ? 'idle' : this;
  }

  bool get isIdle {
    return (this == null || isEmpty);
  }
}
