##创建用户表sys_user：

CREATE TABLE `sys_user`
(
    `id`       int(11)      NOT NULL AUTO_INCREMENT,
    `name`     varchar(255) NOT NULL,
    `password` varchar(255) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;
## 创建权限表sys_role：
CREATE TABLE `sys_role`
(
    `id`   int(11)      NOT NULL,
    `name` varchar(255) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

## 创建用户-角色表sys_user_role：

CREATE TABLE `sys_user_role`
(
    `user_id` int(11) NOT NULL,
    `role_id` int(11) NOT NULL,
    PRIMARY KEY (`user_id`, `role_id`),
    KEY `fk_role_id` (`role_id`),
    CONSTRAINT `fk_role_id` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

## 初始化一下数据：
INSERT INTO `sys_role`
VALUES ('1', 'ROLE_ADMIN');
INSERT INTO `sys_role`
VALUES ('2', 'ROLE_USER');

INSERT INTO `sys_user`
VALUES ('1', 'admin', '123');
INSERT INTO `sys_user`
VALUES ('2', 'jitwxs', '123');

INSERT INTO `sys_user_role`
VALUES ('1', '1');
INSERT INTO `sys_user_role`
VALUES ('2', '2');

## 创建一张表来存储 token 信息
CREATE TABLE `persistent_logins`
(
    `username`  varchar(64) NOT NULL,
    `series`    varchar(64) NOT NULL,
    `token`     varchar(64) NOT NULL,
    `last_used` timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`series`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;
