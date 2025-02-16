class PaymentModel {
  final int status;
  final String message;
  final List<Service> services;

  PaymentModel({
    required this.status,
    required this.message,
    required this.services,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      status: json['status'],
      message: json['message'],
      services: (json['data'] as List)
          .map((service) => Service.fromJson(service))
          .toList(),
    );
  }
}

class Service {
  final String serviceCode;
  final String serviceName;
  final String serviceIcon;
  final int serviceTariff;

  Service({
    required this.serviceCode,
    required this.serviceName,
    required this.serviceIcon,
    required this.serviceTariff,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      serviceCode: json['service_code'],
      serviceName: json['service_name'],
      serviceIcon: json['service_icon'],
      serviceTariff: json['service_tariff'],
    );
  }
}
