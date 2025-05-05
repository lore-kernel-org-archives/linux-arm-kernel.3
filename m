Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C4BC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 00:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FAPQNN3q8kMW6mnCT7+9YQZhdOh/ypJlF6O+RIjEDp4=; b=XAw3wsjnLjjMrksizh2vzIuxaJ
	TSqRYEBql87A9THC0705E10vgeF0QZuQND0UmwGNqRHi0Ft1LI/fZFyOy2FfkkDpKW+5FahpO0C44
	83P+fAvrZLiPQbdWTpj9zk2ga28fcj0kFB4yKBfErx14hZb2Vg589rdZC2l8Jbqlt98P/UNo8gR5O
	Q+2ZFPifk1la497Oha2HYx7u7uNB7rpRGhvpJ46n5WWr9FrwVE+X+Aik9tL8sA86Oil+nwtdRIKB5
	hQX5YYRtsj9Wk5WRbo5YP9h0mj00aZzgprlzziV4KdBpT7/jfupb2BzpVmztP72DR6vunv4T6sB47
	ANZc6G/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC5m8-00000009Bqe-0tfA;
	Tue, 06 May 2025 00:03:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4F2-00000008kPq-2wDL;
	Mon, 05 May 2025 22:24:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4CE3BA4CD1D;
	Mon,  5 May 2025 22:19:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57D43C4CEE4;
	Mon,  5 May 2025 22:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483891;
	bh=dax5wqEKuM333ZcfbQ21Tr60WY5WK+s4KXT4IfgTIks=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=htgu/O5ZpN8WbAns0hUZxYzSw5qqq0j/ZTFxgwSeNxalBruO9CGFSE/T2vTKyxyhh
	 lOE/rwP9gy6xVpiQG3Elzs1sOjwyO8ZOUD1xT9vMWnoruMjUuAErL6r4HRNIgstxma
	 alxkSYQbLK1r584IMQGq6MU4arHyYVA9AuVwwUvZxg1OXYd1XA96VbjFEJxUS7csVX
	 UlCpjQKT4uEPJy2D2xNzo5SRmIuu1BUG2OskO9OLgCTkwwDWrKl3SJHnqlzYOyK/CO
	 gLrBzFt/dH2mtWkcXHkZKt66fnV22oOG0+rSZWz/mm1GCxiPMDMVr8qSBWmUMfs5ZK
	 sP6CctHarVuPA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Artur Weber <aweber.kernel@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	dan.carpenter@linaro.org,
	linux-gpio@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 258/642] pinctrl: bcm281xx: Use "unsigned int" instead of bare "unsigned"
Date: Mon,  5 May 2025 18:07:54 -0400
Message-Id: <20250505221419.2672473-258-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_152452_871594_245EB9DB 
X-CRM114-Status: GOOD (  11.34  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Artur Weber <aweber.kernel@gmail.com>

[ Upstream commit 07b5a2a13f4704c5eae3be7277ec54ffdba45f72 ]

Replace uses of bare "unsigned" with "unsigned int" to fix checkpatch
warnings. No functional change.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
Link: https://lore.kernel.org/20250303-bcm21664-pinctrl-v3-2-5f8b80e4ab51@gmail.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c | 44 +++++++++++++-------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
index cf6efa9c0364a..a039b490cdb8e 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
@@ -72,7 +72,7 @@ static enum bcm281xx_pin_type hdmi_pin = BCM281XX_PIN_TYPE_HDMI;
 struct bcm281xx_pin_function {
 	const char *name;
 	const char * const *groups;
-	const unsigned ngroups;
+	const unsigned int ngroups;
 };
 
 /*
@@ -84,10 +84,10 @@ struct bcm281xx_pinctrl_data {
 
 	/* List of all pins */
 	const struct pinctrl_pin_desc *pins;
-	const unsigned npins;
+	const unsigned int npins;
 
 	const struct bcm281xx_pin_function *functions;
-	const unsigned nfunctions;
+	const unsigned int nfunctions;
 
 	struct regmap *regmap;
 };
@@ -941,7 +941,7 @@ static struct bcm281xx_pinctrl_data bcm281xx_pinctrl = {
 };
 
 static inline enum bcm281xx_pin_type pin_type_get(struct pinctrl_dev *pctldev,
-						  unsigned pin)
+						  unsigned int pin)
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
@@ -985,7 +985,7 @@ static int bcm281xx_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
 }
 
 static const char *bcm281xx_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
-						   unsigned group)
+						   unsigned int group)
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
@@ -993,9 +993,9 @@ static const char *bcm281xx_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
 }
 
 static int bcm281xx_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
-					   unsigned group,
+					   unsigned int group,
 					   const unsigned **pins,
-					   unsigned *num_pins)
+					   unsigned int *num_pins)
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
@@ -1007,7 +1007,7 @@ static int bcm281xx_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
 
 static void bcm281xx_pinctrl_pin_dbg_show(struct pinctrl_dev *pctldev,
 					  struct seq_file *s,
-					  unsigned offset)
+					  unsigned int offset)
 {
 	seq_printf(s, " %s", dev_name(pctldev->dev));
 }
@@ -1029,7 +1029,7 @@ static int bcm281xx_pinctrl_get_fcns_count(struct pinctrl_dev *pctldev)
 }
 
 static const char *bcm281xx_pinctrl_get_fcn_name(struct pinctrl_dev *pctldev,
-						 unsigned function)
+						 unsigned int function)
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
@@ -1037,9 +1037,9 @@ static const char *bcm281xx_pinctrl_get_fcn_name(struct pinctrl_dev *pctldev,
 }
 
 static int bcm281xx_pinctrl_get_fcn_groups(struct pinctrl_dev *pctldev,
-					   unsigned function,
+					   unsigned int function,
 					   const char * const **groups,
-					   unsigned * const num_groups)
+					   unsigned int * const num_groups)
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
@@ -1050,8 +1050,8 @@ static int bcm281xx_pinctrl_get_fcn_groups(struct pinctrl_dev *pctldev,
 }
 
 static int bcm281xx_pinmux_set(struct pinctrl_dev *pctldev,
-			       unsigned function,
-			       unsigned group)
+			       unsigned int function,
+			       unsigned int group)
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 	const struct bcm281xx_pin_function *f = &pdata->functions[function];
@@ -1082,7 +1082,7 @@ static const struct pinmux_ops bcm281xx_pinctrl_pinmux_ops = {
 };
 
 static int bcm281xx_pinctrl_pin_config_get(struct pinctrl_dev *pctldev,
-					   unsigned pin,
+					   unsigned int pin,
 					   unsigned long *config)
 {
 	return -ENOTSUPP;
@@ -1091,9 +1091,9 @@ static int bcm281xx_pinctrl_pin_config_get(struct pinctrl_dev *pctldev,
 
 /* Goes through the configs and update register val/mask */
 static int bcm281xx_std_pin_update(struct pinctrl_dev *pctldev,
-				   unsigned pin,
+				   unsigned int pin,
 				   unsigned long *configs,
-				   unsigned num_configs,
+				   unsigned int num_configs,
 				   u32 *val,
 				   u32 *mask)
 {
@@ -1207,9 +1207,9 @@ static const u16 bcm281xx_pullup_map[] = {
 
 /* Goes through the configs and update register val/mask */
 static int bcm281xx_i2c_pin_update(struct pinctrl_dev *pctldev,
-				   unsigned pin,
+				   unsigned int pin,
 				   unsigned long *configs,
-				   unsigned num_configs,
+				   unsigned int num_configs,
 				   u32 *val,
 				   u32 *mask)
 {
@@ -1277,9 +1277,9 @@ static int bcm281xx_i2c_pin_update(struct pinctrl_dev *pctldev,
 
 /* Goes through the configs and update register val/mask */
 static int bcm281xx_hdmi_pin_update(struct pinctrl_dev *pctldev,
-				    unsigned pin,
+				    unsigned int pin,
 				    unsigned long *configs,
-				    unsigned num_configs,
+				    unsigned int num_configs,
 				    u32 *val,
 				    u32 *mask)
 {
@@ -1321,9 +1321,9 @@ static int bcm281xx_hdmi_pin_update(struct pinctrl_dev *pctldev,
 }
 
 static int bcm281xx_pinctrl_pin_config_set(struct pinctrl_dev *pctldev,
-					   unsigned pin,
+					   unsigned int pin,
 					   unsigned long *configs,
-					   unsigned num_configs)
+					   unsigned int num_configs)
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 	enum bcm281xx_pin_type pin_type;
-- 
2.39.5


