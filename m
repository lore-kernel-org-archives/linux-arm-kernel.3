Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0A0C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 14:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5adloVzHwi79uY2dXSZYO3t6+ZhCtMojJZzwEopgbso=; b=RQTZ3GwwwNovDKMJuWWKzsE1J7
	z/Iijk/NchU6h1U+HGMEYSFCykvxUGPI2V+mgjcRwxshfx03mA5XVThK/mEcM+PO31XUsGX/gDnsB
	8KSf7xlnEoeXDy3xY3t4drKwZWfVofkHatNVvL2p8SWLxIVdw49Wx5FtQQUnrW5wFlcdy4lfIbtCe
	04X/uuJwDVSUIh2AmICXs+eqbIsT//+qB0+7MD1phLNwLjH8dKsKkMaEdO1GkCos5RWFU5AvrRYX3
	/M16QwWjQRNyo1akadVKx9rsWURl318P/Up+tB/K7IpO8tVpU0vgogYi87GnafXeBmr/Zq1fFail9
	zFp4Ae0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIBN-0000000422B-0nL4;
	Wed, 26 Feb 2025 14:14:41 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnI6q-000000041Dc-168S;
	Wed, 26 Feb 2025 14:10:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5adloVzHwi79uY2dXSZYO3t6+ZhCtMojJZzwEopgbso=; b=flrSuKaAKkFeZq+ohPNluB1Y1z
	Ry6xTumrh9UED8H8MtEfDf7fA6X6kvP96dljk411PwSAnewNn4n/+ZyC0IOh2oKJ02kvGtzoLDIcy
	SvxVa97TqF3qE3yasU73G3aSjZL1AXTg1Fg4vobMFjQPi4nixx1D2K90HYTq3569kT5dhGqQKguFP
	U3VYyEj5qquydYnzPMHeaeYBiaN8p1cLV3mGxwXFkZT++oQuOIP0irzovaym/p0hLJUATeHbNNKbI
	qC5wl4ob5ifCjZpMd34AhrPTqE0Da3HLa+4olUmf1sjIxoUVYBgcKVOlfatrJduoaOy/qBYqYQ2Yl
	89wnxyjw==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tnI6o-0000V2-VF; Wed, 26 Feb 2025 15:09:59 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dse@thaumatec.com,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v3 2/3] arm64: dts: rockchip: add dsi controller nodes on rk3588
Date: Wed, 26 Feb 2025 15:09:41 +0100
Message-ID: <20250226140942.3825223-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250226140942.3825223-1-heiko@sntech.de>
References: <20250226140942.3825223-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_061000_299933_B3590A1B 
X-CRM114-Status: GOOD (  12.86  )
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

The RK3588 comes with two DSI2 controllers based on a new Synopsis IP.
Add the necessary nodes for them.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 5535d5d905f6..9f9e0d3c7722 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/rockchip,rk3588-cru.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/power/rk3588-power.h>
 #include <dt-bindings/reset/rockchip,rk3588-cru.h>
 #include <dt-bindings/phy/phy.h>
@@ -1406,6 +1407,62 @@ i2s9_8ch: i2s@fddfc000 {
 		status = "disabled";
 	};
 
+	dsi0: dsi@fde20000 {
+		compatible = "rockchip,rk3588-mipi-dsi2";
+		reg = <0x0 0xfde20000 0x0 0x10000>;
+		interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru PCLK_DSIHOST0>, <&cru CLK_DSIHOST0>;
+		clock-names = "pclk", "sys";
+		resets = <&cru SRST_P_DSIHOST0>;
+		reset-names = "apb";
+		power-domains = <&power RK3588_PD_VOP>;
+		phys = <&mipidcphy0 PHY_TYPE_DPHY>;
+		phy-names = "dcphy";
+		rockchip,grf = <&vop_grf>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			dsi0_in: port@0 {
+				reg = <0>;
+			};
+
+			dsi0_out: port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
+	dsi1: dsi@fde30000 {
+		compatible = "rockchip,rk3588-mipi-dsi2";
+		reg = <0x0 0xfde30000 0x0 0x10000>;
+		interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru PCLK_DSIHOST1>, <&cru CLK_DSIHOST1>;
+		clock-names = "pclk", "sys";
+		resets = <&cru SRST_P_DSIHOST1>;
+		reset-names = "apb";
+		power-domains = <&power RK3588_PD_VOP>;
+		phys = <&mipidcphy1 PHY_TYPE_DPHY>;
+		phy-names = "dcphy";
+		rockchip,grf = <&vop_grf>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			dsi1_in: port@0 {
+				reg = <0>;
+			};
+
+			dsi1_out: port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
 	hdmi0: hdmi@fde80000 {
 		compatible = "rockchip,rk3588-dw-hdmi-qp";
 		reg = <0x0 0xfde80000 0x0 0x20000>;
-- 
2.47.2


