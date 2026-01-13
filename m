Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4E4D29DE3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 06:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r2vgrhEdugmagLwZEvqOkWdh2ipCP/6KRxI2gxuStSw=; b=hWQpxkqdM7mkv991peuKSoesFt
	UpC/hq9UNILu53Ng3l/kj+WXNkegKX/0FYNbfjdrNM1qzYGhRpNqdVYcvW7XKs+BcIlDqqEuXe91b
	XnD+vTmJvull8ZIwaLg/DklULtw03kFxiGXz6dg369rZonlmQ40HWy5OlQKQZOEnBywTmzMjbwg0c
	dhkX09lvQ/I26Cow+yiYDKTQ3r8/FyEJvzDlKfEik2CrmHfApEhiV6j0PoG86tvLROYEPw2o2znbN
	U9vq5W93KxnGAKi4UFt5TPDntBC5sa6WNAKRo2QUYfjtqN9FKZOQE9ZQxj7u6Tm8E2Qxl65KT66KS
	IDtyKMiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfY6n-00000006bek-05Ep;
	Tue, 13 Jan 2026 06:42:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfY6l-00000006bdS-1Ahc;
	Tue, 13 Jan 2026 06:42:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 23567600AA;
	Tue, 13 Jan 2026 06:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0098C19423;
	Tue, 13 Jan 2026 06:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768286545;
	bh=tgNrJivakY84LN4ffX7ynvqrLuzdsKS6bBMEvtxUBUM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CVkNgAwowTw3rkY43D3p+qbnYOV8nlcpIC+gdamWnBdYYkQiH60E0xY+VYSGKvOz3
	 W//tZqbuemKHNoltN36iKRkAU2grVtUr+sTmkErxuhM5ajrbynxok6UsVCbhR55q/P
	 2+sInRkNCU0PYrIRyEPOCOyISf4g5IVKkQrbWv0HhV9pu6ZHSc7VsSnTcnTVx/We5L
	 4gIu42OyGTRLwhcpxsUgMY0eIyGNwJ0cu+fMHsqRQtTaxtdXMYHb/QRkw6Lq6drmtI
	 5hW6Jz8xMXOeSqgvm6wMo1F8PTsYNZd2u62L6mAGqDziM/QWAzZxCDwpSvyjyP2+5r
	 4Nsyq3ObCbeHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0374D29DDC;
	Tue, 13 Jan 2026 06:42:25 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Mon, 12 Jan 2026 22:42:24 -0800
Subject: [PATCH 1/3] arm64: dts: rockchip: Add modem to the Pinephone Pro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260112-ppp_connectivity-v1-1-284d6e83b212@gmail.com>
References: <20260112-ppp_connectivity-v1-0-284d6e83b212@gmail.com>
In-Reply-To: <20260112-ppp_connectivity-v1-0-284d6e83b212@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, Martijn Braam <martijn@brixit.nl>, 
 =?utf-8?q?Kamil_Trzci=C5=84ski?= <ayufan@ayufan.eu>, 
 Ondrej Jirman <megi@xff.cz>, Danct12 <danct12@disroot.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768286545; l=3643;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=4uS+h5BwUlSPrxpCAFJLMPNjdiivO6iFy+cSgNfP0p0=;
 b=2ksy0syKTvw7tTSOjQGRnnffr+1niVslNBIkAg2/x41pqLBRVxPYmnDfrYxHhjVTbjbMotF10
 4/L/4w2w6ybD5Ram1A8zLKUfrUbuTb4LTHAN8WNWBnfPBjxYbRoVaqX
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
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
Reply-To: guptarud@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Rudraksha Gupta <guptarud@gmail.com>

This adds the Quectel EG25-G modem to the Pinephone Pro.

Co-developed-by: Martijn Braam <martijn@brixit.nl>
Signed-off-by: Martijn Braam <martijn@brixit.nl>
Co-developed-by: Kamil Trzciński <ayufan@ayufan.eu>
Signed-off-by: Kamil Trzciński <ayufan@ayufan.eu>
Co-developed-by: Ondrej Jirman <megi@xff.cz>
Signed-off-by: Ondrej Jirman <megi@xff.cz>
Co-developed-by: Danct12 <danct12@disroot.org>
Signed-off-by: Danct12 <danct12@disroot.org>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 6b35f59cd58e..97d0bf455258 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -97,6 +97,46 @@ multi-led {
 		leds = <&led_red>, <&led_green>, <&led_blue>;
 	};
 
+	vcc_4g_5v: regulator-vcc-4g-5v {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio1 RK_PC7 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vcc_4g_5v_en>;
+		regulator-name = "vcc_4g_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_sys>;
+		regulator-always-on;
+	};
+
+	vcc_4g: regulator-vcc-4g {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio4 RK_PC7 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vcc_4g_en>;
+		regulator-name = "vcc_4g";
+		regulator-min-microvolt = <3800000>;
+		regulator-max-microvolt = <3800000>;
+		vin-supply = <&vcc_sys>;
+		regulator-always-on;
+	};
+
+	vcc5v0_sys: regulator-vcc5v0-host {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&boost_otg>;
+
+		regulator-state-mem {
+			regulator-on-in-suspend;
+		};
+	};
+
 	vcc_sys: regulator-vcc-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_sys";
@@ -274,6 +314,17 @@ rk818: pmic@1c {
 		vcc9-supply = <&vcc3v3_sys>;
 
 		regulators {
+			boost_otg: DCDC_BOOST {
+				regulator-name = "boost_otg";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <5000000>;
+				regulator-max-microvolt = <5000000>;
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
 			vdd_cpu_l: DCDC_REG1 {
 				regulator-name = "vdd_cpu_l";
 				regulator-always-on;
@@ -702,6 +753,16 @@ blue_led_pin: blue-led-pin {
 		};
 	};
 
+	modem {
+		vcc_4g_5v_en: vcc-4g-5v-en-pin {
+			rockchip,pins = <1 RK_PC7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		vcc_4g_en: vcc-4g-en-pin {
+			rockchip,pins = <4 RK_PC7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	pmic {
 		pmic_int_l: pmic-int-l {
 			rockchip,pins = <1 RK_PC5 RK_FUNC_GPIO &pcfg_pull_up>;
@@ -827,6 +888,16 @@ &tsadc {
 	status = "okay";
 };
 
+
+&u2phy1 {
+	status = "okay";
+};
+
+&u2phy1_host {
+	status = "okay";
+	phy-supply = <&vcc5v0_sys>;
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_xfer &uart0_cts &uart0_rts>;
@@ -852,6 +923,18 @@ &uart2 {
 	status = "okay";
 };
 
+&uart3 {
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
+
 &vopb {
 	status = "okay";
 	assigned-clocks = <&cru DCLK_VOP0_DIV>, <&cru DCLK_VOP0>,

-- 
2.52.0



