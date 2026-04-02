Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0191CC6B26
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 08:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kUg2Jim7sS5njPFwuf0pR9raeORW1EJTi4tWZ67JQSk=; b=H/FAWJR47prX4DkKKIz9pELOWq
	io8vy1JRiKlLXlCAaB6OECcVIUnh22yEVY/kg+HGyKhRjnrOpSN6tQzWAQ67AeCE0ct8EvBy6D5m0
	4FcJSFo3qMFQDyAbzBpy5w/i6dAq5sOeRQUvi3QWckCJMb5vvslvCSsEloAC0gdQcGcDLoBahQpzJ
	qhAhBSiKBgb7vOXdlsaAQ+wLmdKHHEpkFvdUEWsFiC/0pG/rcUvzNAK50Lpi4XWTVoJmM+mVQc3GM
	JJVkgYKJh+cYER4zwunzcd6a2+pkYbQp3IsvyUPns0xfDfPSus1cS53oGoXxCRJ7gLPxr8K0fuJlr
	e3lo25dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8DBD-0000000H9tJ-2Qop;
	Thu, 02 Apr 2026 08:13:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8DBB-0000000H9sV-30wJ;
	Thu, 02 Apr 2026 08:13:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kUg2Jim7sS5njPFwuf0pR9raeORW1EJTi4tWZ67JQSk=; b=AN/P92SMImlCZOSdE68AjW6jMb
	JMRZ7lyx1h8MeCF6lgntFULNUGhyDZAxHHHLrrzErheNhI7dIhavpUq2n1uAdewz2dcvLsvX1zMu+
	Dj57h1BBsSQu9mHSFaDwougvUPAYB/8s6cNT93vVzrfqyPvhw07HaK7sco2aGJ2v+yFbG74hlRLW2
	lk2W+8NIGTnZySGk9NG7/73TJ9/t40H+EdP1vd3CS1fa0cxtI/yt90y/tPjVOoafyhYEdqbOJwvv5
	9obQ/DlPPaAlR7vVs0WApmijJiPjpk8PA5Zst1qP2tyuHnEnkqsAGzoUS/GXF8XvNBm4Dz08PRYxy
	WsNxAD2A==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8D9K-00000001zMi-1AAL;
	Thu, 02 Apr 2026 08:13:24 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6327e3fK52695627, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1775115603; bh=kUg2Jim7sS5njPFwuf0pR9raeORW1EJTi4tWZ67JQSk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=H7iNMibvu9OiOYIpQ5OCMxxe8Gwu9xpOsJoZwR2EXuh/IyBlTsJ7OUYVph2ldiNDy
	 qNw0JJk+0swDbWrxJMbYK+jAKoij4apKHrsK5k4453umv1ldPJCzZpqiIXUEhl83hL
	 u1H/nB0CGtl5Kg9FR0kOqnHF3uEhRrKKUlbZ0G4ZwPohH4AkzbNkC7dkNml/zzNYqj
	 du1hXVN066s/6sf+dpE/TdGOQLFc862mVpVfu+ksiZ68sysh++KSj74kRxRJ/S/k0K
	 AV8cSFFdipXvNolNvU08wEUmG1oD52bFltQXF3lfVz44MPelbQ+y+OmcWDq0Tm3zbp
	 Ug14KVgBpIAcA==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 6327e3fK52695627
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Apr 2026 15:40:03 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 2 Apr 2026 15:40:03 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 2 Apr 2026 15:40:02 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 2 Apr 2026 15:40:02 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>
Subject: [PATCH v6 09/10] clk: realtek: Add RTD1625-ISO clock controller driver
Date: Thu, 2 Apr 2026 15:39:56 +0800
Message-ID: <20260402073957.2742459-10-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260402073957.2742459-1-eleanor.lin@realtek.com>
References: <20260402073957.2742459-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_091210_867336_9E1606CD 
X-CRM114-Status: GOOD (  23.44  )
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

Add support for the ISO (Isolation) domain clock controller on the Realtek
RTD1625 SoC. This controller manages clocks in the always-on power domain,
ensuring essential services remain functional even when the main system
power is gated.

Since the reset controller shares the same register space with the ISO
clock controller, it is instantiated as an auxiliary device by the core
clock driver. This patch also includes the corresponding auxiliary reset
driver to handle the ISO domain resets.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v6:
- Add the headers used in c file to follow the "Include What You Use" principle.
- Move struct rtk_reset_desc arrays from the clock driver to the dedicated reset driver.
- Implement and register a dedicated reset auxiliary driver.
---
 drivers/clk/realtek/Makefile              |   1 +
 drivers/clk/realtek/clk-rtd1625-iso.c     | 144 ++++++++++++++++++++++
 drivers/reset/realtek/Makefile            |   2 +-
 drivers/reset/realtek/reset-rtd1625-iso.c |  96 +++++++++++++++
 4 files changed, 242 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/realtek/clk-rtd1625-iso.c
 create mode 100644 drivers/reset/realtek/reset-rtd1625-iso.c

diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
index c992f97dfbc7..1680435e1e0f 100644
--- a/drivers/clk/realtek/Makefile
+++ b/drivers/clk/realtek/Makefile
@@ -10,3 +10,4 @@ clk-rtk-y += freq_table.o
 
 clk-rtk-$(CONFIG_RTK_CLK_PLL_MMC) += clk-pll-mmc.o
 obj-$(CONFIG_COMMON_CLK_RTD1625) += clk-rtd1625-crt.o
+obj-$(CONFIG_COMMON_CLK_RTD1625) += clk-rtd1625-iso.o
diff --git a/drivers/clk/realtek/clk-rtd1625-iso.c b/drivers/clk/realtek/clk-rtd1625-iso.c
new file mode 100644
index 000000000000..027a131363f9
--- /dev/null
+++ b/drivers/clk/realtek/clk-rtd1625-iso.c
@@ -0,0 +1,144 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024 Realtek Semiconductor Corporation
+ * Author: Cheng-Yu Lee <cylee12@realtek.com>
+ */
+
+#include <dt-bindings/clock/realtek,rtd1625-clk.h>
+#include <linux/array_size.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include "clk-regmap-gate.h"
+
+#define RTD1625_ISO_CLK_MAX	19
+#define RTD1625_ISO_RSTN_MAX	29
+#define RTD1625_ISO_S_CLK_MAX	5
+#define RTD1625_ISO_S_RSTN_MAX	5
+
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_usb_p4, 0, 0x4, 0, 0);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_usb_p3, 0, 0x4, 1, 0);
+static CLK_REGMAP_GATE(clk_en_misc_cec0, "clk_en_misc", 0, 0x4, 2, 0);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_cbusrx_sys, 0, 0x4, 3, 0);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_cbustx_sys, 0, 0x4, 4, 0);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_cbus_sys, 0, 0x4, 5, 0);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_cbus_osc, 0, 0x4, 6, 0);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_i2c0, 0, 0x4, 9, 0);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_i2c1, 0, 0x4, 10, 0);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_etn_250m, 0, 0x4, 11, 0);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_etn_sys, 0, 0x4, 12, 0);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_usb_drd, 0, 0x4, 13, 0);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_usb_host, 0, 0x4, 14, 0);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_usb_u3_host, 0, 0x4, 15, 0);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_usb, 0, 0x4, 16, 0);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_vtc, 0, 0x4, 17, 0);
+static CLK_REGMAP_GATE(clk_en_misc_vfd, "clk_en_misc", 0, 0x4, 18, 0);
+
+static struct clk_regmap *rtd1625_clk_regmap_list[] = {
+	&clk_en_usb_p4.clkr,
+	&clk_en_usb_p3.clkr,
+	&clk_en_misc_cec0.clkr,
+	&clk_en_cbusrx_sys.clkr,
+	&clk_en_cbustx_sys.clkr,
+	&clk_en_cbus_sys.clkr,
+	&clk_en_cbus_osc.clkr,
+	&clk_en_i2c0.clkr,
+	&clk_en_i2c1.clkr,
+	&clk_en_etn_250m.clkr,
+	&clk_en_etn_sys.clkr,
+	&clk_en_usb_drd.clkr,
+	&clk_en_usb_host.clkr,
+	&clk_en_usb_u3_host.clkr,
+	&clk_en_usb.clkr,
+	&clk_en_vtc.clkr,
+	&clk_en_misc_vfd.clkr,
+};
+
+static struct clk_hw_onecell_data rtd1625_iso_clk_data = {
+	.num = RTD1625_ISO_CLK_MAX,
+	.hws = {
+		[RTD1625_ISO_CLK_EN_USB_P4]      = &__clk_regmap_gate_hw(&clk_en_usb_p4),
+		[RTD1625_ISO_CLK_EN_USB_P3]      = &__clk_regmap_gate_hw(&clk_en_usb_p3),
+		[RTD1625_ISO_CLK_EN_MISC_CEC0]   = &__clk_regmap_gate_hw(&clk_en_misc_cec0),
+		[RTD1625_ISO_CLK_EN_CBUSRX_SYS]  = &__clk_regmap_gate_hw(&clk_en_cbusrx_sys),
+		[RTD1625_ISO_CLK_EN_CBUSTX_SYS]  = &__clk_regmap_gate_hw(&clk_en_cbustx_sys),
+		[RTD1625_ISO_CLK_EN_CBUS_SYS]    = &__clk_regmap_gate_hw(&clk_en_cbus_sys),
+		[RTD1625_ISO_CLK_EN_CBUS_OSC]    = &__clk_regmap_gate_hw(&clk_en_cbus_osc),
+		[RTD1625_ISO_CLK_EN_I2C0]        = &__clk_regmap_gate_hw(&clk_en_i2c0),
+		[RTD1625_ISO_CLK_EN_I2C1]        = &__clk_regmap_gate_hw(&clk_en_i2c1),
+		[RTD1625_ISO_CLK_EN_ETN_250M]    = &__clk_regmap_gate_hw(&clk_en_etn_250m),
+		[RTD1625_ISO_CLK_EN_ETN_SYS]     = &__clk_regmap_gate_hw(&clk_en_etn_sys),
+		[RTD1625_ISO_CLK_EN_USB_DRD]     = &__clk_regmap_gate_hw(&clk_en_usb_drd),
+		[RTD1625_ISO_CLK_EN_USB_HOST]    = &__clk_regmap_gate_hw(&clk_en_usb_host),
+		[RTD1625_ISO_CLK_EN_USB_U3_HOST] = &__clk_regmap_gate_hw(&clk_en_usb_u3_host),
+		[RTD1625_ISO_CLK_EN_USB]         = &__clk_regmap_gate_hw(&clk_en_usb),
+		[RTD1625_ISO_CLK_EN_VTC]         = &__clk_regmap_gate_hw(&clk_en_vtc),
+		[RTD1625_ISO_CLK_EN_MISC_VFD]    = &__clk_regmap_gate_hw(&clk_en_misc_vfd),
+		[RTD1625_ISO_CLK_MAX] = NULL,
+	},
+};
+
+static const struct rtk_clk_desc rtd1625_iso_desc = {
+	.clk_data = &rtd1625_iso_clk_data,
+	.clks     = rtd1625_clk_regmap_list,
+	.num_clks = ARRAY_SIZE(rtd1625_clk_regmap_list),
+};
+
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_irda, 0, 0x4, 6, 1);
+static CLK_REGMAP_GATE_NO_PARENT(clk_en_ur10, 0, 0x4, 8, 1);
+
+static struct clk_regmap *rtd1625_iso_s_clk_regmap_list[] = {
+	&clk_en_irda.clkr,
+	&clk_en_ur10.clkr,
+};
+
+static struct clk_hw_onecell_data rtd1625_iso_s_clk_data = {
+	.num = RTD1625_ISO_S_CLK_MAX,
+	.hws = {
+		[RTD1625_ISO_S_CLK_EN_IRDA] = &__clk_regmap_gate_hw(&clk_en_irda),
+		[RTD1625_ISO_S_CLK_EN_UR10] = &__clk_regmap_gate_hw(&clk_en_ur10),
+		[RTD1625_ISO_S_CLK_MAX] = NULL,
+	},
+};
+
+static const struct rtk_clk_desc rtd1625_iso_s_desc = {
+	.clk_data = &rtd1625_iso_s_clk_data,
+	.clks     = rtd1625_iso_s_clk_regmap_list,
+	.num_clks = ARRAY_SIZE(rtd1625_iso_s_clk_regmap_list),
+};
+
+static int rtd1625_iso_probe(struct platform_device *pdev)
+{
+	const struct rtk_clk_desc *desc;
+
+	desc = of_device_get_match_data(&pdev->dev);
+	if (!desc)
+		return -EINVAL;
+	return rtk_clk_probe(pdev, desc, "iso_rst");
+}
+
+static const struct of_device_id rtd1625_iso_match[] = {
+	{.compatible = "realtek,rtd1625-iso-clk", .data = &rtd1625_iso_desc},
+	{.compatible = "realtek,rtd1625-iso-s-clk", .data = &rtd1625_iso_s_desc},
+	{ /* sentinel */ }
+};
+
+static struct platform_driver rtd1625_iso_driver = {
+	.probe = rtd1625_iso_probe,
+	.driver = {
+		.name = "rtk-rtd1625-iso-clk",
+		.of_match_table = rtd1625_iso_match,
+	},
+};
+
+static int __init rtd1625_iso_init(void)
+{
+	return platform_driver_register(&rtd1625_iso_driver);
+}
+subsys_initcall(rtd1625_iso_init);
+
+MODULE_DESCRIPTION("Realtek RTD1625 ISO Controller Driver");
+MODULE_AUTHOR("Cheng-Yu Lee <cylee12@realtek.com>");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("REALTEK_CLK");
diff --git a/drivers/reset/realtek/Makefile b/drivers/reset/realtek/Makefile
index 8ca1fa939f10..26b3ddc75ada 100644
--- a/drivers/reset/realtek/Makefile
+++ b/drivers/reset/realtek/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_RESET_RTK_COMMON) += common.o reset-rtd1625-crt.o
+obj-$(CONFIG_RESET_RTK_COMMON) += common.o reset-rtd1625-crt.o reset-rtd1625-iso.o
diff --git a/drivers/reset/realtek/reset-rtd1625-iso.c b/drivers/reset/realtek/reset-rtd1625-iso.c
new file mode 100644
index 000000000000..f2a0478382ae
--- /dev/null
+++ b/drivers/reset/realtek/reset-rtd1625-iso.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Realtek Semiconductor Corporation
+ */
+
+#include <dt-bindings/reset/realtek,rtd1625.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+#include "common.h"
+
+#define RTD1625_ISO_RSTN_MAX	29
+#define RTD1625_ISO_S_RSTN_MAX	5
+
+static struct rtk_reset_desc rtd1625_iso_reset_descs[] = {
+	[RTD1625_ISO_RSTN_VFD]                 = { .ofs = 0x88, .bit = 0 },
+	[RTD1625_ISO_RSTN_CEC0]                = { .ofs = 0x88, .bit = 2 },
+	[RTD1625_ISO_RSTN_CEC1]                = { .ofs = 0x88, .bit = 3 },
+	[RTD1625_ISO_RSTN_CBUSTX]              = { .ofs = 0x88, .bit = 5 },
+	[RTD1625_ISO_RSTN_CBUSRX]              = { .ofs = 0x88, .bit = 6 },
+	[RTD1625_ISO_RSTN_USB3_PHY2_XTAL_POW]  = { .ofs = 0x88, .bit = 7 },
+	[RTD1625_ISO_RSTN_UR0]                 = { .ofs = 0x88, .bit = 8 },
+	[RTD1625_ISO_RSTN_GMAC]                = { .ofs = 0x88, .bit = 9 },
+	[RTD1625_ISO_RSTN_GPHY]                = { .ofs = 0x88, .bit = 10 },
+	[RTD1625_ISO_RSTN_I2C_0]               = { .ofs = 0x88, .bit = 11 },
+	[RTD1625_ISO_RSTN_I2C_1]               = { .ofs = 0x88, .bit = 12 },
+	[RTD1625_ISO_RSTN_CBUS]                = { .ofs = 0x88, .bit = 13 },
+	[RTD1625_ISO_RSTN_USB_DRD]             = { .ofs = 0x88, .bit = 14 },
+	[RTD1625_ISO_RSTN_USB_HOST]            = { .ofs = 0x88, .bit = 15 },
+	[RTD1625_ISO_RSTN_USB_PHY_0]           = { .ofs = 0x88, .bit = 16 },
+	[RTD1625_ISO_RSTN_USB_PHY_1]           = { .ofs = 0x88, .bit = 17 },
+	[RTD1625_ISO_RSTN_USB_PHY_2]           = { .ofs = 0x88, .bit = 18 },
+	[RTD1625_ISO_RSTN_USB]                 = { .ofs = 0x88, .bit = 19 },
+	[RTD1625_ISO_RSTN_TYPE_C]              = { .ofs = 0x88, .bit = 20 },
+	[RTD1625_ISO_RSTN_USB_U3_HOST]         = { .ofs = 0x88, .bit = 21 },
+	[RTD1625_ISO_RSTN_USB3_PHY0_POW]       = { .ofs = 0x88, .bit = 22 },
+	[RTD1625_ISO_RSTN_USB3_P0_MDIO]        = { .ofs = 0x88, .bit = 23 },
+	[RTD1625_ISO_RSTN_USB3_PHY1_POW]       = { .ofs = 0x88, .bit = 24 },
+	[RTD1625_ISO_RSTN_USB3_P1_MDIO]        = { .ofs = 0x88, .bit = 25 },
+	[RTD1625_ISO_RSTN_VTC]                 = { .ofs = 0x88, .bit = 26 },
+	[RTD1625_ISO_RSTN_USB3_PHY2_POW]       = { .ofs = 0x88, .bit = 27 },
+	[RTD1625_ISO_RSTN_USB3_P2_MDIO]        = { .ofs = 0x88, .bit = 28 },
+	[RTD1625_ISO_RSTN_USB_PHY_3]           = { .ofs = 0x88, .bit = 29 },
+	[RTD1625_ISO_RSTN_USB_PHY_4]           = { .ofs = 0x88, .bit = 30 },
+};
+
+static struct rtk_reset_desc rtd1625_iso_s_reset_descs[] = {
+	[RTD1625_ISO_S_RSTN_ISOM_MIS] = { .ofs = 0x310, .bit = 0, .write_en = 1 },
+	[RTD1625_ISO_S_RSTN_GPIOM]    = { .ofs = 0x310, .bit = 2, .write_en = 1 },
+	[RTD1625_ISO_S_RSTN_TIMER7]   = { .ofs = 0x310, .bit = 4, .write_en = 1 },
+	[RTD1625_ISO_S_RSTN_IRDA]     = { .ofs = 0x310, .bit = 6, .write_en = 1 },
+	[RTD1625_ISO_S_RSTN_UR10]     = { .ofs = 0x310, .bit = 8, .write_en = 1 },
+};
+
+static int rtd1625_iso_reset_probe(struct auxiliary_device *adev,
+				   const struct auxiliary_device_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct device *parent = dev->parent;
+	struct rtk_reset_data *data;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	if (of_device_is_compatible(parent->of_node, "realtek,rtd1625-iso-s-clk")) {
+		data->descs           = rtd1625_iso_s_reset_descs;
+		data->rcdev.nr_resets = RTD1625_ISO_S_RSTN_MAX;
+	} else {
+		data->descs           = rtd1625_iso_reset_descs;
+		data->rcdev.nr_resets = RTD1625_ISO_RSTN_MAX;
+	}
+	return rtk_reset_controller_add(dev, data);
+}
+
+static const struct auxiliary_device_id rtd1625_iso_reset_ids[] = {
+	{
+		.name = "clk_rtk.iso_rst",
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, rtd1625_iso_reset_ids);
+
+static struct auxiliary_driver rtd1625_iso_driver = {
+	.probe = rtd1625_iso_reset_probe,
+	.id_table = rtd1625_iso_reset_ids,
+	.driver = {
+		.name = "rtd1625-iso-reset",
+	},
+};
+module_auxiliary_driver(rtd1625_iso_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("REALTEK_RESET");
-- 
2.34.1


