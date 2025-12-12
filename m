Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA81D59D93
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 20:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7L/QageIPILi5jf8I9rxOrDK8YjS2Dehy0VVUFfOEeE=; b=SbHMN2cdIgwuMCNisgBbZCA+tM
	VZ5HWzlQj2z4ITi1pLCYp4zv3aJWhHpJPjFXCuHNZwrjl7rDOIWF5M0lyXkmS4OFqC1BcQT+tSO4w
	jeVzum5rxBerTehpIPJiqGgDps7LfhsCHfazig5GrHm/K0lJxZeyg/hIpKciQEAoSMqzVWX/D9ioG
	1t6nF9qCmyest2B8VIGZd19zgeu4wcF32yfO466oyOpTDssc2WYrtmkM0mMcLo/yG41mGJ9nHHl+W
	MZ3CVre9q4DS6VNncEFRsTxLHiw/1y8uaWXXrrMklu0MMmYpjCyWfBT/J1vULDakvj4QfT+O22glm
	OQjsc1Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU9pA-000000013X0-0lWG;
	Fri, 12 Dec 2025 20:33:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU9p7-000000013Vc-0z0B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 20:33:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D3E8424C9;
	Fri, 12 Dec 2025 20:33:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4101AC4CEF1;
	Fri, 12 Dec 2025 20:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765571588;
	bh=5B2vSdXoneVvJtO2lTToIM1NsU8oEU7bS285epobsro=;
	h=From:To:Cc:Subject:Date:From;
	b=Umnn8xB/u8umZveLTZqRTZPLPqYcj05BwywjnDtrBYoLZj8d9KK9wkUaQp/3gNDAC
	 w9p4XsO+ta8ydQfGY+lRmP4QlRc39w22dtuZ3G73E1yGNtOknQnUS5BEjzDQQQrD5Q
	 TNBM80rxn6YIt5TAyHgDiwQ3FU+7N0WbhWBE4QG11cfm3s0RPhahkcnPPB+p+GhWrn
	 yYxY8XIMb0k3DDqUbtQdul5oEpaBM6GTo0H/T9ZwH+ZeXZGBdBBeLYclkEXW0rhz1a
	 zpRNiTfQX34+RcTy3LbRgQeRdQ3iP1vr2hCnkI4YMXEnUHQEJ/GqFHEukyTFOGllJJ
	 a/+f61arhBAsg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: dts: nxp/imx6: Drop unused .dtsi
Date: Fri, 12 Dec 2025 14:32:11 -0600
Message-ID: <20251212203226.458694-5-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_123309_319570_40B592D9 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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

These .dtsi files are not included anywhere in the tree and can't be
tested.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../dts/nxp/imx/imx6dl-kontron-samx6i.dtsi    | 12 -----
 .../dts/nxp/imx/imx6q-kontron-samx6i.dtsi     | 12 -----
 .../boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi  | 45 ----------------
 .../boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi  | 54 -------------------
 4 files changed, 123 deletions(-)
 delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
 delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
 delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
 delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
deleted file mode 100644
index 5a9b819d7ee8..000000000000
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
+++ /dev/null
@@ -1,12 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0 OR X11
-/*
- * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutronix.de>
- */
-
-#include "imx6dl.dtsi"
-#include "imx6qdl-kontron-samx6i.dtsi"
-
-/ {
-	model = "Kontron SMARC-sAMX6i Dual-Lite/Solo";
-	compatible = "kontron,imx6dl-samx6i", "fsl,imx6dl";
-};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
deleted file mode 100644
index e76963436079..000000000000
--- a/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
+++ /dev/null
@@ -1,12 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0 OR X11
-/*
- * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutronix.de>
- */
-
-#include "imx6q.dtsi"
-#include "imx6qdl-kontron-samx6i.dtsi"
-
-/ {
-	model = "Kontron SMARC-sAMX6i Quad/Dual";
-	compatible = "kontron,imx6q-samx6i", "fsl,imx6q";
-};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
deleted file mode 100644
index 3a968782e854..000000000000
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
+++ /dev/null
@@ -1,45 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+ OR MIT
-//
-// Copyright 2017 NXP
-
-#include "imx6qdl-pico.dtsi"
-
-/ {
-	leds {
-		compatible = "gpio-leds";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_gpio_leds>;
-
-		led {
-			label = "gpio-led";
-			gpios = <&gpio5 31 GPIO_ACTIVE_HIGH>;
-		};
-	};
-
-};
-
-&i2c1 {
-	mpl3115@60 {
-		compatible = "fsl,mpl3115";
-		reg = <0x60>;
-	};
-};
-
-&i2c2 {
-	io-expander@25 {
-		compatible = "nxp,pca9554";
-		reg = <0x25>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		#interrupt-cells = <2>;
-	};
-
-};
-
-&iomuxc {
-	pinctrl_gpio_leds: gpioledsgrp {
-		fsl,pins = <
-			MX6QDL_PAD_CSI0_DAT13__GPIO5_IO31	0x1b0b0
-		>;
-	};
-};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi
deleted file mode 100644
index 3d56a4216448..000000000000
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi
+++ /dev/null
@@ -1,54 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+ OR MIT
-
-#include "imx6qdl-pico.dtsi"
-
-/ {
-	leds {
-		compatible = "gpio-leds";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_gpio_leds>;
-
-		led {
-			label = "gpio-led";
-			gpios = <&gpio5 31 GPIO_ACTIVE_HIGH>;
-		};
-	};
-
-};
-
-&i2c1 {
-	adc@52 {
-		compatible = "ti,adc081c";
-		reg = <0x52>;
-		vref-supply = <&reg_2p5v>;
-	};
-};
-
-&i2c2 {
-	io-expander@25 {
-		compatible = "nxp,pca9554";
-		reg = <0x25>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		#interrupt-cells = <2>;
-	};
-};
-
-&i2c3 {
-	rtc@68 {
-		compatible = "dallas,ds1337";
-		reg = <0x68>;
-	};
-};
-
-&pcie {
-	status = "okay";
-};
-
-&iomuxc {
-	pinctrl_gpio_leds: gpioledsgrp {
-		fsl,pins = <
-			MX6QDL_PAD_CSI0_DAT13__GPIO5_IO31	0x1b0b0
-		>;
-	};
-};
-- 
2.51.0


