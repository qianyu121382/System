/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50737
 Source Host           : localhost:3306
 Source Schema         : xm_virtual_game_mall

 Target Server Type    : MySQL
 Target Server Version : 50737
 File Encoding         : 65001

 Date: 10/12/2024 16:18:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人名称',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货电话',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户地址' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (4, 4, '小青哥哥', '合肥市政务区阳光大道1100号', '13877886688');
INSERT INTO `address` VALUES (5, 4, '小青哥哥哥', '合肥市蜀山区科技大道101号', '13899887766');
INSERT INTO `address` VALUES (6, 8, '小妹妹', '北京市丰台区莲花池路1110号', '13988997766');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin', '管理员', 'http://localhost:9090/files/download/1721114905635-柴犬.jpeg', 'ADMIN', '18899990011', 'admin2@xm.com');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `num` int(11) NULL DEFAULT NULL COMMENT '商品数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '购物车' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (8, 8, 2, 2);
INSERT INTO `cart` VALUES (9, 8, 4, 3);

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `fid` int(11) NULL DEFAULT NULL COMMENT '关联ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '收藏信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (111, 4, 4);
INSERT INTO `collect` VALUES (112, 8, 4);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '评论人',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级ID',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '评论时间',
  `fid` int(11) NULL DEFAULT NULL COMMENT '关联ID',
  `root_id` int(11) NULL DEFAULT NULL COMMENT '根节点ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '评论表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (15, '111', 4, NULL, '2024-12-05 17:10:10', 7, 15);
INSERT INTO `comment` VALUES (16, '222', 4, NULL, '2024-12-05 17:10:57', 7, 16);
INSERT INTO `comment` VALUES (17, '333', 4, NULL, '2024-12-05 17:10:59', 7, 17);
INSERT INTO `comment` VALUES (18, '3333', 4, 15, '2024-12-05 17:11:10', 7, 15);
INSERT INTO `comment` VALUES (19, '666', 4, 17, '2024-12-05 17:11:39', 7, 17);
INSERT INTO `comment` VALUES (20, '888', 4, 19, '2024-12-05 17:11:43', 7, 17);
INSERT INTO `comment` VALUES (24, '999', 4, NULL, '2024-12-05 17:13:23', 7, 24);

-- ----------------------------
-- Table structure for forum
-- ----------------------------
DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '帖子标题',
  `descr` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '帖子简介',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '帖子内容',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '帖子图片',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发布时间',
  `view_count` int(11) NULL DEFAULT NULL COMMENT '浏览量',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '宠物帖子信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of forum
-- ----------------------------
INSERT INTO `forum` VALUES (5, 4, '宠物知识科普：如何更好地照顾您的毛茸茸伙伴', '养宠物是一项充满乐趣但也需要责任心的任务。为了让您的宠物健康快乐地成长，以下是一些基本的宠物知识和照顾技巧，希望能帮助您成为一名更称职的宠物主人。', '<h3 style=\"text-align: start;\">宠物知识科普：如何更好地照顾您的毛茸茸伙伴</h3><p style=\"text-align: start;\">养宠物是一项充满乐趣但也需要责任心的任务。为了让您的宠物健康快乐地成长，以下是一些基本的宠物知识和照顾技巧，希望能帮助您成为一名更称职的宠物主人。</p><h4 style=\"text-align: start;\">1. 选择合适的宠物</h4><p style=\"text-align: start;\">在决定养宠物之前，首先要考虑的是选择哪种宠物。不同的宠物有不同的需求和性格特点。例如，狗需要较多的运动和社交，而猫相对独立，需要的照顾较少。此外，还需要考虑您的生活方式、住房条件和经济能力，确保能够为宠物提供一个适宜的生活环境。</p><h4 style=\"text-align: start;\">2. 提供适当的饮食</h4><ul><li style=\"text-align: start;\"><strong>狗</strong>：狗的饮食应包含高质量的蛋白质、适量的脂肪和碳水化合物，以及必需的维生素和矿物质。避免喂食人类食物，特别是巧克力、葡萄、洋葱等对狗有毒的食物。</li><li style=\"text-align: start;\"><strong>猫</strong>：猫是肉食动物，需要高蛋白的饮食。市面上有专门为猫设计的猫粮，可以选择信誉好的品牌。同样，避免喂食人类食物，尤其是生鱼和生肉，以免感染寄生虫。</li><li style=\"text-align: start;\"><strong>鸟类</strong>：鸟类的饮食主要包括种子、水果和蔬菜。不同的鸟类有不同的饮食偏好，需要根据具体品种选择合适的食物。</li><li style=\"text-align: start;\"><strong>小型哺乳动物</strong>（如仓鼠、兔子）：这些宠物主要以干草、专用饲料和少量新鲜蔬果为主食。</li></ul><h4 style=\"text-align: start;\">3. 定期体检和疫苗接种</h4><p style=\"text-align: start;\">定期带宠物去兽医那里进行体检，可以及时发现和治疗潜在的健康问题。此外，按时接种疫苗也是预防疾病的重要措施。常见的疫苗包括狂犬病疫苗、猫三联疫苗、狗五联疫苗等。</p><h4 style=\"text-align: start;\">4. 保持清洁和卫生</h4><ul><li style=\"text-align: start;\"><strong>狗</strong>：定期给狗洗澡和梳理毛发，防止皮肤病和寄生虫。注意清理耳朵和修剪指甲。</li><li style=\"text-align: start;\"><strong>猫</strong>：猫通常会自己清洁毛发，但仍需定期梳理，以防打结。定期清理猫砂盆，保持环境卫生。</li><li style=\"text-align: start;\"><strong>鸟类</strong>：定期清理笼子和更换饮水，保持笼内清洁。定期检查羽毛，确保没有寄生虫。</li><li style=\"text-align: start;\"><strong>小型哺乳动物</strong>：定期更换垫料，清理笼子，保持干燥和清洁。</li></ul><h4 style=\"text-align: start;\">5. 适当的运动和社交</h4><ul><li style=\"text-align: start;\"><strong>狗</strong>：每天带狗散步和玩耍，不仅有助于消耗多余的能量，还能增进你们之间的感情。</li><li style=\"text-align: start;\"><strong>猫</strong>：提供足够的玩具和活动空间，让猫有足够的运动量。定期与猫互动，增强其社交技能。</li><li style=\"text-align: start;\"><strong>鸟类</strong>：提供宽敞的飞行空间，定期放飞，让鸟儿自由飞翔。与鸟儿互动，建立信任关系。</li><li style=\"text-align: start;\"><strong>小型哺乳动物</strong>：提供安全的活动空间，让它们有机会探索和玩耍。定期与宠物互动，增进感情。</li></ul><h4 style=\"text-align: start;\">6. 注意心理健康</h4><p style=\"text-align: start;\">宠物也有情感和心理需求。长时间的孤独和缺乏关注会导致宠物焦虑和抑郁。定期与宠物互动，给予足够的关爱和陪伴，有助于宠物保持良好的心理状态。</p><h4 style=\"text-align: start;\">7. 应急准备</h4><p style=\"text-align: start;\">了解一些基本的急救知识，如心肺复苏术、止血方法等，可以在紧急情况下挽救宠物的生命。此外，准备好应急联系人和最近的24小时兽医诊所信息，以备不时之需。</p>', 'http://localhost:9090/files/download/1733369771950-1732379027123-哈士奇01.png', '2024-12-05 11:37:14', 3, '通过');
INSERT INTO `forum` VALUES (6, 4, '宠物知识大全', '宠物不仅是家庭的一员，更是许多人的忠实伙伴。了解和掌握正确的宠物知识，对于宠物的健康和幸福至关重要。以下是关于宠物饲养、护理、健康等方面的知识汇总，希望能帮助您更好地照顾您的宠物。宠物是家庭的一部分，需要我们用心去照顾和爱护。通过了解和掌握正确的宠物知识，我们可以为宠物提供一个健康、快乐的生活环境。', '<p style=\"text-align: start;\"><span style=\"font-size: 16px;\">宠物不仅是家庭的一员，更是许多人的忠实伙伴。了解和掌握正确的宠物知识，对于宠物的健康和幸福至关重要。以下是关于宠物饲养、护理、健康等方面的知识汇总，希望能帮助您更好地照顾您的宠物。</span></p><h2 style=\"text-align: start;\">一、宠物选择</h2><ol><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">犬类：小型犬：适合居住空间较小的家庭，如吉娃娃、约克夏梗、博美犬等。中型犬：适合有中等居住空间的家庭，如柯基、比格犬、边境牧羊犬等。大型犬：适合有较大居住空间的家庭，如金毛寻回犬、拉布拉多寻回犬、德国牧羊犬等。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">猫类：短毛猫：如英国短毛猫、美国短毛猫，适合忙碌的家庭，因为它们的毛发较短，需要的护理较少。长毛猫：如波斯猫、缅因猫，适合有时间和精力进行日常护理的家庭。无毛猫：如斯芬克斯猫，适合对猫毛过敏的人。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">其他宠物：鸟类：如虎皮鹦鹉、金丝雀，适合喜欢听鸟鸣的家庭。小型哺乳动物：如仓鼠、兔子，适合有小孩的家庭。爬行动物：如蜥蜴、蛇，适合对这些动物感兴趣且有相关知识的人。</span></li></ol><h2 style=\"text-align: start;\">二、宠物饲养</h2><ol><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">饮食：犬类：提供高质量的犬粮，根据年龄、体重和活动水平选择合适的类型。定期补充新鲜的水果和蔬菜。猫类：提供高质量的猫粮，注意猫的特殊营养需求，如牛磺酸。定期补充新鲜的水。鸟类：提供专门的鸟食，如种子、谷物，定期补充新鲜的水果和蔬菜。小型哺乳动物：提供专门的饲料，如兔粮、仓鼠粮，定期补充新鲜的蔬菜和水。爬行动物：根据品种提供合适的食物，如昆虫、小型哺乳动物或植物。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">住所：犬类：提供宽敞的笼子或围栏，确保有足够的活动空间。室内饲养需要定期散步。猫类：提供猫树、猫窝和猫砂盆，确保有足够的活动空间和隐私。鸟类：提供足够大的笼子，确保有足够的飞翔空间。定期清洁笼子和更换垫料。小型哺乳动物：提供合适的笼子，确保有足够的活动空间和隐藏处。爬行动物：提供合适的饲养箱，确保温度和湿度适宜，提供适当的栖木和藏身之处。</span></li></ol><h2 style=\"text-align: start;\">三、宠物护理</h2><ol><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">日常护理：犬类：定期梳理毛发，每周至少一次。定期洗澡，每月一次。定期修剪指甲，清理耳朵和牙齿。猫类：定期梳理毛发，每周至少一次。定期洗澡，每两月一次。定期修剪指甲，清理耳朵和牙齿。鸟类：定期清理笼子，每周至少一次。定期修剪指甲和翅膀，保持羽毛清洁。小型哺乳动物：定期清理笼子，每周至少一次。定期修剪指甲，保持毛发清洁。爬行动物：定期清理饲养箱，每周至少一次。定期检查皮肤和鳞片，保持清洁。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">健康检查：定期体检：每年至少带宠物进行一次全面的体检，包括血液检查、粪便检查等。疫苗接种：按时为宠物接种疫苗，预防常见疾病。驱虫：定期为宠物进行体内和体外驱虫，预防寄生虫感染。</span></li></ol><h2 style=\"text-align: start;\">四、宠物训练</h2><ol><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">基本训练：犬类：进行基本的服从训练，如坐下、握手、等待等。使用正面强化的方法，如奖励和表扬。猫类：进行基本的行为训练，如使用猫砂盆、不抓家具等。使用正面强化的方法，如奖励和表扬。鸟类：进行基本的互动训练，如站在手上、说话等。使用正面强化的方法，如奖励和表扬。小型哺乳动物：进行基本的行为训练，如使用厕所、不咬笼子等。使用正面强化的方法，如奖励和表扬。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">高级训练：犬类：进行高级的技能训练，如搜救、追踪、导盲等。猫类：进行高级的行为训练，如跳过障碍、使用猫门等。鸟类：进行高级的互动训练，如表演杂技、模仿人类语言等。</span></li></ol><h2 style=\"text-align: start;\">五、宠物安全</h2><ol><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">家居安全：有毒植物：避免家中摆放对宠物有毒的植物，如百合、天南星等。危险物品：将清洁剂、药物、尖锐物品等放在宠物无法触及的地方。电线：将电线固定或隐藏，避免宠物咬伤。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">外出安全：牵绳：外出时使用牵绳，避免宠物走失或发生意外。交通：注意交通安全，避免宠物在车流中奔跑。标识：为宠物佩戴带有联系方式的项圈或芯片，以便在走失时能够及时找回。</span></li></ol><h2 style=\"text-align: start;\">六、宠物心理</h2><ol><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">社交：早期社交：从小培养宠物的社交能力，让它们接触不同的人和其他宠物。家庭互动：多花时间与宠物互动，增进感情，提高其信任感和依赖感。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">情感：陪伴：给予宠物足够的陪伴，避免长时间的孤独。安慰：在宠物感到害怕或不安时，给予安慰和支持。</span></li></ol><h2 style=\"text-align: start;\">七、宠物急救</h2><ol><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">常见急救措施：窒息：使用海姆立克法帮助宠物排出异物。中毒：立即联系兽医，提供可能的中毒物质信息。创伤：止血、包扎伤口，立即送医。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">急救工具：急救箱：准备宠物急救箱，包括绷带、纱布、消毒液、止血粉等。</span></li></ol><h2 style=\"text-align: start;\">结语</h2><p style=\"text-align: start;\"><span style=\"font-size: 16px;\">宠物是家庭的一部分，需要我们用心去照顾和爱护。通过了解和掌握正确的宠物知识，我们可以为宠物提供一个健康、快乐的生活环境。希望上述介绍能帮助您更好地照顾您的宠物，让它们成为您生活中最美好的伴侣。</span></p>', 'http://localhost:9090/files/download/1733370264825-1731400186888-布偶猫01.png', '2024-12-05 11:45:11', 1, '通过');
INSERT INTO `forum` VALUES (7, 8, '宠物养护指南：从选择到日常护理', '宠物不仅能为家庭带来欢乐，还能成为忠实的伴侣。正确地选择和照顾宠物，不仅能让宠物健康快乐地成长，还能提升家庭的生活质量。以下是一份全面的宠物养护指南，涵盖从选择到日常护理的各个方面。', '<p style=\"text-align: start;\"><span style=\"font-size: 16px;\">宠物不仅能为家庭带来欢乐，还能成为忠实的伴侣。正确地选择和照顾宠物，不仅能让宠物健康快乐地成长，还能提升家庭的生活质量。以下是一份全面的宠物养护指南，涵盖从选择到日常护理的各个方面。</span></p><h2 style=\"text-align: start;\">一、选择合适的宠物</h2><ol><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">考虑生活方式：忙碌的生活：选择低维护的宠物，如鱼、仓鼠或短毛猫。有时间陪伴：选择需要更多关注的宠物，如犬类或长毛猫。有孩子：选择性格温和、耐玩的宠物，如金毛寻回犬或兔子。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">考虑居住环境：小户型：选择小型宠物，如吉娃娃、约克夏梗、仓鼠等。大户型：选择大型宠物，如金毛寻回犬、拉布拉多寻回犬等。户外空间：选择需要大量运动的宠物，如杜宾犬、边境牧羊犬等。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">考虑经济条件：预算有限：选择成本较低的宠物，如鱼、仓鼠等。经济宽裕：选择需要更多投入的宠物，如大型犬、特殊品种的猫等。</span></li></ol><h2 style=\"text-align: start;\">二、宠物饲养</h2><ol><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">饮食：犬类：提供高质量的犬粮，根据年龄、体重和活动水平选择合适的类型。定期补充新鲜的水果和蔬菜。猫类：提供高质量的猫粮，注意猫的特殊营养需求，如牛磺酸。定期补充新鲜的水。鸟类：提供专门的鸟食，如种子、谷物，定期补充新鲜的水果和蔬菜。小型哺乳动物：提供专门的饲料，如兔粮、仓鼠粮，定期补充新鲜的蔬菜和水。爬行动物：根据品种提供合适的食物，如昆虫、小型哺乳动物或植物。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">住所：犬类：提供宽敞的笼子或围栏，确保有足够的活动空间。室内饲养需要定期散步。猫类：提供猫树、猫窝和猫砂盆，确保有足够的活动空间和隐私。鸟类：提供足够大的笼子，确保有足够的飞翔空间。定期清洁笼子和更换垫料。小型哺乳动物：提供合适的笼子，确保有足够的活动空间和隐藏处。爬行动物：提供合适的饲养箱，确保温度和湿度适宜，提供适当的栖木和藏身之处。</span></li></ol><h2 style=\"text-align: start;\">三、宠物护理</h2><ol><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">日常护理：犬类：定期梳理毛发，每周至少一次。定期洗澡，每月一次。定期修剪指甲，清理耳朵和牙齿。猫类：定期梳理毛发，每周至少一次。定期洗澡，每两月一次。定期修剪指甲，清理耳朵和牙齿。鸟类：定期清理笼子，每周至少一次。定期修剪指甲和翅膀，保持羽毛清洁。小型哺乳动物：定期清理笼子，每周至少一次。定期修剪指甲，保持毛发清洁。爬行动物：定期清理饲养箱，每周至少一次。定期检查皮肤和鳞片，保持清洁。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">健康检查：定期体检：每年至少带宠物进行一次全面的体检，包括血液检查、粪便检查等。疫苗接种：按时为宠物接种疫苗，预防常见疾病。驱虫：定期为宠物进行体内和体外驱虫，预防寄生虫感染。</span></li></ol><h2 style=\"text-align: start;\">四、宠物训练</h2><ol><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">基本训练：犬类：进行基本的服从训练，如坐下、握手、等待等。使用正面强化的方法，如奖励和表扬。猫类：进行基本的行为训练，如使用猫砂盆、不抓家具等。使用正面强化的方法，如奖励和表扬。鸟类：进行基本的互动训练，如站在手上、说话等。使用正面强化的方法，如奖励和表扬。小型哺乳动物：进行基本的行为训练，如使用厕所、不咬笼子等。使用正面强化的方法，如奖励和表扬。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">高级训练：犬类：进行高级的技能训练，如搜救、追踪、导盲等。猫类：进行高级的行为训练，如跳过障碍、使用猫门等。鸟类：进行高级的互动训练，如表演杂技、模仿人类语言等。</span></li></ol><h2 style=\"text-align: start;\">五、宠物安全</h2><ol><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">家居安全：有毒植物：避免家中摆放对宠物有毒的植物，如百合、天南星等。危险物品：将清洁剂、药物、尖锐物品等放在宠物无法触及的地方。电线：将电线固定或隐藏，避免宠物咬伤。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">外出安全：牵绳：外出时使用牵绳，避免宠物走失或发生意外。交通：注意交通安全，避免宠物在车流中奔跑。标识：为宠物佩戴带有联系方式的项圈或芯片，以便在走失时能够及时找回。</span></li></ol><h2 style=\"text-align: start;\">六、宠物心理</h2><ol><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">社交：早期社交：从小培养宠物的社交能力，让它们接触不同的人和其他宠物。家庭互动：多花时间与宠物互动，增进感情，提高其信任感和依赖感。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">情感：陪伴：给予宠物足够的陪伴，避免长时间的孤独。安慰：在宠物感到害怕或不安时，给予安慰和支持。</span></li></ol><h2 style=\"text-align: start;\">七、宠物急救</h2><ol><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">常见急救措施：窒息：使用海姆立克法帮助宠物排出异物。中毒：立即联系兽医，提供可能的中毒物质信息。创伤：止血、包扎伤口，立即送医。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">急救工具：急救箱：准备宠物急救箱，包括绷带、纱布、消毒液、止血粉等。</span></li></ol><h2 style=\"text-align: start;\">结语</h2><p style=\"text-align: start;\"><span style=\"font-size: 16px;\">宠物是家庭的一部分，需要我们用心去照顾和爱护。通过了解和掌握正确的宠物知识，我们可以为宠物提供一个健康、快乐的生活环境。希望上述指南能帮助您更好地照顾您的宠物，让它们成为您生活中最美好的伴侣。</span></p>', 'http://localhost:9090/files/download/1733370660809-1731396169854-小型柴犬01.jpg', '2024-12-05 11:51:10', 79, '通过');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `shop_id` int(11) NULL DEFAULT NULL COMMENT '店铺',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '商品类型',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `descr` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品简介',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品价格',
  `sale` int(11) NULL DEFAULT NULL COMMENT '销量',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上架状态',
  `store` int(11) NULL DEFAULT NULL COMMENT '剩余数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '宠物用品信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (2, 12, 10, '甲硝唑', '甲硝唑（Metronidazole）是一种广谱抗菌和抗原虫药物，常用于治疗由厌氧菌和某些寄生虫引起的感染。在猫的医疗中，甲硝唑被广泛应用于治疗多种疾病，尤其是消化系统的问题。甲硝唑可以帮助减轻肠道炎症，缓解腹泻和呕吐等症状。通常为5-10毫克/千克体重，每日2次。一只5公斤的猫，每次服用25-50毫克，每日2次。', 'http://localhost:9090/files/download/1733216821647-1732243363217-药品01.png', 10.00, 3, '上架', 100);
INSERT INTO `goods` VALUES (3, 12, 5, '复合维生素', '复合维生素配方提升身体保护力均衡饮食 健壮精实，1瓶补齐11种必需维生素营养全面焕发精气神', 'http://localhost:9090/files/download/1733217173903-微信截图_20241203170948.png', 59.00, 1, '上架', 100);
INSERT INTO `goods` VALUES (4, 12, 7, '宠物专用钙片', '辅助修护受损软骨再现爱宠活力，鲨鱼软骨素+葡萄糖胺盐酸盐+乳钙', 'http://localhost:9090/files/download/1733217219965-微信截图_20241203171039.png', 39.00, 2, '上架', 100);
INSERT INTO `goods` VALUES (5, 11, 10, '甲硝唑', '甲硝唑（Metronidazole）是一种广谱抗菌和抗原虫药物，常用于治疗由厌氧菌和某些寄生虫引起的感染。在猫的医疗中，甲硝唑被广泛应用于治疗多种疾病，尤其是消化系统的问题。甲硝唑可以帮助减轻肠道炎症，缓解腹泻和呕吐等症状。通常为5-10毫克/千克体重，每日2次。一只5公斤的猫，每次服用25-50毫克，每日2次。', 'http://localhost:9090/files/download/1733216821647-1732243363217-药品01.png', 10.00, 0, '上架', 100);
INSERT INTO `goods` VALUES (6, 11, 5, '复合维生素', '复合维生素配方提升身体保护力均衡饮食 健壮精实，1瓶补齐11种必需维生素营养全面焕发精气神', 'http://localhost:9090/files/download/1733217173903-微信截图_20241203170948.png', 59.00, 0, '上架', 100);
INSERT INTO `goods` VALUES (7, 11, 7, '宠物专用钙片', '辅助修护受损软骨再现爱宠活力，鲨鱼软骨素+葡萄糖胺盐酸盐+乳钙', 'http://localhost:9090/files/download/1733217219965-微信截图_20241203171039.png', 39.00, 0, '上架', 100);
INSERT INTO `goods` VALUES (8, 13, 10, '甲硝唑', '甲硝唑（Metronidazole）是一种广谱抗菌和抗原虫药物，常用于治疗由厌氧菌和某些寄生虫引起的感染。在猫的医疗中，甲硝唑被广泛应用于治疗多种疾病，尤其是消化系统的问题。甲硝唑可以帮助减轻肠道炎症，缓解腹泻和呕吐等症状。通常为5-10毫克/千克体重，每日2次。一只5公斤的猫，每次服用25-50毫克，每日2次。', 'http://localhost:9090/files/download/1733216821647-1732243363217-药品01.png', 10.00, 0, '上架', 100);
INSERT INTO `goods` VALUES (9, 13, 5, '复合维生素', '复合维生素配方提升身体保护力均衡饮食 健壮精实，1瓶补齐11种必需维生素营养全面焕发精气神', 'http://localhost:9090/files/download/1733217173903-微信截图_20241203170948.png', 59.00, 2, '上架', 98);
INSERT INTO `goods` VALUES (10, 13, 7, '宠物专用钙片', '辅助修护受损软骨再现爱宠活力，鲨鱼软骨素+葡萄糖胺盐酸盐+乳钙', 'http://localhost:9090/files/download/1733217219965-微信截图_20241203171039.png', 39.00, 3, '上架', 97);
INSERT INTO `goods` VALUES (11, 14, 10, '甲硝唑', '甲硝唑（Metronidazole）是一种广谱抗菌和抗原虫药物，常用于治疗由厌氧菌和某些寄生虫引起的感染。在猫的医疗中，甲硝唑被广泛应用于治疗多种疾病，尤其是消化系统的问题。甲硝唑可以帮助减轻肠道炎症，缓解腹泻和呕吐等症状。通常为5-10毫克/千克体重，每日2次。一只5公斤的猫，每次服用25-50毫克，每日2次。', 'http://localhost:9090/files/download/1733216821647-1732243363217-药品01.png', 10.00, 9, '上架', 91);
INSERT INTO `goods` VALUES (12, 14, 5, '复合维生素', '复合维生素配方提升身体保护力均衡饮食 健壮精实，1瓶补齐11种必需维生素营养全面焕发精气神', 'http://localhost:9090/files/download/1733217173903-微信截图_20241203170948.png', 59.00, 0, '上架', 100);
INSERT INTO `goods` VALUES (13, 14, 7, '宠物专用钙片', '辅助修护受损软骨再现爱宠活力，鲨鱼软骨素+葡萄糖胺盐酸盐+乳钙', 'http://localhost:9090/files/download/1733217219965-微信截图_20241203171039.png', 39.00, 0, '上架', 100);
INSERT INTO `goods` VALUES (14, 15, 10, '甲硝唑', '甲硝唑（Metronidazole）是一种广谱抗菌和抗原虫药物，常用于治疗由厌氧菌和某些寄生虫引起的感染。在猫的医疗中，甲硝唑被广泛应用于治疗多种疾病，尤其是消化系统的问题。甲硝唑可以帮助减轻肠道炎症，缓解腹泻和呕吐等症状。通常为5-10毫克/千克体重，每日2次。一只5公斤的猫，每次服用25-50毫克，每日2次。', 'http://localhost:9090/files/download/1733216821647-1732243363217-药品01.png', 10.00, 0, '上架', 100);
INSERT INTO `goods` VALUES (15, 15, 5, '复合维生素', '复合维生素配方提升身体保护力均衡饮食 健壮精实，1瓶补齐11种必需维生素营养全面焕发精气神', 'http://localhost:9090/files/download/1733217173903-微信截图_20241203170948.png', 59.00, 6, '上架', 94);
INSERT INTO `goods` VALUES (16, 15, 7, '宠物专用钙片', '辅助修护受损软骨再现爱宠活力，鲨鱼软骨素+葡萄糖胺盐酸盐+乳钙', 'http://localhost:9090/files/download/1733217219965-微信截图_20241203171039.png', 39.00, 3, '上架', 97);

-- ----------------------------
-- Table structure for goods_orders
-- ----------------------------
DROP TABLE IF EXISTS `goods_orders`;
CREATE TABLE `goods_orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `shop_id` int(11) NULL DEFAULT NULL COMMENT '宠物店id',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goods_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品价格',
  `pickup_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人名称',
  `pickup_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人地址',
  `pickup_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人电话',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单状态',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `num` int(11) NULL DEFAULT NULL COMMENT '购买数量',
  `total` decimal(10, 2) NULL DEFAULT NULL COMMENT '购买总价',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '宠物用品订单信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_orders
-- ----------------------------
INSERT INTO `goods_orders` VALUES (27, '2024120402049', 4, 15, 15, '复合维生素', 'http://localhost:9090/files/download/1733217173903-微信截图_20241203170948.png', 59.00, '小青哥哥哥', '合肥市蜀山区科技大道101号', '13899887766', '待发货', '2024-12-04 17:45:02', 3, 177.00);
INSERT INTO `goods_orders` VALUES (28, '2024120402113', 4, 15, 16, '宠物专用钙片', 'http://localhost:9090/files/download/1733217219965-微信截图_20241203171039.png', 39.00, '小青哥哥哥', '合肥市蜀山区科技大道101号', '13899887766', '待发货', '2024-12-04 17:45:02', 2, 78.00);
INSERT INTO `goods_orders` VALUES (29, '2024120481965', 4, 13, 9, '复合维生素', 'http://localhost:9090/files/download/1733217173903-微信截图_20241203170948.png', 59.00, '小青哥哥哥', '合肥市蜀山区科技大道101号', '13899887766', '已完成', '2024-12-04 17:49:41', 2, 118.00);
INSERT INTO `goods_orders` VALUES (30, '2024120481968', 4, 14, 13, '宠物专用钙片', 'http://localhost:9090/files/download/1733217219965-微信截图_20241203171039.png', 39.00, '小青哥哥哥', '合肥市蜀山区科技大道101号', '13899887766', '已取消', '2024-12-04 17:49:41', 2, 78.00);

-- ----------------------------
-- Table structure for goods_type
-- ----------------------------
DROP TABLE IF EXISTS `goods_type`;
CREATE TABLE `goods_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '宠物用品类型信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_type
-- ----------------------------
INSERT INTO `goods_type` VALUES (1, '猫粮');
INSERT INTO `goods_type` VALUES (2, '狗粮');
INSERT INTO `goods_type` VALUES (3, '鸟食');
INSERT INTO `goods_type` VALUES (4, '鱼食');
INSERT INTO `goods_type` VALUES (5, '维生素');
INSERT INTO `goods_type` VALUES (6, '矿物质');
INSERT INTO `goods_type` VALUES (7, '钙片');
INSERT INTO `goods_type` VALUES (8, '清洁用品');
INSERT INTO `goods_type` VALUES (9, '宠物笼');
INSERT INTO `goods_type` VALUES (10, '药品');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公告标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '公告内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '今天天气真的不错', '今天好开心呀！因为天气很好，我又可以肆无忌惮的跟着武哥和青哥学习了！！真的好开心！', '2024-07-16 15:51:17');
INSERT INTO `notice` VALUES (2, '项目所有功能开发完毕！', '我的项目所有的功能都开发完啦！真的很有成就感！', '2024-07-16 15:52:22');
INSERT INTO `notice` VALUES (3, '项目功能都测试完成，准备上线！', '经过半个月的学习和练习，终于把这个项目完成了，可以打包上线了！', '2024-07-16 15:52:56');

-- ----------------------------
-- Table structure for virtualGame
-- ----------------------------
DROP TABLE IF EXISTS `virtualGame`;
CREATE TABLE `virtualGame`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `shop_id` int(11) NULL DEFAULT NULL COMMENT '宠物店',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '宠物类型',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '宠物名称',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '宠物性别',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '宠物图片',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '宠物价格',
  `introduce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '宠物介绍',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '宠物详情',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '宠物状态',
  `recommend` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否推荐',
  `store` int(11) NULL DEFAULT 0 COMMENT '剩余数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '宠物信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of virtualGame
-- ----------------------------
INSERT INTO `virtualGame` VALUES (4, 11, 3, '金毛寻回犬', '公', 'http://localhost:9090/files/download/1733125943746-1731554448814-金毛01.jpg', 100.00, '金毛寻回犬（Golden Retriever）是一种中大型犬种，原产于苏格兰。金毛以其友好的性格、忠诚的品质和出色的智商而闻名，是世界上最受欢迎的家庭宠物犬之一。3个月大的金毛已经度过了幼犬期的初期阶段，开始展现出更加稳定的性格和行为特点。', '<h2 style=\"text-align: start;\">一、品种简介</h2><p style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>金毛寻回犬</strong></span><span style=\"font-size: 16px;\">（Golden Retriever）是一种中大型犬种，原产于苏格兰。金毛以其友好的性格、忠诚的品质和出色的智商而闻名，是世界上最受欢迎的家庭宠物犬之一。3个月大的金毛已经度过了幼犬期的初期阶段，开始展现出更加稳定的性格和行为特点。</span></p><h2 style=\"text-align: start;\">二、外观特征</h2><ul><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>体型</strong></span><span style=\"font-size: 16px;\">：3个月大的金毛体重约为7-10公斤，肩高约30-40厘米。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>头部</strong></span><span style=\"font-size: 16px;\">：头中等大小，呈楔形，额头平坦，眼睛间距较宽。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>眼睛</strong></span><span style=\"font-size: 16px;\">：眼睛呈杏仁形，颜色多为深褐色，眼神温和、友好。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>耳朵</strong></span><span style=\"font-size: 16px;\">：耳朵中等大小，下垂，贴在头部两侧，边缘圆滑。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>毛发</strong></span><span style=\"font-size: 16px;\">：双层毛发，外层毛发平滑、浓密，内层毛发柔软，颜色多为金色或奶油色。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>尾巴</strong></span><span style=\"font-size: 16px;\">：尾巴粗壮，呈羽毛状，当犬兴奋时，尾巴会欢快地摇摆。</span></li></ul><h2 style=\"text-align: start;\">三、性格特点</h2><ul><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>友好</strong></span><span style=\"font-size: 16px;\">：性格极其友好，对家人和陌生人都很友善，非常适合家庭饲养。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>聪明</strong></span><span style=\"font-size: 16px;\">：智商高，学习能力强，容易训练，适合进行各种技能训练。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>忠诚</strong></span><span style=\"font-size: 16px;\">：对家庭成员非常忠诚，喜欢与家人互动，是理想的家庭宠物。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>活泼</strong></span><span style=\"font-size: 16px;\">：精力充沛，喜欢运动，需要大量的运动和活动空间。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>耐心</strong></span><span style=\"font-size: 16px;\">：对儿童非常有耐心，能够容忍孩子的嬉戏，是非常好的家庭伴侣犬。</span></li></ul><h2 style=\"text-align: start;\">四、饲养要点</h2><ol><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">笼子/住所：室内：如果在室内饲养，需要提供一个宽敞的活动空间，如客厅或专门的房间。室外：如果在室外饲养，需要提供一个坚固的狗舍，确保狗舍防风、防雨、防晒。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">饮食：主食：提供高质量的幼犬专用犬粮，确保营养均衡，支持健康成长。辅食：定期补充新鲜的水果和蔬菜，如苹果、胡萝卜等，但要避免对犬有害的食物，如巧克力、葡萄等。水源：提供清洁的饮用水，每天更换。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">运动：日常散步：每天至少两次散步，每次15-30分钟，逐渐增加时间和强度。玩耍：金毛喜欢玩耍，可以提供各种玩具，如球、飞盘等，帮助消耗多余的精力。训练：进行基本的服从训练，如坐下、握手、等待等，建立良好的行为习惯。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">清洁：梳毛：每周至少梳理一次毛发，特别是在换毛季节，需要更频繁地梳理，防止打结。洗澡：每月洗澡一次，避免过于频繁的洗澡，以免破坏皮肤的天然油脂。耳朵和牙齿：定期检查耳朵和牙齿，保持清洁，防止感染。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">社交：早期社交：3个月大的金毛正处于关键的社交期，需要与人和其他犬进行充分的互动，培养良好的社交能力。家庭互动：多花时间与金毛互动，增进感情，提高其信任感和依赖感。</span></li></ol>', '上架', '是', 9);
INSERT INTO `virtualGame` VALUES (5, 13, 4, '虎皮鹦鹉', '母', 'http://localhost:9090/files/download/1733126623940-1731548086622-虎皮鹦鹉01.png', 100.00, '虎皮鹦鹉（Budgerigar），又称澳洲鹦鹉或波奇鹦鹉，是一种小型鹦鹉，原产于澳大利亚。因其羽毛上独特的条纹和鲜艳的颜色而得名。虎皮鹦鹉是世界上最受欢迎的宠物鸟之一，因其易于饲养、性格温顺、叫声悦耳而受到许多家庭的喜爱。', '<h2 style=\"text-align: start;\">一、品种简介</h2><p style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>虎皮鹦鹉</strong></span><span style=\"font-size: 16px;\">（Budgerigar），又称澳洲鹦鹉或波奇鹦鹉，是一种小型鹦鹉，原产于澳大利亚。因其羽毛上独特的条纹和鲜艳的颜色而得名。虎皮鹦鹉是世界上最受欢迎的宠物鸟之一，因其易于饲养、性格温顺、叫声悦耳而受到许多家庭的喜爱。</span></p><h2 style=\"text-align: start;\">二、外观特征</h2><ul><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>体型</strong></span><span style=\"font-size: 16px;\">：小型，体长约18厘米，体重约30-40克。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>头部</strong></span><span style=\"font-size: 16px;\">：头圆，前额突出，眼睛圆而明亮。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>羽毛</strong></span><span style=\"font-size: 16px;\">：羽毛颜色多样，最常见的是绿色和黄色，背部和翅膀上有黑色条纹，形成独特的“虎皮”图案。此外，还有蓝色、白色、灰色等多种变种。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>尾巴</strong></span><span style=\"font-size: 16px;\">：尾巴较长，呈扇形展开。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>喙</strong></span><span style=\"font-size: 16px;\">：短而弯曲，颜色为角质色或黑色。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>脚</strong></span><span style=\"font-size: 16px;\">：脚爪强壮，颜色为灰色或粉红色。</span></li></ul><h2 style=\"text-align: start;\">三、性格特点</h2><ul><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>温顺</strong></span><span style=\"font-size: 16px;\">：性格温顺，容易亲近人，适合家庭饲养。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>活泼</strong></span><span style=\"font-size: 16px;\">：非常活泼好动，喜欢飞翔和玩耍，需要足够的活动空间。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>社交</strong></span><span style=\"font-size: 16px;\">：具有较强的社交性，喜欢与人和其他鸟类互动。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>聪明</strong></span><span style=\"font-size: 16px;\">：智商较高，能够学会简单的口哨声和词汇。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>叫声</strong></span><span style=\"font-size: 16px;\">：叫声清脆悦耳，不会像大型鹦鹉那样吵闹。</span></li></ul><h2 style=\"text-align: start;\">四、饲养要点</h2><ol><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">笼子：尺寸：选择足够大的笼子，确保鹦鹉有足够的活动空间。笼子的最小尺寸建议为60cm x 40cm x 40cm。材质：笼子应由无毒材料制成，避免使用镀锌铁丝。布局：笼内应放置食物碗、水碗、栖木、玩具等，确保鹦鹉的日常生活需求。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">饮食：主食：提供高质量的鹦鹉专用饲料，如鹦鹉颗粒、种子混合物等。辅食：定期补充新鲜的水果和蔬菜，如苹果、胡萝卜、芹菜等，确保营养均衡。水源：提供清洁的饮用水，每天更换。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">环境：温度：保持室温在18-24°C之间，避免极端温度。湿度：保持适当的湿度，避免过于干燥。光照：每天提供10-12小时的自然光照或人工光源，有助于鹦鹉的健康。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">清洁：笼子清洁：每周至少清洁一次笼子，更换垫料，清洗食碗和水碗。鹦鹉清洁：定期给鹦鹉洗澡，可以使用喷雾瓶喷水或提供浅水盆让其自行沐浴。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">互动：日常互动：每天花时间与鹦鹉互动，增进感情，提高其社交能力。训练：可以进行简单的训练，如学习口哨声、词汇等，增强其智力。</span></li></ol><h2 style=\"text-align: start;\">五、健康问题</h2><ul><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>常见疾病</strong></span><span style=\"font-size: 16px;\">：呼吸道感染、羽虱、腹泻等。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>预防措施</strong></span><span style=\"font-size: 16px;\">：定期检查鹦鹉的健康状况，保持笼子和环境的清洁，及时就医。</span></li></ul>', '上架', '否', 9);
INSERT INTO `virtualGame` VALUES (6, 11, 3, '英国短毛猫', '母', 'http://localhost:9090/files/download/1733128908339-1731399660998-英国短毛猫01.png', 580.00, '英国短毛猫（British Shorthair）是一种历史悠久的猫种，起源于英国。以其圆脸、大眼睛和短而密集的毛发著称，被誉为“猫界的英国绅士”。英国短毛猫性格温顺、友好，非常适合家庭饲养，尤其适合有小孩的家庭。', '<h2 style=\"text-align: start;\">一、品种简介</h2><p style=\"text-align: start;\"><span style=\"font-size: 16px;\">英国短毛猫（British Shorthair）是一种历史悠久的猫种，起源于英国。以其圆脸、大眼睛和短而密集的毛发著称，被誉为“猫界的英国绅士”。英国短毛猫性格温顺、友好，非常适合家庭饲养，尤其适合有小孩的家庭。</span></p><h2 style=\"text-align: start;\">二、外观特征</h2><ul><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>体型</strong></span><span style=\"font-size: 16px;\">：中等到大型，体重一般在4-8公斤之间，体格健壮，肌肉发达。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>头部</strong></span><span style=\"font-size: 16px;\">：圆形，面颊丰满，下巴结实。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>眼睛</strong></span><span style=\"font-size: 16px;\">：大而圆，颜色多样，最常见的是金色和铜色，但也可能有绿色、蓝色等。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>耳朵</strong></span><span style=\"font-size: 16px;\">：中等大小，耳尖略圆，间距较宽。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>鼻子</strong></span><span style=\"font-size: 16px;\">：短而直。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>嘴巴</strong></span><span style=\"font-size: 16px;\">：下颌线条清晰，嘴唇紧闭。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>毛发</strong></span><span style=\"font-size: 16px;\">：短而密集，质地柔软，有光泽，不易打结。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>毛色</strong></span><span style=\"font-size: 16px;\">：多种多样，最常见的是蓝色（灰色），还有白色、黑色、银渐层、金渐层、巧克力色、奶油色等。</span></li></ul><h2 style=\"text-align: start;\">三、性格特点</h2><ul><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>温顺</strong></span><span style=\"font-size: 16px;\">：性格温和，容易接近，适合家庭饲养。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>友好</strong></span><span style=\"font-size: 16px;\">：对人友好，喜欢与家人互动，但不会过于依赖。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>独立</strong></span><span style=\"font-size: 16px;\">：有一定的独立性，不需要过多的关注和陪伴。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>安静</strong></span><span style=\"font-size: 16px;\">：相对安静，不会大声叫唤，适合住在公寓或有小孩的家庭。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>适应性强</strong></span><span style=\"font-size: 16px;\">：适应能力强，能够很好地适应各种生活环境。</span></li></ul><h2 style=\"text-align: start;\">四、饲养要点</h2><ol><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">饮食：高质量猫粮：选择高质量的猫粮，确保营养均衡。可以考虑专门针对英国短毛猫的猫粮，以满足其特殊的营养需求。定时喂食：每天定时喂食，避免随意投喂零食，以免影响正常的饮食习惯。适量喂食：英国短毛猫容易发胖，需控制食量，避免过度喂食。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">运动：定期活动：每天提供一定的活动时间，如玩耍、追逐玩具等，帮助消耗多余的能量。室内环境：提供安全的室内环境，避免猫儿外出冒险。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">美容：定期梳理：每周至少梳理一次毛发，以去除死毛和防止打结。换季时需增加梳理频率。洗澡：每月洗澡1-2次，使用专用的宠物香波，避免频繁洗澡导致皮肤干燥。修剪指甲：定期修剪指甲，避免过长导致行走不便或受伤。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">健康：定期体检：每年进行一次全面体检，及时发现并处理健康问题。接种疫苗：按时接种疫苗，预防常见疾病。驱虫：定期驱虫，保持猫咪的健康。眼部和耳朵清洁：定期清洁眼睛和耳朵，预防感染。</span></li></ol>', '上架', '是', 10);
INSERT INTO `virtualGame` VALUES (7, 12, 8, '小丑鱼', '公', 'http://localhost:9090/files/download/1733128989756-1732246527963-小丑鱼.png', 100.00, '小丑鱼（Clownfish），学名双锯鱼（Amphiprioninae），是一种生活在热带珊瑚礁中的小型海水鱼。它们以其鲜艳的橙色和白色条纹而闻名，是海洋中最受欢迎的观赏鱼之一。小丑鱼与海葵之间有着共生关系，这种关系使它们能够在海洋中生存并躲避捕杀', '<h2 style=\"text-align: start;\">一、店铺概况</h2><p style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>店铺名称</strong></span><span style=\"font-size: 16px;\">：小青宠物店</span></p><p style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>营业时间</strong></span><span style=\"font-size: 16px;\">：周一至周日 10:00 - 21:00</span></p><p style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>联系电话</strong></span><span style=\"font-size: 16px;\">：0551-12345678</span></p><p style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>官方网站</strong></span><span style=\"font-size: 16px;\">：</span><a href=\"http://www.xiaoqingvirtual_game.com/\" target=\"_blank\"><span style=\"font-size: 16px;\">www.xiaoqingvirtual_game.com</span></a></p><h2 style=\"text-align: start;\">二、店铺简介</h2><p style=\"text-align: start;\"><span style=\"font-size: 16px;\">小青宠物店位于合肥市蜀山区繁华的万达广场内，是一家专业的宠物用品和宠物销售店。店铺环境优雅，设施齐全，提供各类宠物及其相关用品，包括鱼类、猫、狗等。小青宠物店特别注重鱼类的养殖和销售，其中小丑鱼因其鲜艳的颜色和独特的习性而备受顾客喜爱。</span></p><p style=\"text-align: center;\"><img src=\"http://43.142.9.148:9090/files/download/1732246489596-%E5%B0%8F%E4%B8%91%E9%B1%BC.png\" alt=\"\" data-href=\"\" style=\"width: 100%;\"></p><h2 style=\"text-align: start;\">三、小丑鱼介绍</h2><p style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>小丑鱼</strong></span><span style=\"font-size: 16px;\">（Clownfish），学名</span><span style=\"font-size: 16px;\"><strong>双锯鱼</strong></span><span style=\"font-size: 16px;\">（Amphiprioninae），是一种生活在热带珊瑚礁中的小型海水鱼。它们以其鲜艳的橙色和白色条纹而闻名，是海洋中最受欢迎的观赏鱼之一。小丑鱼与海葵之间有着共生关系，这种关系使它们能够在海洋中生存并躲避捕食者。</span></p><h2 style=\"text-align: start;\">四、小丑鱼的品种</h2><ol><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">普通小丑鱼（Amphiprion ocellaris）：颜色：橙色底色，带有白色条纹。体型：成年个体长度约为10厘米。习性：喜欢与海葵共生，性格温和，适合初学者。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">黑小丑鱼（Amphiprion melanopus）：颜色：黑色底色，带有白色条纹。体型：成年个体长度约为11厘米。习性：同样喜欢与海葵共生，性格温和，适合初学者。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">红小丑鱼（Amphiprion frenatus）：颜色：红色底色，带有白色条纹。体型：成年个体长度约为12厘米。习性：喜欢与海葵共生，性格温和，适合有一定经验的养鱼爱好者。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">三带小丑鱼（Amphiprion tricinctus）：颜色：橙色底色，带有三条白色条纹。体型：成年个体长度约为12厘米。习性：喜欢与海葵共生，性格温和，适合有一定经验的养鱼爱好者。</span></li></ol><h2 style=\"text-align: start;\">五、小丑鱼的饲养要点</h2><ol><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">水质要求：盐度：1.020-1.025。pH值：8.0-8.4。温度：24-28℃。氨氮和亚硝酸盐：保持在0ppm。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">水族箱设置：尺寸：至少30升的水族箱，更大的水族箱更适合。过滤器：使用高效的过滤器，保持水质清洁。底材：使用细沙或珊瑚砂。装饰：提供海葵或其他类似的避难所，模拟自然环境。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">喂食：食物：提供高质量的鱼食，如冻干虾、鱼片、专用的海水鱼颗粒。频率：每天喂食1-2次，每次喂食量以鱼能在几分钟内吃完为准。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">健康监测：观察：定期观察鱼的活动和食欲，如有异常及时处理。水质检测：每周检测水质，确保各项指标在正常范围内。</span></li></ol><p style=\"text-align: start;\"><br></p>', '上架', '是', 7);
INSERT INTO `virtualGame` VALUES (8, 12, 5, '黄缘龟', '公', 'http://localhost:9090/files/download/1733129175629-微信截图_20241202164555.png', 2000.00, '黄缘闭壳龟是龟鳖目龟科闭壳龟属爬行动物，又名夹板龟。成龟背甲呈圆形，中央隆起，绛红色，中央具淡黄色脊棱；腹甲黑色，无斑点，边缘黄色；头顶淡橄榄绿色，眼眶上有一条金黄色条纹，由细变粗延伸至颈部，左右条纹在头顶部相遇后连接形成U形条纹，侧面淡黄色，下颌淡黄色或橘红色；四肢黑褐色，有较大鳞片，指、趾间具半蹼；尾褐色且短。因背甲缘盾腹面为黄色而得名', '<h2><span style=\"font-size: 22px;\">黄缘龟介绍</span></h2><p style=\"line-height: 2;\"><span style=\"color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-size: 14px;\">黄缘闭壳龟头部光滑无鳞，鼓膜圆而清晰，头部背面浅橄榄色，吻前端平，上喙有明显的勾曲，下颌橘红色，两眼后各有一条金黄色宽条纹，两纹在头部背面交汇成“U”形弧纹，纹后的颈部呈浅橘红色。背甲绛红色或棕红色，高而隆起，正中有一条淡黄色脊棱，壳高约为壳长的1/2，背甲缘盾略上翘，盾片上有较清晰的同心环纹。腹甲棕黑色，外缘与缘盾腹面呈米黄色，腹甲前缘略突出，后缘呈椭圆弧形，前后边缘均无缺刻。背甲与腹甲间、腹甲前后两部分间借韧带相连。腹甲前后两部分能向上闭合于背甲，头、尾及四肢可完全缩入壳内。四肢略扁平，上覆有瓦状排列的鳞片，呈灰褐色，前肢基部呈浅橘红色，具五趾，后肢基部呈米黄色，具四趾，趾间具微蹼，尾短，两后肢之间及尾部的皮肤具疣粒。</span></p><h2 style=\"line-height: 2;\"><span style=\"color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-size: 22px;\">饲养条件</span></h2><p style=\"text-align: left;\">首先，了解乌龟的品种习性是关键。不同种类的乌龟有不同的生活习性，例如生水龟和潜水龟对温度的需求不同，有些乌龟需要在加温环境下生存，而有些则可以正常冬眠。选择合适的饲养容器也很重要，可以使用收纳箱、物流箱或鱼缸，并在使用前进行消毒处理。容器的高度不应过浅，以防止乌龟逃出，同时饲养密度也不宜过大，以免乌龟因抢食而受伤。‌</p><p style=\"text-align: left;\">使用经过晾晒的自来水或使用鱼乐宝可以去除水中的有害物质，促进水中藻类和益生菌的繁殖。水位应保持在乌龟背甲长度的0.5到1倍之间，以便乌龟随时伸出头来换气。定期换水并保持水温一致是必要的，也可以使用过滤器来净化水质，减少换水频率。</p><p style=\"text-align: left;\">乌龟是杂食性动物，喜食昆虫、蠕虫、小鱼虾等动物性食物，也食用嫩叶、浮萍、草种、稻谷等植物。保持饮食多样性有助于乌龟的健康。‌</p><p style=\"text-align: left;\">常见的疾病包括甲壳溃疡等，这些疾病可能由细菌通过擦伤的伤口进入体内引起。治疗时可以使用药浴和适当的抗生素，但需注意乌龟可能对某些抗生素过敏。‌</p><p><br></p><p><br></p>', '上架', '是', 10);
INSERT INTO `virtualGame` VALUES (9, 11, 3, '布偶猫', '母', 'http://localhost:9090/files/download/1733129497999-1731400186888-布偶猫01.png', 800.00, '布偶猫（Ragdoll）是一种大型、长毛的猫种，起源于美国。以其温柔的性格、美丽的外表和对人类的极度亲和而著称，被誉为“小狗猫”。布偶猫非常适合家庭饲养，尤其是有小孩的家庭，因为它们非常友好、耐心，喜欢与人互动。', '<h2 style=\"text-align: start;\">一、品种简介</h2><p style=\"text-align: start;\"><span style=\"font-size: 16px;\">布偶猫（Ragdoll）是一种大型、长毛的猫种，起源于美国。以其温柔的性格、美丽的外表和对人类的极度亲和而著称，被誉为“小狗猫”。布偶猫非常适合家庭饲养，尤其是有小孩的家庭，因为它们非常友好、耐心，喜欢与人互动。</span></p><h2 style=\"text-align: start;\">二、外观特征</h2><ul><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>体型</strong></span><span style=\"font-size: 16px;\">：大型，体重一般在4-9公斤之间，体格健壮，肌肉发达。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>头部</strong></span><span style=\"font-size: 16px;\">：中等大小，呈楔形，额部宽阔，鼻梁直。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>眼睛</strong></span><span style=\"font-size: 16px;\">：大而圆，颜色为蓝色，非常引人注目。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>耳朵</strong></span><span style=\"font-size: 16px;\">：中等大小，耳尖略圆，间距适中。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>鼻子</strong></span><span style=\"font-size: 16px;\">：长度适中，鼻梁直。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>嘴巴</strong></span><span style=\"font-size: 16px;\">：下颌线条清晰，嘴唇紧闭。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>毛发</strong></span><span style=\"font-size: 16px;\">：长而柔软，质地丝滑，有光泽，不易打结。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>毛色</strong></span><span style=\"font-size: 16px;\">：主要有三种颜色模式：重点色（Point）、手套色（Mitted）、梵高色（Bicolor）。常见的毛色有海豹色、蓝色、巧克力色、奶油色、红色、薰衣草色等。</span></li></ul><h2 style=\"text-align: start;\">三、性格特点</h2><ul><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>温顺</strong></span><span style=\"font-size: 16px;\">：性格极为温顺，容易接近，适合家庭饲养。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>友好</strong></span><span style=\"font-size: 16px;\">：对人极其友好，喜欢与家人互动，喜欢被人抱在怀里。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>耐心</strong></span><span style=\"font-size: 16px;\">：非常有耐心，对小孩也非常友善，适合有小孩的家庭。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>亲人</strong></span><span style=\"font-size: 16px;\">：对主人非常依赖，喜欢跟随主人的脚步，被称为“小狗猫”。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>安静</strong></span><span style=\"font-size: 16px;\">：相对安静，不会大声叫唤，适合住在公寓或有小孩的家庭。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\"><strong>适应性强</strong></span><span style=\"font-size: 16px;\">：适应能力强，能够很好地适应各种生活环境。</span></li></ul><h2 style=\"text-align: start;\">四、饲养要点</h2><ol><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">饮食：高质量猫粮：选择高质量的猫粮，确保营养均衡。可以考虑专门针对布偶猫的猫粮，以满足其特殊的营养需求。定时喂食：每天定时喂食，避免随意投喂零食，以免影响正常的饮食习惯。适量喂食：布偶猫容易发胖，需控制食量，避免过度喂食。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">运动：定期活动：每天提供一定的活动时间，如玩耍、追逐玩具等，帮助消耗多余的能量。室内环境：提供安全的室内环境，避免猫儿外出冒险。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">美容：定期梳理：每周至少梳理2-3次毛发，以去除死毛和防止打结。换季时需增加梳理频率。洗澡：每月洗澡1-2次，使用专用的宠物香波，避免频繁洗澡导致皮肤干燥。修剪指甲：定期修剪指甲，避免过长导致行走不便或受伤。</span></li><li style=\"text-align: start;\"><span style=\"font-size: 16px;\">健康：定期体检：每年进行一次全面体检，及时发现并处理健康问题。接种疫苗：按时接种疫苗，预防常见疾病。驱虫：定期驱虫，保持猫咪的健康。眼部和耳朵清洁：定期清洁眼睛和耳朵，预防感染。</span></li></ol>', '上架', '否', 10);
INSERT INTO `virtualGame` VALUES (10, 15, 3, '小柴犬', '公', 'http://localhost:9090/files/download/1733278379510-1731396169854-小型柴犬01.jpg', 1000.00, '柴犬的头部的前额较宽，吻部尖细突出，颈索粗壮有力，尾巴粗壮而向背上卷曲；体毛较短，茂密厚实，毛质刚直粗硬。眼睛稍呈三角形，深陷，朝着耳朵的外耳根部向上倾斜，耳朵三角形，小而且牢固地竖立，但和头及身体大小相称。嘴唇紧而黑，鼻子为黑色。前胸发育良好。四肢骨料粗壮，强健有力，站立姿势好，后肢大腿肌肉丰满', '<h2>饮食习惯</h2><p>柴犬是杂食动物，应为其选择营养均衡的高品质犬粮，并根据柴犬的成长发育，选择不同年龄阶段的犬粮。并加强饮食管理，增加合理的运动量，包括外出散步的时间、玩互动玩具的时间等<sup><em> </em></sup>。</p><p>柴犬经过长期培育珍养，便形成<sup><em> </em></sup>性情温顺，忠实，有服从性、忍耐，朴实而雅致，灵巧机敏，英勇大胆、亲切而富有感情，这些特点共同产生一种独特的天性。对陌生人有所保留，但对于得到它尊重的人则显得忠诚而挚爱。有时会攻击其他狗<sup><em> </em></sup>。</p><h2>驯养方式</h2><p>柴犬驯养柴犬的要点在于要与其建立值得信赖的主仆关系。要教会它分辨好坏，只要对它充满关爱并让它的生活形成规律，柴犬将会是非常容易饲养的。 柴犬头脑聪明，生活中主人交给的任何工作都会努力去完成。运动能提高它的体能储备，应让它习惯在户外进行大运动量活动，运动量得到满足后在室内它就会很安静。柴犬适合作为孩子的游戏犬，也非常适合作为老年人的陪伴犬</p>', '上架', '否', 9);
INSERT INTO `virtualGame` VALUES (11, 14, 7, '宠物小蜘蛛', '母', 'http://localhost:9090/files/download/1733278607533-蜘蛛.png', 100.00, '蜘蛛，属于节肢动物。头前部长有一对螯肢，螯肢末端是有毒腺导管的毒牙；在胸部两侧还有四对足，足尖处长有坚硬的爪；蜘蛛的眼睛是单眼，也有八只眼睛，六只和四只眼睛的蜘蛛', '<h2>形态特点</h2><p>不同种类的蜘蛛体长从0.05毫米到60毫米不等。身体分头胸部和腹部。部分种类头胸部背面有胸甲（有的没有），头胸部前端通常有8个单眼（也有六个、四个、二个、零个的），排成二～四行。腹面有一片大的胸板，胸板前方两个额叶中间有下唇。腹部不分节，腹柄由第1腹节（第7体节）演变而来。腹部多为圆形或卵圆形，有的具各种突起，形状奇特。腹部腹面纺器由附肢演变而来，少数原始的种类有8个，位置稍靠前；大多数种类6个纺器，位于体后端肛门的前方；还有部分种类具4个纺器，纺器上有许多纺管，内连各种丝腺，由纺管纺出丝。感觉器官有眼、各种感觉毛、听毛、琴形器和跗节器。<sup><em> </em></sup></p><p><span style=\"color: rgb(85, 85, 85); font-size: 12px; font-family: 宋体;\">蜘蛛</span>蜘蛛体外被几丁质外骨骼，身体明显地分为头胸部及腹部，二者之间往往由腹部第一腹节变成的细柄相连接，无尾节或尾鞭。蜘蛛无复眼，头胸部有附肢6对，第一、二对属头部附肢，其中第一对为螯肢多为2节，基部膨大部分为螯节，端部尖细部分为螯牙，牙为管状，螯节内或头胸部内有毒腺，其分泌的毒液即由此导出。第二对附肢称为脚须，形如步足，但只具6节，基节近口部形成颚状突起，可助摄食，雌蛛末节无大变化，而雄蛛脚须末节则特化为生殖辅助器官，具有储精、传精结构，称触肢器。第三至六对附肢为步足，由7节组成，末端有爪，爪下还有硬毛一丛，故适于在光滑的物体上爬行。</p><h2 style=\"text-align: start;\">栖息环境</h2><p><span style=\"color: rgb(51, 51, 51); background-color: rgb(255, 255, 255); font-size: 14px;\">蜘蛛分布于中国各地，多栖息于屋檐、墙角和树间，结车轮状网。</span></p><h2 style=\"text-align: start;\">食性</h2><p>蜘蛛食性杂，主要以苍蝇等昆虫<sup><em> </em></sup>、其他蜘蛛、多足类为食，部分蜘蛛也会以小型动物为食，耐饱饿<sup><em> [20]</em></sup>。跳蛛视力佳，能在30厘米内潜近捕获猎物，猛扑过去。蟹蛛在与其体色相近的花上等候猎物。穴居在土中的地蛛筑衬以丝的地穴，洞口有夜间打开的活盖，捕食从洞口经过的昆虫。漏斗蛛织漏斗网，昆虫落网即引起振动；蜘蛛本身居于丝管内，末端窄而通入植物丛或石缝中。<sup><em> </em></sup></p><p>大多数圆蛛用最少的丝织成面积最大的网，网像一个空中滤器，陷捕未看见细丝的、飞行力不强的昆虫。网虽复杂，但一般在1小时内即能织成，多在天亮前完成。若网于捕食时破坏，则另织一新网。织圆网时，蜘蛛放出一丝，随风飘荡。如果丝的游离端未能黏在某物上，则蜘蛛把丝拉回吃掉。若该丝牢固地黏在某物（如树枝）上，则蜘蛛从该丝桥上通过，再以丝将它加固。蜘蛛在桥的中央固著一丝，自身坠在一条丝上往下垂，到地面上或另一树枝上，把此丝黏著。蜘蛛回到中心，拉多根从网中心向四周辐射的辐射丝。然后，蜘蛛爬回网中心，从里向外用乾丝拉临时的螺旋丝，各圈螺旋丝之间间距较大。然后蜘蛛爬到最外围，自外向网中心安置带黏性的较紧密的捕虫螺旋丝。一边结，一边把先前结的不带黏性的乾螺旋丝吃掉。网全部完工后，有的蜘蛛从网中心拉一根丝（信号丝）爬到网的一角的树叶中隐蔽起来。</p><p>若有昆虫投网，透过信号丝的振动便可闻讯而来取食。有的蜘蛛头朝下留在网中心，等候猎物，有猎物时先用丝将其缠绕，再叮咬之并将其携回网中心或隐蔽处进食或贮藏。蝶蛾类较大，易于逃脱，故先叮咬后用丝捆缚。有的蜘蛛结共用网，如加彭的社会漏斗蛛（Agelena conso ciata）筑一大网，几百只蜘蛛共同捕食。蜘蛛在控制某些昆虫的种群上可能起重要的作用。有几种毒蛛的神经毒对人有毒性。织网过程引起科学上的兴趣，并已用于研究影响神经系统的药物（用药后蜘蛛所织的网异于平常）。</p>', '上架', '否', 10);

-- ----------------------------
-- Table structure for virtual_game_orders
-- ----------------------------
DROP TABLE IF EXISTS `virtual_game_orders`;
CREATE TABLE `virtual_game_orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `shop_id` int(11) NULL DEFAULT NULL COMMENT '宠物店id',
  `virtual_game_id` int(11) NULL DEFAULT NULL COMMENT '宠物id',
  `virtual_game_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '宠物名称',
  `virtual_game_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '宠物图片',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '宠物价格',
  `pickup_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人名称',
  `pickup_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人地址',
  `pickup_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人电话',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单状态',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '宠物订单信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of virtual_game_orders
-- ----------------------------
INSERT INTO `virtual_game_orders` VALUES (15, '2024120412716', 4, 12, 7, '小丑鱼', 'http://localhost:9090/files/download/1733128989756-1732246527963-小丑鱼.png', 100.00, '小青哥哥哥', '合肥市蜀山区科技大道101号', '13899887766', '待发货', '2024-12-04 15:13:32');
INSERT INTO `virtual_game_orders` VALUES (16, '2024120430370', 4, 12, 7, '小丑鱼', 'http://localhost:9090/files/download/1733128989756-1732246527963-小丑鱼.png', 100.00, '小青哥哥哥', '合肥市蜀山区科技大道101号', '13899887766', '已取消', '2024-12-04 15:33:50');
INSERT INTO `virtual_game_orders` VALUES (17, '2024120430361', 4, 12, 7, '小丑鱼', 'http://localhost:9090/files/download/1733128989756-1732246527963-小丑鱼.png', 100.00, '小青哥哥哥', '合肥市蜀山区科技大道101号', '13899887766', '待支付', '2024-12-04 15:53:50');
INSERT INTO `virtual_game_orders` VALUES (18, '2024120468101', 8, 12, 7, '小丑鱼', 'http://localhost:9090/files/download/1733128989756-1732246527963-小丑鱼.png', 100.00, '小妹妹', '北京市丰台区莲花池路1110号', '13988997766', '已完成', '2024-12-04 15:56:08');
INSERT INTO `virtual_game_orders` VALUES (19, '2024121016102', 4, 11, 4, '金毛寻回犬', 'http://localhost:9090/files/download/1733125943746-1731554448814-金毛01.jpg', 100.00, '小青哥哥哥', '合肥市蜀山区科技大道101号', '13899887766', '待发货', '2024-12-10 15:41:56');
INSERT INTO `virtual_game_orders` VALUES (20, '2024121016706', 4, 15, 10, '小柴犬', 'http://localhost:9090/files/download/1733278379510-1731396169854-小型柴犬01.jpg', 1000.00, '小青哥哥', '合肥市政务区阳光大道1100号', '13877886688', '待发货', '2024-12-10 16:00:16');
INSERT INTO `virtual_game_orders` VALUES (21, '2024121031599', 4, 13, 5, '虎皮鹦鹉', 'http://localhost:9090/files/download/1733126623940-1731548086622-虎皮鹦鹉01.png', 100.00, '小青哥哥哥', '合肥市蜀山区科技大道101号', '13899887766', '待发货', '2024-12-10 16:00:31');

-- ----------------------------
-- Table structure for virtual_game_shop
-- ----------------------------
DROP TABLE IF EXISTS `virtual_game_shop`;
CREATE TABLE `virtual_game_shop`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `sell_virtual_game` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '销售宠物',
  `address` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `introduce` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '介绍',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮件',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色',
  `practice_license` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '认证图片',
  `principal_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人名称',
  `principal_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人身份证号',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '认证状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '宠物店信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of virtual_game_shop
-- ----------------------------
INSERT INTO `virtual_game_shop` VALUES (11, 'xiaomei', '小美宠物店', '123', 'http://localhost:9090/files/download/1733108906854-8.png', '13988997788', '[\"哺乳类\"]', '合肥市蜀山区武原大道小美宠物店', '小美宠物店位于城市中心的一条繁华商业街上，是一家集宠物销售、宠物用品、宠物美容、宠物寄养、宠物培训、宠物医疗为一体的综合性宠物服务中心。我们致力于为每一位宠物爱好者提供高品质的服务和产品，让您的爱宠在这里享受到最专业的关爱和呵护。无论是寻找理想的宠物伙伴，还是为您的爱宠选购高品质的用品，小美宠物店都是您的最佳选择。', NULL, 'PETSHOP', 'http://localhost:9090/files/download/1733109070518-经营许可证.png', '王美', '342500199909087897', '审核通过');
INSERT INTO `virtual_game_shop` VALUES (12, 'xiaoqing', '小青宠物店', '123', 'http://localhost:9090/files/download/1733125074612-1732245305605-宠物店06.png', NULL, '[\"鱼类\",\"爬行类\"]', '北京市东城区110号', '小青宠物店是一家专业的宠物用品和宠物销售店。店铺环境优雅，设施齐全，提供各类宠物及其相关用品，包括鱼类、爬行宠物等。无论是寻找可爱的宠物伴侣，还是购买高品质的宠物用品，小青宠物店都能满足您的需求。', NULL, 'PETSHOP', 'http://localhost:9090/files/download/1733125312954-经营许可证.png', '小青哥哥', '342800199807198978', '审核通过');
INSERT INTO `virtual_game_shop` VALUES (13, 'dachui', '大锤宠物店', '123', 'http://localhost:9090/files/download/1733125417470-1732245305605-宠物店06.png', NULL, '[\"鸟类\"]', '北京东路110号', '在繁华都市的一隅，隐藏着一片充满欢声笑语的天地——小鸡乐园。这是一座专为家庭和孩子们打造的综合性娱乐场所，自2010年开业以来，已经成为无数家庭周末休闲和亲子互动的理想选择。小鸡乐园以其独特的设计理念、丰富的游乐设施和贴心的服务，吸引了众多游客前来体验。', NULL, 'PETSHOP', 'http://localhost:9090/files/download/1733125457012-经营许可证.png', '王大锤', '101010199509087890', '审核通过');
INSERT INTO `virtual_game_shop` VALUES (14, 'kele', '可乐宠物店', '123', 'http://localhost:9090/files/download/1733132000277-1731478736594-柯基01.png', '13900998899', '[\"两栖类\",\"昆虫类\"]', '南京西路120号', '可乐宠物店位于城市中心的繁华商圈，是一家集宠物销售、宠物用品、宠物美容、宠物寄养、宠物培训为一体的综合性宠物服务中心。我们致力于为每一位宠物爱好者提供高品质的服务和产品，让您的爱宠在这里享受到最专业的关爱和呵护。无论是寻找理想的宠物伙伴，还是为您的爱宠选购高品质的用品，可乐宠物店都是您的最佳选择。', NULL, 'PETSHOP', 'http://localhost:9090/files/download/1733132038518-经营许可证.png', '李可乐', '342900199807061989', '审核通过');
INSERT INTO `virtual_game_shop` VALUES (15, 'my', '明月宠物店', '123', 'http://localhost:9090/files/download/1733132066643-1732377158356-宠物店11.jpg', '13899887755', '[\"哺乳类\",\"爬行类\"]', '上海路1101号', '在喧嚣的城市一角，有一家温馨而充满活力的宠物店——明月宠物店。自2005年开业以来，明月宠物店凭借其专业、贴心的服务和丰富多样的宠物用品，成为了众多宠物爱好者和主人的首选之地。', NULL, 'PETSHOP', 'http://localhost:9090/files/download/1733132114206-经营许可证.png', '张月月', '342700199905091986', '审核通过');

-- ----------------------------
-- Table structure for virtual_game_type
-- ----------------------------
DROP TABLE IF EXISTS `virtual_game_type`;
CREATE TABLE `virtual_game_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '宠物类型信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of virtual_game_type
-- ----------------------------
INSERT INTO `virtual_game_type` VALUES (3, '哺乳类');
INSERT INTO `virtual_game_type` VALUES (4, '鸟类');
INSERT INTO `virtual_game_type` VALUES (5, '爬行类');
INSERT INTO `virtual_game_type` VALUES (6, '两栖类');
INSERT INTO `virtual_game_type` VALUES (7, '昆虫类');
INSERT INTO `virtual_game_type` VALUES (8, '鱼类');

-- ----------------------------
-- Table structure for slideshow
-- ----------------------------
DROP TABLE IF EXISTS `slideshow`;
CREATE TABLE `slideshow`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `virtual_game_id` int(11) NULL DEFAULT NULL COMMENT '关联宠物',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '轮播图信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of slideshow
-- ----------------------------
INSERT INTO `slideshow` VALUES (1, 9, 'http://localhost:9090/files/download/1733129525641-c1.jpg');
INSERT INTO `slideshow` VALUES (2, 6, 'http://localhost:9090/files/download/1733129601406-c3.jpg');
INSERT INTO `slideshow` VALUES (3, 4, 'http://localhost:9090/files/download/1733129614596-c2.jpg');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `account` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '余额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (4, 'aaa', '123', '小哥哥', 'http://localhost:9090/files/download/1733111378687-5.png', 'USER', '13988997788', 'xgg@xm.com', 527.00);
INSERT INTO `user` VALUES (5, 'ccc', '123', '小姐姐11', 'http://localhost:9090/files/download/1733110908522-2.png', 'USER', '13899887766', NULL, 0.00);
INSERT INTO `user` VALUES (8, 'acc', '123', '小妹妹', 'http://localhost:9090/files/download/1733112185139-10.png', 'USER', NULL, NULL, 100.00);
INSERT INTO `user` VALUES (9, 'abb', '123', 'abb', 'http://localhost:9090/files/download/1733112175901-9.png', 'USER', NULL, NULL, 0.00);

SET FOREIGN_KEY_CHECKS = 1;
