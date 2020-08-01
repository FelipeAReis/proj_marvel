class Moeda {
  Rates rates;
  String base;
  String date;

  Moeda({this.rates, this.base, this.date});

  Moeda.fromJson(Map<String, dynamic> json) {
    rates = json['rates'] != null ? new Rates.fromJson(json['rates']) : null;
    base = json['base'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rates != null) {
      data['rates'] = this.rates.toJson();
    }
    data['base'] = this.base;
    data['date'] = this.date;
    return data;
  }
}

class Rates {
  double cAD;
  double hKD;
  double iSK;
  double pHP;
  double dKK;
  double hUF;
  double cZK;
  double aUD;
  double rON;
  double sEK;
  double iDR;
  double iNR;
  double bRL;
  double rUB;
  double hRK;
  double jPY;
  double tHB;
  double cHF;
  double sGD;
  double pLN;
  double bGN;
  double tRY;
  double cNY;
  double nOK;
  double nZD;
  double zAR;
  double uSD;
  double mXN;
  double iLS;
  double gBP;
  double kRW;
  double mYR;

  Rates(
      {this.cAD,
      this.hKD,
      this.iSK,
      this.pHP,
      this.dKK,
      this.hUF,
      this.cZK,
      this.aUD,
      this.rON,
      this.sEK,
      this.iDR,
      this.iNR,
      this.bRL,
      this.rUB,
      this.hRK,
      this.jPY,
      this.tHB,
      this.cHF,
      this.sGD,
      this.pLN,
      this.bGN,
      this.tRY,
      this.cNY,
      this.nOK,
      this.nZD,
      this.zAR,
      this.uSD,
      this.mXN,
      this.iLS,
      this.gBP,
      this.kRW,
      this.mYR});

  Rates.fromJson(Map<String, dynamic> json) {
    cAD = json['CAD'];
    hKD = json['HKD'];
    iSK = json['ISK'];
    pHP = json['PHP'];
    dKK = json['DKK'];
    hUF = json['HUF'];
    cZK = json['CZK'];
    aUD = json['AUD'];
    rON = json['RON'];
    sEK = json['SEK'];
    iDR = json['IDR'];
    iNR = json['INR'];
    bRL = json['BRL'];
    rUB = json['RUB'];
    hRK = json['HRK'];
    jPY = json['JPY'];
    tHB = json['THB'];
    cHF = json['CHF'];
    sGD = json['SGD'];
    pLN = json['PLN'];
    bGN = json['BGN'];
    tRY = json['TRY'];
    cNY = json['CNY'];
    nOK = json['NOK'];
    nZD = json['NZD'];
    zAR = json['ZAR'];
    uSD = json['USD'];
    mXN = json['MXN'];
    iLS = json['ILS'];
    gBP = json['GBP'];
    kRW = json['KRW'];
    mYR = json['MYR'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CAD'] = this.cAD;
    data['HKD'] = this.hKD;
    data['ISK'] = this.iSK;
    data['PHP'] = this.pHP;
    data['DKK'] = this.dKK;
    data['HUF'] = this.hUF;
    data['CZK'] = this.cZK;
    data['AUD'] = this.aUD;
    data['RON'] = this.rON;
    data['SEK'] = this.sEK;
    data['IDR'] = this.iDR;
    data['INR'] = this.iNR;
    data['BRL'] = this.bRL;
    data['RUB'] = this.rUB;
    data['HRK'] = this.hRK;
    data['JPY'] = this.jPY;
    data['THB'] = this.tHB;
    data['CHF'] = this.cHF;
    data['SGD'] = this.sGD;
    data['PLN'] = this.pLN;
    data['BGN'] = this.bGN;
    data['TRY'] = this.tRY;
    data['CNY'] = this.cNY;
    data['NOK'] = this.nOK;
    data['NZD'] = this.nZD;
    data['ZAR'] = this.zAR;
    data['USD'] = this.uSD;
    data['MXN'] = this.mXN;
    data['ILS'] = this.iLS;
    data['GBP'] = this.gBP;
    data['KRW'] = this.kRW;
    data['MYR'] = this.mYR;
    return data;
  }
}
