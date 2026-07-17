Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9BAC44519
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 05:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8hKk6b8UckKzjxsKlRUSCsjBP/DrlWcDht3eTHcoz1Y=; b=C1dYes7lb94F4n3/cdyCz9S7pT
	ZyN1NeQAPThwC3bM/8VqJgp1Dwsj1JrFYVWd2xZ8KIAIJDJhcmLESNQsfSYVlVGIp0pSs+R0NArdW
	AfZaipYbL59fPOKAoNrBqL7U6AzMU7Nh5qvuAygbO7OMmWbDx8ZOa6LGYr4AokcmNnrBMgzPB8n59
	xOoC0Qr58eVEDHOl3pferASShoRx4L2gWI1QSj83pkhbAohhFvrIer/GKz8f6i40H3YRLtAnv4PYP
	uI1qIQwjcDICWiPFmcS1dgGoqpScN4nME4b6RMeEu+O8lk3mztSAKhztnbn+Ch6aILXjKqCbiCetG
	tJ0n4Njw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkaro-00000001ACu-3vNk;
	Fri, 17 Jul 2026 05:12:08 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkari-00000001AAX-1efD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 05:12:05 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id F325F20019A;
	Fri, 17 Jul 2026 07:12:00 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id BBE9B200181;
	Fri, 17 Jul 2026 07:12:00 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id ED71E18000B5;
	Fri, 17 Jul 2026 13:11:58 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Date: Fri, 17 Jul 2026 14:11:54 +0900
Subject: [PATCH 3/3] arm64: dts: imx93: Add i.MX93 Wireless FRDM board
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-imx93w_frdm-v1-3-0cca6c0ba2f5@nxp.com>
References: <20260717-imx93w_frdm-v1-0-0cca6c0ba2f5@nxp.com>
In-Reply-To: <20260717-imx93w_frdm-v1-0-0cca6c0ba2f5@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Joseph Guo <qijian.guo@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784265114; l=3045;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=rFR1VSayt2OVJUkDppwqa9ZiDJIiRa4WVrFcRZEYjAE=;
 b=JLaIS9ghT8hTEVbVqATesK26tuc3lNCXY1XHm0V88s2IkrBnD1SwlWMiaFODLzFV/nvpYYiIx
 DUXrbJ0Zj3jD5LvxnhoHqFK7STC5JzR0XgMy9dEqRBu+tpG4ourdvWu
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_221202_713517_8B61C68D 
X-CRM114-Status: GOOD (  11.02  )
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

i.MX93 Wireless FRDM board(FRDM-IMX93W) is a low-cost and compact board featuring
the i.MX93W applications processor:https://www.nxp.com/products/IMX93W

FRDM-IMX93W board basically reuse the FRDM-IMX93 board, with some minor
functional and pin connection differences. Reuse the
imx93-11x11-frdm-common.dtsi and add the board-specific changes.

Here are the detailed differences between FRDM-IMX93 and FRDM-IMX93W board.

Function differences:
Function	FRDM-IMX93W			FRDM-IMX93
WIFI/BT		IW610 in i.MX93W		IW612 M.2 module
MQS		N				Y
M.2		N				Y
RPi 40-pin HDR	Limited support(pin conflict) 	Y

Pin connection differences:
Function  Signal name	i.MX93W EVK		i.MX93 EVK
WIFI/BT	  SPI_FRM	SAI1_TXFS (spi1.PCS0)	GPIO_IO08 (spi3.PCS0)
	  SPI_TXD	SAI1_TXC (spi1.SIN)	GPIO_IO09 (spi3.SIN)
	  SPI_RXD	SAI1_RXD0 (spi1.SOUT)	GPIO_IO10 (spi3.SOUT)
	  SPI_CLK	SAI1_TXD0 (spi1.SCK)	GPIO_IO11 (spi3.SCK)
	  SPI_INT	CCM_CLKO1		on-board IO expander
	  NB_WAKE_IN	PDM_CLK			on-module IO expander
	  WL_WAKE_IN	PDM_BIT_STREAM0		on-module IO expander
	  IND_RST_WL	PDM_BIT_STREAM1		on-module IO expander
	  IND_RST_NB	GPIO_IO28		on-module IO expander
	  PDn		GPIO_IO29		on-module IO expander
	  NB_WAKE_OUT	GPIO_IO14		on-board IO expander
	  WL_WAKE_OUT	GPIO_IO15		CCM_CLKO1
I2C3	  I2C3_SDA	GPIO_IO00		GPIO_IO28
	  I2C3_SCL	GPIO_IO01		GPIO_IO29

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 arch/arm64/boot/dts/freescale/imx93w-frdm.dts | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index be3c858f1eeb1a807cb8ac36269c581143f755df..d48ba7dee1861e0b39ab025c4b8108ffa68c9bf3 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -655,6 +655,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla-mini-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-dart-sonata.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93w-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93w-frdm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx943-evk.dtb
 
 imx943-evk-pcie0-ep-dtbs += imx943-evk.dtb imx-pcie0-ep.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx93w-frdm.dts b/arch/arm64/boot/dts/freescale/imx93w-frdm.dts
new file mode 100644
index 0000000000000000000000000000000000000000..766e942fe6638330b602577c541d93f3526afe51
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93w-frdm.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+
+#include "imx93w.dtsi"
+#include "imx93-11x11-frdm-common.dtsi"
+
+/ {
+	model = "NXP i.MX93W FRDM board";
+	compatible = "fsl,imx93-wireless-frdm", "fsl,imx93";
+};
+
+&iomuxc {
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO00__LPI2C3_SDA			0x40000b9e
+			MX93_PAD_GPIO_IO01__LPI2C3_SCL			0x40000b9e
+		>;
+	};
+};

-- 
2.34.1


