Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EB3106FD9A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 08:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uoaRU6Wq8zo+rnXooOfv2Ge739awluqlqLlpIGBAad0=; b=3sypTphBeifzrvqPADkBIsYEnl
	xbncNca6tcxL0eGbFPokMjFT/wlpzkXVGHaKbh0VLv/2yd9K5jhsxxGBohwDlIK4OzMnK1xVd8r8Y
	fwe01aXtrpUOavE5KkqgP5OL/dSShTuXxwEIVRgo5IEIwNq5jA6mmawyY/XhqhEXgaHqxpbJpyeMO
	JKnBGCO6OJDmV0cyWQy0+v50ONXBvNSZnJCdZKgkXkRK9u807IIg8FtT/NlJSkAFPAcHPjzLn02h8
	k7LueKeIK9kUm+fZEz9/AOKS9gG9t4ySWm5GAzW/6lU/9Z4joa5kf9Yeot/mowoHP5BFcpWWPkSqW
	zxPkuxYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xeT-0000000HC3h-1ZKS;
	Fri, 13 Mar 2026 08:13:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xeL-0000000HBwT-3ZyU;
	Fri, 13 Mar 2026 08:13:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uoaRU6Wq8zo+rnXooOfv2Ge739awluqlqLlpIGBAad0=; b=WfmBJXc2/07bVVF101JB1u75NF
	ZtLSJlHKPgHjcACLWWvJjtGiS4B5HI6g6mU5aHjmebkIot7BgvbNGnmsPrkGRy7UFLxwwcRQkyJwt
	8Vab6JcEEw0SidMuRk/04hlwPHMydXmwqZoWT3HufqUMYxIV+3lsFthvkX9Ie5vGrRHA19WuvQMcl
	efjH3oYX57k8+iRSfgt+iCbNIvG++/RC3Pgwj//a/Wfp51rqoRnxeWDI9mgA9J1AdpokiNSpvxk12
	eY8zACcZv6BwoDT9xLD6dNFQOFY5q8mGZ730I43+pq7USVc7XPWCMjjERCW1xRmZBVFhokYljN98K
	RuTuoedQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xeG-00000002pFu-05xZ;
	Fri, 13 Mar 2026 08:13:35 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62D8B1eU4053097, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773389461; bh=uoaRU6Wq8zo+rnXooOfv2Ge739awluqlqLlpIGBAad0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=qs9bQciDULRoG7cMn1mqzLi7qLls/vputj3XZWahru46BJeQGKYIvoLydY/KQ1mUw
	 CKWfsbvCKLvoqnMZsx8IixPh6t1KhesSh8F7NzSjjtZNezfLRAIJUc2XkRA+tc6UWP
	 P22/Fjf4zyRpx14L2AkSKrSKwbs7zzzNNsk80ZbarFyT1U2fujPOkrHXKWzc/8BTVr
	 XFtwtjiR3eccoFqrKkvIR4GBT6fGxf7csh/YBZ4NbCuFj5+/cg3/f5ayrBW0uQqXrU
	 kX6xrc2iT6IAqJs00KHLOL8XgleTh3csd5xlMKy7feEm9JuYXHPeWxopjm2p76ml52
	 IsXzZLTdHn7oA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62D8B1eU4053097
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Mar 2026 16:11:01 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 13 Mar 2026 16:11:01 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 13 Mar 2026 16:11:01 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 13 Mar 2026 16:11:01 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>
Subject: [PATCH v4 03/10] clk: realtek: Add basic reset support
Date: Fri, 13 Mar 2026 16:10:53 +0800
Message-ID: <20260313081100.596224-4-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260313081100.596224-1-eleanor.lin@realtek.com>
References: <20260313081100.596224-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_081332_869324_18337459 
X-CRM114-Status: GOOD (  20.03  )
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

Define the reset operations backed by a regmap-based register
interface and prepare the reset controller to be registered
through the reset framework.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v4:
- Add forward declaration for struct regmap in reset.h.
- Move struct rtk_reset_data definition into reset.c as it's only used there.
- Remove rtk_reset_reset() due to unnecessary implementation.
- Remove unnecessary parameter from rtk_reset_get_id().
---
 MAINTAINERS                  |   1 +
 drivers/clk/Kconfig          |   1 +
 drivers/clk/Makefile         |   1 +
 drivers/clk/realtek/Kconfig  |  27 ++++++++++
 drivers/clk/realtek/Makefile |   4 ++
 drivers/clk/realtek/reset.c  | 104 +++++++++++++++++++++++++++++++++++
 drivers/clk/realtek/reset.h  |  28 ++++++++++
 7 files changed, 167 insertions(+)
 create mode 100644 drivers/clk/realtek/Kconfig
 create mode 100644 drivers/clk/realtek/Makefile
 create mode 100644 drivers/clk/realtek/reset.c
 create mode 100644 drivers/clk/realtek/reset.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 9b7d64cc8d90..53a2f3575c37 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22247,6 +22247,7 @@ L:	devicetree@vger.kernel.org
 L:	linux-clk@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/clock/realtek*
+F:	drivers/clk/realtek/*
 F:	include/dt-bindings/clock/realtek*
 
 REALTEK SPI-NAND
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 3d803b4cf5c1..d60f6415b0a3 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -519,6 +519,7 @@ source "drivers/clk/nuvoton/Kconfig"
 source "drivers/clk/pistachio/Kconfig"
 source "drivers/clk/qcom/Kconfig"
 source "drivers/clk/ralink/Kconfig"
+source "drivers/clk/realtek/Kconfig"
 source "drivers/clk/renesas/Kconfig"
 source "drivers/clk/rockchip/Kconfig"
 source "drivers/clk/samsung/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index f7bce3951a30..69b84d1e7bcc 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -140,6 +140,7 @@ obj-$(CONFIG_COMMON_CLK_PISTACHIO)	+= pistachio/
 obj-$(CONFIG_COMMON_CLK_PXA)		+= pxa/
 obj-$(CONFIG_COMMON_CLK_QCOM)		+= qcom/
 obj-y					+= ralink/
+obj-$(CONFIG_COMMON_CLK_REALTEK)	+= realtek/
 obj-y					+= renesas/
 obj-$(CONFIG_ARCH_ROCKCHIP)		+= rockchip/
 obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
diff --git a/drivers/clk/realtek/Kconfig b/drivers/clk/realtek/Kconfig
new file mode 100644
index 000000000000..121158f11dd1
--- /dev/null
+++ b/drivers/clk/realtek/Kconfig
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config COMMON_CLK_REALTEK
+	bool "Clock driver for Realtek SoCs"
+	depends on ARCH_REALTEK || COMPILE_TEST
+	default y
+	help
+	  Enable the common clock framework infrastructure for Realtek
+	  system-on-chip platforms.
+
+	  This provides the base support required by individual Realtek
+	  clock controller drivers to expose clocks to peripheral devices.
+
+	  If you have a Realtek-based platform, say Y.
+
+if COMMON_CLK_REALTEK
+
+config RTK_CLK_COMMON
+	tristate "Realtek Clock Common"
+	select RESET_CONTROLLER
+	help
+	  Common helper code shared by Realtek clock controller drivers.
+
+	  This provides utility functions and data structures used by
+	  multiple Realtek clock implementations, and include integration
+	  with reset controllers where required.
+
+endif
diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
new file mode 100644
index 000000000000..52267de2eef4
--- /dev/null
+++ b/drivers/clk/realtek/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
+
+clk-rtk-y += reset.o
diff --git a/drivers/clk/realtek/reset.c b/drivers/clk/realtek/reset.c
new file mode 100644
index 000000000000..45713785d76d
--- /dev/null
+++ b/drivers/clk/realtek/reset.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2019 Realtek Semiconductor Corporation
+ */
+
+#include <linux/device.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include "reset.h"
+
+#define RTK_RESET_BANK_SHIFT 5
+#define RTK_RESET_ID_MASK    0x1f
+
+struct rtk_reset_data {
+	struct device *dev;
+	struct reset_controller_dev rcdev;
+	struct rtk_reset_bank *banks;
+	struct regmap *regmap;
+};
+
+static inline struct rtk_reset_data *to_rtk_reset_controller(struct reset_controller_dev *r)
+{
+	return container_of(r, struct rtk_reset_data, rcdev);
+}
+
+static inline struct rtk_reset_bank *
+rtk_reset_get_bank(struct rtk_reset_data *data, unsigned long idx)
+{
+	int bank_id = idx >> RTK_RESET_BANK_SHIFT;
+
+	return &data->banks[bank_id];
+}
+
+static inline int rtk_reset_get_id(unsigned long idx)
+{
+	return idx & RTK_RESET_ID_MASK;
+}
+
+static int rtk_reset_assert(struct reset_controller_dev *rcdev,
+			    unsigned long idx)
+{
+	struct rtk_reset_data *data = to_rtk_reset_controller(rcdev);
+	struct rtk_reset_bank *bank = rtk_reset_get_bank(data, idx);
+	u32 id = rtk_reset_get_id(idx);
+	u32 mask = bank->write_en ? (UL(0x3) << id) : BIT(id);
+	u32 val = bank->write_en ? (UL(0x2) << id) : 0;
+
+	return regmap_update_bits(data->regmap, bank->ofs, mask, val);
+}
+
+static int rtk_reset_deassert(struct reset_controller_dev *rcdev,
+			      unsigned long idx)
+{
+	struct rtk_reset_data *data = to_rtk_reset_controller(rcdev);
+	struct rtk_reset_bank *bank = rtk_reset_get_bank(data, idx);
+	u32 id = rtk_reset_get_id(idx);
+	u32 mask = bank->write_en ? (0x3 << id) : BIT(id);
+	u32 val = mask;
+
+	return regmap_update_bits(data->regmap, bank->ofs, mask, val);
+}
+
+static int rtk_reset_status(struct reset_controller_dev *rcdev,
+			    unsigned long idx)
+{
+	struct rtk_reset_data *data = to_rtk_reset_controller(rcdev);
+	struct rtk_reset_bank *bank = &data->banks[idx >> RTK_RESET_BANK_SHIFT];
+	u32 id = rtk_reset_get_id(idx);
+	u32 val;
+	int ret;
+
+	ret = regmap_read(data->regmap, bank->ofs, &val);
+	if (ret)
+		return ret;
+
+	return !((val >> id) & 1);
+}
+
+static const struct reset_control_ops rtk_reset_ops = {
+	.assert   = rtk_reset_assert,
+	.deassert = rtk_reset_deassert,
+	.status   = rtk_reset_status,
+};
+
+int rtk_reset_controller_add(struct device *dev,
+			     struct rtk_reset_initdata *initdata)
+{
+	struct rtk_reset_data *data;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->banks = initdata->banks;
+	data->regmap = initdata->regmap;
+	data->rcdev.owner = THIS_MODULE;
+	data->rcdev.ops = &rtk_reset_ops;
+	data->rcdev.dev = dev;
+	data->rcdev.of_node = dev->of_node;
+	data->rcdev.nr_resets = initdata->num_banks * 32;
+
+	return devm_reset_controller_register(dev, &data->rcdev);
+}
+EXPORT_SYMBOL_GPL(rtk_reset_controller_add);
diff --git a/drivers/clk/realtek/reset.h b/drivers/clk/realtek/reset.h
new file mode 100644
index 000000000000..56f944b1dcdd
--- /dev/null
+++ b/drivers/clk/realtek/reset.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2019 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#ifndef __CLK_REALTEK_RESET_H
+#define __CLK_REALTEK_RESET_H
+
+#include <linux/reset-controller.h>
+
+struct regmap;
+
+struct rtk_reset_bank {
+	u32 ofs;
+	u32 write_en;
+};
+
+struct rtk_reset_initdata {
+	struct rtk_reset_bank *banks;
+	u32 num_banks;
+	struct regmap *regmap;
+};
+
+int rtk_reset_controller_add(struct device *dev,
+			     struct rtk_reset_initdata *initdata);
+
+#endif /* __CLK_REALTEK_RESET_H */
-- 
2.34.1


