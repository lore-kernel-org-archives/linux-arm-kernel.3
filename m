Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34EAE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 08:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qjeeJAHsiqDBQFfxqzbtwKog7iKBf9oYKl6SL/TvwRQ=; b=MwQ05h7XWXrOokhYXkTT+RJafz
	QemzE/h6Kii5nduU+Jmh2aoUPH3Yc4JqdXQg1nDlfJ3H3UP6CevEVlWt9DI91bznLOaBr78HMS8ms
	N+QlFL5VG0l9wYxFqcBWekInG3DuVXw8g/vTVFpMth9MWGM4YMWMnXg54Q7K5SI+CjaooMCfrwis1
	heIvtV32DhslUHmuvPEFZ9dEl6NSRccpHcgWj6CqelK+dfVuG0rj1/UqgaVvlGxhvAO8lWXBWRQ9W
	vFN3i4SXE0Sx92svbt0Fkdd12baKkCoaFij8p7gKpCW4kxxzSwhtufLEugP+WwbZYlzsRAfQtFsYH
	nsw3KRgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOBoP-00000001GQs-2yfc;
	Thu, 19 Dec 2024 08:23:14 +0000
Received: from mail-m12784.qiye.163.com ([115.236.127.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOBYZ-00000001DBN-0U0F;
	Thu, 19 Dec 2024 08:06:52 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 633f41f4;
	Thu, 19 Dec 2024 16:06:46 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rfoss@kernel.org,
	vkoul@kernel.org,
	sebastian.reichel@collabora.com,
	cristian.ciocaltea@collabora.com,
	l.stach@pengutronix.de,
	andy.yan@rock-chips.com,
	hjc@rock-chips.com,
	algea.cao@rock-chips.com,
	kever.yang@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v3 14/15] arm64: dts: rockchip: Enable eDP0 display on RK3588S EVB1 board
Date: Thu, 19 Dec 2024 16:06:03 +0800
Message-Id: <20241219080604.1423600-15-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219080604.1423600-1-damon.ding@rock-chips.com>
References: <20241219080604.1423600-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxlNGVYZT0waSEkZHRlOHR1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a93ddf4792403a3kunm633f41f4
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NQw6Exw*TjIRIhUdHz8vDBka
	SzcwFCpVSlVKTEhPTkJOTUtDTkJJVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJSk1JNwY+
DKIM-Signature: a=rsa-sha256;
	b=QcCXeYnt/g2OnvNJFEktVv5pH/zvKN6LPZnKY2AhfSr7OgVg5nwvCrTXBGytHrRe8EJnx9JofT9HNJLf96cmMZ1ffyGb71xuSDZwRCCOUlGOjIuPUS+0DZW+CdoNL1n95IkRWYcA48qrdbs7yFBUgvMjedU72P5sHLSgctClcHo=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=qjeeJAHsiqDBQFfxqzbtwKog7iKBf9oYKl6SL/TvwRQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_000651_329832_AB8B94FA 
X-CRM114-Status: UNSURE (   8.90  )
X-CRM114-Notice: Please train this message.
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
- Add edp-panel node
- Set pinctrl of pwm12 for backlight
- Enable edp0/hdptxphy0/vp2

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v2:
- Remove brightness-levels and default-brightness-level properties in
  backlight node.
- Add the detail DT changes to commit message.

Changes in v3:
- Use aux-bus instead of platform bus for edp-panel.
---
 .../boot/dts/rockchip/rk3588s-evb1-v10.dts    | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
index bc4077575beb..9547ab18e596 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
@@ -9,6 +9,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
 #include <dt-bindings/usb/pd.h>
 #include "rk3588s.dtsi"
 
@@ -238,6 +239,41 @@ &combphy2_psu {
 	status = "okay";
 };
 
+&edp0 {
+	force-hpd;
+	status = "okay";
+
+	aux-bus {
+		panel {
+			compatible = "lg,lp079qx1-sp0v";
+			backlight = <&backlight>;
+			power-supply = <&vcc3v3_lcd_edp>;
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
 
@@ -399,6 +435,7 @@ usbc0_int: usbc0-int {
 };
 
 &pwm12 {
+	pinctrl-0 = <&pwm12m1_pins>;
 	status = "okay";
 };
 
@@ -1168,3 +1205,18 @@ usbdp_phy0_dp_altmode_mux: endpoint@1 {
 		};
 	};
 };
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vop {
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


