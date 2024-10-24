Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A232CE8E76
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 13:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OntcF2LDcuLBkXSM2En+JfGB3Jl5eFSXxvJ7ANnr81Q=; b=ObYNaKQs5EHbyudeqEojs2BbMR
	in0OFBbqnaMEZlX8CczvvUqeU6850TJO8pFfXBd3E4EDGetynH0FVxgO+Yhr6JoxzBgp7KgYMY77g
	3b6gE6i6Ge/8KJGjOywRhYfn3WA9WMWNRqxMosSQXOyszWFm76jaMFwu8dk5YPkN/Z+4E+SU7Ify3
	cHx9GxuUIdAHYQy3OvSQGmWftuukwHdfWeaapDCD1ppLnOcBrINJyrc5B/72PJT6Ld8LZ78L4DhpF
	9LHUpUsXADBfJrWIzlDVTPTKAhqU2963wpHmsaOFuHry+CzT24vu3/W8tz7Y2OHUrP6JktYHIzv7G
	N1v9IvIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3y0P-00000000Xyo-23Y8;
	Thu, 24 Oct 2024 13:36:01 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3xxF-00000000X9k-2LB0;
	Thu, 24 Oct 2024 13:32:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OntcF2LDcuLBkXSM2En+JfGB3Jl5eFSXxvJ7ANnr81Q=; b=xdRcTUkUw6WtN9ur1eJvgRfwKW
	HwV0UPL3m6H94N6HpfdGUpWgpc/MbDOWUszVPhYhs4503kN/0wGNBNFIRwZ5i1RKN6UMsiQJ7qYIf
	3BJbJiOU/qj1YYkTWN5OVxmHtEPci4859fe6VswhX9ty/B21HuxGBftaeiiATGf2Bo0d/9C8euVvK
	o8NvESGfQXl0KITPYyHlAaM8lr5D51Yzv/vN7YFBLD6Z8+sP2D+1Jx2l9qOjj5lhvXGFA0DbSKz2E
	eH+Og/n+fu3FMjMNC3R+Dlt6mVVxYaKbF4Skfzk1uemvxGSFKX780ZeT9w0swcA5dh9gztacLQt1Y
	esKMx2NQ==;
Received: from i53875b34.versanet.de ([83.135.91.52] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t3xxD-0007hQ-AY; Thu, 24 Oct 2024 15:32:43 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 1/2] arm64: dts: rockchip: add HDMI support to rk3588-tiger-haikou
Date: Thu, 24 Oct 2024 15:32:39 +0200
Message-ID: <20241024133240.1737647-1-heiko@sntech.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_063245_649996_00475375 
X-CRM114-Status: GOOD (  11.89  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

The Haikou baseboard has an hdmi output port, which is connected
via the Q7 connector to the hdmi0 controller of the rk3588.

Add the necessary plumbing to enable it using the recently merged
hdmi-qp controller.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 .../boot/dts/rockchip/rk3588-tiger-haikou.dts | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts b/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
index e4b7a0a4444b..e3596341b816 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
 #include "rk3588-tiger.dtsi"
 
 / {
@@ -61,6 +62,17 @@ switch-lid-btn-n {
 		};
 	};
 
+	hdmi-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi0_out_con>;
+			};
+		};
+	};
+
 	i2s3-sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,format = "i2s";
@@ -155,6 +167,29 @@ &gmac0 {
 	status = "okay";
 };
 
+&hdmi0 {
+	/* No CEC on Haikou */
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmim0_tx0_hpd &hdmim1_tx0_scl &hdmim1_tx0_sda>;
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
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
+&hdptxphy_hdmi0 {
+	status = "okay";
+};
+
 &i2c1 {
 	status = "okay";
 
@@ -321,3 +356,18 @@ &usb_host1_xhci {
 &usb_host2_xhci {
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
2.45.2


