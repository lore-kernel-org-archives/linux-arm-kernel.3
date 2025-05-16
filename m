Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BBFC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 17:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MTES7r/mz5eFe0/aHTnnGuz3oakuN7ftdgqAWEa9PoM=; b=JTI3lEI3kY2Y9iMtvs0oHii5NU
	gVJwysGoISLI/lLRt/tshPHZh/DulZDQdB3MIUhv8MQvyw62K5UAN2rm2PUnitva44FTjYHLjijb8
	OF0x3WolUgNOXQq/nBOEkkfGDsQnewTDNtPjPUTHMUw5eRnHyKGkdhAUNd9ziZ9KirXX1lSgicilI
	Uc0d7bZdCp3KQ8YXnrU0MLRnCqt3RbXvkJdR9ZzQCaxVana/+K7p7iVdjFpKD2nSL74Hs4jYKIT4N
	CIqkdcPDQ6slwSWBQk8apG/NHwFo99LDNjUHYSRGElv4IODT/uQrzG8D79EOlErPTIkig6g569Mab
	LL6ARzbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFyrk-00000004Ahk-3xsO;
	Fri, 16 May 2025 17:29:00 +0000
Received: from smtp-bc0d.mail.infomaniak.ch ([45.157.188.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFypc-00000004AWA-247S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 17:26:50 +0000
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ZzYsb3nGKzK1R;
	Fri, 16 May 2025 19:26:43 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4ZzYsZ1yphzSdm;
	Fri, 16 May 2025 19:26:42 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Fri, 16 May 2025 19:26:10 +0200
Subject: [PATCH] arm64: dts: rockchip: support camera module on Haikou
 Video Demo on PX30 Ringneck
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-ringneck-haikou-video-demo-cam-v1-1-fff23160395f@cherry.de>
X-B4-Tracking: v=1; b=H4sIADF1J2gC/x3NTQqAIBBA4avErBswyf6uEi1MxxoiDaUIorsnL
 b/New8kikwJhuKBSBcnDj6jKgswq/YLIdtskEIqoaoGI/vFk9lw1byFEy+2FNDSHtDoHWspmk6
 5uXW9gxw5Ijm+/8E4ve8HLcFN+HAAAAA=
X-Change-ID: 20250516-ringneck-haikou-video-demo-cam-420685fb7f9f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_102648_660713_AF841736 
X-CRM114-Status: GOOD (  19.24  )
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

From: Quentin Schulz <quentin.schulz@cherry.de>

The Haikou Video Demo adapter has a proprietary connector for a camera
module which has an OV5675 camera sensor and a companion DW9714 focus
lens driver.

This adds support for the camera module on PX30 Ringneck module fitted
on a Haikou devkit with the Haikou Video Demo adapter.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
This adapter is also used with RK3588 Tiger, but there's currently no
camera stack at all on RK3588, and RK3399 Puma, but:
 - 19.2MHz is not achievable exactly, so need to patch the driver to
   support 24MHz for example, this will come later,
 - The camera clk is on an IO domain at 1.8V but configured at boot at
   3.3V, and until the IO domain is properly configured, the camera
   won't receive a clock. Based on the probe order, it is possible (and
   empirically very likely) that the camera won't be detected at all.
   A Linux kernel solution was attempted multiple times in the past,
   c.f.
   https://lore.kernel.org/linux-gpio/20230904115816.1237684-1-s.hauer@pengutronix.de/
   https://lore.kernel.org/lkml/20220802095252.2486591-1-foss+kernel@0leil.net/
   We'll need to figure something out this time as I won't be able to
   upstream camera support without it :)

To test, install libcamera on Debian Bookworm (or more recent I guess)
add a file at /usr/share/libcamera/ipa/rkisp1/ov5675.yaml whose content
is (remove one leading whitespace):

 # SPDX-License-Identifier: CC0-1.0
 %YAML 1.1
 ---
 version: 1
 algorithms:
   - Agc:
   - Awb:
   - BlackLevelCorrection:
   - ColorProcessing:
 ...

then call

qcam -platform eglfs -c /base/i2c@ff190000/camera@36

While this is running, control the focus lens driver with:

v4l2-ctl -d /dev/v4l-subdev5 -c focus_absolute=150

and change the focus_absolute value to see the lens moving and the focus
change.

I'll try to have a look at libcamera's config file so I can send a
proper one to the project instead of this dummy one.
---
 .../rockchip/px30-ringneck-haikou-video-demo.dtso  | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso b/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso
index 7d9ea5aa598486680191d52e4c87af59f7b0e579..1e3f43bbe1734e5c88d1f76f8f7a545d881df88d 100644
--- a/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso
+++ b/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso
@@ -94,6 +94,15 @@ video-adapter-led {
 	};
 };
 
+&cif_clkout_m0 {
+	rockchip,pins =
+		<2 RK_PB3 1 &pcfg_pull_none_12ma>;
+};
+
+&csi_dphy {
+	status = "okay";
+};
+
 &display_subsystem {
 	status = "okay";
 };
@@ -135,6 +144,12 @@ &i2c1 {
 	/* OV5675, GT911, DW9714 are limited to 400KHz */
 	clock-frequency = <400000>;
 
+	focus: focus@c {
+		compatible = "dongwoon,dw9714";
+		reg = <0xc>;
+		vcc-supply = <&cam_afvdd_2v8>;
+	};
+
 	touchscreen@14 {
 		compatible = "goodix,gt911";
 		reg = <0x14>;
@@ -157,6 +172,47 @@ pca9670: gpio@27 {
 		pinctrl-names = "default";
 		reset-gpios = <&gpio0 RK_PA2 GPIO_ACTIVE_LOW>;
 	};
+
+	camera@36 {
+		compatible = "ovti,ov5675";
+		reg = <0x36>;
+		clocks = <&cru SCLK_CIF_OUT>;
+		assigned-clocks = <&cru SCLK_CIF_OUT>;
+		/* Only parent to get exactly 19.2MHz */
+		assigned-clock-parents = <&cru USB480M>;
+		assigned-clock-rates = <19200000>;
+		avdd-supply = <&cam_avdd_2v8>;
+		dvdd-supply = <&cam_dvdd_1v2>;
+		dovdd-supply = <&cam_dovdd_1v8>;
+		lens-focus = <&focus>;
+		orientation = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cif_clkout_m0>;
+		reset-gpios = <&pca9670 6 GPIO_ACTIVE_LOW>;
+		rotation = <180>;
+
+		port {
+			cam_out: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <450000000>;
+				remote-endpoint = <&mipi_in_cam>;
+			};
+		};
+	};
+};
+
+&isp {
+	status = "okay";
+
+	ports {
+		port@0 {
+			mipi_in_cam: endpoint@0 {
+				reg = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&cam_out>;
+			};
+		};
+	};
 };
 
 &pinctrl {

---
base-commit: fee3e843b309444f48157e2188efa6818bae85cf
change-id: 20250516-ringneck-haikou-video-demo-cam-420685fb7f9f

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


