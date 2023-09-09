# entitlements
This repo is to handle the entitlements(Permission to access a feature) of a user.

TABLES:
```
1. USERS: Table to store information about users, including their identifiers and login credentials
2. APPLICATIONS: Table to store list of Applications
3. APPLICATION_FEATURES: Table to store information about the features associated with each application
4. ROLES: Table defines various roles that users can have within different applications e.g. ADVISOR, CORPORATE, REGIONAL
5. PERMISSION_TYPES: Table defines various permission types available for different features. e.g. ALL, READ, ADD, UPDATE, DELETE, UPLOAD_FOR_APPROVAL, UPLOAD_AND_SAVE
6. PERMISSIONS: Table stores infromation about individual permission of features within applications
7. ROLE_PERMISSIONS: It's a ampping table which establishes the relationship between roles and the permissions they have
8. USER_ROLES: This table links users to their assigned roles.
```

EER DIAGRAM:
![alt text](https://github.com/KK-Ecom/entitlements/blob/main/entitlements_EER.png)

QUERY FOR ENTITLEMENTS OF A USER:
```sql
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
```

OUTPUT:
![alt text](https://github.com/KK-Ecom/entitlements/blob/main/user_role_info.png)