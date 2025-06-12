class Kafeel {
  final int? id;
  final String kafeelName;
  final String kafeelAddress;
  final String kafeelPhoneNumber;
  final bool isHasDebt;
  final double kafeelMonthlyPayment;
  final int dateOfContact; // Day of month (1-31)
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? lastContactDate;
  final bool isCompleted; // Whether payment was collected this month

  Kafeel({
    this.id,
    required this.kafeelName,
    required this.kafeelAddress,
    required this.kafeelPhoneNumber,
    this.isHasDebt = true,
    required this.kafeelMonthlyPayment,
    required this.dateOfContact,
    required this.createdAt,
    this.updatedAt,
    this.lastContactDate,
    this.isCompleted = false,
  });

  // Convert TaxTodo to Map for database storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'kafeel_name': kafeelName,
      'kafeel_address': kafeelAddress,
      'kafeel_phone_number': kafeelPhoneNumber,
      'is_has_debt': isHasDebt ? 1 : 0,
      'kafeel_monthly_payment': kafeelMonthlyPayment,
      'date_of_contact': dateOfContact,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'last_contact_date': lastContactDate?.toIso8601String(),
      'is_completed': isCompleted ? 1 : 0,
    };
  }

  // Create TaxTodo from Map (database result)
  factory Kafeel.fromMap(Map<String, dynamic> map) {
    return Kafeel(
      id: map['id'],
      kafeelName: map['kafeel_name'],
      kafeelAddress: map['kafeel_address'],
      kafeelPhoneNumber: map['kafeel_phone_number'],
      isHasDebt: map['is_has_debt'] == 1,
      kafeelMonthlyPayment: map['kafeel_monthly_payment'].toDouble(),
      dateOfContact: map['date_of_contact'],
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: map['updated_at'] != null
          ? DateTime.parse(map['updated_at'])
          : null,
      lastContactDate: map['last_contact_date'] != null
          ? DateTime.parse(map['last_contact_date'])
          : null,
      isCompleted: map['is_completed'] == 1,
    );
  }

  // Create a copy with updated fields
  Kafeel copyWith({
    int? id,
    String? kafeelName,
    String? kafeelAddress,
    String? kafeelPhoneNumber,
    bool? isHasDebt,
    double? kafeelMonthlyPayment,
    int? dateOfContact,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? lastContactDate,
    bool? isCompleted,
  }) {
    return Kafeel(
      id: id ?? this.id,
      kafeelName: kafeelName ?? this.kafeelName,
      kafeelAddress: kafeelAddress ?? this.kafeelAddress,
      kafeelPhoneNumber: kafeelPhoneNumber ?? this.kafeelPhoneNumber,
      isHasDebt: isHasDebt ?? this.isHasDebt,
      kafeelMonthlyPayment: kafeelMonthlyPayment ?? this.kafeelMonthlyPayment,
      dateOfContact: dateOfContact ?? this.dateOfContact,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastContactDate: lastContactDate ?? this.lastContactDate,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
