Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7E4FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 21:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tDaizahlEh2OvSLmRf+4xq1naQkZuG9Cj6T6OSAEDGs=; b=LzoFiraEXcHG4OwDkmT6CeIEm4
	sG8D9fOCJbwEQbGRQSpXTNP7Q51KQPGOzfIJ3ahgOPgMUxTduZDJ2GC+30GDzv3Mnhz+lmWlTUWoZ
	rVg28e32tOTxf8EXpufgOP64ejx/ebyA3mKVvXX8daTqcjcm8JxqJpIJiu5Up3w9U5ZS3FKtg+z/M
	kuBXqAkEjajRe0LZlHzaI+sVkHt9CoQ9GolDVh11PdknvI91PUd3kj0rN0vgUPazSddqEXCvSslps
	zv3L/hNs44bsK/dZxuphaWjIWpA+yceSr9e+IBB2LgMC7D4Jn6pTsMtswdndh2lcWAk/T5DPvV6Cx
	z0V72neA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTxy-00000000Dnw-2Tkg;
	Mon, 27 Apr 2026 21:58:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTxj-00000000DLl-1JwH;
	Mon, 27 Apr 2026 21:57:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777327073;
	bh=YdRIwqxOF7212PcAYjIGHNU8fspzvht9JZclE1blmgo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Mw4iQqvadAmOphrPhpJVLo4xrwmSLa5UtdvdRNoXj3BrP5EUXXbfTTpU1EmaVjMug
	 lcYe4BNTRujnnqcXt8Pfbz+RUTuUwWgeFqDqvsOsqq8x2PBPbu1Ck5t6wA/BKrz5tj
	 ZDH3F3SQeR7C1vL8MBiRnwWQg2MuH4pkrLU59WPRXyzcGXNWGjT6ewdmogN/UUPwO+
	 IETGUhKTSQM6XreXwl4MgKFhtJmmdH3xXwBX7Z2iSGJcODxO5h1r8Imo9UfLKDuSG7
	 cqnZkxEjP8AhYvbt/xkGo5PLkj1/xNC9u41SrTKbotic5jVoBojX4HQVuLAW3VuXy4
	 nF6q/1LLbPDEw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 511F117E157E;
	Mon, 27 Apr 2026 23:57:53 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 28 Apr 2026 00:57:31 +0300
Subject: [PATCH v2 13/13] arm64: dts: rockchip: Add missing pinctrl-names
 to rk3588s boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-dts-rk-frl-enable-gpios-v2-13-924df9db884a@collabora.com>
References: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
In-Reply-To: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_145755_562327_5B283EB3 
X-CRM114-Status: GOOD (  11.42  )
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

Several rk3588s board DTS files override pinctrl-0 for i2c, i2s, pwm,
spi, tsadc and uart nodes without re-specifying pinctrl-names.  While
the property is inherited from the base rk3588s.dtsi, add it explicitly
to the board-level overrides for consistency with other nodes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts         | 6 ++++++
 arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts          | 1 +
 arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts     | 7 +++++++
 arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts   | 3 +++
 arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts      | 1 +
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi        | 1 +
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi       | 1 +
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5-base.dts | 3 +++
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5.dtsi     | 3 +++
 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts            | 1 +
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts           | 1 +
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts           | 1 +
 12 files changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts b/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
index 16f19109fca6..2e8661ac7fcf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
@@ -276,6 +276,7 @@ &hdptxphy0 {
 
 &i2c0 {
 	pinctrl-0 = <&i2c0m2_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 
 	vdd_cpu_big0_s0: regulator@42 {
@@ -336,6 +337,7 @@ regulator-state-mem {
 
 &i2c6 {
 	pinctrl-0 = <&i2c6m3_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 
 	hym8563: rtc@51 {
@@ -352,6 +354,7 @@ hym8563: rtc@51 {
 
 &i2c7 {
 	pinctrl-0 = <&i2c7m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 
 	es8316: audio-codec@10 {
@@ -377,6 +380,7 @@ &i2s0_mclk
 		     &i2s0_sclk
 		     &i2s0_sdi0
 		     &i2s0_sdo0>;
+	pinctrl-names = "default";
 	status = "okay";
 
 	i2s0_8ch_p0: port {
@@ -469,6 +473,7 @@ wifi_poweren_pin: wifi-poweren-pin {
 
 &pwm2 {
 	pinctrl-0 = <&pwm2m1_pins>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -875,6 +880,7 @@ &u2phy3_host {
 
 &uart2 {
 	pinctrl-0 = <&uart2m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
index d6b62cd1b90b..c4ddb78f9bb2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
@@ -457,6 +457,7 @@ usbc0_int: usbc0-int {
 
 &pwm12 {
 	pinctrl-0 = <&pwm12m1_pins>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts b/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
index b657d54c2c59..230aac005e8f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
@@ -614,6 +614,7 @@ touchscreen@14 {
 
 &i2c4 {
 	pinctrl-0 = <&i2c4m2_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 
 	ti_adc: adc@48 {
@@ -650,6 +651,7 @@ imu@68 {
 
 &i2c6 {
 	pinctrl-0 = <&i2c6m3_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 
 	fusb302: typec@22 {
@@ -783,6 +785,7 @@ &i2s0_mclk
 		     &i2s0_sclk
 		     &i2s0_sdi0
 		     &i2s0_sdo0>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -1026,11 +1029,13 @@ wifi_host_wake_irq: wifi-host-wake-irq {
 
 &pwm12 {
 	pinctrl-0 = <&pwm12m1_pins>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
 &pwm13 {
 	pinctrl-0 = <&pwm13m1_pins>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -1432,11 +1437,13 @@ &u2phy0_otg {
 
 &uart2 {
 	pinctrl-0 = <&uart2m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
 &uart9 {
 	pinctrl-0 = <&uart9m2_xfer>, <&uart9m2_ctsn>, <&uart9m2_rtsn>;
+	pinctrl-names = "default";
 	uart-has-rtscts;
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
index f9e3c0134d5f..ed36c27c2320 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
@@ -368,6 +368,7 @@ regulator-state-mem {
 
 &i2c6 {
 	pinctrl-0 = <&i2c6m3_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 
 	fusb302: typec-portc@22 {
@@ -440,6 +441,7 @@ rtc_hym8563: rtc@51 {
 
 &i2c7 {
 	pinctrl-0 = <&i2c7m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 
 	es8388: audio-codec@11 {
@@ -973,6 +975,7 @@ &u2phy3_host {
 
 &uart2 {
 	pinctrl-0 = <&uart2m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts b/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
index 5afbc593341b..833f27fdd1c6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
@@ -742,6 +742,7 @@ &tsadc {
 
 &uart2 {
 	pinctrl-0 = <&uart2m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index b9c0a1a050a9..91b6eefd7abf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -851,6 +851,7 @@ &u2phy2_host {
 
 &uart2 {
 	pinctrl-0 = <&uart2m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
index cd80cb15a405..9da13f96f13a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
@@ -847,6 +847,7 @@ &u2phy3_host {
 
 &uart2 {
 	pinctrl-0 = <&uart2m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5-base.dts b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5-base.dts
index 20da0c2b3d92..0145e194841c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5-base.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5-base.dts
@@ -173,6 +173,7 @@ &hdptxphy0 {
 
 &i2c1 {
 	pinctrl-0 = <&i2c1m2_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 
 	rtc@51 {
@@ -280,6 +281,7 @@ &pwm4 {
 
 &pwm5 {
 	pinctrl-0 = <&pwm5m1_pins>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -320,6 +322,7 @@ &u2phy2_host {
 
 &uart2 {
 	pinctrl-0 = <&uart2m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5.dtsi
index 32357eba4b78..5d3dc21c4d61 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5.dtsi
@@ -64,6 +64,7 @@ &gpu {
 
 &i2c0 {
 	pinctrl-0 = <&i2c0m2_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 
 	vdd_cpu_big0_s0: regulator@42 {
@@ -142,6 +143,7 @@ &spi2 {
 	assigned-clock-rates = <200000000>;
 	num-cs = <1>;
 	pinctrl-0 = <&spi2m2_cs0 &spi2m2_pins>;
+	pinctrl-names = "default";
 	status = "okay";
 
 	pmic@0 {
@@ -468,5 +470,6 @@ &tsadc {
 	 * through the CRU.
 	 */
 	pinctrl-0 = <&tsadc_gpio_func>;
+	pinctrl-names = "default";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts b/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
index aa02cf510d6d..d534d662c40f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
@@ -810,6 +810,7 @@ &uart2 {
 
 &uart7 {
 	pinctrl-0 = <&uart7m2_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts
index ffd26b43ae8c..a76734da982f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts
@@ -827,6 +827,7 @@ &u2phy3_host {
 
 &uart2 {
 	pinctrl-0 = <&uart2m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
index 9d3d0791554d..e4784885c267 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
@@ -930,6 +930,7 @@ &u2phy3_host {
 
 &uart2 {
 	pinctrl-0 = <&uart2m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 

-- 
2.53.0


