Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DFAC02188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jan 2025 23:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mykE6XYAa/L6PjPwFyz3zJZRBcEqHwGk8LTmdP4EN5o=; b=IiwJmN22CrVBNEIcf/ap4FApwV
	t8I3X0q94GuTbJ8RKlLPKUDpZx86uABcFnL7kLgED0n85wdm74K0zUQUT185zriMl5SnakbiX3Xvl
	U721RvKLh0Q8ETw8XbTRoNGxfC5RVocPLSXNP/qxQ6Kq5SOOUlu4iSU4r2NIsjM12AnuuFeQpAvcF
	PxZcGzpCbQ/2JvW9ui7Op4hlcfPEoO5voTHWM8Jop0l4VJ9tDH6qI2humklnZrA5qMFOKuIC46F+0
	0zYeGXpemImjIhqCg8C8zD3gSgPtbflaFT5gAMTlrtZMsUv+Ko2Ij5dkcnpCczRJBDtawFqZ3ZHMx
	I8Ml/YeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZeHu-00000004Pvg-13ib;
	Sun, 19 Jan 2025 23:01:02 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZeE8-00000004PVb-0dH9;
	Sun, 19 Jan 2025 22:57:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B81641C0004;
	Sun, 19 Jan 2025 22:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737327423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mykE6XYAa/L6PjPwFyz3zJZRBcEqHwGk8LTmdP4EN5o=;
	b=e9y9Wz48a1xPDRr7uEcXWcHFHxNdsoc0GwFFq6JM2DHmsde6BwcO5s1YX/gWHWRCzxIeMC
	WKzNnEYfKMrbQY7uLEHgqxHrw2JHAyehojmpHqUUN8Vrp5tpi2xI4GMIRnImtkSAW51xrz
	+rNWJFKY2TkxYiRYZC1OQ9otQyETk62sSf9W+nbTG9lU1Em8u68q0sezVfnbGmnd59V1EH
	sYLAdTExbvXwftM6xUgoBgj/HuI80P2/V3MT1vtRCdOAKW88cTPOUDp9jcPPq8Kua5dIt3
	DTw6DuIONAkHjK2Jy3YkWOsBoMhoGXyJh+QF7RHquv8TUWABAibHe6fn1sQ3GQ==
From: Olivier Benjamin <olivier.benjamin@bootlin.com>
Date: Sun, 19 Jan 2025 23:57:00 +0100
Subject: [PATCH 2/2] arm64: dts: PinePhone Pro: describe the OV8858 user
 camera
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250119-camera-v1-2-320be4f0dc2b@bootlin.com>
References: <20250119-camera-v1-0-320be4f0dc2b@bootlin.com>
In-Reply-To: <20250119-camera-v1-0-320be4f0dc2b@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Olivier Benjamin <olivier.benjamin@bootlin.com>, 
 Dragan Simic <dsimic@manjaro.org>, Ondrej Jirman <megi@xff.cz>
X-Mailer: b4 0.14.2
X-GND-Sasl: olivier.benjamin@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_145708_491726_35F9830C 
X-CRM114-Status: GOOD (  10.73  )
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

Add the description of the front/user camera (OV8858) on the PinePhone Pro
to the device dts file.
It receives commands over SCCB, an I2C-compatible protocol, at
I2C address 0x36 and transmits data over CSI-MIPI.
I confirmed this address experimentally.

The pin control mapping was again extracted from the PinePhone Pro
schematic v1.0 as well as the RK3399 datasheet revision 1.8.

Table 2-3 in section 2.8 of the RK3399 datasheet contains the mapping
of IO functions for the SoC pins. Page 52 shows GPIO1_A4, page 54 shows
GPIO2_B4.

For the reset (RESET) signal:
page 11 quadrant D2             | p.18 q.B3-4 | p.18 q.C2
RK3399_E.R28 -> GPIO1_A4 -> Camera2_RST -> MIPI_RST1 -> OV8858.12

For the powerdown (PWDN) signal:
page 9 quadrants D4-5          | p.18 q.B2
RK3399_L.F31 -> GPIO2_B4 -> DVP_PDN0_H -> OV8858.14

Helped-by: Dragan Simic <dsimic@manjaro.org>
Co-developed-by: Ondrej Jirman <megi@xff.cz>
Signed-off-by: Ondrej Jirman <megi@xff.cz>
Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
---
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 4c059b4cda198b0f1973c7bba677ce12d37211b3..9129320b51e6a870f8b86d4bc6bb2ea39d9ab483 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -481,6 +481,27 @@ wcam_lens: camera-lens@c {
 		/* Same I2c bus as both cameras, depends on vcca1v8_codec for power. */
 		vcc-supply = <&vcc1v8_dvp>;
 	};
+
+	ucam: camera@36 {
+		compatible = "ovti,ov8858";
+		reg = <0x36>;
+		clocks = <&cru SCLK_CIF_OUT>; /* MIPI_MCLK1, derived from CIF_CLK0 */
+		clock-names = "xvclk";
+		pinctrl-names = "default";
+		pinctrl-0 = <&ucam_rst &ucam_pwdn>;
+		dovdd-supply = <&vcc1v8_dvp>;
+		reset-gpios = <&gpio1 RK_PA4 GPIO_ACTIVE_LOW>;
+		powerdown-gpios = <&gpio2 RK_PB4 GPIO_ACTIVE_LOW>;
+		orientation = <0>; /* V4L2_CAMERA_ORIENTATION_FRONT */
+		rotation = <90>;
+
+		port {
+			ucam_out: endpoint {
+				remote-endpoint = <&mipi_in_ucam>;
+				data-lanes = <1 2 3 4>;
+			};
+		};
+	};
 };
 
 &i2c3 {
@@ -546,6 +567,24 @@ &io_domains {
 	status = "okay";
 };
 
+&isp0 {
+	status = "okay";
+
+	ports {
+		port@0 {
+			mipi_in_ucam: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&ucam_out>;
+				data-lanes = <1 2 3 4>;
+			};
+		};
+	};
+};
+
+&isp0_mmu {
+	status = "okay";
+};
+
 &isp1 {
 	status = "okay";
 
@@ -621,6 +660,12 @@ camera {
 		wcam_rst: wcam-rst {
 			rockchip,pins = <1 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
+		ucam_rst: ucam-rst {
+			rockchip,pins = <1 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+		ucam_pwdn: ucam-pwdn {
+			rockchip,pins = <2 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
 	};
 
 	leds {

-- 
2.47.1


