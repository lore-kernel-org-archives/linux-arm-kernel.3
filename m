Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621A2FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 21:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b2NH6zjdcKvSDzbOk6O5NQa8oZf6YVmG9OHyBdU4tv0=; b=j+Y7ybjrwKa8XWF4TA06I3pQ1a
	xp94HK96k2WiOYq1LvyOkHRky0J9s7A5VudbZw4wsoyjishV8cXw5gRngoapiWmNRBbyZSNW3vkVT
	vfdCt5sWGwynA26178TPTRNNtthDW0+MDJvrAS4F+uSxNp0/viQKNgFTVizVBhWQuP1sS7l3IFBGt
	lYL5KmOTabxpFx5jlHEkQl7AJAEYpzdz6g748/4AM8wpr6yd+uC40g2aZKksBxoxdd8FxbxgGb6Rv
	+zkqo9edtzYIgANF5LZClGD0Uy5wEBjx//WJx62FL75GWQcMrZ2QorrdF0b5mnCC/KpC5wwE1IlSC
	+xvl4U+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTxn-00000000DTU-1UHE;
	Mon, 27 Apr 2026 21:57:59 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTxe-00000000DFx-2JVN;
	Mon, 27 Apr 2026 21:57:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777327066;
	bh=GBlgGv3GtlJcaiLMjdHnPI0cHx08TkK+G4j4qUmiPIE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HhUxTX3RV6qpf/wFVa0TCZ5x3euiMr004fUYN1KMIe4MNa/2V7Dm3z9RToqPDi59k
	 84MnyEFSkPHNM+Sr2IuDhQz8SEdoVK7l4lPtas5cPk/sXkM0R5mS2uWp5TOMgaTdCX
	 tGZXY31LL9xsnr0tWMJlq3TV+FZovpWCQygXtZArO9Mm6gH5VRd/jGbBRVcz3nS2lf
	 jFD7A+xMXAmATHNa/1Jqj48Qy2clM8nURtxT8yaa5yK/IkN3j4vQ5hFyr/BvE5H0Tn
	 L8tnEADmkO2qHgaMUwTjoXvfJ8rmmNVp6QK4tRfvvkleXoSoNACw2agbSgcZ0kfhfm
	 VlwLCU945VCtA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BF2DC17E1523;
	Mon, 27 Apr 2026 23:57:46 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 28 Apr 2026 00:57:23 +0300
Subject: [PATCH v2 05/13] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588s boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-dts-rk-frl-enable-gpios-v2-5-924df9db884a@collabora.com>
References: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
In-Reply-To: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_145750_932788_05C703FF 
X-CRM114-Status: GOOD (  10.94  )
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

The following RK3588s boards expose a GPIO pin to control the voltage
bias on the HDMI0 data lines:

- rk3588s-coolpi-4b
- rk3588s-indiedroid-nova
- rk3588s-nanopi-r6
- rk3588s-odroid-m2
- rk3588s-orangepi-5
- rk3588s-radxa-cm5-io
- rk3588s-rock-5a
- rk3588s-rock-5c

The pin must be asserted when operating in HDMI 2.1 FRL mode and
deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the hdmi0 node to its dedicated GPIO via frl-enable-gpios to
allow adjusting the bias when transitioning between TMDS and FRL modes.

While at it, also ensure that pinctrl-names is present and ordered
alphabetically within the hdmi nodes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts       | 10 ++++++++++
 arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts | 10 +++++++++-
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi      | 10 ++++++++++
 arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts       | 10 ++++++++++
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi     | 10 ++++++++++
 arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts    | 10 ++++++++++
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts         | 12 ++++++++++--
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts         | 12 ++++++++++--
 8 files changed, 79 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts b/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
index 189444d20779..16f19109fca6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
@@ -251,6 +251,10 @@ &gpu {
 };
 
 &hdmi0 {
+	frl-enable-gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -396,6 +400,12 @@ &pd_gpu {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi0_tx_on_h: hdmi0-tx-on-h {
+			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		hym8563_int: hym8563-int {
 			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
index 174d299cc6bb..f9e3c0134d5f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
@@ -277,8 +277,10 @@ &gpu {
 };
 
 &hdmi0 {
+	frl-enable-gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&hdmim0_tx0_scl>, <&hdmim0_tx0_sda>,
-		    <&hdmim0_tx0_hpd>, <&hdmim0_tx0_cec>;
+		    <&hdmim0_tx0_hpd>, <&hdmim0_tx0_cec>,
+		    <&hdmi0_tx_on_h>;
 	pinctrl-names = "default";
 	status = "okay";
 };
@@ -517,6 +519,12 @@ bt_wake_host: bt-wake-host {
 		};
 	};
 
+	hdmi {
+		hdmi0_tx_on_h: hdmi0-tx-on-h {
+			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 
 		hym8563_int: hym8563-int {
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index 1b6a59f7cabc..b9c0a1a050a9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -236,6 +236,10 @@ &gpu {
 };
 
 &hdmi0 {
+	frl-enable-gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -404,6 +408,12 @@ lan2_led_pin: lan2-led-pin {
 		};
 	};
 
+	hdmi {
+		hdmi0_tx_on_h: hdmi0-tx-on-h {
+			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		rtc_int: rtc-int {
 			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts b/arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts
index a72063c55140..4e98fa33492c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts
@@ -249,6 +249,10 @@ &gpu {
 };
 
 &hdmi0 {
+	frl-enable-gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -438,6 +442,12 @@ &pd_gpu {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi0_tx_on_h: hdmi0-tx-on-h {
+			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	lcd {
 		lcd_pwren: lcd-pwren {
 			rockchip,pins = <4 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
index dafad29f9854..cd80cb15a405 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
@@ -181,6 +181,10 @@ &gpu {
 };
 
 &hdmi0 {
+	frl-enable-gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -381,6 +385,12 @@ &pd_npu {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi0_tx_on_h: hdmi0-tx-on-h {
+			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		hym8563_int: hym8563-int {
 			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts b/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts
index f80d5a00a4bd..af4a9bc015e1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts
@@ -120,6 +120,10 @@ &gmac1 {
 };
 
 &hdmi0 {
+	frl-enable-gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -217,6 +221,12 @@ usbc0_int: usbc0-int {
 		};
 	};
 
+	hdmi {
+		hdmi0_tx_on_h: hdmi0-tx-on-h {
+			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	usb {
 		vcc5v0_host_en: vcc5v0-host-en {
 			rockchip,pins = <1 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts
index 0991f6a21190..ffd26b43ae8c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts
@@ -323,11 +323,13 @@ &gmac1_rgmii_clk
 };
 
 &hdmi0 {
-	pinctrl-names = "default";
+	frl-enable-gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&hdmim0_tx0_cec
 		     &hdmim1_tx0_hpd
 		     &hdmim0_tx0_scl
-		     &hdmim0_tx0_sda>;
+		     &hdmim0_tx0_sda
+		     &hdmi0_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -373,6 +375,12 @@ &pd_gpu {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi0_tx_on_h: hdmi0-tx-on-h {
+			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	leds {
 		io_led: io-led {
 			rockchip,pins = <3 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
index 7fe42f4ff827..9d3d0791554d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
@@ -258,11 +258,13 @@ &gpu {
 };
 
 &hdmi0 {
-	pinctrl-names = "default";
+	frl-enable-gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&hdmim0_tx0_cec
 		     &hdmim1_tx0_hpd
 		     &hdmim0_tx0_scl
-		     &hdmim0_tx0_sda>;
+		     &hdmim0_tx0_sda
+		     &hdmi0_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -461,6 +463,12 @@ &pd_gpu {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi0_tx_on_h: hdmi0-tx-on-h {
+			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	leds {
 		led_pins: led-pins {
 			rockchip,pins = <3 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>,

-- 
2.53.0


