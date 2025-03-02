Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8174C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 15:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fdnQ5+Le+Og1Av7WQPN6X9ybA51iqbx7l8HzvezJN3g=; b=U18d22py3WLM8SznsP7FC4UiFT
	JLF1dQPpBdzCnT/X/mmgNGe2+ATWcGFb/p91n8SiIKkNLUNlmOC8TfTsEA+YlFhG1i4iqVpHHsFWo
	/YkcyIxOL7s8VzfJu2SLQTBEM7ytVGXP+9rFYhWFP86mOTxINsaejTjzaln0dRsRXf583YHHkvIdJ
	9ekbWe+f/uxLKobi+FXV05SNfdJU1eRg5s46tnuNixND33OWSrCpXmqjmGzL3jSYKjLC1ICGv21b/
	E1fDTagTu6NptBt1blMPM4LgIEJt3eBJsZRmCULZuW2hqGBiHvcVBFnChI55lJsAzdWMPBhrlJFMr
	4oLHl6DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tolVb-0000000GFek-0UoP;
	Sun, 02 Mar 2025 15:45:39 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tolSU-0000000GFGn-2Juf;
	Sun, 02 Mar 2025 15:42:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C6A044417;
	Sun,  2 Mar 2025 15:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740930142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fdnQ5+Le+Og1Av7WQPN6X9ybA51iqbx7l8HzvezJN3g=;
	b=Un8MpdeH2J+qxZ+MJKjzBwSk0gRRBdMDH0Yb0PBCqzgABRh5TYye6RlFUp0rjmWtvupTKR
	p0NdqCgjCdTq6mxoDmVP+07LdwuLGBI6DMQBgCEmoyY8E0xqXyW+3UHL49xrWFMcoohKk+
	f4iYa+e3v5LYDV7uGW8F3UChtmGiRvVHBP98DwkOOuvhJ3b7WNEj3g0i8bMPdziSUnTHXF
	nqzq407zm0U35teBDqO/cfTbE3xMD41W2d9qeiYcbG3keRWKACxAS8Ozqs4OeY+6faxZ2c
	hgMqQdkH5yxk2f2+rRE016YGLGi2frr82BU1eBZZ21xQ50ARKQwVj5SVuQdqHQ==
From: Olivier Benjamin <olivier.benjamin@bootlin.com>
Date: Sun, 02 Mar 2025 16:41:03 +0100
Subject: [PATCH v2 2/2] arm64: dts: rockchip: describe the OV8858 user
 camera on PinePhone Pro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250302-camera-v2-2-312b44b4a89c@bootlin.com>
References: <20250302-camera-v2-0-312b44b4a89c@bootlin.com>
In-Reply-To: <20250302-camera-v2-0-312b44b4a89c@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Olivier Benjamin <olivier.benjamin@bootlin.com>, oren@taumoda.com, 
 Dragan Simic <dsimic@manjaro.org>, Ondrej Jirman <megi@xff.cz>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelieeitdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefqlhhivhhivghruceuvghnjhgrmhhinhcuoeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeugeeivddvveevvedvudefjeevffdtuefgffekieelheehfeeihefgleefieelnecukfhppedvrgdtudemvgefgeemvggtfeekmedvgegvtdemfhehtggvmehffeegvdemieehkeejmehfieehieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgefgeemvggtfeekmedvgegvtdemfhehtggvmehffeegvdemieehkeejmehfieehiedphhgvlhhopegludelvddrudeikedruddrvddtngdpmhgrihhlfhhrohhmpeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheplhhinhhugidqrhhotghktghhihhpsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmvghgihesgihffhdrt
 giipdhrtghpthhtohepughsihhmihgtsehmrghnjhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepohhrvghnsehtrghumhhouggrrdgtohhmpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: olivier.benjamin@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_074227_190830_08F5D641 
X-CRM114-Status: GOOD (  10.56  )
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
index 7f8fe7577d240f330328b6ea44ea6b06bbc8595b..9c965a00fcf6dbf4c618e1f4668d82a028c76143 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -479,6 +479,27 @@ wcam_lens: camera-lens@c {
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
@@ -523,6 +544,24 @@ &io_domains {
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
 
@@ -598,6 +637,12 @@ camera {
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
2.48.1


