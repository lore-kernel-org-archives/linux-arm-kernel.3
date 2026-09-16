Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D3FC982C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 05:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bv42BCq0VbJx83T3QQNyUqvHP1MGmtolrNTMYYRob5Y=; b=NoK/Z4wpXGlT7oOFHnQrduDASy
	O9ge0tj7+TAFvuph4q6mL3yt6/Glm1tdJT1jps7zKLLfs+3R7FQHOJj5o3GvKHo7HqkoCcXWXUlHR
	v8rZcEsxxpdSKIqCHPP6C5wczRgeBkzHSoBn1FjapAjwC2AalFa1skWRxLiKa5+Okou+d+OJ6MS1G
	XLKJkTyPfYFejN9nobFQ4doWcAMpj3AIFnUoMj6a3bvlqxSyXgSUKip9ChKXYCiULl7K9rMsXxrCQ
	RMqODOphchPLjep0OZ0DIq4jkXlHR3tkNWrWUmxuVin8W/Njj+fARHSMyv8JyEd0eJX73rY83zF7w
	w4c/K2Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6iEw-00000008OLO-3uY8;
	Wed, 16 Sep 2026 05:31:26 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6iEV-00000008O3Q-0rih
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 05:31:01 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 16 Sep
 2026 13:30:39 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 16 Sep 2026 13:30:39 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Wed, 16 Sep 2026 13:30:41 +0800
Subject: [PATCH v3 4/9] EDAC/aspeed: Clean up whitespace and include
 ordering
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260916-edac-v3-4-23e9ed2fbdf9@aspeedtech.com>
References: <20260916-edac-v3-0-23e9ed2fbdf9@aspeedtech.com>
In-Reply-To: <20260916-edac-v3-0-23e9ed2fbdf9@aspeedtech.com>
To: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-edac@vger.kernel.org>, Borislav Petkov <bp@suse.de>, Ryan Chen
	<ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789536639; l=4626;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=FhGqCgC1qcv7kHcNVhXGaiiu15ASlL/TX82CfVZ7NtU=;
 b=4Xo/osRwy3I1OWVSj7PlvVFVWiFO/6HzMd9tjo5CsuPIo9o+HF/zF65MGUc0r7J0dG6b2eyUE
 heUPiGa8yleCJirwrK3EqH2Gt5soyvuUWC0ykGbYg4AzvUp5izGwXke
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_223059_363847_281DDA8D 
X-CRM114-Status: GOOD (  15.52  )
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

The driver separates functions and definition groups with two blank
lines where the kernel style uses one, its headers are not sorted, and it
includes linux/stop_machine.h without using it. Collapse the double blank
lines, drop the unused include and sort the rest alphabetically so the
following changes start from a consistent style.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 drivers/edac/aspeed_edac.c | 34 +++++++++-------------------------
 1 file changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/edac/aspeed_edac.c b/drivers/edac/aspeed_edac.c
index e05ebed5c2f2..cd2a6fcca355 100644
--- a/drivers/edac/aspeed_edac.c
+++ b/drivers/edac/aspeed_edac.c
@@ -4,20 +4,17 @@
  */
 
 #include <linux/edac.h>
-#include <linux/module.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
-#include <linux/platform_device.h>
-#include <linux/stop_machine.h>
 #include <linux/io.h>
+#include <linux/module.h>
 #include <linux/of_address.h>
+#include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include "edac_module.h"
 
-
 #define DRV_NAME "aspeed-edac"
 
-
 #define ASPEED_MCR_PROT        0x00 /* protection key register */
 #define ASPEED_MCR_CONF        0x04 /* configuration register */
 #define ASPEED_MCR_INTR_CTRL   0x50 /* interrupt control/status register */
@@ -25,19 +22,16 @@
 #define ASPEED_MCR_ADDR_REC    0x5c /* address of last recoverable error */
 #define ASPEED_MCR_LAST        ASPEED_MCR_ADDR_REC
 
-
-#define ASPEED_MCR_PROT_PASSWD	            0xfc600309
-#define ASPEED_MCR_CONF_DRAM_TYPE               BIT(4)
-#define ASPEED_MCR_CONF_ECC                     BIT(7)
-#define ASPEED_MCR_INTR_CTRL_CLEAR             BIT(31)
-#define ASPEED_MCR_INTR_CTRL_CNT_REC   GENMASK(23, 16)
-#define ASPEED_MCR_INTR_CTRL_CNT_UNREC GENMASK(15, 12)
-#define ASPEED_MCR_INTR_CTRL_ENABLE  (BIT(0) | BIT(1))
-
+#define ASPEED_MCR_PROT_PASSWD          0xfc600309
+#define ASPEED_MCR_CONF_DRAM_TYPE       BIT(4)
+#define ASPEED_MCR_CONF_ECC             BIT(7)
+#define ASPEED_MCR_INTR_CTRL_CLEAR      BIT(31)
+#define ASPEED_MCR_INTR_CTRL_CNT_REC    GENMASK(23, 16)
+#define ASPEED_MCR_INTR_CTRL_CNT_UNREC  GENMASK(15, 12)
+#define ASPEED_MCR_INTR_CTRL_ENABLE     (BIT(0) | BIT(1))
 
 static struct regmap *aspeed_regmap;
 
-
 static int regmap_reg_write(void *context, unsigned int reg, unsigned int val)
 {
 	void __iomem *regs = (void __iomem *)context;
@@ -53,7 +47,6 @@ static int regmap_reg_write(void *context, unsigned int reg, unsigned int val)
 	return 0;
 }
 
-
 static int regmap_reg_read(void *context, unsigned int reg, unsigned int *val)
 {
 	void __iomem *regs = (void __iomem *)context;
@@ -76,7 +69,6 @@ static bool regmap_is_volatile(struct device *dev, unsigned int reg)
 	}
 }
 
-
 static const struct regmap_config aspeed_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
@@ -88,7 +80,6 @@ static const struct regmap_config aspeed_regmap_config = {
 	.fast_io = true,
 };
 
-
 static void count_rec(struct mem_ctl_info *mci, u8 rec_cnt, u32 rec_addr)
 {
 	struct csrow_info *csrow = mci->csrows[0];
@@ -120,7 +111,6 @@ static void count_rec(struct mem_ctl_info *mci, u8 rec_cnt, u32 rec_addr)
 			     0, 0, -1, "", "");
 }
 
-
 static void count_un_rec(struct mem_ctl_info *mci, u8 un_rec_cnt,
 			 u32 un_rec_addr)
 {
@@ -153,7 +143,6 @@ static void count_un_rec(struct mem_ctl_info *mci, u8 un_rec_cnt,
 	}
 }
 
-
 static irqreturn_t mcr_isr(int irq, void *arg)
 {
 	struct mem_ctl_info *mci = arg;
@@ -200,7 +189,6 @@ static irqreturn_t mcr_isr(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
-
 static int config_irq(void *ctx, struct platform_device *pdev)
 {
 	int irq;
@@ -225,7 +213,6 @@ static int config_irq(void *ctx, struct platform_device *pdev)
 	return 0;
 }
 
-
 static int init_csrows(struct mem_ctl_info *mci)
 {
 	struct csrow_info *csrow = mci->csrows[0];
@@ -274,7 +261,6 @@ static int init_csrows(struct mem_ctl_info *mci)
 	return 0;
 }
 
-
 static int aspeed_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -355,7 +341,6 @@ static int aspeed_probe(struct platform_device *pdev)
 	return rc;
 }
 
-
 static void aspeed_remove(struct platform_device *pdev)
 {
 	struct mem_ctl_info *mci;
@@ -375,7 +360,6 @@ static void aspeed_remove(struct platform_device *pdev)
 		edac_mc_free(mci);
 }
 
-
 static const struct of_device_id aspeed_of_match[] = {
 	{ .compatible = "aspeed,ast2400-sdram-edac" },
 	{ .compatible = "aspeed,ast2500-sdram-edac" },

-- 
2.34.1


