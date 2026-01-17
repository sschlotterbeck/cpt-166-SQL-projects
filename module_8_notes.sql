/*
1. Create Roles
Create three roles:
read_only → can only SELECT from tables.
data_entry → can INSERT into customers and orders but cannot delete data.
admin_assistant → can SELECT, INSERT, UPDATE but cannot create/drop tables.
*/
CREATE ROLE read_only;
CREATE ROLE data_entry;
CREATE ROLE admin_assistant;

/*
2. Create Users and Assign Roles
Create at least three users:
alice → assign to read_only.
bob → assign to data_entry.
carol → assign to admin_assistant.
*/
CREATE ROLE alice LOGIN;
GRANT read_only TO alice;UPDAT

CREATE ROLE bob LOGIN;
GRANT data_entry TO bob;

CREATE ROLE carol LOGIN;
GRANT admin_assistant TO carol;

/*
3. Grant and Revoke Privileges
Grant the roles the correct privileges on the appropriate tables.
Demonstrate revoking a privilege (e.g., remove UPDATE from admin_assistant on products).
*/
GRANT SELECT ON customers, orders, order_details, products, categories TO read_only;
GRANT INSERT ON customers, orders TO data_entry;
GRANT SELECT, INSERT, UPDATE ON customers, orders, order_details, products, categories TO admin_assistant;

REVOKE UPDATE ON products FROM admin_assistant;

/*
4. Test Permissions
As each user (alice, bob, carol), attempt the following actions:
alice: run a SELECT on customers (should succeed).
bob: attempt to DELETE from orders (should fail).
carol: UPDATE a product’s price (should succeed). Then try DROP TABLE products (should fail).
*/

