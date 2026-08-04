Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB33C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 19:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PFn1/nGz77BAmrsJlv+gwN9460fBMLMCDsPaWLNjnD8=; b=w5+9jaYBznGKiRxEjECzgnC551
	EHJFBCE12wCBdARIwr7K1zcRh6PiMQQNxyOeAviJY4RpyK4j4m2VOxNIWhekjuWgLizj0KQtX+vgK
	fnsHtYd4J/eRMnCuA9lLSj8b28EQorZUDikRYhAtsJcb1kJa8GRNjMRscTkyoQjjDP0AST2e7jP56
	N09+vZ3YAqIIEtEgpzzCaPfOU2lLO3BHza8z6v8qBL2ZDd6dARm2vUgx+dqz2cQLC32hBGF48va0c
	19BghRFm+u/jpiijOrV7I/ne2PQmHxJLK9sXuS6IlHv7dYrWwhYfD0Qo9mB7uVKiW0a9fIzRZHJtJ
	bAYFj0Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrL3M-00000002h7f-12OT;
	Tue, 04 Aug 2026 19:43:56 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrL3I-00000002h1u-2GsE;
	Tue, 04 Aug 2026 19:43:54 +0000
Received: from [192.168.0.240] (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98E472948;
	Tue,  4 Aug 2026 21:42:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785872561;
	bh=PomUEBBRA3Fl49H8tTzqZdKM/TCp3EmmjMVNBOqclKw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=R1Ckn5tRRs3vBb7C6YADbHAfRAC3WGSkMIM9/WZ0FPnvNlpnS1oSgh0yjezI3LIT2
	 G1ht//e6ZpZ1oUhKUbLpMEVyl75gxSci/hbz3GBKvB7w/yyOJaCTjgi5jY+5d1TcuD
	 paLgR0SDovaYNGD5kpef7Dg2GGSbawH5RPbkQJjg=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Tue, 04 Aug 2026 20:43:33 +0100
Subject: [PATCH v4 6/7] arm64: dts: rockchip: Convert to new media
 orientation definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-kbingham-orientation-v4-6-336998dd63b4@ideasonboard.com>
References: <20260804-kbingham-orientation-v4-0-336998dd63b4@ideasonboard.com>
In-Reply-To: <20260804-kbingham-orientation-v4-0-336998dd63b4@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>, 
 Matthias Fend <matthias.fend@emfend.at>, 
 Mikhail Rudenko <mike.rudenko@gmail.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Paul Elder <paul.elder@ideasonboard.com>, 
 Martin Kepplinger <martin.kepplinger@puri.sm>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Tommaso Merciai <tomm.merciai@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Richard Acayan <mailingradian@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>, 
 David Heidelberg <david@ixit.cz>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785872619; l=6136;
 i=kieran.bingham@ideasonboard.com; s=20260204; h=from:subject:message-id;
 bh=PomUEBBRA3Fl49H8tTzqZdKM/TCp3EmmjMVNBOqclKw=;
 b=CcyfUJ+1ZYJA3fONhisxjZ3lMO9dZpVIb9380Tu6EFfJnNlmdbMlPY2K7c/SfcKoNhfUIpmxq
 odS6GWC8rwZDpYb0341ivJWLarRc7YzdbbGnaoerLlN57naAreacdPd
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=IOxS2C6nWHNjLfkDR71Iesk904i6wJDfEERqV7hDBdY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_124352_745223_5F032886 
X-CRM114-Status: GOOD (  12.24  )
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

The orientation property for video interface devices now has definitions
to prevent hardcoded integer values for the enum options.

Update the users throughout the rockchip device trees to use the new
definitions.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de> # PP-1516 and
Reviewed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi                        | 3 ++-
 arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso    | 3 ++-
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts                | 5 +++--
 .../boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso      | 3 ++-
 .../boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso      | 3 ++-
 5 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi b/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
index 192791993f05911326bd8ae451daaa29ccc9ea73..d58d6ee6241e559fddef98510b32f32edc75a310 100644
--- a/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
@@ -6,6 +6,7 @@
 /dts-v1/;
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include "px30.dtsi"
 
@@ -413,7 +414,7 @@ camera@36 {
 		dvdd-supply = <&vcc_cam_dvdd>;
 		dovdd-supply = <&vcc_cam_dovdd>;
 		lens-focus = <&focus>;
-		orientation = <0>;
+		orientation = <MEDIA_ORIENTATION_FRONT>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&cif_clkout_m0 &cam_pwdn>;
 		reset-gpios = <&gpio2 RK_PB0 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso b/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso
index 760d5139f95dfa4f71a2a03bfa140b7a71e40025..2168db9168a590207f3a00e1fbbcae29731dfb96 100644
--- a/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso
+++ b/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso
@@ -16,6 +16,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 
 &{/} {
@@ -185,7 +186,7 @@ camera@36 {
 		dvdd-supply = <&cam_dvdd_1v2>;
 		dovdd-supply = <&cam_dovdd_1v8>;
 		lens-focus = <&focus>;
-		orientation = <0>;
+		orientation = <MEDIA_ORIENTATION_FRONT>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&cif_clkout_m0>;
 		reset-gpios = <&pca9670 6 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 8d26bd9b75003cfa8ff7e4921f1c94866db95d39..6608c777f18588b9386a57d936e77783b5d9b4fb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -13,6 +13,7 @@
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include "rk3399-s.dtsi"
 
 / {
@@ -455,7 +456,7 @@ wcam: camera@1a {
 		reg = <0x1a>;
 		clocks = <&cru SCLK_CIF_OUT>; /* MIPI_MCLK0, derived from CIF_CLKO */
 		lens-focus = <&wcam_lens>;
-		orientation = <1>; /* V4L2_CAMERA_ORIENTATION_BACK */
+		orientation = <MEDIA_ORIENTATION_BACK>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&camera_rst_l>;
 		reset-gpios = <&gpio1 RK_PA0 GPIO_ACTIVE_LOW>;
@@ -487,7 +488,7 @@ ucam: camera@36 {
 		clocks = <&cru SCLK_CIF_OUT>; /* MIPI_MCLK1, derived from CIF_CLK0 */
 		clock-names = "xvclk";
 		dovdd-supply = <&vcc1v8_dvp>;
-		orientation = <0>; /* V4L2_CAMERA_ORIENTATION_FRONT */
+		orientation = <MEDIA_ORIENTATION_FRONT>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&camera2_rst_l &dvp_pdn0_h>;
 		powerdown-gpios = <&gpio2 RK_PB4 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso
index ee9ecf68a88663a04e1c33a718894490ef475203..8c9a4a1181e467b457ee37647753c874523117ad 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso
@@ -9,6 +9,7 @@
 
 #include <dt-bindings/clock/rockchip,rk3588-cru.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 
 &{/} {
@@ -50,7 +51,7 @@ imx415: camera-sensor@1a {
 		avdd-supply = <&savdd_cam0>;
 		clocks = <&cru CLK_MIPI_CAMARAOUT_M3>;
 		dvdd-supply = <&sdvdd_cam0>;
-		orientation = <2>; /* External */
+		orientation = <MEDIA_ORIENTATION_EXTERNAL>;
 		ovdd-supply = <&siovdd_cam0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&cam0_rstn &mipim0_camera3_clk>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso
index 8a4cf3fdbf8ebde8b2939c6126d169074431588a..0cc3d6a34cef36883b6599d4df12a2c5a6aacbc8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso
@@ -9,6 +9,7 @@
 
 #include <dt-bindings/clock/rockchip,rk3588-cru.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 
 &{/} {
@@ -50,7 +51,7 @@ cam1_imx415: camera-sensor@1a {
 		avdd-supply = <&savdd_cam1>;
 		clocks = <&cru CLK_MIPI_CAMARAOUT_M4>;
 		dvdd-supply = <&sdvdd_cam1>;
-		orientation = <2>; /* External */
+		orientation = <MEDIA_ORIENTATION_EXTERNAL>;
 		ovdd-supply = <&siovdd_cam1>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&cam1_rstn &mipim0_camera4_clk>;

-- 
2.53.0


