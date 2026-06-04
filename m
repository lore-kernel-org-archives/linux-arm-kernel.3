Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180A7CD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 11:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2y39ejFgo5oVqse/gOT1R7NkdhQZHGhNBtJddbK8aJg=; b=mm+L+IVDy7kfYLip0HdhEGRFoj
	Lvw4oEvWe6vs8kUJEZ/Q9auvtr1NLGxClHn6H9tVylQdCxPsjLoP9jegPYZdvVDbApjHz1FZPPOtJ
	MwBPmrAA5Xj0Nhvll5dyeosMGvOlwqoWOHSrlZoxeIDjA645Vp9l3uOEjXtG8AKhdBNC/HevieDKN
	aV8Yf6rWnZltPRpu3beeaN2sjhYwH8fuOkTpSwyWQCtuENGf99S4gahv2H5y7AiliYyVNu/m08/Bv
	kIuH/hrmXE2kH22t1LScq1G4mmWvCwCIchMfZEA5yjzDsW5tprs3fZVsb6JSmUUfji63d3FQB1q9R
	V24QJlmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV66M-0000000Gd9F-4BGv;
	Thu, 04 Jun 2026 11:19:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV66K-0000000Gd6k-14dD;
	Thu, 04 Jun 2026 11:19:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2y39ejFgo5oVqse/gOT1R7NkdhQZHGhNBtJddbK8aJg=; b=qDWX3h4Tlou0NasqPDvzyzkXt6
	jOCtIbCNnQ6U6A9iBkwPxJ2rt7clhIboIZOulTBviy2OL8GWGD0X4whdDURlFWsIVEWW2RdUOQHfm
	/twJST9jYYOdCsbWUz+FYpwbdRQqSmQ9Q1pOwSrBCap3d+5TH0Obu8HP3zZki10dC+3F/xRNN6ylA
	lrWn/ChogE8twnqqmQTfgkUSpoVsyPdW4ksCq69qYkdUjLLplOtYSHPpku2rWe0Bx/NAzOr9AlfjA
	NxRqAHGkB539P8ChE9Z+aCUVumg3o35rSsaCYc+dEPOyzzDz8HGLJttr+tTwnIWPeydhultoKy+f2
	6KwO041w==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wV66E-0000000EEpA-47oF;
	Thu, 04 Jun 2026 11:19:03 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 654BIMHe8299934, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1780571902; bh=2y39ejFgo5oVqse/gOT1R7NkdhQZHGhNBtJddbK8aJg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=a3qQzpHOR6LLe8Io4EzYeehsALA0XODKOOztzxBXJR7J+GApOjbZ/q10P+/hbNULD
	 jT+dXFq/rpSw5VZ5NnHcBUltURiK35p9h0sg9IBxdAAPTF35VrMTBSXcCIFv53uJtL
	 8K9PPqc3TsUGVbXXZXkxSyTqcuHt3PPQXyEfAgfy1tKWcmCkmA7L1qoHVfNfvX/Qo5
	 fvI5oTkK56LpFXEhlOruSR/2ZkqS728nj9BOJYMPYomhw2FnwSjBgwvGC4+3fUCvs4
	 BGubevlLsexNLE21/8TwQYGki6SvmokWGQPfeMse0jJVbXBnL3nxhwTtgkULGOrSis
	 LAMtnu4IwJIyQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.28/5.94) with ESMTPS id 654BIMHe8299934
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 Jun 2026 19:18:22 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Jun 2026 19:18:22 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Jun 2026 19:18:21 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 4 Jun 2026 19:18:21 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<tychang@realtek.com>
CC: <eleanor.lin@realtek.com>, <cy.huang@realtek.com>,
	<stanley_chang@realtek.com>, <james.tai@realtek.com>, <afaerber@suse.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>
Subject: [PATCH 2/3] soc: realtek: Add driver for DHC I/O level detector
Date: Thu, 4 Jun 2026 19:18:19 +0800
Message-ID: <20260604111821.975624-3-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260604111821.975624-1-eleanor.lin@realtek.com>
References: <20260604111821.975624-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_121859_695401_5241DA5E 
X-CRM114-Status: GOOD (  23.58  )
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

From: Tzuyi Chang <tychang@realtek.com>

Add driver support for the Realtek DHC I/O level detector.

The driver reads hardware registers to determine the current I/O voltage
levels (e.g., 1.8V or 3.3V) for specific IP blocks. Based on the
detection results, it selects and applies the appropriate pinctrl states
to ensure the correct pad configurations are used.

Signed-off-by: Tzuyi Chang <tychang@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 MAINTAINERS                         |   1 +
 drivers/soc/Kconfig                 |   1 +
 drivers/soc/Makefile                |   1 +
 drivers/soc/realtek/Kconfig         |  21 ++++
 drivers/soc/realtek/Makefile        |   2 +
 drivers/soc/realtek/rtd-io-detect.c | 152 ++++++++++++++++++++++++++++
 6 files changed, 178 insertions(+)
 create mode 100644 drivers/soc/realtek/Kconfig
 create mode 100644 drivers/soc/realtek/Makefile
 create mode 100644 drivers/soc/realtek/rtd-io-detect.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 9ec290e38b44..6121eb4f904e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3379,6 +3379,7 @@ F:	arch/arm/boot/dts/realtek/
 F:	arch/arm/mach-realtek/
 F:	arch/arm64/boot/dts/realtek/
 F:	drivers/pinctrl/realtek/
+F:	drivers/soc/realtek/
 
 ARM/RISC-V/RENESAS ARCHITECTURE
 M:	Geert Uytterhoeven <geert+renesas@glider.be>
diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index a2d65adffb80..d63b9d4dc042 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -20,6 +20,7 @@ source "drivers/soc/microchip/Kconfig"
 source "drivers/soc/nuvoton/Kconfig"
 source "drivers/soc/pxa/Kconfig"
 source "drivers/soc/qcom/Kconfig"
+source "drivers/soc/realtek/Kconfig"
 source "drivers/soc/renesas/Kconfig"
 source "drivers/soc/rockchip/Kconfig"
 source "drivers/soc/samsung/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index c9e689080ceb..8678b1001183 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -26,6 +26,7 @@ obj-y				+= nuvoton/
 obj-y				+= pxa/
 obj-y				+= amlogic/
 obj-y				+= qcom/
+obj-y				+= realtek/
 obj-y				+= renesas/
 obj-y				+= rockchip/
 obj-$(CONFIG_SOC_SAMSUNG)	+= samsung/
diff --git a/drivers/soc/realtek/Kconfig b/drivers/soc/realtek/Kconfig
new file mode 100644
index 000000000000..4c5796c7f9f7
--- /dev/null
+++ b/drivers/soc/realtek/Kconfig
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Realtek SoC drivers
+#
+menu "Realtek SoC drivers"
+        depends on ARCH_REALTEK || COMPILE_TEST
+
+config RTD_IO_LEVEL_DETECT
+	tristate "Realtek DHC I/O Level Detector"
+	depends on PINCTRL_RTD
+	select MFD_SYSCON
+	default ARCH_REALTEK
+	help
+	  Enable support for the Realtek DHC I/O level detector.
+
+	  This driver handles the auto-detection of I/O signaling levels
+	  (such as 1.8V and 3.3V) and dynamically configures the pad states
+	  for specific IP blocks.
+
+endmenu
+
diff --git a/drivers/soc/realtek/Makefile b/drivers/soc/realtek/Makefile
new file mode 100644
index 000000000000..c307e5bdb52d
--- /dev/null
+++ b/drivers/soc/realtek/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_RTD_IO_LEVEL_DETECT) += rtd-io-detect.o
diff --git a/drivers/soc/realtek/rtd-io-detect.c b/drivers/soc/realtek/rtd-io-detect.c
new file mode 100644
index 000000000000..84ef8ea23cb5
--- /dev/null
+++ b/drivers/soc/realtek/rtd-io-detect.c
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Realtek DHC I/O Level Detect driver
+ *
+ * Copyright (c) 2026 Realtek Semiconductor Corp.
+ */
+
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+struct rtd_io_detect_desc_info {
+	const char *name;
+	const char *state_1v8;
+	const char *state_3v3;
+	unsigned int reg_offset;
+	unsigned int en_offset;
+	unsigned int status_offset;
+};
+
+struct rtd_io_detect_descs {
+	const struct rtd_io_detect_desc_info *info;
+	int num_descs;
+};
+
+struct rtd_io_detect_data {
+	const struct rtd_io_detect_descs *descs;
+	struct regmap *base;
+	struct device *dev;
+};
+
+#define RTD_IO_DETECT_DESC(_name, _reg_off, _en_off, _st_off) \
+	{ \
+		.name = #_name, \
+		.state_1v8 = #_name "_1v8", \
+		.state_3v3 = #_name "_3v3", \
+		.reg_offset = _reg_off, \
+		.en_offset = _en_off, \
+		.status_offset = _st_off, \
+	}
+
+static const struct rtd_io_detect_desc_info rtd1625_io_detect_desc[] = {
+	RTD_IO_DETECT_DESC(rgmii, 0x1a0, 8, 1),
+	RTD_IO_DETECT_DESC(sd, 0x1a0, 9, 2),
+	RTD_IO_DETECT_DESC(csi, 0x1a0, 10, 3),
+	RTD_IO_DETECT_DESC(sdio, 0x1a0, 11, 4),
+	RTD_IO_DETECT_DESC(uart1, 0x1a0, 12, 5),
+	RTD_IO_DETECT_DESC(aio, 0x1a0, 13, 6),
+	RTD_IO_DETECT_DESC(emmc, 0x1a0, 14, 7),
+};
+
+static const struct rtd_io_detect_descs rtd1625_io_detect_descs = {
+	.info = rtd1625_io_detect_desc,
+	.num_descs = ARRAY_SIZE(rtd1625_io_detect_desc),
+};
+
+static void detect_io_set(struct pinctrl *pinctrl,
+			  const struct rtd_io_detect_desc_info *desc,
+			  struct rtd_io_detect_data *data)
+{
+	struct pinctrl_state *state_1v8;
+	struct pinctrl_state *state_3v3;
+	unsigned int val;
+	int ret;
+
+	state_1v8 = pinctrl_lookup_state(pinctrl, desc->state_1v8);
+	if (IS_ERR(state_1v8)) {
+		dev_err(data->dev, "Failed to lookup %s state: %ld\n",
+			desc->state_1v8, PTR_ERR(state_1v8));
+		return;
+	}
+
+	state_3v3 = pinctrl_lookup_state(pinctrl, desc->state_3v3);
+	if (IS_ERR(state_3v3)) {
+		dev_err(data->dev, "Failed to lookup %s state: %ld\n",
+			desc->state_3v3, PTR_ERR(state_3v3));
+		return;
+	}
+
+	regmap_update_bits(data->base, desc->reg_offset,
+			   BIT(desc->en_offset), BIT(desc->en_offset));
+
+	regmap_read(data->base, desc->reg_offset, &val);
+
+	ret = pinctrl_select_state(pinctrl,
+				   (val & BIT(desc->status_offset)) ? state_3v3 : state_1v8);
+	if (ret)
+		dev_err(data->dev, "Failed to select pinctrl state\n");
+}
+
+static int rtd_io_detect_probe(struct platform_device *pdev)
+{
+	struct rtd_io_detect_data *data;
+	struct device *dev = &pdev->dev;
+	struct device_node *pinctrl_np;
+	struct pinctrl *pinctrl;
+	int i;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	pinctrl_np = of_parse_phandle(dev->of_node, "realtek,iso-pinctrl", 0);
+	if (!pinctrl_np) {
+		dev_err(dev, "Failed to find ISO pinctrl node\n");
+		return -ENODEV;
+	}
+
+	data->base = device_node_to_regmap(pinctrl_np);
+	of_node_put(pinctrl_np);
+
+	if (IS_ERR(data->base))
+		return dev_err_probe(dev, PTR_ERR(data->base), "Failed to get regmap\n");
+
+	data->descs = device_get_match_data(dev);
+	if (!data->descs)
+		return -EINVAL;
+
+	pinctrl = devm_pinctrl_get(dev);
+	if (IS_ERR(pinctrl))
+		return dev_err_probe(dev, PTR_ERR(pinctrl), "Failed to get pinctrl\n");
+
+	data->dev = dev;
+
+	for (i = 0; i < data->descs->num_descs; i++)
+		detect_io_set(pinctrl, &data->descs->info[i], data);
+
+	return 0;
+}
+
+static const struct of_device_id rtd_io_detect_of_matches[] = {
+	{ .compatible = "realtek,rtd1625-io-detect", .data = &rtd1625_io_detect_descs },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, rtd_io_detect_of_matches);
+
+static struct platform_driver rtd_io_detect_driver = {
+	.driver = {
+		.name = "rtd_io_level_detect",
+		.of_match_table = rtd_io_detect_of_matches,
+	},
+	.probe = rtd_io_detect_probe,
+};
+module_platform_driver(rtd_io_detect_driver);
+
+MODULE_DESCRIPTION("Realtek DHC SoC I/O Level Detect driver");
+MODULE_LICENSE("GPL");
+
-- 
2.43.0


