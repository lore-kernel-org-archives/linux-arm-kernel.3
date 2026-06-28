Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0003AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 10:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MjSzcvyunEUJgnzWRV8qqMmJW7HSxcKmnfszk3CEJfU=; b=KmCqDPcJm3gQSAWoOkTOvnB40Y
	SowrAEytAZZoXRgX82h/dbkM4d47ktSk2kTMKjzz64GKP8s+23ExtK1756jTsameZQiJVgMduLvJg
	LoJyujKfw54joRJIuMt6PVadB0P6CsUmq9/g1nN6+M2nhFSarIhvzeSrjFHC83MX2OrT8r2zeEMe7
	F7Z+NHsnfcF453mkHIATVLmf2rP5Z8rudOzg/RY1JabcBEjUl/YyCDObRnAgySMulvwU5W2yKdHCX
	8aIRPYLke7hw8bbHVXPn5qiXZ2RAYq3xpMEhbND+XG7S6oCEnNmq1BezqCPebAVCnDStBbcHn82k4
	0/Blt/cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdmfQ-0000000D2p2-2gZB;
	Sun, 28 Jun 2026 10:23:12 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdmen-0000000D2JV-3rLW;
	Sun, 28 Jun 2026 10:22:35 +0000
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8AF715B2;
	Sun, 28 Jun 2026 12:21:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782642110;
	bh=dPsbWhdsRJFV1RVWCdtYwJ/p4Y6zPhVV6Vx4WeLxgNQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MnlJhnpn/yyaPY9ohyf1XUkeGYUZA3IrM9vUMvIK/uGaNiGWtpAQLu7kByUcU3Bac
	 nGPwwlygL2fy6ddKkIUKYUIYbPHakX0FM7/z7nCfjVSuyuX/inCFYmZAakUnYE9QZc
	 hggmHWoxqKcl8m5FrY0m+zSahw9ULRCIfk0B5Tmg=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Sun, 28 Jun 2026 11:22:22 +0100
Subject: [PATCH v3 7/7] arm64: dts: rockchip: Convert to new media
 orientation definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-kbingham-orientation-v3-7-4ed92968aff8@ideasonboard.com>
References: <20260628-kbingham-orientation-v3-0-4ed92968aff8@ideasonboard.com>
In-Reply-To: <20260628-kbingham-orientation-v3-0-4ed92968aff8@ideasonboard.com>
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
 Richard Acayan <mailingradian@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux@ew.tq-group.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782642139; l=3957;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=dPsbWhdsRJFV1RVWCdtYwJ/p4Y6zPhVV6Vx4WeLxgNQ=;
 b=rRE0N0u6PkN10gU6tGRTxFeSk15U9jeCp5Aj+C5fl9qbB1KxwyPCiqAq3XB+68p/huApvYpv/
 7tqC6W61Lg7Bd64K260+0189mCY+zFoJ8eSSqx4wusH3j/L/jme1njX
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_032234_131975_4EDF4694 
X-CRM114-Status: GOOD (  12.05  )
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
Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

---

v3:
- Remove:
    arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso
    arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso

When the core change land in linux-next, I'll resend the conflicting
changes.
---
 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi                     | 3 ++-
 arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso | 3 ++-
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts             | 5 +++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi b/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
index 192791993f05..d58d6ee6241e 100644
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
index 760d5139f95d..2168db9168a5 100644
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
index 8d26bd9b7500..6608c777f185 100644
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

-- 
2.52.0


