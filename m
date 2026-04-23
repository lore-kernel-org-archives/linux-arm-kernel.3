Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB67FDEE4E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 21:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O1BLpSDvNmWKyUm5kw05+4oGAoI8Z1ptEpiUvP099ow=; b=uQGat9v/EPxTV9borw2XR7MZfz
	0CNx82zJwwSNRMYTJAncDbnV1fYilanL7QbwVkUxFkq00vqoGXpiAwN5kUqfmqb+g9VjRwQLcArfk
	7IAhSqZfjc7IslugtnzqGr5agc5WNhPlqy868jsCICJLEilFcuDKq0WDRGYNc5Lv1PMBjdznR/B/9
	yVjH5yM8xlOktGjimTncxHe0T1+6EyzFgM79vu/0kzPGSDc6smg5M3+qe646E835N2qA94e1teNHQ
	4+uxo6k+q7yOrRGY5ssY8b+74QOj8qb8IUiTvJ7Yi+yi1BfXcu4fItFOcBwxJSIEgoYPVpYsCQrPM
	tD3+9cJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG1OY-0000000CKTD-1c1Y;
	Thu, 23 Apr 2026 21:15:34 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG1OV-0000000CKQZ-0ytL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 21:15:32 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4g1plj03ssz9vM4;
	Thu, 23 Apr 2026 23:15:29 +0200 (CEST)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of linux@timmermann.space designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=linux@timmermann.space
From: Lukas Timmermann <linux@timmermann.space>
Date: Thu, 23 Apr 2026 23:14:41 +0200
Subject: [PATCH 5/5] ARM: dts: exynos: Add display support for
 exynos5250-manta
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-manta-display-v1-5-196f80c5673a@timmermann.space>
References: <20260423-manta-display-v1-0-196f80c5673a@timmermann.space>
In-Reply-To: <20260423-manta-display-v1-0-196f80c5673a@timmermann.space>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Lukas Timmermann <linux@timmermann.space>, 
 Alexandre Marquet <tb@a-marquet.fr>
X-Rspamd-Queue-Id: 4g1plj03ssz9vM4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_141531_487285_3BE32A33 
X-CRM114-Status: GOOD (  11.10  )
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

Adds the necessary entries for panel and backlight as
well as the fimd controller.

Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
Signed-off-by: Lukas Timmermann <linux@timmermann.space>
---
 arch/arm/boot/dts/samsung/exynos5250-manta.dts | 99 ++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos5250-manta.dts b/arch/arm/boot/dts/samsung/exynos5250-manta.dts
index 76d3657eb22f..eb97a28ff4e3 100644
--- a/arch/arm/boot/dts/samsung/exynos5250-manta.dts
+++ b/arch/arm/boot/dts/samsung/exynos5250-manta.dts
@@ -25,6 +25,29 @@ aliases {
 		mmc1 = &mmc_1; /* WiFi */
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm 0 1000000 0>;
+
+		brightness-levels = <2 255>; /* TODO */
+		num-interpolated-steps = <254>; /* TODO */
+		default-brightness-level = <102>; /* TODO */
+		post-pwm-on-delay-ms = <97>; /* TODO */
+
+		power-supply = <&backlight_reg>;
+		enable-gpios = <&gpg0 5 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&led_bl_reset &pwm0_out>;
+		pinctrl-names = "default";
+	};
+
+	backlight_reg: regulator-backlight {
+		compatible = "regulator-fixed";
+		regulator-name = "APS_EN_18V";
+		pinctrl-0 = <&aps_en_18v>;
+		pinctrl-names = "default";
+	};
+
 	/* Voltage source unknown */
 	bmp180_vdda_reg: regulator-bmp180-vdda {
 		compatible = "regulator-fixed";
@@ -105,6 +128,28 @@ multi-led {
 		leds = <&status_red>, <&status_green>, <&status_blue>, <&status_white>;
 	};
 
+	panel {
+		compatible = "samsung,ltl101dl02-002";
+
+		backlight = <&backlight>;
+		power-supply = <&panel_reg>;
+		enable-gpios = <&gph1 7 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&lcd_en>;
+		pinctrl-names = "default";
+		no-hpd;
+
+		port {
+			panel: endpoint {
+				remote-endpoint = <&dp_out>;
+			};
+		};
+	};
+
+	panel_reg: regulator-panel {
+		compatible = "regulator-fixed";
+		regulator-name = "LCD_EN";
+	};
+
 	pwrseq: mmc1-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 
@@ -146,10 +191,36 @@ &cpu1 {
 	cpu-supply = <&buck2_reg>;
 };
 
+&dp {
+	status = "okay";
+
+	samsung,color-space = <0>;
+	samsung,color-depth = <1>;
+	samsung,link-rate = <0x0a>;
+	samsung,lane-count = <4>;
+	samsung,dynamic-range = <0>;
+	samsung,ycbcr-coeff = <0>;
+
+	ports {
+		port {
+			dp_out: endpoint {
+				remote-endpoint = <&panel>;
+			};
+		};
+	};
+};
+
 &ehci {
 	status = "disabled";
 };
 
+&fimd {
+	status = "okay";
+
+	assigned-clocks = <&clock CLK_MOUT_FIMD1>, <&clock CLK_MOUT_VPLL>;
+	assigned-clock-parents = <&clock CLK_MOUT_VPLL>;
+};
+
 &i2c_1 {
 	status = "okay";
 
@@ -396,6 +467,12 @@ ldo25_reg: LDO25 {
 	};
 };
 
+&mali {
+	status = "okay";
+
+	mali-supply = <&buck4_reg>;
+};
+
 &mixer {
 	status = "okay";
 };
@@ -489,6 +566,14 @@ wlan_irq: wlan-irq-pins {
 };
 
 &pinctrl_1 {
+	aps_en_18v: aps-en-18v-pins {
+		samsung,pins = "gph1-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>; /* TODO */
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>; /* TODO */
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_UP>; /* TODO */
+		samsung,pin-val = <0>; /* TODO */
+	};
+
 	bh1721fvc_reset: bh1721fvc-reset-pins {
 		samsung,pins = "gph1-2";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
@@ -509,6 +594,20 @@ bt_wake: bt-wake-pins {
 		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
 	};
 
+	lcd_en: lcd-en-pins {
+		samsung,pins = "gph1-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>; /* TODO */
+		samsung,pin-val = <0>;
+	};
+
+	led_bl_reset: led-bl-rst-pins {
+		samsung,pins = "gpg0-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>; /* TODO */
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>; /* TODO */
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>; /* TODO */
+		samsung,pin-val = <0>; /* TODO */
+	};
+
 	msense_reset: msense-reset-pins {
 		samsung,pins = "gpg2-0";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;

-- 
2.53.0


