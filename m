Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85851CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 16:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qYjAq4lS0X830hLZOI/nDQ998raGTvTagTmw/6iAjOI=; b=1OgptdhMLcgEy5QWf2gzt5RVPq
	wsoiX7wPsk+XDM/xT+tdnaMMySt46NeVbiZMYleXNIsukK0R7M/efv55q8HYL6WN9W5MrQTenG/6M
	o6AUixOn7tI+eG2E+fJQA9kTCYVm9q9oRZnX/XChaUrhCZrlzDGcRdyBjg0/dznR5Mo3XN3NPXDzl
	K3Fm2vfgeq1OTdk/UERxXrdzHPgm4AEfaClj9kfJ9RHCeTMjD0JUIIWU9oyniRMmRNLCmgkn5g7JJ
	0LWeKqVxyWFpLqU66ORuwAgRY1oHOU74JBs3/LeGML40Z6zv6Q2mNHYEjJy9+ucNp7bM66geU/imw
	+uGSIbQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5o7y-00000000PPv-0VRT;
	Mon, 06 Oct 2025 16:31:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5o7u-00000000POB-3Vo6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 16:31:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D239459C3;
	Mon,  6 Oct 2025 16:31:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC01DC4CEF5;
	Mon,  6 Oct 2025 16:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759768314;
	bh=lmmhiSMSM0QI5UtyLT1oRwAi1Xu2NtSABJdRNdbbkNE=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=CwnYn4NHuuK2n+KeFOkVrYSrz7n6GusDJdpomGbI25ZrSucN60q12b+U00K9N5Jqo
	 tIxIu75efDoSY0RpM6GXkUJ7gFlKNK+Swvp1ee4nlNimP5stM0KRRgznWB3ykSBFhh
	 pszmsF/cfWyXCmT1AR00Cyy1O8ROROl2A3QiLzBLp+gmTea4mBWqaqgOlFiJOPGYfJ
	 Goxm52Ko5z7ft7lhqv+oQ83w5QN6N6I7g7LRLx9tvp+eI62DzGEJIbjh3QtYH7xrje
	 gq/qXCKamoh5wGnf/u7uDmGtc7NLtawyIw6Zp3+Bxc4PbQ9RkwJV18VlWVMRT5/Sks
	 zVE9CJFsWMdJg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D95F8CCA470;
	Mon,  6 Oct 2025 16:31:53 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Mon, 06 Oct 2025 18:31:28 +0200
Subject: [PATCH] arm64: dts: freescale: Add GMAC Ethernet for S32G2 EVB and
 RDB2 and S32G3 RDB3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251006-nxp-s32g-boards-v1-1-f70a57b8087f@oss.nxp.com>
X-B4-Tracking: v=1; b=H4sIAN/u42gC/x3MMQqAMAxA0atIZgNtJIJeRRysjTVLlQZEEO9uc
 XzD/w+YFBWDsXmgyKWmR67wbQPrvuQkqLEayBF753rM94nWUcJwLCUaUvTcE3PggaBWZ5FN7/8
 4ze/7AaoG5dxhAAAA
To: Chester Lin <chester62515@gmail.com>, 
 Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759768312; l=7038;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=TMWFQ/FCO7r1LG54aYnEDegZ7oUI5MIx6sPdhGBxOcA=;
 b=BYkrZtIcJy8FigoNiS7KdvSacfpqLvQ8+glEubaeNymGK1JA+8tu/tR1m9gshcgR22HkuQ5Mw
 Cmy9eQyLBqgD4z5OxjWHaoTIiGXyJAXPiv+S2FEYTssNJq0IC465zL+
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_093154_926114_C9AC5845 
X-CRM114-Status: GOOD (  12.20  )
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
Reply-To: jan.petrous@oss.nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

Add support for the Ethernet connection over GMAC controller connected to
the Micrel KSZ9031 Ethernet RGMII PHY located on the boards.

The mentioned GMAC controller is one of two network controllers
embedded on the NXP Automotive SoCs S32G2 and S32G3.

The supported boards:
 * EVB:  S32G-VNP-EVB with S32G2 SoC
 * RDB2: S32G-VNP-RDB2
 * RDB3: S32G-VNP-RDB3

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi        | 50 ++++++++++++++++++++++++-
 arch/arm64/boot/dts/freescale/s32g274a-evb.dts  | 21 ++++++++++-
 arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts | 19 ++++++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi        | 50 ++++++++++++++++++++++++-
 arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts | 21 ++++++++++-
 5 files changed, 157 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index d167624d1f0c..d06103e9564e 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -3,7 +3,7 @@
  * NXP S32G2 SoC family
  *
  * Copyright (c) 2021 SUSE LLC
- * Copyright 2017-2021, 2024 NXP
+ * Copyright 2017-2021, 2024-2025 NXP
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -738,5 +738,53 @@ gic: interrupt-controller@50800000 {
 			interrupt-controller;
 			#interrupt-cells = <3>;
 		};
+
+		gmac0: ethernet@4033c000 {
+			compatible = "nxp,s32g2-dwmac";
+			reg = <0x4033c000 0x2000>, /* gmac IP */
+			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			snps,mtl-rx-config = <&mtl_rx_setup>;
+			snps,mtl-tx-config = <&mtl_tx_setup>;
+			status = "disabled";
+
+			mtl_rx_setup: rx-queues-config {
+				snps,rx-queues-to-use = <5>;
+
+				queue0 {
+				};
+				queue1 {
+				};
+				queue2 {
+				};
+				queue3 {
+				};
+				queue4 {
+				};
+			};
+
+			mtl_tx_setup: tx-queues-config {
+				snps,tx-queues-to-use = <5>;
+
+				queue0 {
+				};
+				queue1 {
+				};
+				queue2 {
+				};
+				queue3 {
+				};
+				queue4 {
+				};
+			};
+
+			gmac0mdio: mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "snps,dwmac-mdio";
+			};
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/s32g274a-evb.dts b/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
index c4a195dd67bf..f020da03979a 100644
--- a/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
+++ b/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later OR MIT
 /*
  * Copyright (c) 2021 SUSE LLC
- * Copyright 2019-2021, 2024 NXP
+ * Copyright 2019-2021, 2024-2025 NXP
  */
 
 /dts-v1/;
@@ -15,6 +15,7 @@ / {
 
 	aliases {
 		serial0 = &uart0;
+		ethernet0 = &gmac0;
 	};
 
 	chosen {
@@ -43,3 +44,21 @@ &usdhc0 {
 	no-1-8-v;
 	status = "okay";
 };
+
+&gmac0 {
+	clocks = <&clks 24>, <&clks 19>, <&clks 18>, <&clks 15>;
+	clock-names = "stmmaceth", "tx", "rx", "ptp_ref";
+	phy-mode = "rgmii-id";
+	phy-handle = <&rgmiiaphy4>;
+	status = "okay";
+};
+
+&gmac0mdio {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* KSZ 9031 on RGMII */
+	rgmiiaphy4: ethernet-phy@4 {
+		reg = <4>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
index 4f58be68c818..b9c2f964b3f7 100644
--- a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
+++ b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
@@ -16,6 +16,7 @@ / {
 	aliases {
 		serial0 = &uart0;
 		serial1 = &uart1;
+		ethernet0 = &gmac0;
 	};
 
 	chosen {
@@ -77,3 +78,21 @@ &usdhc0 {
 	no-1-8-v;
 	status = "okay";
 };
+
+&gmac0 {
+	clocks = <&clks 24>, <&clks 19>, <&clks 18>, <&clks 15>;
+	clock-names = "stmmaceth", "tx", "rx", "ptp_ref";
+	phy-mode = "rgmii-id";
+	phy-handle = <&rgmiiaphy1>;
+	status = "okay";
+};
+
+&gmac0mdio {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* KSZ 9031 on RGMII */
+	rgmiiaphy1: ethernet-phy@1 {
+		reg = <1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index be3a582ebc1b..e31184847371 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
 /*
- * Copyright 2021-2024 NXP
+ * Copyright 2021-2025 NXP
  *
  * Authors: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
  *          Ciprian Costea <ciprianmarian.costea@nxp.com>
@@ -883,6 +883,54 @@ gic: interrupt-controller@50800000 {
 			      <0x50420000 0x2000>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		gmac0: ethernet@4033c000 {
+			compatible = "nxp,s32g2-dwmac";
+			reg = <0x4033c000 0x2000>, /* gmac IP */
+			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			snps,mtl-rx-config = <&mtl_rx_setup>;
+			snps,mtl-tx-config = <&mtl_tx_setup>;
+			status = "disabled";
+
+			mtl_rx_setup: rx-queues-config {
+				snps,rx-queues-to-use = <5>;
+
+				queue0 {
+				};
+				queue1 {
+				};
+				queue2 {
+				};
+				queue3 {
+				};
+				queue4 {
+				};
+			};
+
+			mtl_tx_setup: tx-queues-config {
+				snps,tx-queues-to-use = <5>;
+
+				queue0 {
+				};
+				queue1 {
+				};
+				queue2 {
+				};
+				queue3 {
+				};
+				queue4 {
+				};
+			};
+
+			gmac0mdio: mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "snps,dwmac-mdio";
+			};
+		};
 	};
 
 	timer {
diff --git a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
index e94f70ad82d9..4a74923789ae 100644
--- a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
+++ b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
 /*
- * Copyright 2021-2024 NXP
+ * Copyright 2021-2025 NXP
  *
  * NXP S32G3 Reference Design Board 3 (S32G-VNP-RDB3)
  */
@@ -18,6 +18,7 @@ aliases {
 		mmc0 = &usdhc0;
 		serial0 = &uart0;
 		serial1 = &uart1;
+		ethernet0 = &gmac0;
 	};
 
 	chosen {
@@ -93,3 +94,21 @@ &usdhc0 {
 	disable-wp;
 	status = "okay";
 };
+
+&gmac0 {
+	clocks = <&clks 24>, <&clks 19>, <&clks 18>, <&clks 15>;
+	clock-names = "stmmaceth", "tx", "rx", "ptp_ref";
+	phy-mode = "rgmii-id";
+	phy-handle = <&rgmiiaphy1>;
+	status = "okay";
+};
+
+&gmac0mdio {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* KSZ 9031 on RGMII */
+	rgmiiaphy1: ethernet-phy@1 {
+		reg = <1>;
+	};
+};

---
base-commit: fd94619c43360eb44d28bd3ef326a4f85c600a07
change-id: 20251006-nxp-s32g-boards-2d156255b592

Best regards,
-- 
Jan Petrous (OSS) <jan.petrous@oss.nxp.com>



