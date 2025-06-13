// User roles enum
enum UserRole { user, admin, subAdmin }

// Status enum
enum StatusEnum { none, requested, accepted, rejected, blocked }

// Order status enum
enum OrderStatusEnum { pending, processing, partial, dispatched }

// Notification types enum
enum NotificationTypeEnum {
  orders,
  stockTransfer,
  userRequest,
  ordfirebaseapprocessed,
  profileUpdated,
}

// Plan types enum
enum PlanEnum { free, premium, trial }

// Entry status enum
enum EntryStatus { checked, entered, none }

UserRole userRoleFromString(String role) {
  switch (role.toLowerCase()) {
    case 'user':
      return UserRole.user;
    case 'admin':
      return UserRole.admin;
    case 'subadmin':
      return UserRole.subAdmin;
    default:
      throw Exception('Unknown role: $role');
  }
}

// Map StatusEnum from String
StatusEnum statusEnumFromString(String status) {
  switch (status.toLowerCase()) {
    case 'none':
      return StatusEnum.none;
    case 'requested':
      return StatusEnum.requested;
    case 'accepted':
      return StatusEnum.accepted;
    case 'rejected':
      return StatusEnum.rejected;
    case 'blocked':
      return StatusEnum.blocked;
    default:
      throw Exception('Unknown status: $status');
  }
}

// Map OrderStatusEnum from String
OrderStatusEnum orderStatusEnumFromString(String status) {
  switch (status.toLowerCase()) {
    case 'pending':
      return OrderStatusEnum.pending;
    case 'processing':
      return OrderStatusEnum.processing;
    case 'partial':
      return OrderStatusEnum.partial;
    case 'dispatched':
      return OrderStatusEnum.dispatched;
    default:
      throw Exception('Unknown order status: $status');
  }
}

// Map NotificationTypeEnum from String
NotificationTypeEnum notificationTypeEnumFromString(String type) {
  switch (type.toLowerCase()) {
    case 'sales-order':
      return NotificationTypeEnum.orders;
    case 'stock-transfer':
      return NotificationTypeEnum.stockTransfer;
    case 'user-request':
      return NotificationTypeEnum.userRequest;
    case 'order-processed':
      return NotificationTypeEnum.ordfirebaseapprocessed;
    case 'profile-updated':
      return NotificationTypeEnum.profileUpdated;
    default:
      throw Exception('Unknown notification type: $type');
  }
}

// Map PlanEnum from String
PlanEnum planEnumFromString(String plan) {
  switch (plan.toUpperCase()) {
    case 'FREE':
      return PlanEnum.free;
    case 'PREMIUM':
      return PlanEnum.premium;
    case 'TRIAL':
      return PlanEnum.trial;
    default:
      throw Exception('Unknown plan: $plan');
  }
}

// Map EntryStatus from String
EntryStatus entryStatusFromString(String status) {
  switch (status.toLowerCase()) {
    case 'checked':
      return EntryStatus.checked;
    case 'entered':
      return EntryStatus.entered;
    case 'none':
      return EntryStatus.none;
    default:
      throw Exception('Unknown entry status: $status');
  }
}

// Map UserRole enum to String
String? userRoleToString(UserRole? role) {
  if (role == null) return null;
  switch (role) {
    case UserRole.user:
      return 'user';
    case UserRole.admin:
      return 'admin';
    case UserRole.subAdmin:
      return 'subadmin';
  }
}

// Map StatusEnum to String
String? statusEnumToString(StatusEnum? status) {
  if (status == null) return null;
  switch (status) {
    case StatusEnum.none:
      return 'none';
    case StatusEnum.requested:
      return 'requested';
    case StatusEnum.accepted:
      return 'accepted';
    case StatusEnum.rejected:
      return 'rejected';
    case StatusEnum.blocked:
      return 'blocked';
  }
}

// Map OrderStatusEnum to String
String? orderStatusEnumToString(OrderStatusEnum? status) {
  if (status == null) return null;
  switch (status) {
    case OrderStatusEnum.pending:
      return 'pending';
    case OrderStatusEnum.processing:
      return 'processing';
    case OrderStatusEnum.partial:
      return 'partial';
    case OrderStatusEnum.dispatched:
      return 'dispatched';
  }
}

// Map NotificationTypeEnum to String
String? notificationTypeEnumToString(NotificationTypeEnum? type) {
  if (type == null) return null;
  switch (type) {
    case NotificationTypeEnum.orders:
      return 'sales-order';
    case NotificationTypeEnum.stockTransfer:
      return 'stock-transfer';
    case NotificationTypeEnum.userRequest:
      return 'user-request';
    case NotificationTypeEnum.ordfirebaseapprocessed:
      return 'order-processed';
    case NotificationTypeEnum.profileUpdated:
      return 'profile-updated';
  }
}

// Map PlanEnum to String
String? planEnumToString(PlanEnum? plan) {
  if (plan == null) return null;
  switch (plan) {
    case PlanEnum.free:
      return 'FREE';
    case PlanEnum.premium:
      return 'PREMIUM';
    case PlanEnum.trial:
      return 'TRIAL';
  }
}

// Map EntryStatus to String
String? entryStatusToString(EntryStatus? status) {
  if (status == null) return null;
  switch (status) {
    case EntryStatus.checked:
      return 'checked';
    case EntryStatus.entered:
      return 'entered';
    case EntryStatus.none:
      return 'none';
  }
}
