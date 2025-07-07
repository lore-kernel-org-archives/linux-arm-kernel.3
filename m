Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15259C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 06:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hC+oHwBxw5rT4Q2/WgH7GowIF82tJbKjvrWC1OKenAo=; b=I+zNeVsbHLZC12/3GSbLUhD6vf
	zoO1jlXiZRVhrOauwwXFSzBIcentFFBSOBzq4ZG220XvJZe+mzile8sfWjFpVf97ruCbS28S7qrIw
	oVZHsPFcTjNgPKoG66Fc+EAHDZdUo9qwLDb2xx+3ZcM8WzCnlgQKts6vUkYgpP/irSTvepWKMwnaa
	/EbT/pJkHbk3IXdAaQe/R73L4XvJLSF1U6LQ1h2IZ60GxaKB1fIDZI7ZFu9iB0e8Lm+qf4n+m+czW
	27sJYCY1V1RRjKMuQo8bieFkzu+yIyQ10TEw0mgQjS82VOS8QZOebuxmewDynr4o61V53RTcseZ2l
	qDQr5leQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYfDO-00000001XD3-3UZM;
	Mon, 07 Jul 2025 06:20:34 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYf4D-00000001Vsf-1hq9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 06:11:08 +0000
Received: from [89.212.21.243] (port=56226 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uYf4B-00DKr8-18;
	Mon, 07 Jul 2025 08:11:02 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v2 3/4] arm64: dts: imx93-phyboard-segin: Add PEB-WLBT-05 overlay
Date: Mon,  7 Jul 2025 08:11:00 +0200
Message-Id: <20250707061101.1194618-4-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707061101.1194618-1-primoz.fiser@norik.com>
References: <20250707061101.1194618-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_231105_599955_BF4BF468 
X-CRM114-Status: GOOD (  11.55  )
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

Add support for PEB-WLBT-05 WLAN/BT adapter on phyBOARD-Segin-i.MX93.
The PEB-WLBT-05 is equipped with a Sterling-LWB radio module, which is
capable of Wi-Fi 802.11 b/g/n and Bluetooth 4.2.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v2:
- no changes 

 arch/arm64/boot/dts/freescale/Makefile        |  2 +
 .../imx93-phyboard-segin-peb-wlbt-05.dtso     | 93 +++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-wlbt-05.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 011b2d58e4f7..3166684ab558 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -326,8 +326,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
 
 imx93-phyboard-segin-peb-eval-01-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-eval-01.dtbo
+imx93-phyboard-segin-peb-wlbt-05-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-wlbt-05.dtbo
 imx93-phycore-rpmsg-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-segin.dtb imx93-phycore-rpmsg.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-eval-01.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-wlbt-05.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phycore-rpmsg.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba91xxca.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-wlbt-05.dtso b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-wlbt-05.dtso
new file mode 100644
index 000000000000..fba1362ced72
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-wlbt-05.dtso
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ * Author: Andrej Picej <andrej.picej@norik.com>
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "imx93-pinfunc.h"
+
+&{/} {
+	usdhc3_pwrseq: usdhc3-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		post-power-on-delay-ms = <100>;
+		power-off-delay-us = <60>;
+		reset-gpios = <&gpio4 7 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&lpuart5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart5>;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		shutdown-gpios = <&gpio4 13 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;
+		max-speed = <2000000>;
+	};
+};
+
+&usdhc3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_wlbt>;
+	pinctrl-1 = <&pinctrl_usdhc3_sleep>, <&pinctrl_wlbt>;
+	mmc-pwrseq = <&usdhc3_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	no-1-8-v;
+	status = "okay";
+
+	brmcf: wifi@1 {
+		compatible = "brcm,bcm4329-fmac";
+		reg = <1>;
+	};
+};
+
+&iomuxc {
+	pinctrl_uart5: uart5grp {
+		fsl,pins = <
+			MX93_PAD_DAP_TDO_TRACESWO__LPUART5_TX	0x31e
+			MX93_PAD_DAP_TDI__LPUART5_RX		0x31e
+			MX93_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B	0x31e
+			MX93_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B	0x31e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO22__USDHC3_CLK		0x179e
+			MX93_PAD_GPIO_IO23__USDHC3_CMD		0x4000139e
+			MX93_PAD_GPIO_IO24__USDHC3_DATA0	0x4000139e
+			MX93_PAD_GPIO_IO25__USDHC3_DATA1	0x4000139e
+			MX93_PAD_GPIO_IO26__USDHC3_DATA2	0x4000139e
+			MX93_PAD_GPIO_IO27__USDHC3_DATA3	0x4000139e
+		>;
+	};
+
+	pinctrl_usdhc3_sleep: usdhc3sleepgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO22__USDHC3_CLK		0x31e
+			MX93_PAD_GPIO_IO23__USDHC3_CMD		0x31e
+			MX93_PAD_GPIO_IO24__USDHC3_DATA0	0x31e
+			MX93_PAD_GPIO_IO25__USDHC3_DATA1	0x31e
+			MX93_PAD_GPIO_IO26__USDHC3_DATA2	0x31e
+			MX93_PAD_GPIO_IO27__USDHC3_DATA3	0x31e
+		>;
+	};
+
+	pinctrl_wlbt: wlbtgrp {
+		fsl,pins = <
+			MX93_PAD_ENET1_RD3__GPIO4_IO13		0x31e	/* BT ENABLE */
+			MX93_PAD_ENET1_TXC__GPIO4_IO07		0x31e	/* WLAN ENABLE */
+			MX93_PAD_I2C1_SCL__GPIO1_IO00		0x31e	/* HOST WAKEUP */
+		>;
+	};
+};
-- 
2.34.1


