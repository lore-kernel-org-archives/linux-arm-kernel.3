Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90CBC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 13:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJhFWQN9kQYNsPpzWROhU9cJ5mnw+FnPzcUzcdJp3Ww=; b=Dz8t6iAAOJZPSMZ6yG6Ov6VewQ
	a5sLIdr77KgJOr6BqF+KoluAChs/zWfeVIzooVAvpD4NG/GJdzCtgs6EndQc8KnKJ/mDf6GteVHOK
	gHrLJrZ/ptclb8xAIW8NJ0KhkRxPu8LrRyAk/n/AayZXBMe2DAlS+UwcaDV8tLB6eTmkAFRhysWZL
	7cnynRi0dgTfJESYIFdbrrV/7/DkvHvWIcoyjdduN94pRplMykE9C9UaLRFF4nwf+Q3WlH8UC/C1m
	x92ZDnNnRVjEhF+1b1T+f+mDVNGmDZyzOX17F2KxByG5wjHcCmyWhHmVIlZsF1bd5DVU+0PgkiULG
	PWl7ApHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trGaw-00000000ZiC-1BAI;
	Sun, 09 Mar 2025 13:21:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trGW4-00000000YeF-0NG1;
	Sun, 09 Mar 2025 13:16:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F3B305C0FD7;
	Sun,  9 Mar 2025 13:14:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B359C4CEEE;
	Sun,  9 Mar 2025 13:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741526185;
	bh=SHZtBJAG+o4RRVLthnCajXIZ2+BgK5nZRZEOGGpVBTg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SvCqKlbfwXeyDko/+0Omsj8qcKAQkuW6rNS3mPgph6cbliD8/8NMhmYpelLlWtuCt
	 aTA9g8ENErDnNm7Ox5uM9roljunATr3VCeWbysQEHsFmcECBjG/Nk3YLIz2sX33tji
	 o6dY7XVcmc9zs+A2Xml8tsG+skgyJD58te3KK0ZxRv6G4xYiVckTlJ5Yrobaxe3G61
	 2N+r0evPNfjs+IOElIoxgSd06o3y6sxnR1b0pTtcPdPN3wSVqaSS0gN1tocm7QNmk6
	 9yrWGSyDry1G3EHzWBwl8TLHtVsl+CVxY9jnNj1qSl83vtXjpMZ2WgCdod/HSLH6oM
	 qwU67IxL7886w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B0F8C35FF1;
	Sun,  9 Mar 2025 13:16:25 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sun, 09 Mar 2025 14:16:21 +0100
Subject: [PATCH 2/2] arm64: dts: amlogic: Add Ogoos AM3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250309-ugoos-am3-v1-2-38cab5a4725b@posteo.net>
References: <20250309-ugoos-am3-v1-0-38cab5a4725b@posteo.net>
In-Reply-To: <20250309-ugoos-am3-v1-0-38cab5a4725b@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741526184; l=4569;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=r2xd+Ae/jy3p72pJ06WqDTpZeVRV52iMgB3vroAEsT0=;
 b=HT0H/WdaPMebTfWtVNUzbITgKdjZOBqvnQAfEt/VLbNCnctGgaFBwEt6w1YtFQVcwUvL0AMce
 JFmBOWaKuP6BjVG2dzUrKBhmNKXu3cq7x1RqdhhvLMVbjcE9hofvn8J
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_061628_253194_20F45A6D 
X-CRM114-Status: GOOD (  17.63  )
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
Reply-To: j.ne@posteo.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: "J. Neuschäfer" <j.ne@posteo.net>

The Ugoos AM3 is a small set-top box based on the Amlogic S912 SoC,
with a board design that is very close to the Q20x development boards.
The MMC max-frequency properties are copied from the downstream device
tree.

  https://ugoos.com/ugoos-am3-16g

The following functionality has been tested and is known to work:
 - debug serial port
 - "update" button inside the case
 - USB host mode, on all three ports
 - HDMI video/audio output
 - eMMC, MicroSD, and SDIO WLAN
 - S/PDIF audio output
 - Ethernet
 - Infrared remote control input

The following functionality doesn't seem to work:
 - USB role switching and device mode on the "OTG" port
 - case LED

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/arm64/boot/dts/amlogic/Makefile               |  1 +
 .../arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi |  2 +-
 .../arm64/boot/dts/amlogic/meson-gxm-ugoos-am3.dts | 95 ++++++++++++++++++++++
 3 files changed, 97 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 2fbda8419c65a3056410ac45ca3ddaceb69ea4f5..bf2bc14528bfa27e8d6ae2730085fc356d6c6dd8 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -76,6 +76,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxm-q200.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-q201.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-rbox-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-s912-libretech-pc.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxm-ugoos-am3.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-vega-s96.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-wetek-core2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-s4-s805x2-aq222.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
index 45ccddd1aaf0546632c81a52c8917a923beae883..4223b26f7d0f3aa47e42e9434d24f73b20441981 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
@@ -97,7 +97,7 @@ sdio_pwrseq: sdio-pwrseq {
 		clock-names = "ext_clock";
 	};
 
-	cvbs-connector {
+	cvbs_connector: cvbs-connector {
 		compatible = "composite-video-connector";
 
 		port {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-ugoos-am3.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-ugoos-am3.dts
new file mode 100644
index 0000000000000000000000000000000000000000..c413736f4096df8727311844de352debd89cdfb9
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-ugoos-am3.dts
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 J. Neuschäfer <j.ne@posteo.net>
+ *
+ * Debug UART (3.3V, 115200 baud) at the corner of the board:
+ *   (4) (3) (2) [1]
+ *   Vcc RXD TXD GND
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/amlogic,meson-g12a-gpio-intc.h>
+
+#include "meson-gxm.dtsi"
+#include "meson-gx-p23x-q20x.dtsi"
+
+/ {
+	compatible = "ugoos,am3", "amlogic,s912", "amlogic,meson-gxm";
+	model = "Ugoos AM3";
+
+	adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 0>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1710000>;
+
+		button-function {
+			label = "Update";
+			linux,code = <KEY_VENDOR>;
+			press-threshold-microvolt = <10000>;
+		};
+	};
+};
+
+&cvbs_connector {
+	/* Not used on this board */
+	status = "disabled";
+};
+
+&ethmac {
+	pinctrl-0 = <&eth_pins>;
+	pinctrl-names = "default";
+
+	/* Select external PHY by default */
+	phy-handle = <&external_phy>;
+
+	amlogic,tx-delay-ns = <2>;
+
+	/* External PHY is in RGMII */
+	phy-mode = "rgmii";
+
+	status = "okay";
+};
+
+&external_mdio {
+	external_phy: ethernet-phy@0 {
+		/* Realtek RTL8211F (0x001cc916) */
+		reg = <0>;
+
+		reset-assert-us = <10000>;
+		reset-deassert-us = <80000>;
+		reset-gpios = <&gpio GPIOZ_14 GPIO_ACTIVE_LOW>;
+
+		interrupt-parent = <&gpio_intc>;
+		/* MAC_INTR on GPIOZ_15 */
+		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&i2c_B {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c_b_pins>;
+
+	rtc: rtc@51 {
+		compatible = "haoyu,hym8563";
+		reg = <0x51>;
+		#clock-cells = <0>;
+	};
+};
+
+/* WLAN: Atheros 10k (QCA9377) */
+&sd_emmc_a {
+	max-frequency = <200000000>;
+};
+
+&sdio_pwrseq {
+	reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_HIGH>;
+};
+
+/* eMMC */
+&sd_emmc_c {
+	max-frequency = <100000000>;
+};

-- 
2.48.0.rc1.219.gb6b6757d772



