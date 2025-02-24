Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4950C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 08:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5h/y9NEgz/o71+GHUNhAGQ4SKKQ0RE+55I5pH4r07Uk=; b=ejxxuQxwKfi/uLM5aK05+6wLde
	o1yYh7u9FK2dLDS1mt9E//vXznvuBYul0Oem7C8fvN1Bqb1/iaF2TgkgeTdBbyTclZLAesw5aYEe3
	ItoO7nvTm6JX2AIEvgd6hKIU/RbKdjICDLiNnyg7oGuxSTe6Gs5HWUUoMbhh6ZEqfPbZ/u6EGo79v
	uvVNFbU48ZxAnuZUAKAH7CcXnWmODCPqf4C0GMO7p2+F/Hf8AZo1VdeHh9FWEiO4uS1qpjyJ8IEj/
	JGiGwZOzJxBLUcrwAXO7FbmPPfj7Qn3zX8fcqc0RBBaPeiaen/aCaQpmd+bz1uQ/cBzhx57U35RED
	Yo3Qm6Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmU0A-0000000CjNq-0fr3;
	Mon, 24 Feb 2025 08:39:46 +0000
Received: from mail-m155104.qiye.163.com ([101.71.155.104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmTbj-0000000CeHA-05td;
	Mon, 24 Feb 2025 08:14:33 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id bfd28862;
	Mon, 24 Feb 2025 16:14:26 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: andy.yan@rock-chips.com,
	hjc@rock-chips.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	dmitry.baryshkov@linaro.org,
	dianders@chromium.org,
	sebastian.reichel@collabora.com,
	cristian.ciocaltea@collabora.com,
	boris.brezillon@collabora.com,
	l.stach@pengutronix.de,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v7 15/15] arm64: dts: rockchip: Enable eDP0 display on RK3588S EVB1 board
Date: Mon, 24 Feb 2025 16:13:25 +0800
Message-Id: <20250224081325.96724-16-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250224081325.96724-1-damon.ding@rock-chips.com>
References: <20250224081325.96724-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkxPTlYYHxlNS0NKThpLSRhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a953705924d03a3kunmbfd28862
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6M006Agw6KDIUMxMRTTMBEQ0X
	CB9PCRBVSlVKTE9LSENPQ01DQ0tPVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFISE9MNwY+
DKIM-Signature: a=rsa-sha256;
	b=B8AqRAw6Tbymyr1sz474bXDJxxKsZIun4JYntG1Btss0YszgMlqF+06zz73RdUa0B7s4zI71p0b155OIJlcSShh88bdXD+gPKfm24AhrwfdflUnjOLB4tiu/jeEa0JwMRBtmOPpbi0R0Ee2J8Wl3qGYtFf5bZkqtmhLLrSe9KVY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=5h/y9NEgz/o71+GHUNhAGQ4SKKQ0RE+55I5pH4r07Uk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_001431_369219_D4F3DA6C 
X-CRM114-Status: GOOD (  13.17  )
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

Add the necessary DT changes to enable eDP0 on RK3588S EVB1 board:
- Set pinctrl of pwm12 for backlight
- Enable edp0/hdptxphy0/vp2
- Assign the parent of DCLK_VOP2_SRC to PLL_V0PLL
- Add aux-bus/panel nodes

For RK3588, the PLL_V0PLL is specifically designed for the VOP2. This
means the clock rate of PLL_V0PLL can be adjusted according to the dclk
rate of relevant VP. It is typically assigned as the dclk source of a
specific VP when the clock of relevant display mode is unusual, such as
the eDP panel 'lg,lp079qx1-sp0v' paired with RK3588S EVB1, which has a
clock rate of 202.02MHz.

Additionally, the 'force-hpd' is set for edp0 because the HPD pin on the
panel side is not connected to the eDP HPD pin on the SoC side according
to the RK3588S EVB1 hardware design.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v2:
- Remove brightness-levels and default-brightness-level properties in
  backlight node.
- Add the detail DT changes to commit message.

Changes in v3:
- Use aux-bus instead of platform bus for edp-panel.

Changes in v4:
- Add comments related to the use of panel compatible "lg,lp079qx1-sp0v"
  in the commit message.

Changes in v5:
- Use "edp-panel" instead of "lg,lp079qx1-sp0v"
- Remove unnecessary comments in commit message
- Assign the parent of DCLK_VOP2_SRC to PLL_V0PLL

Changes in v6:
- Add PLL_V0PLL related descriptions in commit message

Changes in v7:
- Describe why to set the 'force-hpd' for edp0
- Add no-hpd for the panel node
---
 .../boot/dts/rockchip/rk3588s-evb1-v10.dts    | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
index bc4077575beb..de52a6600b7b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
@@ -9,6 +9,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
 #include <dt-bindings/usb/pd.h>
 #include "rk3588s.dtsi"
 
@@ -238,6 +239,42 @@ &combphy2_psu {
 	status = "okay";
 };
 
+&edp0 {
+	force-hpd;
+	status = "okay";
+
+	aux-bus {
+		panel {
+			compatible = "edp-panel";
+			backlight = <&backlight>;
+			power-supply = <&vcc3v3_lcd_edp>;
+			no-hpd;
+
+			port {
+				panel_in_edp: endpoint {
+					remote-endpoint = <&edp_out_panel>;
+				};
+			};
+		};
+	};
+};
+
+&edp0_in {
+	edp0_in_vp2: endpoint {
+		remote-endpoint = <&vp2_out_edp0>;
+	};
+};
+
+&edp0_out {
+	edp_out_panel: endpoint {
+		remote-endpoint = <&panel_in_edp>;
+	};
+};
+
+&hdptxphy0 {
+	status = "okay";
+};
+
 &i2c3 {
 	status = "okay";
 
@@ -399,6 +436,7 @@ usbc0_int: usbc0-int {
 };
 
 &pwm12 {
+	pinctrl-0 = <&pwm12m1_pins>;
 	status = "okay";
 };
 
@@ -1168,3 +1206,20 @@ usbdp_phy0_dp_altmode_mux: endpoint@1 {
 		};
 	};
 };
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vop {
+	assigned-clocks = <&cru DCLK_VOP2_SRC>;
+	assigned-clock-parents = <&cru PLL_V0PLL>;
+	status = "okay";
+};
+
+&vp2 {
+	vp2_out_edp0: endpoint@ROCKCHIP_VOP2_EP_EDP0 {
+		reg = <ROCKCHIP_VOP2_EP_EDP0>;
+		remote-endpoint = <&edp0_in_vp2>;
+	};
+};
-- 
2.34.1


