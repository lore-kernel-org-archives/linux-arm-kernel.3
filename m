Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84796C54F52
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 12:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XPfD72OzvtxyC+AW3sYLGrlc2Q1idMcvPbVnxbkXNFY=; b=wzkFcym3XzRnkDVyQ3OzTRPGa+
	sd+Su+cbejiYTAvMRcQYnavyp1qL8xT4ZenJ/5aouFPDlX0invvEZxwlNtooTdL3RZePndAQ2lBBS
	nBP9vybhiTotoL3uZYNzmVpadh5yclin75xu74WgMbT+I/r/xsPDTm+jAwjgHUfFXx0rDFB2j1JnE
	QlTL4T+LrSuFweYqzwiOb/Ohm7/B/qkYRW+u9cbsvkMeBuVDUMdCeXHSSUHziclEFOvtVLRiaIsgM
	O7yn+UJXQvxl21QOoftgZp/gqpKDtf0sXczoWF7urAj8lFuuRjIvSBQiw5nrTn9KkUlALoJhd8eDs
	QTzVgBaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogW2-00000005AIt-0BTJ;
	Tue, 28 Jul 2026 12:02:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogVx-00000005AA6-2GDQ;
	Tue, 28 Jul 2026 12:02:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 77C9E4514D;
	Tue, 28 Jul 2026 12:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4CA12C4AF12;
	Tue, 28 Jul 2026 12:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785240149;
	bh=37yLiqRavtbJr+G/J8iaWhg59NFd8czF0Kl2gB9DZRU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AU2bjwq1a+Zz64o2Mlgl4lT2DRw6MsHVUq2U382FldaXMPiKS6nvcVYHWfYrlaY5H
	 Fn3KCi7wWH7I6gH3L51mPHt3bEr/XiwN6vbdi51BbEFwvtcZgg+Bs/oc/vfXxwbx76
	 7dzfelG94wP7WYkSEu4rCxI7gcuQAIfrXcl2Qd1Ect5xihBUJuqD9e0OYEws6I2+fn
	 7WvgkEvp3050cF8mQODuoQTED3y8DQI/zKZLXPPMA2mzT4DjPePYvxGs9xWmCQztD5
	 rnni1+vNWv959VM6k07kD+BKkQLoqNZnaw94nS8Wk9RRDLUhGoLiMGoMnia6kcwwbO
	 Jm2vjpf4/xmVg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34497C54F4C;
	Tue, 28 Jul 2026 12:02:29 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Tue, 28 Jul 2026 14:00:39 +0200
Subject: [PATCH v5 12/12] arm64: dts: rockchip: add support for NanoPi M6
 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-nanopi-m6-v5-12-cbc1eb0d8d56@gmail.com>
References: <20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com>
In-Reply-To: <20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785240146; l=6264;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=J2NeRbVgli1g/p560y0BTFZZgoBAuNJ+5IL7Z4IgRdY=;
 b=Y54XjlN2AQqR53+yZmRNaMK+Z94BRAyn/BlB+BHM+V+3jO4l0s40A7oY4BKt42wVnS5N87DMu
 QDkLpf17FB2Cgwo7ZdUZ4ujyWqq1K6h1+teqtSagpBEBSER4JIiKfeV
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
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
Reply-To: joachim.eastwood@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Joachim Eastwood <joachim.eastwood@gmail.com>

The NanoPi M6 (V1) board shares most of the features of the R6 boards.

Main differences:
* M.2 M-key slot with PCIe (Also present on R6C)
* M.2 E-key slot with PCIe and USB (from hub)
* 1 additional USB 2.0 port from an on-board USB hub
* RT5616 audio CODEC

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi | 142 +++++++++++++++++++++
 .../boot/dts/rockchip/rk3588s-nanopi-m6v1.dts      |  57 +++++++++
 3 files changed, 200 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 761d82b4f4f2..55a1ec8309df 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -218,6 +218,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-evb1-v10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-gameforce-ace.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-indiedroid-nova.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-khadas-edge2.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-nanopi-m6v1.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-nanopi-r6s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-nanopi-r6c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-odroid-m2.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
new file mode 100644
index 000000000000..6644d3b72c9c
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+#include "rk3588s-nanopi.dtsi"
+
+/ {
+	adc-keys-1 {
+		compatible = "adc-keys";
+		io-channels = <&saradc 1>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+		poll-interval = <100>;
+
+		button-maskrom {
+			label = "Recovery";
+			linux,code = <KEY_VENDOR>;
+			press-threshold-microvolt = <1800>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		sys_led: led-0 {
+			label = "sys_led";
+			gpios = <&gpio1 RK_PA4 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			pinctrl-names = "default";
+			pinctrl-0 = <&sys_led_pin>;
+		};
+
+		user_led: led-1 {
+			label = "user_led";
+			gpios = <&gpio1 RK_PA6 GPIO_ACTIVE_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&user_led_pin>;
+		};
+	};
+
+	vcc_3v3_pcie: regulator-vcc-3v3-pcie {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio3 RK_PC6 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pcie2_2_pwren>;
+		regulator-name = "vcc_3v3_pcie";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc5v0_usb_otg0: regulator-vcc5v0-usb-otg0 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio3 RK_PD4 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&typec5v_pwren>;
+		regulator-name = "vcc5v0_usb_otg0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vdd_mpcie_3v3: regulator-vdd-mpcie-3v3 {
+		compatible = "regulator-fixed";
+		/* Controlled by EXT_EN on RK806 */
+		regulator-name = "vdd_mpcie_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+};
+
+&i2c7 {
+	clock-frequency = <200000>;
+	status = "okay";
+};
+
+&i2s0_8ch {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2s0_lrck
+		     &i2s0_mclk
+		     &i2s0_sclk
+		     &i2s0_sdi0
+		     &i2s0_sdo0>;
+	status = "okay";
+};
+
+&pcie2x1l1 { /* M.2 E-key 2230 */
+	vpcie3v3-supply = <&vdd_mpcie_3v3>;
+};
+
+&pcie2x1l2 { /* M.2 M-key 2280 */
+	pinctrl-0 = <&pcie20x1_2_perstn_m0>, <&pcie20x1m0_clkreqn>, <&pcie20x1m0_waken>;
+	vpcie3v3-supply = <&vcc_3v3_pcie>;
+};
+
+&pinctrl {
+	gpio-leds {
+		sys_led_pin: sys-led-pin {
+			rockchip,pins = <1 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		user_led_pin: user-led-pin {
+			rockchip,pins = <1 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	headphone {
+		hp_det: hp-det {
+			rockchip,pins = <1 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	pcie {
+		pcie2_2_pwren: pcie2-2-pwren {
+			rockchip,pins = <3 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	usb {
+		typec5v_pwren: typec5v-pwren {
+			rockchip,pins = <3 RK_PD4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&u2phy3 {
+	status = "okay";
+};
+
+&u2phy3_host {
+	phy-supply = <&vcc5v0_host_20>;
+	status = "okay";
+};
+
+&usb_host1_ehci {
+	status = "okay";
+};
+
+&usb_host1_ohci {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6v1.dts b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6v1.dts
new file mode 100644
index 000000000000..2a22435f46c8
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6v1.dts
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include "rk3588s-nanopi-m6.dtsi"
+
+/ {
+	model = "FriendlyElec NanoPi M6";
+	compatible = "friendlyarm,nanopi-m6", "rockchip,rk3588s";
+
+	analog-sound {
+		compatible = "audio-graph-card";
+		label = "rk3588s-rt5616";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&hp_det>;
+		hp-det-gpios = <&gpio1 RK_PC4 GPIO_ACTIVE_LOW>;
+
+		dais = <&i2s0_8ch_p0>;
+		routing =
+			"Headphones", "HPOL",
+			"Headphones", "HPOR",
+			"MIC1", "Microphone Jack",
+			"Microphone Jack", "micbias1";
+		widgets =
+			"Headphone", "Headphones",
+			"Microphone", "Microphone Jack";
+	};
+};
+
+&i2c7 {
+	audio-codec@1b {
+		compatible = "realtek,rt5616";
+		reg = <0x1b>;
+		assigned-clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
+		assigned-clock-rates = <12288000>;
+		clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
+
+		port {
+			rt5616_p0: endpoint {
+				remote-endpoint = <&i2s0_8ch_p0_0>;
+			};
+		};
+	};
+};
+
+&i2s0_8ch {
+	i2s0_8ch_p0: port {
+		i2s0_8ch_p0_0: endpoint {
+			dai-format = "i2s";
+			mclk-fs = <256>;
+			remote-endpoint = <&rt5616_p0>;
+		};
+	};
+};

-- 
2.55.0



