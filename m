Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EA4CC6B28
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 08:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4lBWYs4WqFxlGcIUC3MY37rLvGAf1tmYvTPNg6gZE0M=; b=ZfqQmwJp+F8Oxr8Tc2TgB70WC8
	5+qNZ8AwSd1EmBFsRVlwyWEdY57B3qfiqODcxuCYmi6EYWrMop2zNJap19iLRKX+sC8FsM2nZSSy7
	7PE9c6cPalwbmvKNieuBLmiM/sXmT2Kt8Y8X62lgoiMR3a3eqAUeHVc3GOtWiou7f32caV5ZAkvU/
	DVQ2hTwqrrIUKukfu6U0eVqYoM5U5wtS/q6qAJGBR2Zzfi73Dto+38CDjDu/DTi1w8kHiAhmR6/hx
	Wp+HfvOLoAgNEIT2kdJ9teNFH58nei0snXzGA7p9QBKOoD8QRMP6sRRHsN8dUrl3/tErxdiBG4TPQ
	rjxBJG4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8D9O-0000000H9GZ-1pOg;
	Thu, 02 Apr 2026 08:11:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8D9L-0000000H9E9-3A28;
	Thu, 02 Apr 2026 08:11:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4lBWYs4WqFxlGcIUC3MY37rLvGAf1tmYvTPNg6gZE0M=; b=UyYxAqgaDtV7lYPoC4vI6KCGEF
	nsN6VbpdCnN4UZwMswRfI7AsCoBwoMDHKoVtkCxJoK+BLSLlUxSvcUX4/60zy9C2N+c8gT3kOA3e1
	kK6MCgUOk/Hn7P3gwrSBhSkfoDre25W+imzzONiJhSc9XdJzCZk/3FgARN3P4cGIlInBlaes44Ld5
	4+p2pf8kqv6lyk6ckuZ9lz/sTBOXvzwgM2UPtTIsIjg4gu3datG55IbL/hk5jy6ALYPtMhkv/T5lp
	LWMz9xEi5UVaN5UBoybc03a51cp9WStLP+WOJ5uxhiPD50ofohkmSD0sY+PFx/r4TWxv1g36QBV2l
	JT367Ncw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8D8Q-00000001zLx-3sqN;
	Thu, 02 Apr 2026 08:10:46 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6327dwefF2694952, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1775115598; bh=4lBWYs4WqFxlGcIUC3MY37rLvGAf1tmYvTPNg6gZE0M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=aByCqOnu3r7se+5ubhQbrkrkiWlegd+tjSLyLW4x1JvFLo3U5pygLMazpHmTHoYjR
	 P1QUyf8jdUO0TwfXQH9KeY5VcTLAkoAzRQwOqxkQkVhd70gnM6AZlmrday8kUT7d8J
	 MAf0vtcdok79dmfJmuTblgphE8RyTF8me/AvzQv1lyBzLVF2tTQnGhl08AneHY51Vn
	 BDXOeROSvNKQurPy0AIZsvp2vOE0hfsBeRgH29BlCzE6kGijjUYTEPm0Vp0P3JLSUg
	 +omkDee0sVTZ95ksX++lysh1BF+KstGGn0Q7h9m0jaqR7fFoNfmTWajF/AqKa9dwlm
	 2tLqPX7cJkVHQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 6327dwefF2694952
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Apr 2026 15:39:58 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 2 Apr 2026 15:39:58 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 2 Apr 2026 15:39:57 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>
Subject: [PATCH v6 02/10] reset: Add Realtek basic reset support
Date: Thu, 2 Apr 2026 15:39:49 +0800
Message-ID: <20260402073957.2742459-3-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260402073957.2742459-1-eleanor.lin@realtek.com>
References: <20260402073957.2742459-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_091044_556913_CBC90E93 
X-CRM114-Status: GOOD (  19.49  )
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
Changes in v6:
- Remove the global header include/linux/reset/realtek.h and use a local common.h
instead.
- Extract regmap and of_node directly from the parent device.
- Remove struct rtk_reset_initdata. Now, pass struct rtk_reset_data directly when
calling rtk_reset_controller_add().
---
 MAINTAINERS                    |  1 +
 drivers/reset/Kconfig          |  1 +
 drivers/reset/Makefile         |  1 +
 drivers/reset/realtek/Kconfig  |  3 ++
 drivers/reset/realtek/Makefile |  2 +
 drivers/reset/realtek/common.c | 85 ++++++++++++++++++++++++++++++++++
 drivers/reset/realtek/common.h | 29 ++++++++++++
 7 files changed, 122 insertions(+)
 create mode 100644 drivers/reset/realtek/Kconfig
 create mode 100644 drivers/reset/realtek/Makefile
 create mode 100644 drivers/reset/realtek/common.c
 create mode 100644 drivers/reset/realtek/common.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 07e73bf621b0..8f355896583b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22240,6 +22240,7 @@ L:	devicetree@vger.kernel.org
 L:	linux-clk@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/clock/realtek*
+F:	drivers/reset/realtek/*
 F:	include/dt-bindings/clock/realtek*
 F:	include/dt-bindings/reset/realtek*
 
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 7ce151f6a7e4..03be1931f264 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -398,6 +398,7 @@ config RESET_ZYNQMP
 
 source "drivers/reset/amlogic/Kconfig"
 source "drivers/reset/hisilicon/Kconfig"
+source "drivers/reset/realtek/Kconfig"
 source "drivers/reset/spacemit/Kconfig"
 source "drivers/reset/starfive/Kconfig"
 source "drivers/reset/sti/Kconfig"
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index fc0cc99f8514..4407d1630070 100644
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
index 000000000000..99a14d355803
--- /dev/null
+++ b/drivers/reset/realtek/Kconfig
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config RESET_RTK_COMMON
+	bool
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
index 000000000000..ea7ff27117e7
--- /dev/null
+++ b/drivers/reset/realtek/common.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2019 Realtek Semiconductor Corporation
+ */
+
+#include <linux/device.h>
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
+static inline struct rtk_reset_desc *rtk_reset_get_desc(struct rtk_reset_data *data,
+							unsigned long idx)
+{
+	return &data->descs[idx];
+}
+
+static int rtk_reset_assert(struct reset_controller_dev *rcdev,
+			    unsigned long idx)
+{
+	struct rtk_reset_data *data = to_rtk_reset_controller(rcdev);
+	struct rtk_reset_desc *desc = rtk_reset_get_desc(data, idx);
+	u32 mask = desc->write_en ? (0x3 << desc->bit) : BIT(desc->bit);
+	u32 val  = desc->write_en ? (0x2 << desc->bit) : 0;
+
+	return regmap_update_bits(data->regmap, desc->ofs, mask, val);
+}
+
+static int rtk_reset_deassert(struct reset_controller_dev *rcdev,
+			      unsigned long idx)
+{
+	struct rtk_reset_data *data = to_rtk_reset_controller(rcdev);
+	struct rtk_reset_desc *desc = rtk_reset_get_desc(data, idx);
+	u32 mask = desc->write_en ? (0x3 << desc->bit) : BIT(desc->bit);
+	u32 val  = mask;
+
+	return regmap_update_bits(data->regmap, desc->ofs, mask, val);
+}
+
+static int rtk_reset_status(struct reset_controller_dev *rcdev,
+			    unsigned long idx)
+{
+	struct rtk_reset_data *data = to_rtk_reset_controller(rcdev);
+	struct rtk_reset_desc *desc = rtk_reset_get_desc(data, idx);
+	u32 val;
+	int ret;
+
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
+/* The caller must initialize data->rcdev.nr_resets and data->descs before
+ * calling rtk_reset_controller_add().
+ */
+int rtk_reset_controller_add(struct device *dev,
+			     struct rtk_reset_data *data)
+{
+	struct device *parent = dev->parent;
+
+	data->regmap = dev_get_regmap(parent, NULL);
+	if (!data->regmap)
+		return -ENODEV;
+
+	data->rcdev.owner     = THIS_MODULE;
+	data->rcdev.ops       = &rtk_reset_ops;
+	data->rcdev.dev       = dev;
+	data->rcdev.of_node   = parent->of_node;
+
+	return devm_reset_controller_register(dev, &data->rcdev);
+}
+EXPORT_SYMBOL_NS_GPL(rtk_reset_controller_add, "REALTEK_RESET");
diff --git a/drivers/reset/realtek/common.h b/drivers/reset/realtek/common.h
new file mode 100644
index 000000000000..ed69bca458de
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
+	struct rtk_reset_desc *descs;
+	struct regmap *regmap;
+};
+
+int rtk_reset_controller_add(struct device *dev,
+			     struct rtk_reset_data *initdata);
+
+#endif /* __RESET_REALTEK_COMMON_H */
-- 
2.34.1


