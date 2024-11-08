Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36026D6406B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 17:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TS2gLOjQjFV6cYijRKcDLkRYjhtlEXXGFVSSgqynX+0=; b=rTL/lFbgGV34bn3JNBrzuUG4Co
	e0VKT7b3hdE7n35kPnCQlEHfMx4u8ScaQMVSNVLFeSAAMGzu5I4F6Al2IgrNssVIvuSvTobu8gaqi
	WBWekrnKHE2m0XqMOT0tFJJHnqcZfaQIzOBBz+ZCI0qx8ecYhjbUQR0NGQCuD9RhF4EOXSnmiZ3d2
	dB6Ion1FRdqTRwSwjwXJnTXSMQ7dzJo7GxTgf5JbO6vOf/Om7fqy8mWFNLwmEMSC++NACN5Ufl7qE
	u2n77VBj7o2g3mtP+G8PCmspC8anBUbkGIgsL5QVHEC7ad46j+O/ZI3WjgSsm9CWxRC9cNnKXkO3x
	WiZlPGFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Sbd-0000000BMfT-0V00;
	Fri, 08 Nov 2024 17:17:09 +0000
Received: from smtp.forwardemail.net ([207.246.76.47])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9SZs-0000000BMRc-03GS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 17:15:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1731086073;
 bh=TS2gLOjQjFV6cYijRKcDLkRYjhtlEXXGFVSSgqynX+0=;
 b=S7/LwjT6RrrOoOPpoX8j7fT6pvrM9FJPPNvCA46Lx5Ehz12dE2LjDgV2BADueA/ceVI7dEYIl
 H5rZu5ruJncXOvjzBY1sP+RuLSlJgRDKmJQHfovbO07j4q8dMQbROtWnoAgvsuuiqRFrpHEl5Bi
 aCklkowmL7CVLxmSQgDMSUjvCdqpQmU8Sv+U6NPMXs/X1bya8SaH6kmCo6e8quSQyL4r4l0cUs5
 5tfWn51szFGA45bcodTA/5Xo79QZLS3ib1X0LGnLRyF5d5G9mdbxp/eE+VhXf8gWzwNVxluy0aG
 uUNhdS8Kz6WXq3+IVLnF/E4PYdNVC26yG2Rq5WpB0N9w==
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jonas Karlman <jonas@kwiboo.se>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Enable HDMI0 on FriendlyElec CM3588 NAS
Date: Fri,  8 Nov 2024 17:14:19 +0000
Message-ID: <20241108171423.835496-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 207.246.76.47
X-ForwardEmail-ID: 672e46f71f83b87ca0e8e60e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_091520_209629_0998B085 
X-CRM114-Status: UNSURE (   9.67  )
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

Add the necessary DT changes to enable HDMI0 on FriendlyElec CM3588 NAS.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Tested and working with video=1920x1080@60 cmdline on a CM3588 NAS
---
 .../rk3588-friendlyelec-cm3588-nas.dts        | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
index 411007cb8118..b3a04ca370bb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
@@ -11,6 +11,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
 #include <dt-bindings/usb/pd.h>
 #include "rk3588-friendlyelec-cm3588.dtsi"
 
@@ -89,6 +90,17 @@ button-user {
 		};
 	};
 
+	hdmi0-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi0_con_in: endpoint {
+				remote-endpoint = <&hdmi0_out_con>;
+			};
+		};
+	};
+
 	ir-receiver {
 		compatible = "gpio-ir-receiver";
 		gpios = <&gpio0 RK_PD4 GPIO_ACTIVE_LOW>;
@@ -307,6 +319,26 @@ &gpio4 {
 		"", "", "", "";
 };
 
+&hdmi0 {
+	status = "okay";
+};
+
+&hdmi0_in {
+	hdmi0_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi0>;
+	};
+};
+
+&hdmi0_out {
+	hdmi0_out_con: endpoint {
+		remote-endpoint = <&hdmi0_con_in>;
+	};
+};
+
+&hdptxphy_hdmi0 {
+	status = "okay";
+};
+
 /* Connected to MIPI-DSI0 */
 &i2c5 {
 	pinctrl-names = "default";
@@ -776,3 +808,18 @@ usbdp_phy0_dp_altmode_mux: endpoint@1 {
 &usbdp_phy1 {
 	status = "okay";
 };
+
+&vop {
+	status = "okay";
+};
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vp0 {
+	vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
+		remote-endpoint = <&hdmi0_in_vp0>;
+	};
+};
-- 
2.46.2


