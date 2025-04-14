Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A908DC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 19:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IW26hhDBDO/5nhHJsjCd5C+mJJ7oXEkd6pqmTxSFoSo=; b=uua1NwJuppnoiP7XXfUFhTC1Ux
	STPA8cW1Jsx+uobGZVIXto5YQr3Ayv3zFaguO/9K/uEun2PLD/wQqaTXyPF1Dkcr9oWMmZ/Am7O7W
	3P9PecXU/IoLzAu/xkXzUyP5uThKsw0HVj9jaTBLwP37ueAmY6NIWY7r+n8eAotaiieVllY792GhG
	Bg3MuXbKaIn1+02KhVcqSg+74Pdga1bEe/eSbSYCwPU2gf0BJVpdvzYXNrA1DpqDYkG2il338Q537
	svYUYeySeCumjegdDu6xeRDkSc2GX8ERJ/3ulXeOymkuPX90Wqrxt8sRPclBuzJUnqt/EI2L0SLoq
	q0Kv2ptA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4PHP-00000003HMf-2AAL;
	Mon, 14 Apr 2025 19:15:39 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Oh7-000000038Wz-3AcH;
	Mon, 14 Apr 2025 18:38:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=IW26hhDBDO/5nhHJsjCd5C+mJJ7oXEkd6pqmTxSFoSo=; b=cn7+C1QMnlYQiLauPpu1bCkvT8
	rxeTVFsbpTj78EfGta10MmZKCUZWIVZxCL+DApimzG6F0AtY9W9Dq69sUcpA/vDdVzqx/VTg4kfbY
	udvnXyU5Ja8Ezzsryok+e8SMOXdzi+JWWHhea+gEZzvCpNFlnr2oevOwo7lhkQuJKORDVy5O71FUc
	3hpMs6pdxX4SoqnnUkripXBHUMh+AqzrigAWHc3w5ipW/ktIq+65KdIDA3r7td5hmM/UHyIyRKxkr
	vrdk/r2NSkgstIWBL7ojhU1aOUjBgTa0u5aNR3AmqdQW2kK0lL0bb4Lc2DpOcACYnW+7RSKt4JmSn
	lJJSJAtg==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u4Ogz-0000dZ-Lu; Mon, 14 Apr 2025 20:38:01 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Add HDMI support for roc-rk3576-pc
Date: Mon, 14 Apr 2025 20:37:45 +0200
Message-ID: <20250414183745.1352470-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_113809_813458_1FEFFE40 
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

Enable HDMI and VOP nodes for the roc-rk3576-pc board.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../arm64/boot/dts/rockchip/rk3576-roc-pc.dts | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts b/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts
index 612b7bb0b7493..d4e437ea6cd86 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts
@@ -10,6 +10,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/pwm/pwm.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
 #include <dt-bindings/usb/pd.h>
 #include "rk3576.dtsi"
 
@@ -54,6 +55,17 @@ button-recovery {
 		};
 	};
 
+	hdmi-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	vbus5v0_typec: regulator-vbus5v0-typec {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -258,6 +270,26 @@ &eth0m0_rgmii_bus
 	status = "okay";
 };
 
+&hdmi {
+	status = "okay";
+};
+
+&hdmi_in {
+	hdmi_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi>;
+	};
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
+&hdptxphy {
+	status = "okay";
+};
+
 &mdio0 {
 	status = "okay";
 
@@ -734,3 +766,18 @@ &uart6 {
 	pinctrl-0 = <&uart6m3_xfer>;
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
+	vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
+		remote-endpoint = <&hdmi_in_vp0>;
+	};
+};
-- 
2.47.2


