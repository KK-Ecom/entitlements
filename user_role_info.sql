-- query to fetch the user role information
SELECT
u.userName AS user_name,
r.roleName AS role_name,
a.appName as application_name,
f.featureName as feature_name,
pt.permissionTypeName AS permission_name
FROM users u
JOIN user_roles ur ON u.user_id = ur.user_id
JOIN roles r ON ur.role_id = r.role_id
JOIN role_permissions rp ON r.role_id = rp.role_id
JOIN permissions p ON rp.permission_id = p.permission_id
JOIN application_features f ON p.feature_id = f.feature_id
JOIN applications a ON f.app_id = a.app_id
JOIN permission_types pt ON p.permission_type_id = pt.permission_type_id 
WHERE u.user_id = 2;