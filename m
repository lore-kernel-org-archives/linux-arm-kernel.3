Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E3BC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 15:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nY0S3h9TNbvjPa0oqXiKssMDiiZYbdnLuZAy4PGUKk=; b=KtbEVCQ89aXBaRZEGCjf8u9DL9
	rhEtAT5MsPFYy1YszX16qvnvGURTd+bnsPBA1gwbm93JdYAGW1kugPchtzWCzYZ7zaJXtU2x7dpXO
	yzAX9HJRZDD5aLtlI8LBcEcuv/9reMNCSJcDcv8VsOXFx5iHIEek12+ETgOoFBpW+0ZhoTDjnySv7
	EOYZ7XZUb2K5gjGPKEYaal9dJZ1VVgYRxxUlpeNGWYpjtwHmeKFHI2ZiufXH76WgVWQeAKb5AmhVB
	FPlBDlMGsFezjhpt6MN6ZfJiqFQL5Z5t8SjfpZJCANa2wFMMez00dPAvuQAan8CpIZ01aTP0VBddP
	YTU4IrvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSdfU-0000000FyZ2-1qT7;
	Fri, 20 Jun 2025 15:28:40 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSdYq-0000000Fx4s-0x9g;
	Fri, 20 Jun 2025 15:21:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB8D44326A;
	Fri, 20 Jun 2025 15:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750432906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9nY0S3h9TNbvjPa0oqXiKssMDiiZYbdnLuZAy4PGUKk=;
	b=FBEHMOt3QA2tcRmg1IhTgJpD0kDH1a6QghFDUG9YKdXBL1/I3I536lWB8AdIqODJiCAcW2
	9Q6vTKNX4DtrAwGRqJCs3M/aZP+6z4/Ukoik0FB2Tn6Rz5GlXr7meC6NihPF7CnWK0mDzs
	WRPnbP8uJaefVnSXFc6P6McyZqyvx3cFUrLzRtPdHu00FzmdVbmq3C69sTBTtjh6QLO9fm
	yEQMPP2E+WLiwC238XM5Tgz6zmFNWEUATafkTmf/D6P+A27pWzQr0FOX+2xFSdlgdobxOi
	00dJ9s42pIeng7pJay1IdSM/asFH6pz0hsUYQWhXGLaE31YcQu01MbP1+aLC/w==
From: Olivier Benjamin <olivier.benjamin@bootlin.com>
Date: Fri, 20 Jun 2025 17:21:35 +0200
Subject: [PATCH v4 4/4] arm64: dts: rockchip: describe the OV8858 user
 camera on PinePhone Pro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-camera-v4-4-0201a8ed5fae@bootlin.com>
References: <20250620-camera-v4-0-0201a8ed5fae@bootlin.com>
In-Reply-To: <20250620-camera-v4-0-0201a8ed5fae@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Nicholas Roth <nicholas@rothemail.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 imx@lists.linux.dev, Olivier Benjamin <olivier.benjamin@bootlin.com>, 
 ~diederik/pine64-discuss@lists.sr.ht, Dragan Simic <dsimic@manjaro.org>, 
 Ondrej Jirman <megi@xff.cz>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdekjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepqfhlihhvihgvrhcuuegvnhhjrghmihhnuceoohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegueegiedvvdevveevvddufeejvefftdeugfffkeeileehheefieehgfelfeeileenucfkphepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeinecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeipdhhvghloheplgduledvrdduieekrddurddvtdgnpdhmrghilhhfrhhomhepohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvgedprhgtphhtthhopeimughivgguvghrihhksdhpihhnvgeigedqughishgtuhhssheslhhishhtshdrshhrrdhhthdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhitghhohhlrghssehrohhth
 hgvmhgrihhlrdhnvghtpdhrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghv
X-GND-Sasl: olivier.benjamin@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_082148_403441_CAA64BB9 
X-CRM114-Status: GOOD (  12.31  )
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
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 49 +++++++++++++++++++++-
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index b335d044138b413359ba54269ab646142254a55f..c1a151ed4215638895ef5c9872d746dca38cb671 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -454,7 +454,7 @@ wcam: camera@1a {
 		reg = <0x1a>;
 		clocks = <&cru SCLK_CIF_OUT>; /* MIPI_MCLK0, derived from CIF_CLKO */
 		pinctrl-names = "default";
-		pinctrl-0 = <&camera_rst>;
+		pinctrl-0 = <&camera_rst_l>;
 		/* Note: both cameras also depend on vcca1v8_codec to power the I2C bus. */
 		vif-supply = <&vcc1v8_dvp>;
 		vana-supply = <&avdd2v8_dvp>;
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
+		pinctrl-0 = <&camera2_rst_l &dvp_pdn0_h>;
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
 
@@ -594,10 +633,16 @@ pwrbtn_pin: pwrbtn-pin {
 		};
 	};
 
-	camera {
+	cameras {
 		camera_rst_l: camera-rst-l {
 			rockchip,pins = <1 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
+		camera2_rst_l: camera2-rst-l {
+			rockchip,pins = <1 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+		dvp_pdn0_h: dvp-pdn0-h {
+			rockchip,pins = <2 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
 	};
 
 	leds {

-- 
2.49.0


