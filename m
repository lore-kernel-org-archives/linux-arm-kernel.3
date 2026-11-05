Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7D6606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zimTVOps;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UAhtLQAF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=tFn6zikrEC2zlRMrakpJdg31GXuSzHcjKbCz7ZUJ270=; b=zimTVOpsL22tCNCbUUDx2l869x
	Z62dBGep/ddAarJV0hiHloxKlamqimtt5nC2UaUCc3P/K/AQ5eQInOoyd9i8aTSq+CMgy++zBG+H4
	zjefNbymUX/S3wsxwnEjArSheJMoxgM8oPRp9uoCZsTxD2YWsivkf2jZAnpNccdmXoCqxKmy76X3F
	FEsePed0Cim3Fb6etXuCu7Wp0NS6Aiso3Cezd/FxfoGhqEHoqCT3LJjfAdHELs5twMwEeYbyZEsJt
	0aonXXpXwuP47QqvWabXQhsUM9XlXEMuudS0mAWfYXBggZXUgMzpn88gEYwM6qbJoNHmL595qmRgx
	mttPS19g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyos-00000009KzB-2CbC;
	Thu, 05 Nov 2026 14:52:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyor-00000009Kyz-1pGa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 14:52:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BE12B417F0;
	Thu,  5 Nov 2026 14:52:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CDC41F00919;
	Thu,  5 Nov 2026 14:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793890320;
	bh=tFn6zikrEC2zlRMrakpJdg31GXuSzHcjKbCz7ZUJ270=;
	h=From:To:Cc:Subject:Date;
	b=UAhtLQAF7ygLXbRm4nIp+VFu3Zsf5fwk2EQdIQK2d9V2i6A8PVlNuSObt9AuFKSXj
	 SoKszMHuYAQBz+LdZhBnKMbqx2bco+KTDrCNSu7EmVIizM4XdbI/Qv2Ye3ZmaNpiCc
	 Tjo9Ks58BNb3G0fzdGPjTZLLnVUtM8eLB95E5zD5rFCHJZm1FxBTQqK97ogSlDrbq2
	 JAwRVjm+pu/CXuNGkxtY4vjLzvR6tW6+J+E6EOT5ovABUjdLXyjTkKYF+J0qPQ7Dq+
	 iVZUmUg9YoyY0l96BX8hnLottoD2lgi48PqczKNKEBlmKMOB+r1Gyw+pWXBY8tost7
	 iO97CRtnQYqjg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: dts: nxp/imx6: Drop unused .dtsi
Date: Thu,  5 Nov 2026 08:49:19 -0600
Message-ID: <20261105144920.2796623-2-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

These .dtsi files are not included anywhere in the tree and can't be
tested.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Rebased

It's been nearly a year and these are still orphans. There was a promise
to upstream something for the kontron ones, but that hasn't happened.

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
2.53.0


