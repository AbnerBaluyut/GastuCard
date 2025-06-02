// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CardsTable extends Cards with TableInfo<$CardsTable, Card> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _bankNameMeta = const VerificationMeta(
    'bankName',
  );
  @override
  late final GeneratedColumn<String> bankName = GeneratedColumn<String>(
    'bank_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _creditLimitMeta = const VerificationMeta(
    'creditLimit',
  );
  @override
  late final GeneratedColumn<double> creditLimit = GeneratedColumn<double>(
    'credit_limit',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cardTypeMeta = const VerificationMeta(
    'cardType',
  );
  @override
  late final GeneratedColumn<String> cardType = GeneratedColumn<String>(
    'card_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant("Visa"),
  );
  static const VerificationMeta _statementDueDateMeta = const VerificationMeta(
    'statementDueDate',
  );
  @override
  late final GeneratedColumn<DateTime> statementDueDate =
      GeneratedColumn<DateTime>(
        'statement_due_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _paymentDueDateMeta = const VerificationMeta(
    'paymentDueDate',
  );
  @override
  late final GeneratedColumn<DateTime> paymentDueDate =
      GeneratedColumn<DateTime>(
        'payment_due_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _cardColorHexMeta = const VerificationMeta(
    'cardColorHex',
  );
  @override
  late final GeneratedColumn<String> cardColorHex = GeneratedColumn<String>(
    'card_color_hex',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    bankName,
    creditLimit,
    cardType,
    statementDueDate,
    paymentDueDate,
    cardColorHex,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cards';
  @override
  VerificationContext validateIntegrity(
    Insertable<Card> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('bank_name')) {
      context.handle(
        _bankNameMeta,
        bankName.isAcceptableOrUnknown(data['bank_name']!, _bankNameMeta),
      );
    } else if (isInserting) {
      context.missing(_bankNameMeta);
    }
    if (data.containsKey('credit_limit')) {
      context.handle(
        _creditLimitMeta,
        creditLimit.isAcceptableOrUnknown(
          data['credit_limit']!,
          _creditLimitMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_creditLimitMeta);
    }
    if (data.containsKey('card_type')) {
      context.handle(
        _cardTypeMeta,
        cardType.isAcceptableOrUnknown(data['card_type']!, _cardTypeMeta),
      );
    }
    if (data.containsKey('statement_due_date')) {
      context.handle(
        _statementDueDateMeta,
        statementDueDate.isAcceptableOrUnknown(
          data['statement_due_date']!,
          _statementDueDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_statementDueDateMeta);
    }
    if (data.containsKey('payment_due_date')) {
      context.handle(
        _paymentDueDateMeta,
        paymentDueDate.isAcceptableOrUnknown(
          data['payment_due_date']!,
          _paymentDueDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_paymentDueDateMeta);
    }
    if (data.containsKey('card_color_hex')) {
      context.handle(
        _cardColorHexMeta,
        cardColorHex.isAcceptableOrUnknown(
          data['card_color_hex']!,
          _cardColorHexMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Card map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Card(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      bankName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}bank_name'],
          )!,
      creditLimit:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}credit_limit'],
          )!,
      cardType:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}card_type'],
          )!,
      statementDueDate:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}statement_due_date'],
          )!,
      paymentDueDate:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}payment_due_date'],
          )!,
      cardColorHex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}card_color_hex'],
      ),
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
    );
  }

  @override
  $CardsTable createAlias(String alias) {
    return $CardsTable(attachedDatabase, alias);
  }
}

class Card extends DataClass implements Insertable<Card> {
  final int id;
  final String bankName;
  final double creditLimit;
  final String cardType;
  final DateTime statementDueDate;
  final DateTime paymentDueDate;
  final String? cardColorHex;
  final DateTime createdAt;
  const Card({
    required this.id,
    required this.bankName,
    required this.creditLimit,
    required this.cardType,
    required this.statementDueDate,
    required this.paymentDueDate,
    this.cardColorHex,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['bank_name'] = Variable<String>(bankName);
    map['credit_limit'] = Variable<double>(creditLimit);
    map['card_type'] = Variable<String>(cardType);
    map['statement_due_date'] = Variable<DateTime>(statementDueDate);
    map['payment_due_date'] = Variable<DateTime>(paymentDueDate);
    if (!nullToAbsent || cardColorHex != null) {
      map['card_color_hex'] = Variable<String>(cardColorHex);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CardsCompanion toCompanion(bool nullToAbsent) {
    return CardsCompanion(
      id: Value(id),
      bankName: Value(bankName),
      creditLimit: Value(creditLimit),
      cardType: Value(cardType),
      statementDueDate: Value(statementDueDate),
      paymentDueDate: Value(paymentDueDate),
      cardColorHex:
          cardColorHex == null && nullToAbsent
              ? const Value.absent()
              : Value(cardColorHex),
      createdAt: Value(createdAt),
    );
  }

  factory Card.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Card(
      id: serializer.fromJson<int>(json['id']),
      bankName: serializer.fromJson<String>(json['bankName']),
      creditLimit: serializer.fromJson<double>(json['creditLimit']),
      cardType: serializer.fromJson<String>(json['cardType']),
      statementDueDate: serializer.fromJson<DateTime>(json['statementDueDate']),
      paymentDueDate: serializer.fromJson<DateTime>(json['paymentDueDate']),
      cardColorHex: serializer.fromJson<String?>(json['cardColorHex']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'bankName': serializer.toJson<String>(bankName),
      'creditLimit': serializer.toJson<double>(creditLimit),
      'cardType': serializer.toJson<String>(cardType),
      'statementDueDate': serializer.toJson<DateTime>(statementDueDate),
      'paymentDueDate': serializer.toJson<DateTime>(paymentDueDate),
      'cardColorHex': serializer.toJson<String?>(cardColorHex),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Card copyWith({
    int? id,
    String? bankName,
    double? creditLimit,
    String? cardType,
    DateTime? statementDueDate,
    DateTime? paymentDueDate,
    Value<String?> cardColorHex = const Value.absent(),
    DateTime? createdAt,
  }) => Card(
    id: id ?? this.id,
    bankName: bankName ?? this.bankName,
    creditLimit: creditLimit ?? this.creditLimit,
    cardType: cardType ?? this.cardType,
    statementDueDate: statementDueDate ?? this.statementDueDate,
    paymentDueDate: paymentDueDate ?? this.paymentDueDate,
    cardColorHex: cardColorHex.present ? cardColorHex.value : this.cardColorHex,
    createdAt: createdAt ?? this.createdAt,
  );
  Card copyWithCompanion(CardsCompanion data) {
    return Card(
      id: data.id.present ? data.id.value : this.id,
      bankName: data.bankName.present ? data.bankName.value : this.bankName,
      creditLimit:
          data.creditLimit.present ? data.creditLimit.value : this.creditLimit,
      cardType: data.cardType.present ? data.cardType.value : this.cardType,
      statementDueDate:
          data.statementDueDate.present
              ? data.statementDueDate.value
              : this.statementDueDate,
      paymentDueDate:
          data.paymentDueDate.present
              ? data.paymentDueDate.value
              : this.paymentDueDate,
      cardColorHex:
          data.cardColorHex.present
              ? data.cardColorHex.value
              : this.cardColorHex,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Card(')
          ..write('id: $id, ')
          ..write('bankName: $bankName, ')
          ..write('creditLimit: $creditLimit, ')
          ..write('cardType: $cardType, ')
          ..write('statementDueDate: $statementDueDate, ')
          ..write('paymentDueDate: $paymentDueDate, ')
          ..write('cardColorHex: $cardColorHex, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    bankName,
    creditLimit,
    cardType,
    statementDueDate,
    paymentDueDate,
    cardColorHex,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Card &&
          other.id == this.id &&
          other.bankName == this.bankName &&
          other.creditLimit == this.creditLimit &&
          other.cardType == this.cardType &&
          other.statementDueDate == this.statementDueDate &&
          other.paymentDueDate == this.paymentDueDate &&
          other.cardColorHex == this.cardColorHex &&
          other.createdAt == this.createdAt);
}

class CardsCompanion extends UpdateCompanion<Card> {
  final Value<int> id;
  final Value<String> bankName;
  final Value<double> creditLimit;
  final Value<String> cardType;
  final Value<DateTime> statementDueDate;
  final Value<DateTime> paymentDueDate;
  final Value<String?> cardColorHex;
  final Value<DateTime> createdAt;
  const CardsCompanion({
    this.id = const Value.absent(),
    this.bankName = const Value.absent(),
    this.creditLimit = const Value.absent(),
    this.cardType = const Value.absent(),
    this.statementDueDate = const Value.absent(),
    this.paymentDueDate = const Value.absent(),
    this.cardColorHex = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  CardsCompanion.insert({
    this.id = const Value.absent(),
    required String bankName,
    required double creditLimit,
    this.cardType = const Value.absent(),
    required DateTime statementDueDate,
    required DateTime paymentDueDate,
    this.cardColorHex = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : bankName = Value(bankName),
       creditLimit = Value(creditLimit),
       statementDueDate = Value(statementDueDate),
       paymentDueDate = Value(paymentDueDate);
  static Insertable<Card> custom({
    Expression<int>? id,
    Expression<String>? bankName,
    Expression<double>? creditLimit,
    Expression<String>? cardType,
    Expression<DateTime>? statementDueDate,
    Expression<DateTime>? paymentDueDate,
    Expression<String>? cardColorHex,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (bankName != null) 'bank_name': bankName,
      if (creditLimit != null) 'credit_limit': creditLimit,
      if (cardType != null) 'card_type': cardType,
      if (statementDueDate != null) 'statement_due_date': statementDueDate,
      if (paymentDueDate != null) 'payment_due_date': paymentDueDate,
      if (cardColorHex != null) 'card_color_hex': cardColorHex,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  CardsCompanion copyWith({
    Value<int>? id,
    Value<String>? bankName,
    Value<double>? creditLimit,
    Value<String>? cardType,
    Value<DateTime>? statementDueDate,
    Value<DateTime>? paymentDueDate,
    Value<String?>? cardColorHex,
    Value<DateTime>? createdAt,
  }) {
    return CardsCompanion(
      id: id ?? this.id,
      bankName: bankName ?? this.bankName,
      creditLimit: creditLimit ?? this.creditLimit,
      cardType: cardType ?? this.cardType,
      statementDueDate: statementDueDate ?? this.statementDueDate,
      paymentDueDate: paymentDueDate ?? this.paymentDueDate,
      cardColorHex: cardColorHex ?? this.cardColorHex,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (bankName.present) {
      map['bank_name'] = Variable<String>(bankName.value);
    }
    if (creditLimit.present) {
      map['credit_limit'] = Variable<double>(creditLimit.value);
    }
    if (cardType.present) {
      map['card_type'] = Variable<String>(cardType.value);
    }
    if (statementDueDate.present) {
      map['statement_due_date'] = Variable<DateTime>(statementDueDate.value);
    }
    if (paymentDueDate.present) {
      map['payment_due_date'] = Variable<DateTime>(paymentDueDate.value);
    }
    if (cardColorHex.present) {
      map['card_color_hex'] = Variable<String>(cardColorHex.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CardsCompanion(')
          ..write('id: $id, ')
          ..write('bankName: $bankName, ')
          ..write('creditLimit: $creditLimit, ')
          ..write('cardType: $cardType, ')
          ..write('statementDueDate: $statementDueDate, ')
          ..write('paymentDueDate: $paymentDueDate, ')
          ..write('cardColorHex: $cardColorHex, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, Transaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _cardIdMeta = const VerificationMeta('cardId');
  @override
  late final GeneratedColumn<int> cardId = GeneratedColumn<int>(
    'card_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'REFERENCES cards(id) NOT NULL',
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isInstallmentMeta = const VerificationMeta(
    'isInstallment',
  );
  @override
  late final GeneratedColumn<bool> isInstallment = GeneratedColumn<bool>(
    'is_installment',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_installment" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _processingFeeMeta = const VerificationMeta(
    'processingFee',
  );
  @override
  late final GeneratedColumn<double> processingFee = GeneratedColumn<double>(
    'processing_fee',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _interestRateMeta = const VerificationMeta(
    'interestRate',
  );
  @override
  late final GeneratedColumn<double> interestRate = GeneratedColumn<double>(
    'interest_rate',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    cardId,
    title,
    amount,
    category,
    date,
    isInstallment,
    processingFee,
    interestRate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Transaction> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('card_id')) {
      context.handle(
        _cardIdMeta,
        cardId.isAcceptableOrUnknown(data['card_id']!, _cardIdMeta),
      );
    } else if (isInserting) {
      context.missing(_cardIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('is_installment')) {
      context.handle(
        _isInstallmentMeta,
        isInstallment.isAcceptableOrUnknown(
          data['is_installment']!,
          _isInstallmentMeta,
        ),
      );
    }
    if (data.containsKey('processing_fee')) {
      context.handle(
        _processingFeeMeta,
        processingFee.isAcceptableOrUnknown(
          data['processing_fee']!,
          _processingFeeMeta,
        ),
      );
    }
    if (data.containsKey('interest_rate')) {
      context.handle(
        _interestRateMeta,
        interestRate.isAcceptableOrUnknown(
          data['interest_rate']!,
          _interestRateMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Transaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Transaction(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      cardId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}card_id'],
          )!,
      title:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}title'],
          )!,
      amount:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}amount'],
          )!,
      category:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}category'],
          )!,
      date:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}date'],
          )!,
      isInstallment:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_installment'],
          )!,
      processingFee: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}processing_fee'],
      ),
      interestRate: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}interest_rate'],
      ),
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }
}

class Transaction extends DataClass implements Insertable<Transaction> {
  final int id;
  final int cardId;
  final String title;
  final double amount;
  final String category;
  final DateTime date;
  final bool isInstallment;
  final double? processingFee;
  final double? interestRate;
  const Transaction({
    required this.id,
    required this.cardId,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    required this.isInstallment,
    this.processingFee,
    this.interestRate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['card_id'] = Variable<int>(cardId);
    map['title'] = Variable<String>(title);
    map['amount'] = Variable<double>(amount);
    map['category'] = Variable<String>(category);
    map['date'] = Variable<DateTime>(date);
    map['is_installment'] = Variable<bool>(isInstallment);
    if (!nullToAbsent || processingFee != null) {
      map['processing_fee'] = Variable<double>(processingFee);
    }
    if (!nullToAbsent || interestRate != null) {
      map['interest_rate'] = Variable<double>(interestRate);
    }
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      cardId: Value(cardId),
      title: Value(title),
      amount: Value(amount),
      category: Value(category),
      date: Value(date),
      isInstallment: Value(isInstallment),
      processingFee:
          processingFee == null && nullToAbsent
              ? const Value.absent()
              : Value(processingFee),
      interestRate:
          interestRate == null && nullToAbsent
              ? const Value.absent()
              : Value(interestRate),
    );
  }

  factory Transaction.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Transaction(
      id: serializer.fromJson<int>(json['id']),
      cardId: serializer.fromJson<int>(json['cardId']),
      title: serializer.fromJson<String>(json['title']),
      amount: serializer.fromJson<double>(json['amount']),
      category: serializer.fromJson<String>(json['category']),
      date: serializer.fromJson<DateTime>(json['date']),
      isInstallment: serializer.fromJson<bool>(json['isInstallment']),
      processingFee: serializer.fromJson<double?>(json['processingFee']),
      interestRate: serializer.fromJson<double?>(json['interestRate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'cardId': serializer.toJson<int>(cardId),
      'title': serializer.toJson<String>(title),
      'amount': serializer.toJson<double>(amount),
      'category': serializer.toJson<String>(category),
      'date': serializer.toJson<DateTime>(date),
      'isInstallment': serializer.toJson<bool>(isInstallment),
      'processingFee': serializer.toJson<double?>(processingFee),
      'interestRate': serializer.toJson<double?>(interestRate),
    };
  }

  Transaction copyWith({
    int? id,
    int? cardId,
    String? title,
    double? amount,
    String? category,
    DateTime? date,
    bool? isInstallment,
    Value<double?> processingFee = const Value.absent(),
    Value<double?> interestRate = const Value.absent(),
  }) => Transaction(
    id: id ?? this.id,
    cardId: cardId ?? this.cardId,
    title: title ?? this.title,
    amount: amount ?? this.amount,
    category: category ?? this.category,
    date: date ?? this.date,
    isInstallment: isInstallment ?? this.isInstallment,
    processingFee:
        processingFee.present ? processingFee.value : this.processingFee,
    interestRate: interestRate.present ? interestRate.value : this.interestRate,
  );
  Transaction copyWithCompanion(TransactionsCompanion data) {
    return Transaction(
      id: data.id.present ? data.id.value : this.id,
      cardId: data.cardId.present ? data.cardId.value : this.cardId,
      title: data.title.present ? data.title.value : this.title,
      amount: data.amount.present ? data.amount.value : this.amount,
      category: data.category.present ? data.category.value : this.category,
      date: data.date.present ? data.date.value : this.date,
      isInstallment:
          data.isInstallment.present
              ? data.isInstallment.value
              : this.isInstallment,
      processingFee:
          data.processingFee.present
              ? data.processingFee.value
              : this.processingFee,
      interestRate:
          data.interestRate.present
              ? data.interestRate.value
              : this.interestRate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('id: $id, ')
          ..write('cardId: $cardId, ')
          ..write('title: $title, ')
          ..write('amount: $amount, ')
          ..write('category: $category, ')
          ..write('date: $date, ')
          ..write('isInstallment: $isInstallment, ')
          ..write('processingFee: $processingFee, ')
          ..write('interestRate: $interestRate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    cardId,
    title,
    amount,
    category,
    date,
    isInstallment,
    processingFee,
    interestRate,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.id == this.id &&
          other.cardId == this.cardId &&
          other.title == this.title &&
          other.amount == this.amount &&
          other.category == this.category &&
          other.date == this.date &&
          other.isInstallment == this.isInstallment &&
          other.processingFee == this.processingFee &&
          other.interestRate == this.interestRate);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<int> id;
  final Value<int> cardId;
  final Value<String> title;
  final Value<double> amount;
  final Value<String> category;
  final Value<DateTime> date;
  final Value<bool> isInstallment;
  final Value<double?> processingFee;
  final Value<double?> interestRate;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.cardId = const Value.absent(),
    this.title = const Value.absent(),
    this.amount = const Value.absent(),
    this.category = const Value.absent(),
    this.date = const Value.absent(),
    this.isInstallment = const Value.absent(),
    this.processingFee = const Value.absent(),
    this.interestRate = const Value.absent(),
  });
  TransactionsCompanion.insert({
    this.id = const Value.absent(),
    required int cardId,
    required String title,
    required double amount,
    required String category,
    required DateTime date,
    this.isInstallment = const Value.absent(),
    this.processingFee = const Value.absent(),
    this.interestRate = const Value.absent(),
  }) : cardId = Value(cardId),
       title = Value(title),
       amount = Value(amount),
       category = Value(category),
       date = Value(date);
  static Insertable<Transaction> custom({
    Expression<int>? id,
    Expression<int>? cardId,
    Expression<String>? title,
    Expression<double>? amount,
    Expression<String>? category,
    Expression<DateTime>? date,
    Expression<bool>? isInstallment,
    Expression<double>? processingFee,
    Expression<double>? interestRate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cardId != null) 'card_id': cardId,
      if (title != null) 'title': title,
      if (amount != null) 'amount': amount,
      if (category != null) 'category': category,
      if (date != null) 'date': date,
      if (isInstallment != null) 'is_installment': isInstallment,
      if (processingFee != null) 'processing_fee': processingFee,
      if (interestRate != null) 'interest_rate': interestRate,
    });
  }

  TransactionsCompanion copyWith({
    Value<int>? id,
    Value<int>? cardId,
    Value<String>? title,
    Value<double>? amount,
    Value<String>? category,
    Value<DateTime>? date,
    Value<bool>? isInstallment,
    Value<double?>? processingFee,
    Value<double?>? interestRate,
  }) {
    return TransactionsCompanion(
      id: id ?? this.id,
      cardId: cardId ?? this.cardId,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      category: category ?? this.category,
      date: date ?? this.date,
      isInstallment: isInstallment ?? this.isInstallment,
      processingFee: processingFee ?? this.processingFee,
      interestRate: interestRate ?? this.interestRate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (cardId.present) {
      map['card_id'] = Variable<int>(cardId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (isInstallment.present) {
      map['is_installment'] = Variable<bool>(isInstallment.value);
    }
    if (processingFee.present) {
      map['processing_fee'] = Variable<double>(processingFee.value);
    }
    if (interestRate.present) {
      map['interest_rate'] = Variable<double>(interestRate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('cardId: $cardId, ')
          ..write('title: $title, ')
          ..write('amount: $amount, ')
          ..write('category: $category, ')
          ..write('date: $date, ')
          ..write('isInstallment: $isInstallment, ')
          ..write('processingFee: $processingFee, ')
          ..write('interestRate: $interestRate')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CardsTable cards = $CardsTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cards, transactions];
}

typedef $$CardsTableCreateCompanionBuilder =
    CardsCompanion Function({
      Value<int> id,
      required String bankName,
      required double creditLimit,
      Value<String> cardType,
      required DateTime statementDueDate,
      required DateTime paymentDueDate,
      Value<String?> cardColorHex,
      Value<DateTime> createdAt,
    });
typedef $$CardsTableUpdateCompanionBuilder =
    CardsCompanion Function({
      Value<int> id,
      Value<String> bankName,
      Value<double> creditLimit,
      Value<String> cardType,
      Value<DateTime> statementDueDate,
      Value<DateTime> paymentDueDate,
      Value<String?> cardColorHex,
      Value<DateTime> createdAt,
    });

final class $$CardsTableReferences
    extends BaseReferences<_$AppDatabase, $CardsTable, Card> {
  $$CardsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TransactionsTable, List<Transaction>>
  _transactionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.transactions,
    aliasName: $_aliasNameGenerator(db.cards.id, db.transactions.cardId),
  );

  $$TransactionsTableProcessedTableManager get transactionsRefs {
    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.cardId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_transactionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CardsTableFilterComposer extends Composer<_$AppDatabase, $CardsTable> {
  $$CardsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bankName => $composableBuilder(
    column: $table.bankName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get creditLimit => $composableBuilder(
    column: $table.creditLimit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cardType => $composableBuilder(
    column: $table.cardType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get statementDueDate => $composableBuilder(
    column: $table.statementDueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get paymentDueDate => $composableBuilder(
    column: $table.paymentDueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cardColorHex => $composableBuilder(
    column: $table.cardColorHex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> transactionsRefs(
    Expression<bool> Function($$TransactionsTableFilterComposer f) f,
  ) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.cardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CardsTableOrderingComposer
    extends Composer<_$AppDatabase, $CardsTable> {
  $$CardsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bankName => $composableBuilder(
    column: $table.bankName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get creditLimit => $composableBuilder(
    column: $table.creditLimit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cardType => $composableBuilder(
    column: $table.cardType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get statementDueDate => $composableBuilder(
    column: $table.statementDueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get paymentDueDate => $composableBuilder(
    column: $table.paymentDueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cardColorHex => $composableBuilder(
    column: $table.cardColorHex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CardsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CardsTable> {
  $$CardsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get bankName =>
      $composableBuilder(column: $table.bankName, builder: (column) => column);

  GeneratedColumn<double> get creditLimit => $composableBuilder(
    column: $table.creditLimit,
    builder: (column) => column,
  );

  GeneratedColumn<String> get cardType =>
      $composableBuilder(column: $table.cardType, builder: (column) => column);

  GeneratedColumn<DateTime> get statementDueDate => $composableBuilder(
    column: $table.statementDueDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get paymentDueDate => $composableBuilder(
    column: $table.paymentDueDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get cardColorHex => $composableBuilder(
    column: $table.cardColorHex,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> transactionsRefs<T extends Object>(
    Expression<T> Function($$TransactionsTableAnnotationComposer a) f,
  ) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.cardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CardsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CardsTable,
          Card,
          $$CardsTableFilterComposer,
          $$CardsTableOrderingComposer,
          $$CardsTableAnnotationComposer,
          $$CardsTableCreateCompanionBuilder,
          $$CardsTableUpdateCompanionBuilder,
          (Card, $$CardsTableReferences),
          Card,
          PrefetchHooks Function({bool transactionsRefs})
        > {
  $$CardsTableTableManager(_$AppDatabase db, $CardsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CardsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$CardsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$CardsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> bankName = const Value.absent(),
                Value<double> creditLimit = const Value.absent(),
                Value<String> cardType = const Value.absent(),
                Value<DateTime> statementDueDate = const Value.absent(),
                Value<DateTime> paymentDueDate = const Value.absent(),
                Value<String?> cardColorHex = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => CardsCompanion(
                id: id,
                bankName: bankName,
                creditLimit: creditLimit,
                cardType: cardType,
                statementDueDate: statementDueDate,
                paymentDueDate: paymentDueDate,
                cardColorHex: cardColorHex,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String bankName,
                required double creditLimit,
                Value<String> cardType = const Value.absent(),
                required DateTime statementDueDate,
                required DateTime paymentDueDate,
                Value<String?> cardColorHex = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => CardsCompanion.insert(
                id: id,
                bankName: bankName,
                creditLimit: creditLimit,
                cardType: cardType,
                statementDueDate: statementDueDate,
                paymentDueDate: paymentDueDate,
                cardColorHex: cardColorHex,
                createdAt: createdAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$CardsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({transactionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (transactionsRefs) db.transactions],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (transactionsRefs)
                    await $_getPrefetchedData<Card, $CardsTable, Transaction>(
                      currentTable: table,
                      referencedTable: $$CardsTableReferences
                          ._transactionsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$CardsTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) =>
                              referencedItems.where((e) => e.cardId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CardsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CardsTable,
      Card,
      $$CardsTableFilterComposer,
      $$CardsTableOrderingComposer,
      $$CardsTableAnnotationComposer,
      $$CardsTableCreateCompanionBuilder,
      $$CardsTableUpdateCompanionBuilder,
      (Card, $$CardsTableReferences),
      Card,
      PrefetchHooks Function({bool transactionsRefs})
    >;
typedef $$TransactionsTableCreateCompanionBuilder =
    TransactionsCompanion Function({
      Value<int> id,
      required int cardId,
      required String title,
      required double amount,
      required String category,
      required DateTime date,
      Value<bool> isInstallment,
      Value<double?> processingFee,
      Value<double?> interestRate,
    });
typedef $$TransactionsTableUpdateCompanionBuilder =
    TransactionsCompanion Function({
      Value<int> id,
      Value<int> cardId,
      Value<String> title,
      Value<double> amount,
      Value<String> category,
      Value<DateTime> date,
      Value<bool> isInstallment,
      Value<double?> processingFee,
      Value<double?> interestRate,
    });

final class $$TransactionsTableReferences
    extends BaseReferences<_$AppDatabase, $TransactionsTable, Transaction> {
  $$TransactionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CardsTable _cardIdTable(_$AppDatabase db) => db.cards.createAlias(
    $_aliasNameGenerator(db.transactions.cardId, db.cards.id),
  );

  $$CardsTableProcessedTableManager get cardId {
    final $_column = $_itemColumn<int>('card_id')!;

    final manager = $$CardsTableTableManager(
      $_db,
      $_db.cards,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cardIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TransactionsTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isInstallment => $composableBuilder(
    column: $table.isInstallment,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get processingFee => $composableBuilder(
    column: $table.processingFee,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get interestRate => $composableBuilder(
    column: $table.interestRate,
    builder: (column) => ColumnFilters(column),
  );

  $$CardsTableFilterComposer get cardId {
    final $$CardsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cardId,
      referencedTable: $db.cards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CardsTableFilterComposer(
            $db: $db,
            $table: $db.cards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionsTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isInstallment => $composableBuilder(
    column: $table.isInstallment,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get processingFee => $composableBuilder(
    column: $table.processingFee,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get interestRate => $composableBuilder(
    column: $table.interestRate,
    builder: (column) => ColumnOrderings(column),
  );

  $$CardsTableOrderingComposer get cardId {
    final $$CardsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cardId,
      referencedTable: $db.cards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CardsTableOrderingComposer(
            $db: $db,
            $table: $db.cards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<bool> get isInstallment => $composableBuilder(
    column: $table.isInstallment,
    builder: (column) => column,
  );

  GeneratedColumn<double> get processingFee => $composableBuilder(
    column: $table.processingFee,
    builder: (column) => column,
  );

  GeneratedColumn<double> get interestRate => $composableBuilder(
    column: $table.interestRate,
    builder: (column) => column,
  );

  $$CardsTableAnnotationComposer get cardId {
    final $$CardsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cardId,
      referencedTable: $db.cards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CardsTableAnnotationComposer(
            $db: $db,
            $table: $db.cards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransactionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransactionsTable,
          Transaction,
          $$TransactionsTableFilterComposer,
          $$TransactionsTableOrderingComposer,
          $$TransactionsTableAnnotationComposer,
          $$TransactionsTableCreateCompanionBuilder,
          $$TransactionsTableUpdateCompanionBuilder,
          (Transaction, $$TransactionsTableReferences),
          Transaction,
          PrefetchHooks Function({bool cardId})
        > {
  $$TransactionsTableTableManager(_$AppDatabase db, $TransactionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$TransactionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$TransactionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$TransactionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> cardId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<bool> isInstallment = const Value.absent(),
                Value<double?> processingFee = const Value.absent(),
                Value<double?> interestRate = const Value.absent(),
              }) => TransactionsCompanion(
                id: id,
                cardId: cardId,
                title: title,
                amount: amount,
                category: category,
                date: date,
                isInstallment: isInstallment,
                processingFee: processingFee,
                interestRate: interestRate,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int cardId,
                required String title,
                required double amount,
                required String category,
                required DateTime date,
                Value<bool> isInstallment = const Value.absent(),
                Value<double?> processingFee = const Value.absent(),
                Value<double?> interestRate = const Value.absent(),
              }) => TransactionsCompanion.insert(
                id: id,
                cardId: cardId,
                title: title,
                amount: amount,
                category: category,
                date: date,
                isInstallment: isInstallment,
                processingFee: processingFee,
                interestRate: interestRate,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$TransactionsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({cardId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (cardId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.cardId,
                            referencedTable: $$TransactionsTableReferences
                                ._cardIdTable(db),
                            referencedColumn:
                                $$TransactionsTableReferences
                                    ._cardIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TransactionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransactionsTable,
      Transaction,
      $$TransactionsTableFilterComposer,
      $$TransactionsTableOrderingComposer,
      $$TransactionsTableAnnotationComposer,
      $$TransactionsTableCreateCompanionBuilder,
      $$TransactionsTableUpdateCompanionBuilder,
      (Transaction, $$TransactionsTableReferences),
      Transaction,
      PrefetchHooks Function({bool cardId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CardsTableTableManager get cards =>
      $$CardsTableTableManager(_db, _db.cards);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db, _db.transactions);
}
