/*
 Navicat Premium Dump SQL

 Source Server         : aliyun
 Source Server Type    : MySQL
 Source Server Version : 80200 (8.2.0)
 Source Host           : 47.94.76.140:3306
 Source Schema         : newbie3

 Target Server Type    : MySQL
 Target Server Version : 80200 (8.2.0)
 File Encoding         : 65001

 Date: 08/10/2024 11:26:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_config
-- ----------------------------
DROP TABLE IF EXISTS `gen_config`;
CREATE TABLE `gen_config`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id主键',
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '作者',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `date_format` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日期格式',
  `package_parent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '父级包名',
  `module_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模块名',
  `table_prefix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表名前缀，多个以逗号分隔',
  `enable_api_auth` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '接口权限控制，1开启 0关闭',
  `enable_spring_doc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '接口文档，1开启 0关闭',
  `enable_drawer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'ui抽屉组件，1开启 0关闭',
  `config_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '配置名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '生成器配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_config
-- ----------------------------
INSERT INTO `gen_config` VALUES ('1843486172630745090', 'ZhangYuGe', '398698424@qq.com', 'yyyy-MM-dd', 'com.newbie', 'business', 't_', '1', '1', '1', '业务', NULL, 'admin', '2024-10-08 10:58:49', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门名称',
  `parent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '父级id',
  `ancestors` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '祖级列表',
  `sort` int NULL DEFAULT 1 COMMENT '显示顺序',
  `leader` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '状态（1正常 0停用）',
  `tier` int NULL DEFAULT NULL COMMENT '层级',
  `home_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '首页路由地址',
  `remark` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('270', '公司总部', '0', '270', 1, '张三', '13566666666', 'zhangsan@newbie.com', '1', 1, NULL, '描述信息', 'admin', '2023-11-28 19:42:59', 'admin', '2023-11-28 20:57:50');
INSERT INTO `sys_dept` VALUES ('271', '山东分公司', '270', '270,271', 1, '张三', '13566666666', 'zhangsan@newbie.com', '1', 2, NULL, '描述信息', 'admin', '2023-11-28 19:43:42', 'admin', '2023-11-28 20:57:50');
INSERT INTO `sys_dept` VALUES ('272', '河南分公司', '270', '270,272', 2, '李四', '13566666666', 'lisi@newbie.com', '1', 2, NULL, '描述信息', 'admin', '2023-11-28 19:46:35', 'admin', '2023-11-28 20:57:50');
INSERT INTO `sys_dept` VALUES ('273', '云南分公司', '270', '270,273', 3, '王五', '13566666666', 'wangwu@newbie.com', '1', 2, NULL, '描述信息', 'admin', '2023-11-28 19:51:00', 'admin', '2023-11-28 20:57:50');
INSERT INTO `sys_dept` VALUES ('274', '河北分公司', '270', '270,274', 4, '赵六', '13599999999', 'zhaoliu@newbie.com', '1', 2, NULL, '描述信息', 'admin', '2023-11-28 19:51:55', 'admin', '2023-11-28 20:57:50');
INSERT INTO `sys_dept` VALUES ('275', '东营分部', '271', '270,271,275', 2, '悟空', '13234435454', 'wukong@newbie.com', '1', 3, NULL, '描述信息', 'admin', '2023-11-28 19:53:38', 'admin', '2023-11-28 20:57:50');
INSERT INTO `sys_dept` VALUES ('276', '济南分部', '271', '270,271,276', 1, '八戒', '15543547357', 'bajie@newbie.com', '1', 3, NULL, '描述信息', 'admin', '2023-11-28 19:55:25', 'admin', '2023-11-28 20:57:50');
INSERT INTO `sys_dept` VALUES ('277', '昆明分部', '273', '270,273,277', 1, '三藏', '16546273436', 'sanzang@newbie.com', '1', 3, NULL, '', 'admin', '2023-11-28 19:56:21', 'admin', '2023-11-28 20:57:50');
INSERT INTO `sys_dept` VALUES ('278', '济宁分部', '271', '270,271,278', 4, '阿虎', '16323242332', 'ahu@newbie.com', '1', 3, NULL, '', 'admin', '2023-11-28 19:57:47', 'admin', '2023-11-28 20:57:50');
INSERT INTO `sys_dept` VALUES ('279', '菏泽分部', '271', '270,271,279', 5, '石头', '16767466463', 'shitou@newbie.com', '1', 3, NULL, '', 'admin', '2023-11-28 19:58:35', 'admin', '2023-11-28 20:57:50');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `label` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签',
  `value` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '值',
  `type_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字典类型ID',
  `ele_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '元素类型',
  `ele_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '元素样式类名',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '状态（1正常 0禁用）',
  `def` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '默认，Y/N',
  `sort` int NULL DEFAULT 0 COMMENT '排序字段',
  `remark` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统字典数据' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('16', '女', '0', '33', 'danger', NULL, '1', 'N', 1, '', NULL, '2024-02-21 17:10:58', NULL, '2024-03-09 22:38:57');
INSERT INTO `sys_dict_data` VALUES ('19', '男', '1', '33', 'primary', NULL, '1', 'N', 2, '', NULL, '2024-03-09 13:28:37', NULL, '2024-03-09 23:16:49');
INSERT INTO `sys_dict_data` VALUES ('20', '正常', '1', '35', 'primary', NULL, '1', 'Y', 1, '', NULL, '2024-03-09 21:02:49', NULL, '2024-03-09 23:16:45');
INSERT INTO `sys_dict_data` VALUES ('21', '锁定', '0', '35', 'info', NULL, '1', 'N', 2, '', NULL, '2024-03-09 21:02:59', NULL, '2024-03-09 22:36:03');
INSERT INTO `sys_dict_data` VALUES ('22', '正常', '1', '37', 'primary', 'status-enable status-box', '1', 'Y', 1, '', NULL, '2024-03-09 21:34:07', 'admin', '2024-09-05 17:16:21');
INSERT INTO `sys_dict_data` VALUES ('23', '禁用', '0', '37', 'info', 'status-disabled status-box', '1', 'N', 2, '', NULL, '2024-03-09 21:34:15', 'admin', '2024-09-05 17:16:19');
INSERT INTO `sys_dict_data` VALUES ('25', '未知', '2', '33', 'warning', NULL, '1', 'Y', 3, '', NULL, '2024-03-09 22:24:30', NULL, '2024-03-09 22:37:53');
INSERT INTO `sys_dict_data` VALUES ('26', 'primary', 'primary', '38', 'primary', '', '1', 'Y', 1, '', NULL, '2024-03-09 22:53:21', 'admin', '2024-04-18 14:48:24');
INSERT INTO `sys_dict_data` VALUES ('27', 'success', 'success', '38', 'success', '', '1', 'N', 2, '', NULL, '2024-03-09 22:53:30', NULL, '2024-03-09 23:17:28');
INSERT INTO `sys_dict_data` VALUES ('28', 'info', 'info', '38', 'info', '', '1', 'N', 3, '', NULL, '2024-03-09 22:53:39', NULL, '2024-03-09 23:17:33');
INSERT INTO `sys_dict_data` VALUES ('29', 'warning', 'warning', '38', 'warning', '', '1', 'N', 4, '', NULL, '2024-03-09 22:53:46', NULL, '2024-03-09 23:17:36');
INSERT INTO `sys_dict_data` VALUES ('30', 'danger', 'danger', '38', 'danger', '', '1', 'N', 5, '', NULL, '2024-03-09 22:53:54', NULL, '2024-03-09 23:17:40');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `type_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典类型名称',
  `type_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类型编码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '状态（1正常 0禁用）',
  `sort` int NULL DEFAULT 0 COMMENT '排序字段',
  `remark` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `type_code`(`type_code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统字典类型' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('33', '用户性别', 'userGender', '1', 2, '', 'admin', '2024-02-21 17:10:39', 'admin', '2024-09-04 17:44:36');
INSERT INTO `sys_dict_type` VALUES ('35', '用户状态', 'userStatus', '1', 3, '', 'admin', '2024-03-09 21:02:27', 'admin', '2024-03-09 22:50:28');
INSERT INTO `sys_dict_type` VALUES ('37', '通用状态', 'commonStatus', '1', 1, '通用状态', 'admin', '2024-03-09 21:32:14', 'admin', '2024-09-12 13:24:56');
INSERT INTO `sys_dict_type` VALUES ('38', '元素类型', 'eleType', '1', 4, '元素类型', 'admin', '2024-03-09 22:52:58', 'admin', '2024-03-10 13:41:31');

-- ----------------------------
-- Table structure for sys_log_login
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_login`;
CREATE TABLE `sys_log_login`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '状态 1 成功，0 失败',
  `login_ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '登录IP',
  `login_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '登录方式',
  `fail_reason` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '失败原因',
  `os` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作系统',
  `browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浏览器信息',
  `cost_time` bigint NULL DEFAULT NULL COMMENT '消耗时长，毫秒',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `login_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '1 登入，0 登出',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统登录日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_log_login
-- ----------------------------
INSERT INTO `sys_log_login` VALUES ('1831256785962856449', '1', '192.168.2.5', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(128.0.0.0)', 578, '2024-09-04 17:03:36', '1', 'admin');
INSERT INTO `sys_log_login` VALUES ('1831628821562351618', '1', '192.168.2.5', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(128.0.0.0)', 167, '2024-09-05 17:41:56', '0', 'admin');
INSERT INTO `sys_log_login` VALUES ('1831628839597858817', '1', '192.168.2.5', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(128.0.0.0)', 563, '2024-09-05 17:42:00', '1', 'admin');
INSERT INTO `sys_log_login` VALUES ('1831632380014059522', '1', '192.168.2.5', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(128.0.0.0)', 175, '2024-09-05 17:56:04', '0', 'admin');
INSERT INTO `sys_log_login` VALUES ('1831632394241138689', '1', '192.168.2.5', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(128.0.0.0)', 554, '2024-09-05 17:56:08', '1', 'admin');
INSERT INTO `sys_log_login` VALUES ('1831632416261234689', '1', '192.168.2.5', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(128.0.0.0)', 140, '2024-09-05 17:56:13', '0', 'admin');
INSERT INTO `sys_log_login` VALUES ('1834064314715324417', '0', '192.168.2.102', 'username', '验证码不正确', 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(128.0.0.0)', 67, '2024-09-12 10:59:43', '1', '123456');
INSERT INTO `sys_log_login` VALUES ('1834064340942307329', '1', '192.168.2.102', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(128.0.0.0)', 1492, '2024-09-12 10:59:49', '1', 'admin');
INSERT INTO `sys_log_login` VALUES ('1834098055454076929', '1', '192.168.2.102', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(128.0.0.0)', 303, '2024-09-12 13:13:47', '0', 'admin');
INSERT INTO `sys_log_login` VALUES ('1834098071090442241', '1', '192.168.2.102', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(128.0.0.0)', 978, '2024-09-12 13:13:51', '1', 'admin');
INSERT INTO `sys_log_login` VALUES ('1834107333540642817', '1', '172.31.222.26', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(128.0.0.0)', 99, '2024-09-12 13:50:39', '1', 'admin');
INSERT INTO `sys_log_login` VALUES ('1834107711195774977', '1', '172.31.222.26', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(128.0.0.0)', 8, '2024-09-12 13:52:09', '0', 'admin');
INSERT INTO `sys_log_login` VALUES ('1834107726106525697', '0', '172.31.222.26', 'username', '验证码不正确', 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(128.0.0.0)', 4, '2024-09-12 13:52:13', '1', 'admin');
INSERT INTO `sys_log_login` VALUES ('1834107747233234946', '1', '172.31.222.26', 'username', NULL, 'Windows 10 or Windows Server 2016(10.0)', 'Chrome(128.0.0.0)', 91, '2024-09-12 13:52:18', '1', 'admin');

-- ----------------------------
-- Table structure for sys_log_operate
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_operate`;
CREATE TABLE `sys_log_operate`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '状态，1 成功，0 失败',
  `fail_reason` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '失败原因',
  `client_ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户端IP',
  `target_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求路径',
  `target_fun` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行的类方法',
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求方式',
  `cost_time` bigint NULL DEFAULT NULL COMMENT '消耗时长，毫秒',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统操作日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_log_operate
-- ----------------------------
INSERT INTO `sys_log_operate` VALUES ('1834064342443868161', 'admin', '0', 'java.io.FileNotFoundException: D:\\project\\upload\\public\\2024\\09\\04\\_4k_uhd__anastasia_by_assassinwarrior_daikgux1853.jpg (系统找不到指定的路径。)', '192.168.2.102', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 8, '2024-09-12 10:59:49');
INSERT INTO `sys_log_operate` VALUES ('1834064362568138753', 'admin', '0', 'java.io.FileNotFoundException: D:\\project\\upload\\public\\2024\\09\\04\\_4k_uhd__anastasia_by_assassinwarrior_daikgux1853.jpg (系统找不到指定的路径。)', '192.168.2.102', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 1, '2024-09-12 10:59:54');
INSERT INTO `sys_log_operate` VALUES ('1834068828948217857', 'admin', '0', 'java.io.FileNotFoundException: D:\\project\\upload\\public\\2024\\09\\04\\_4k_uhd__anastasia_by_assassinwarrior_daikgux1853.jpg (系统找不到指定的路径。)', '192.168.2.102', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 0, '2024-09-12 11:17:39');
INSERT INTO `sys_log_operate` VALUES ('1834097950374178818', 'admin', '0', 'java.io.FileNotFoundException: D:\\project\\upload\\public\\2024\\09\\04\\_4k_uhd__anastasia_by_assassinwarrior_daikgux1853.jpg (系统找不到指定的路径。)', '192.168.2.102', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 5, '2024-09-12 13:13:22');
INSERT INTO `sys_log_operate` VALUES ('1834097968401297410', 'admin', '0', 'java.io.FileNotFoundException: D:\\project\\upload\\public\\2024\\09\\04\\_4k_uhd__anastasia_by_assassinwarrior_daikgux1853.jpg (系统找不到指定的路径。)', '192.168.2.102', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 5, '2024-09-12 13:13:26');
INSERT INTO `sys_log_operate` VALUES ('1834097979449094145', 'admin', '0', 'java.io.FileNotFoundException: D:\\project\\upload\\public\\2024\\09\\04\\_4k_uhd__anastasia_by_assassinwarrior_daikgux1853.jpg (系统找不到指定的路径。)', '192.168.2.102', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 1, '2024-09-12 13:13:29');
INSERT INTO `sys_log_operate` VALUES ('1834097986361307137', 'admin', '0', 'java.io.FileNotFoundException: D:\\project\\upload\\public\\2024\\09\\04\\_4k_uhd__anastasia_by_assassinwarrior_daikgux1853.jpg (系统找不到指定的路径。)', '192.168.2.102', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 0, '2024-09-12 13:13:30');
INSERT INTO `sys_log_operate` VALUES ('1834101399765594114', 'admin', '0', 'java.io.FileNotFoundException: D:\\project\\upload\\public\\2024\\04\\30\\wallhaven-7pmkj30394.png (系统找不到指定的路径。)', '192.168.2.102', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 1, '2024-09-12 13:27:04');
INSERT INTO `sys_log_operate` VALUES ('1834101406237405185', 'admin', '0', 'java.io.FileNotFoundException: D:\\project\\upload\\public\\2024\\04\\30\\wallhaven-7pmkj30394.png (系统找不到指定的路径。)', '192.168.2.102', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 4, '2024-09-12 13:27:06');
INSERT INTO `sys_log_operate` VALUES ('1834101412277202946', 'admin', '0', 'java.io.FileNotFoundException: D:\\project\\upload\\public\\2024\\04\\30\\wallhaven-7pmkj30394.png (系统找不到指定的路径。)', '192.168.2.102', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 0, '2024-09-12 13:27:07');
INSERT INTO `sys_log_operate` VALUES ('1834101432581828609', 'admin', '0', 'java.io.FileNotFoundException: D:\\project\\upload\\public\\2024\\04\\30\\wallhaven-7pmkj30394.png (系统找不到指定的路径。)', '192.168.2.102', '/file/download', 'com.newbie.controller.file.FileController.download', 'GET', 0, '2024-09-12 13:27:12');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单标题',
  `parent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '父菜单ID',
  `sort` int NULL DEFAULT 1 COMMENT '排序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '菜单状态（1正常 0停用）',
  `route_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由地址',
  `route_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由name',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `remark` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_keep` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否缓存组件（1缓存 0不缓存）',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '菜单类型（1菜单 0按钮）',
  `is_hide` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否隐藏菜单（1是 0否 ）',
  `perm` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `hide_children` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否隐藏子级菜单（1是 0否）',
  `iframe_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内嵌外链接地址',
  `is_outer` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否在layout外显示（1是 0否）',
  `transition` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '切换动画',
  `fixed_tab` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否固定在tabs（1是 0否）',
  `ancestors` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '祖级列表',
  `tier` int NULL DEFAULT NULL COMMENT '层级',
  `route_redirect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由地址重定向',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1795419039163936769', '系统监控', '0', 3, '1', '/monitor', NULL, NULL, NULL, 'admin', '2024-05-28 19:37:10', 'admin', '2024-05-28 19:42:41', '0', '1', '0', NULL, 'CarbonCloudMonitoring', '0', NULL, '0', NULL, '0', '1795419039163936769', 1, '/monitor/server');
INSERT INTO `sys_menu` VALUES ('1795424113898455041', '操作日志', '1795419039163936769', 20, '1', '/monitor/operatelog', 'SysLogOperate', 'monitor/logOperate/index', NULL, 'admin', '2024-05-28 19:57:20', 'admin', '2024-05-28 20:06:45', '0', '1', '0', 'sys.log.operate', 'MaterialSymbolsDataInfoAlertRounded', '0', NULL, '0', NULL, '0', '1795419039163936769,1795424113898455041', 2, NULL);
INSERT INTO `sys_menu` VALUES ('1795426597572345858', '删除', '1795424113898455041', 10, '1', NULL, NULL, NULL, NULL, 'admin', '2024-05-28 20:07:12', 'admin', '2024-05-28 20:07:12', NULL, '0', NULL, 'sys.log.operate.del', NULL, NULL, NULL, NULL, NULL, NULL, '1795419039163936769,1795424113898455041,1795426597572345858', 3, NULL);
INSERT INTO `sys_menu` VALUES ('1795426808940101633', '登录日志', '1795419039163936769', 30, '1', '/monitor/loginlog', 'SysLogLogin', 'monitor/logLogin/index', NULL, 'admin', '2024-05-28 20:08:03', 'admin', '2024-05-28 20:08:43', '0', '1', '0', 'sys.log.login', 'MaterialSymbolsDataInfoAlertRounded', '0', NULL, '0', NULL, '0', '1795419039163936769,1795426808940101633', 2, NULL);
INSERT INTO `sys_menu` VALUES ('1795427077400723458', '删除', '1795426808940101633', 10, '1', NULL, NULL, NULL, NULL, 'admin', '2024-05-28 20:09:07', 'admin', '2024-05-28 20:09:07', NULL, '0', NULL, 'sys.log.login.del', NULL, NULL, NULL, NULL, NULL, NULL, '1795419039163936769,1795426808940101633,1795427077400723458', 3, NULL);
INSERT INTO `sys_menu` VALUES ('1796439829787398145', '服务监控', '1795419039163936769', 50, '1', '/monitor/server', 'SysServerMonitor', 'monitor/serverMonitor/index', '', 'admin', '2024-05-31 15:13:26', 'admin', '2024-06-04 16:01:59', '0', '1', '0', 'sys.monitor.server', 'CarbonCloudMonitoring', '0', '', '0', '', '0', '1795419039163936769,1796439829787398145', 2, NULL);
INSERT INTO `sys_menu` VALUES ('1840579422453780482', '开发工具', '0', 100, '1', '/devtool', '', '', '', 'admin', '2024-09-30 10:28:25', 'admin', '2024-09-30 10:30:59', '0', '1', '0', '', 'TdesignSystemSetting', '0', '', '0', '', '0', '1840579422453780482', 1, '');
INSERT INTO `sys_menu` VALUES ('1840580008502906881', '代码生成器', '1840579422453780482', 1, '1', '/dev-tool/generator', 'Generator', 'dev-tool/generator/index', '', 'admin', '2024-09-30 10:30:45', 'admin', '2024-09-30 10:30:45', '0', '1', '0', '', 'CarbonCloudMonitoring', '0', '', '0', '', '0', '1840579422453780482,1840580008502906881', 2, '');
INSERT INTO `sys_menu` VALUES ('2008', '系统管理', '0', 2, '1', '/system', NULL, '', NULL, 'admin', '2023-02-26 01:31:55', 'admin', '2023-11-28 20:58:16', '0', '1', '0', 'sys', 'TdesignSystemSetting', '0', '', '0', NULL, '0', '2008', 1, '/system/user');
INSERT INTO `sys_menu` VALUES ('2009', '用户管理', '2008', 1, '1', '/system/user', 'SysUser', 'system/user/index', NULL, 'admin', '2023-02-26 01:49:34', 'admin', '2024-04-23 19:04:05', '0', '1', '0', 'sys.user', 'MaterialSymbolsManageAccountsOutlineRounded', '0', '', '0', NULL, '0', '2008,2009', 2, NULL);
INSERT INTO `sys_menu` VALUES ('2010', '角色管理', '2008', 2, '1', '/system/role', 'SysRole', 'system/role/index', NULL, 'admin', '2023-02-26 02:31:10', 'admin', '2024-05-02 14:45:13', '0', '1', '0', 'sys.role', 'CarbonUserRole', '0', '', '0', '', '0', '2008,2010', 2, NULL);
INSERT INTO `sys_menu` VALUES ('2013', '菜单管理', '2008', 3, '1', '/system/menu', 'SysMenu', 'system/menu/index', NULL, 'admin', '2023-02-26 23:11:00', 'admin', '2024-04-23 19:00:35', '0', '1', '0', 'sys.menu', 'FluentTextBulletListTree16Regular', '0', '', '0', NULL, '0', '2008,2013', 2, NULL);
INSERT INTO `sys_menu` VALUES ('2042', '首页', '0', 0, '1', '/home', '', 'home/index', '', 'admin', '2023-07-31 05:37:08', 'admin', '2024-05-28 14:34:03', '0', '1', '0', '', 'ep:home-filled', '0', '', '0', NULL, '1', '2042', 1, NULL);
INSERT INTO `sys_menu` VALUES ('2050', '新增', '2013', 1, '1', NULL, NULL, NULL, '菜单新增按钮', 'admin', '2023-08-27 15:54:22', 'admin', '2024-04-18 16:04:23', '0', '0', '0', 'sys.menu.add', NULL, NULL, '', '0', NULL, '0', '2008,2013,2050', 3, NULL);
INSERT INTO `sys_menu` VALUES ('2051', '修改', '2013', 2, '1', NULL, NULL, NULL, '菜单编辑按钮', 'admin', '2023-08-27 15:54:58', 'admin', '2024-04-18 18:04:41', '0', '0', '0', 'sys.menu.update', NULL, NULL, '', '0', NULL, '0', '2008,2013,2051', 3, NULL);
INSERT INTO `sys_menu` VALUES ('2052', '删除', '2013', 3, '1', NULL, NULL, NULL, '菜单删除按钮', 'admin', '2023-08-27 15:55:21', 'admin', '2024-04-18 16:04:54', '0', '0', '0', 'sys.menu.del', NULL, NULL, '', '0', NULL, '0', '2008,2013,2052', 3, NULL);
INSERT INTO `sys_menu` VALUES ('2069', '前端文档', '2072', 98, '1', 'https://zhangyuge7.github.io/preview/five-admin-v2-docs/', '', '', '', 'admin', '2023-11-10 15:03:57', 'admin', '2024-05-18 17:13:56', '0', '1', '0', '', 'ep:document', '0', '', '0', NULL, '0', '2072,2069', 2, NULL);
INSERT INTO `sys_menu` VALUES ('2071', '部门管理', '2008', 6, '1', '/system/dept', 'SysDept', 'system/dept/index', '', 'admin', '2023-11-18 22:46:58', 'admin', '2024-04-23 19:00:55', '0', '1', '0', 'sys.dept', 'MingcuteDepartmentLine', '0', '', '0', '', '0', '2008,2071', 2, NULL);
INSERT INTO `sys_menu` VALUES ('2072', '文档', '0', 22, '1', '/docs', '', '', '', 'admin', '2023-11-19 00:04:13', 'admin', '2024-09-12 13:47:28', '0', '1', '0', '', 'StreamlineInterfaceSettingMenu1ButtonParallelHorizontalLinesMenuNavigationThreeHamburger', '0', '', '0', '', '0', '2072', 1, NULL);
INSERT INTO `sys_menu` VALUES ('3009', '字典分类', '2008', 10, '1', '/system/dict/type', 'SysDeptType', 'system/dictType/index', '', 'admin', '2023-11-19 22:33:46', 'admin', '2024-04-23 19:01:22', '0', '1', '1', 'sys.dict.type', 'MingcuteBook5Line', '0', '', '0', '', '0', '2008,3009', 2, NULL);
INSERT INTO `sys_menu` VALUES ('3010', '字典管理', '2008', 11, '1', '/system/dict/data', 'SysDictData', 'system/dictData/index', '', 'admin', '2024-02-20 11:29:06', 'admin', '2024-04-23 19:01:48', '0', '1', '0', 'sys.dict.data', 'SolarNotebookMinimalisticLinear', '0', '', '0', '', '0', '2008,3010', 2, NULL);
INSERT INTO `sys_menu` VALUES ('3015', '个人中心', '0', 99, '1', '/personal-center', 'PersonalCenter', 'personalCenter/index', '', 'admin', '2024-03-22 12:38:00', 'admin', '2024-05-24 11:17:16', '0', '1', '0', '', 'CarbonUserRole', '0', '', '0', '', '0', '3015', 1, NULL);
INSERT INTO `sys_menu` VALUES ('3038', '新增', '2009', 1, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 16:06:10', NULL, NULL, '0', '0', '0', 'sys.user.add', NULL, '0', NULL, '0', NULL, '0', '2008,2009,3038', 3, NULL);
INSERT INTO `sys_menu` VALUES ('3039', '修改', '2009', 2, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 16:06:22', 'admin', '2024-04-18 16:07:44', '0', '0', '0', 'sys.user.update', NULL, '0', NULL, '0', NULL, '0', '2008,2009,3039', 3, NULL);
INSERT INTO `sys_menu` VALUES ('3040', '删除', '2009', 3, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 16:06:34', NULL, NULL, '0', '0', '0', 'sys.user.del', NULL, '0', NULL, '0', NULL, '0', '2008,2009,3040', 3, NULL);
INSERT INTO `sys_menu` VALUES ('3041', '修改密码', '2009', 4, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 16:07:24', NULL, NULL, '0', '0', '0', 'sys.user.update.password', NULL, '0', NULL, '0', NULL, '0', '2008,2009,3041', 3, NULL);
INSERT INTO `sys_menu` VALUES ('3042', '新增', '2010', 1, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 16:09:31', NULL, NULL, '0', '0', '0', 'sys.role.add', NULL, '0', NULL, '0', NULL, '0', '2008,2010,3042', 3, NULL);
INSERT INTO `sys_menu` VALUES ('3043', '修改', '2010', 2, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 16:09:46', NULL, NULL, '0', '0', '0', 'sys.role.update', NULL, '0', NULL, '0', NULL, '0', '2008,2010,3043', 3, NULL);
INSERT INTO `sys_menu` VALUES ('3044', '删除', '2010', 3, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:02:04', NULL, NULL, '0', '0', '0', 'sys.role.del', NULL, '0', NULL, '0', NULL, '0', '2008,2010,3044', 3, NULL);
INSERT INTO `sys_menu` VALUES ('3045', '权限', '2010', 4, '1', NULL, NULL, NULL, '分配权限按钮', 'admin', '2024-04-18 18:03:10', NULL, NULL, '0', '0', '0', 'sys.role.perm', NULL, '0', NULL, '0', NULL, '0', '2008,2010,3045', 3, NULL);
INSERT INTO `sys_menu` VALUES ('3046', '用户', '2010', 5, '1', NULL, NULL, NULL, '分配用户按钮', 'admin', '2024-04-18 18:03:35', NULL, NULL, '0', '0', '0', 'sys.role.user', NULL, '0', NULL, '0', NULL, '0', '2008,2010,3046', 3, NULL);
INSERT INTO `sys_menu` VALUES ('3047', '新增', '2071', 1, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:04:07', NULL, NULL, '0', '0', '0', 'sys.dept.add', NULL, '0', NULL, '0', NULL, '0', '2008,2071,3047', 3, NULL);
INSERT INTO `sys_menu` VALUES ('3048', '修改', '2071', 2, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:04:25', NULL, NULL, '0', '0', '0', 'sys.dept.update', NULL, '0', NULL, '0', NULL, '0', '2008,2071,3048', 3, NULL);
INSERT INTO `sys_menu` VALUES ('3049', '删除', '2071', 3, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:04:57', NULL, NULL, '0', '0', '0', 'sys.dept.del', NULL, '0', NULL, '0', NULL, '0', '2008,2071,3049', 3, NULL);
INSERT INTO `sys_menu` VALUES ('3050', '新增', '3009', 1, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:05:37', 'admin', '2024-04-18 18:05:53', '0', '0', '0', 'sys.dict.type.add', NULL, '0', NULL, '0', NULL, '0', '2008,3009,3050', 3, NULL);
INSERT INTO `sys_menu` VALUES ('3051', '修改', '3009', 2, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:06:25', NULL, NULL, '0', '0', '0', 'sys.dict.type.update', NULL, '0', NULL, '0', NULL, '0', '2008,3009,3051', 3, NULL);
INSERT INTO `sys_menu` VALUES ('3052', '删除', '3009', 3, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:06:40', NULL, NULL, '0', '0', '0', 'sys.dict.type.del', NULL, '0', NULL, '0', NULL, '0', '2008,3009,3052', 3, NULL);
INSERT INTO `sys_menu` VALUES ('3053', '新增', '3010', 1, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:07:10', NULL, NULL, '0', '0', '0', 'sys.dict.data.add', NULL, '0', NULL, '0', NULL, '0', '2008,3010,3053', 3, NULL);
INSERT INTO `sys_menu` VALUES ('3054', '修改', '3010', 2, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:07:25', NULL, NULL, '0', '0', '0', 'sys.dict.data.update', NULL, '0', NULL, '0', NULL, '0', '2008,3010,3054', 3, NULL);
INSERT INTO `sys_menu` VALUES ('3055', '删除', '3010', 3, '1', NULL, NULL, NULL, '', 'admin', '2024-04-18 18:07:48', NULL, NULL, '0', '0', '0', 'sys.dict.data.del', NULL, '0', NULL, '0', NULL, '0', '2008,3010,3055', 3, NULL);
INSERT INTO `sys_menu` VALUES ('3056', '默认', '3010', 4, '1', NULL, NULL, NULL, '字典数据设置默认的按钮', 'admin', '2024-04-18 18:08:52', NULL, NULL, '0', '0', '0', 'sys.dict.data.def', NULL, '0', NULL, '0', NULL, '0', '2008,3010,3056', 3, NULL);
INSERT INTO `sys_menu` VALUES ('3059', '演示', '0', 98, '1', '/demo', '', '', '', 'admin', '2024-04-30 15:06:58', 'admin', '2024-05-18 17:11:44', '0', '1', '0', '', 'MingcuteDepartmentLine', '0', '', '0', '', '0', '3059', 1, NULL);
INSERT INTO `sys_menu` VALUES ('3060', '上传下载', '3059', 1, '1', '/uploadtest', 'UploadTest', 'demo/UploadTest', '', 'admin', '2024-04-30 15:08:16', NULL, NULL, '0', '1', '0', '', '', '0', '', '0', '', '0', '3059,3060', 2, NULL);
INSERT INTO `sys_menu` VALUES ('3068', 'API文档', '2072', 1, '1', 'http://localhost:8080/swagger-ui/index.html,_blank', '', '', '', 'admin', '2024-05-25 14:33:52', 'admin', '2024-05-25 14:35:04', '0', '1', '0', '', 'SolarNotebookMinimalisticLinear', '0', '', '0', '', '0', '2072,3068', 2, NULL);
INSERT INTO `sys_menu` VALUES ('71c0d4ff-df7a-4f60-b6f7-3bbd16498c0d', '修改', '77ca6f16-9670-4f05-a404-463df02739df', 2, '1', NULL, NULL, NULL, '修改按钮', 'NewbieGenerator', '2024-10-04 00:00:00', NULL, NULL, '0', '0', '0', 'generator.genConfig.update', NULL, '0', NULL, '0', NULL, '0', '1840579422453780482,77ca6f16-9670-4f05-a404-463df02739df,71c0d4ff-df7a-4f60-b6f7-3bbd16498c0d', 2, NULL);
INSERT INTO `sys_menu` VALUES ('77ca6f16-9670-4f05-a404-463df02739df', '代码生成器配置', '1840579422453780482', 1, '1', '/dev-tool/genConfig', 'GeneratorgenConfigVue', 'dev-tool/genConfig/index', NULL, 'NewbieGenerator', '2024-10-04 00:00:00', 'admin', '2024-10-04 10:57:45', '0', '1', '0', 'generator.genConfig.list', 'TdesignSystemSetting', '0', '', '0', '', '0', '1840579422453780482,77ca6f16-9670-4f05-a404-463df02739df', 1, NULL);
INSERT INTO `sys_menu` VALUES ('d339b227-2352-48d0-b8a6-77ed46fcfc7e', '删除', '77ca6f16-9670-4f05-a404-463df02739df', 3, '1', NULL, NULL, NULL, '删除按钮', 'NewbieGenerator', '2024-10-04 00:00:00', NULL, NULL, '0', '0', '0', 'generator.genConfig.delete', NULL, '0', NULL, '0', NULL, '0', '1840579422453780482,77ca6f16-9670-4f05-a404-463df02739df,d339b227-2352-48d0-b8a6-77ed46fcfc7e', 2, NULL);
INSERT INTO `sys_menu` VALUES ('dde3e764-a6a4-4c14-9c32-ea1fbdfdcfc1', '新增', '77ca6f16-9670-4f05-a404-463df02739df', 1, '1', NULL, NULL, NULL, '新增按钮', 'NewbieGenerator', '2024-10-04 00:00:00', NULL, NULL, '0', '0', '0', 'generator.genConfig.add', NULL, '0', NULL, '0', NULL, '0', '1840579422453780482,77ca6f16-9670-4f05-a404-463df02739df,dde3e764-a6a4-4c14-9c32-ea1fbdfdcfc1', 2, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_code` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色编码',
  `sort` int NULL DEFAULT NULL COMMENT '排序顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '角色状态（1正常 0停用）',
  `home_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '首页路由地址',
  `remark` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('173', '测试', 'test', 1, '1', '', '测试角色', 'admin', '2024-04-18 15:53:42', 'admin', '2024-05-02 15:48:58');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `role_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色ID',
  `menu_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单ID',
  `create_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色菜单关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1802995429547028481', '173', '2042', 'admin', '2024-06-18 17:23:03', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES ('1802995429547028482', '173', '2072', 'admin', '2024-06-18 17:23:03', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES ('1802995429547028483', '173', '3068', 'admin', '2024-06-18 17:23:03', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES ('1802995429547028484', '173', '2069', 'admin', '2024-06-18 17:23:03', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES ('1802995429547028485', '173', '3059', 'admin', '2024-06-18 17:23:03', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES ('1802995429547028486', '173', '3060', 'admin', '2024-06-18 17:23:03', NULL, NULL);
INSERT INTO `sys_role_menu` VALUES ('1802995429547028487', '173', '3015', 'admin', '2024-06-18 17:23:03', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `dept_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门ID',
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像地址',
  `home_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '首页路由地址',
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话（手机号）',
  `email` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '2' COMMENT '性别（1男 0女）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '账号状态（1正常 0锁定）',
  `remark` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  `create_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1800797782850125825', '271', 'test', '$2a$10$48v7bbo.9PcGnd5J9G66meIP1Kd20I6wrXdqpDgmr0BHfGqtEpf4q', '测试用户', NULL, '', '18566666666', '', '1', '1', '密码：123456', 1, 'admin', '2024-06-12 15:50:23', 'admin', '2024-09-04 16:23:28');
INSERT INTO `sys_user` VALUES ('57', NULL, 'admin', '$2a$10$Jc9ytizwSRL/nVR6.NGDfOpTgAl0Kwh8BhPhM7/1BmbKLtnsjgOFa', '系统管理员', 'public/2024/09/12/_4k_uhd__pony_tail_by_assassinwarrior_dbfqubi9516.jpg', NULL, '18800000000', '32132@qq.com', '1', '1', NULL, 0, NULL, '2024-05-24 09:15:38', 'admin', '2024-09-12 13:13:45');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `role_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色ID',
  `create_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1800798087998324738', '1800797782850125825', '173', 'admin', '2024-06-12 15:51:36', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
