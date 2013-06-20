#CONSTANTS
LEVELS = ['college', 'department', 'group']
LEVEL_COLLEGE = 'college'
LEVEL_DEPT = 'department'
LEVEL_GROUP = 'group'

#NOTIFICATION CONSTANTS
NOTIFICATION_TYPES = { 1 => 'comment', 2 => 'like', 3 => 'post', 4 => 'approve', 5 => 'follow' }

COMMENT = 'comment'
POST = 'post'
USER = 'user'
DEPARTMENT = 'department'
COLLEGE = 'college'
GROUP = 'group'

COMMENT_NOTIFICATION_TYPE = 1
LIKE_NOTIFICATION_TYPE = 2
POST_NOTIFICATION_TYPE = 3
APPROVE_NOTIFICATION_TYPE = 4
FOLLOW_NOTIFICATION_TYPE = 5


#ACCESS_RIGHTS
ACCESS_RIGHTS = {1 => 'read', 2 => 'write', 3 => 'admin'}
READ = 'read'
WRITE = 'write'
ADMIN = 'admin'

READ_ACCESS_RIGHT = 1
WRITE_ACCESS_RIGHT = 2
ADMIN_ACCESS_RIGHT = 3


#EVENT CONSTANTS
EVENT_TYPES = { 1 => 'comment', 2 => 'like', 3 => 'post', 4 => 'joined', 5 => 'following'}
COMMENT_EVENT_TYPE = 1
LIKE_EVENT_TYPE = 2
POST_EVENT_TYPE = 3
JOINED_EVENT_TYPE = 4
FOLLOWING_EVENT_TYPE = 5

#CONTENT_TYPE
TCONTENT_TYPES = {1 => 'post', 2 => 'user', 3 => 'college', 4 => 'department', 5 => 'group'}
POST_TCONTENT_TYPE = 1
USER_TCONTENT_TYPE = 2
COLLEGE_TCONTENT_TYPE = 3
DEPARTMENT_TCONTENT_TYPE = 4
GROUP_TCONTENT_TYPE = 5

#INBOX
CHECKED_INBOX = 1
UNCHECKED_INBOX = 0
