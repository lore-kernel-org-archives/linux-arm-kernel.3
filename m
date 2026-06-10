Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF107CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YM/WzGB54qg+7zNwVx31dRrfeQidylWsP1EVolYAyUU=; b=jD2yXQsOCxOaRxbKSs5XgendAF
	SZpsah4ipzis23FGnHuk1bdUNnYlCUuNcCzz+2cIdaH7bK1WdTCC6CBKt70SluuTeiFTPo5uiiMFt
	G9oRaHZ6PgtPhO26aQNM1RIq/3z2aOrRxVvm2ghk3DCm8FXD9hBVGSCuSwWEsUMrXsJNdst9Y15in
	ck+9+QrtprDKUvOhJrb43vDYgq575/5fy+6sbkHz9W8dMgfKGoc5XjA8ogi4EpLKUiDLdqFcyl2Rz
	/dluQbF7ZvsPHk6OYzt7yxgE6HLSYygZjlctJ3qAdxpTBzRUEhX0CPcG3tYcXWWyKiZwZ6POWm4hJ
	/OG2q2tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDzw-000000071EF-2MOT;
	Wed, 10 Jun 2026 08:09:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDzs-000000071Bj-0vLP;
	Wed, 10 Jun 2026 08:09:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YM/WzGB54qg+7zNwVx31dRrfeQidylWsP1EVolYAyUU=; b=QNzhjtZxjYdsSnP3KxIIOgquSx
	upK7WoopygdWSospENNfdqO0HIN0xGl0058gVkPJb3n0O7jwVinlea/hgfyDOFQzcPnUnN95Qv2pS
	G1LQWq1MTuHaeKamPQSouclim6aK8UzgHZD4AtTZnqIq0QVKRMKHuzXnjcYVfYbSaJwPWQ8Gr051z
	CR/Y0i1YpOdhYAUpGDqGgJ7AO+cwshDDH+zqDMpiRIg/CnllKc4oZQ7i0Trx3YNbDZqk/t47CvN8W
	8PRhsQyQdyvkG4J2zozXoWnhdk++mkrdmecrKKsQdJdfxaTBXHCQ6D+zWGYVo4wehhL7JVFGH2u5O
	mihal6Gg==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wXDzk-00000003b0r-0UVs;
	Wed, 10 Jun 2026 08:09:08 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 65A88QhK4983537, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1781078906; bh=YM/WzGB54qg+7zNwVx31dRrfeQidylWsP1EVolYAyUU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=DcKKbmkc68/g1XDFZ8gkR1WeIbnUoOG7wyPaABRHd1tsbtLAnpboI2FdnOw0kBfea
	 MuA5b9PaQmtKipfAMy6gCPf6oHOoXzeDm3gQfVQ+t1Em3ESCQNmyXJAWkYpN+iH2Yk
	 ojE2aC3z+6DCMCa3YOr7ib5hmKr6LYWJOY/G6A2PRp8ZUfEBL03+gO8no2ogs/ORdl
	 iHIF1qvjkW+aeCRdezFaGYf/kI3BB1HOWPZDSdpJoh+yT/q5M/rtEcCa6y8pTYG5ix
	 nNy15CeEj/8w/06wqsOgl9uFAG5+k7a/ajK1yrJ3/pcIGNKq7Otby/ta50w+F+pkju
	 E1GYou61/whfg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 65A88QhK4983537
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 10 Jun 2026 16:08:26 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Jun 2026 16:08:25 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS03.realtek.com.tw
 (10.21.1.53) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 10 Jun 2026 16:08:25 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <bmasney@redhat.com>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v8 02/10] reset: Add Realtek basic reset support
Date: Wed, 10 Jun 2026 16:08:16 +0800
Message-ID: <20260610080824.255063-3-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260610080824.255063-1-eleanor.lin@realtek.com>
References: <20260610080824.255063-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_090905_358586_AFD98AE7 
X-CRM114-Status: GOOD (  19.34  )
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

From: Cheng-Yu Lee <cylee12@realtek.com>

Define the reset operations backed by a regmap-based register interface
and prepare the reset controller to be registered through the reset
framework.

Since the reset controllers on Realtek SoCs often share the same register
space with the clock controllers, this common framework is designed to
extract the regmap and device tree node from the parent device
(e.g., an auxiliary device parent).

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v8:
- None
---
 MAINTAINERS                    |  1 +
 drivers/reset/Kconfig          |  1 +
 drivers/reset/Makefile         |  1 +
 drivers/reset/realtek/Kconfig  |  8 +++
 drivers/reset/realtek/Makefile |  2 +
 drivers/reset/realtek/common.c | 90 ++++++++++++++++++++++++++++++++++
 drivers/reset/realtek/common.h | 29 +++++++++++
 7 files changed, 132 insertions(+)
 create mode 100644 drivers/reset/realtek/Kconfig
 create mode 100644 drivers/reset/realtek/Makefile
 create mode 100644 drivers/reset/realtek/common.c
 create mode 100644 drivers/reset/realtek/common.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 613ca7e95e47..80e840a6691d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22484,6 +22484,7 @@ L:	devicetree@vger.kernel.org
 L:	linux-clk@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/clock/realtek*
+F:	drivers/reset/realtek/*
 F:	include/dt-bindings/clock/realtek*
 F:	include/dt-bindings/reset/realtek*
 
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index d009eb0849a3..45a4227b5f44 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -418,6 +418,7 @@ config RESET_ZYNQMP
 
 source "drivers/reset/amlogic/Kconfig"
 source "drivers/reset/hisilicon/Kconfig"
+source "drivers/reset/realtek/Kconfig"
 source "drivers/reset/spacemit/Kconfig"
 source "drivers/reset/starfive/Kconfig"
 source "drivers/reset/sti/Kconfig"
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 3e52569bd276..7330fee91365 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -2,6 +2,7 @@
 obj-y += core.o
 obj-y += amlogic/
 obj-y += hisilicon/
+obj-y += realtek/
 obj-y += spacemit/
 obj-y += starfive/
 obj-y += sti/
diff --git a/drivers/reset/realtek/Kconfig b/drivers/reset/realtek/Kconfig
new file mode 100644
index 000000000000..bb6dd856a64a
--- /dev/null
+++ b/drivers/reset/realtek/Kconfig
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config RESET_RTK_COMMON
+	tristate "Realtek common reset driver" if COMPILE_TEST
+	help
+	  This option enables the common reset controller library for
+	  Realtek SoCs. It provides shared reset control operations
+	  (assert, deassert, status) and a registration helper function
+	  that other Realtek-specific reset drivers can use.
diff --git a/drivers/reset/realtek/Makefile b/drivers/reset/realtek/Makefile
new file mode 100644
index 000000000000..b59a3f7f2453
--- /dev/null
+++ b/drivers/reset/realtek/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_RESET_RTK_COMMON) += common.o
diff --git a/drivers/reset/realtek/common.c b/drivers/reset/realtek/common.c
new file mode 100644
index 000000000000..2ce20c25377b
--- /dev/null
+++ b/drivers/reset/realtek/common.c
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2019-2026 Realtek Semiconductor Corporation
+ */
+
+#include <linux/device.h>
+#include <linux/export.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include "common.h"
+
+static inline struct rtk_reset_data *to_rtk_reset_controller(struct reset_controller_dev *r)
+{
+	return container_of(r, struct rtk_reset_data, rcdev);
+}
+
+static inline const struct rtk_reset_desc *rtk_reset_get_desc(struct rtk_reset_data *data,
+							      unsigned long idx)
+{
+	return &data->descs[idx];
+}
+
+static int rtk_reset_assert(struct reset_controller_dev *rcdev,
+			    unsigned long idx)
+{
+	struct rtk_reset_data *data = to_rtk_reset_controller(rcdev);
+	const struct rtk_reset_desc *desc;
+	u32 mask, val;
+
+	desc = rtk_reset_get_desc(data, idx);
+	mask = desc->write_en ? (0x3U << desc->bit) : BIT(desc->bit);
+	val  = desc->write_en ? (0x2U << desc->bit) : 0;
+
+	return regmap_update_bits(data->regmap, desc->ofs, mask, val);
+}
+
+static int rtk_reset_deassert(struct reset_controller_dev *rcdev,
+			      unsigned long idx)
+{
+	struct rtk_reset_data *data = to_rtk_reset_controller(rcdev);
+	const struct rtk_reset_desc *desc;
+	u32 mask, val;
+
+	desc = rtk_reset_get_desc(data, idx);
+	mask = desc->write_en ? (0x3U << desc->bit) : BIT(desc->bit);
+	val = mask;
+
+	return regmap_update_bits(data->regmap, desc->ofs, mask, val);
+}
+
+static int rtk_reset_status(struct reset_controller_dev *rcdev,
+			    unsigned long idx)
+{
+	struct rtk_reset_data *data = to_rtk_reset_controller(rcdev);
+	const struct rtk_reset_desc *desc;
+	u32 val;
+	int ret;
+
+	desc = rtk_reset_get_desc(data, idx);
+	ret = regmap_read(data->regmap, desc->ofs, &val);
+	if (ret)
+		return ret;
+
+	return !((val >> desc->bit) & 1);
+}
+
+static const struct reset_control_ops rtk_reset_ops = {
+	.assert   = rtk_reset_assert,
+	.deassert = rtk_reset_deassert,
+	.status   = rtk_reset_status,
+};
+
+/* The caller must initialize data->descs, data->rcdev.nr_resets and
+ * data->rcdev.owner before calling rtk_reset_controller_add().
+ */
+int rtk_reset_controller_add(struct device *dev,
+			     struct rtk_reset_data *data)
+{
+	data->regmap          = dev_get_platdata(dev);
+	data->rcdev.ops       = &rtk_reset_ops;
+	data->rcdev.dev       = dev;
+	data->rcdev.of_node   = dev->parent->of_node;
+
+	return devm_reset_controller_register(dev, &data->rcdev);
+}
+EXPORT_SYMBOL_NS_GPL(rtk_reset_controller_add, "REALTEK_RESET");
+
+MODULE_DESCRIPTION("realtek reset infrastructure");
+MODULE_LICENSE("GPL");
diff --git a/drivers/reset/realtek/common.h b/drivers/reset/realtek/common.h
new file mode 100644
index 000000000000..42eb41eae2ec
--- /dev/null
+++ b/drivers/reset/realtek/common.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 Realtek Semiconductor Corporation
+ * Author: Yu-Chun Lin <eleanor.lin@realtek.com>
+ */
+
+#ifndef __RESET_REALTEK_COMMON_H
+#define __RESET_REALTEK_COMMON_H
+
+#include <linux/reset-controller.h>
+
+struct regmap;
+
+struct rtk_reset_desc {
+	u32 ofs;
+	u32 bit;
+	bool write_en;
+};
+
+struct rtk_reset_data {
+	struct reset_controller_dev rcdev;
+	const struct rtk_reset_desc *descs;
+	struct regmap *regmap;
+};
+
+int rtk_reset_controller_add(struct device *dev,
+			     struct rtk_reset_data *initdata);
+
+#endif /* __RESET_REALTEK_COMMON_H */
-- 
2.43.0


