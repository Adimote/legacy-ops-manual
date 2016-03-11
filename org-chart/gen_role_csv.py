#!/usr/bin/env python
import pydotplus
import sys

class Role(object):
    def __init__(self, node):
        self.role_id = self.sanitize_id(node.get_name())
        self.title = self.sanitize_string(node.get('label'))
        self.email = self.sanitize_string(node.get('email'))
        self.tel = self.sanitize_string(node.get('tel'))
        self.rolesexclude = self.sanitize_bool(node.get('rolesexclude'))
        self.contactsexclude = self.sanitize_bool(node.get('contactsexclude'))

    @staticmethod
    def sanitize_id(role_id):
        return role_id.replace('_', '-')

    @staticmethod
    def sanitize_string(v):
        if v is None:
            return ""

        v = v.replace("\\n", " ")

        if v.startswith('"') and v.endswith('"'):
            return v[1:-1]
        else:
            return v

    @staticmethod
    def sanitize_bool(b):
        if b is None:
            return False

        if b.lower() == "true" or b.lower() == "yes":
            return True
        else:
            return False

    def __repr__(self):
        return "Role(id={0}, title={1}, email={2}, tel={3})".format(
            self.role_id, self.title, self.email, self.tel)


roles = []
for f in sys.argv[1:]:
    dot_file = pydotplus.graph_from_dot_file(f)
    file_roles = [Role(n) for n in dot_file.get_nodes()]
    roles += file_roles

filtered_roles = [r for r in roles if r.rolesexclude == False]
filtered_roles.sort(key=lambda r: r.title)

print "id,title,email,tel,contactsexclude"
for r in filtered_roles:
    print "{0},{1},{2},{3},{4}".format(r.role_id, r.title, r.email, r.tel, r.contactsexclude)
