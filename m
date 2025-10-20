Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7DBCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 08:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z62Mgu+xiqkq1oFmKOzlCDXsOLsmTSYpn7SJ2PjkVXI=; b=tOdMbKweVkqnUe9+HOqY2V3yXy
	DIiGWI3QMBbxEDMzKvQl+jBgSr6CQSWvOvpP9pGCH0eMLFN1v0F+GCS1mlpfKVBr7KV6qqwRwZ54H
	YFSz1bI7B1qAvEAYM0WY/MhDhlgrWBc1d1491CevZMTFUcPHIqwoExJKXHka2YPGIPvMsmQxp5GpV
	UsB88XurV/ansCGo962bZF/cHG30LINVrFIHDJu1RTYZWNTt2hxg2Ton4eqFEGGODOK364r+Q1i0j
	F4+5dk81FNNsfUnCHFCa6y5wHoj6v8L7+XxFZTtufVZ8pWNzaZpe7gx3nxplsB7F0D6XVeh1WMxm8
	+hDilZrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlDO-0000000CN2d-3bCf;
	Mon, 20 Oct 2025 08:26:02 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlDH-0000000CMqe-3etk;
	Mon, 20 Oct 2025 08:25:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=z62Mgu+xiqkq1oFmKOzlCDXsOLsmTSYpn7SJ2PjkVXI=; b=0xEykeNUAlhlZYnBbS5HBkSZ+q
	sKcc2FKNH8uK+tKOugvviiwfaU+ObaveVGqRMZkXj0pZ/KLLPIzLoZxoGunkuZ2pXIi/rPLfXq4Tx
	NLAiBIzG3ktQli4doLSz/UuVT6djPwnq7xngDu0ncMW/ax4Un1BEp/pJPK+j0GQZWmf6AqnOZW+mq
	YuHJ/JgrM0soN4dPeNd4n0FqGn3U3V8Qw8Ach7N7YlgjyA8xyqeBtQb2sMQCBQsPiCKBphS+/Dbrs
	T2XcF7DKw8nS2XARH9A2x8b7NN2nndvYo7oLM4BAUfZoP5/5aII/+N00pIhHYb4fnnhX1aIN3y0d5
	JGVkq9dQ==;
Received: from [141.76.253.240] (helo=phil.eduroam.local)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vAlD0-00078O-GG; Mon, 20 Oct 2025 10:25:38 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quentin.schulz@cherry.de,
	andy.yan@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	cn.liweihao@gmail.com,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 7/9] arm64: dts: rockchip: Add HDMI node to RK3368
Date: Mon, 20 Oct 2025 10:25:06 +0200
Message-ID: <20251020082508.3636511-8-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251020082508.3636511-1-heiko@sntech.de>
References: <20251020082508.3636511-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_012555_920569_1E54F4AE 
X-CRM114-Status: GOOD (  11.27  )
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

Add the hdmi controller node to the main soc devicetree and hook
it into the vop.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 43 ++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index ce4b112b082b..892d35242259 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -875,6 +875,11 @@ vop_out_dsi: endpoint@0 {
 				reg = <0>;
 				remote-endpoint = <&dsi_in_vop>;
 			};
+
+			vop_out_hdmi: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&hdmi_in_vop>;
+			};
 		};
 	};
 
@@ -933,6 +938,37 @@ dphy: phy@ff968000 {
 		status = "disabled";
 	};
 
+	hdmi: hdmi@ff980000 {
+		compatible = "rockchip,rk3368-dw-hdmi";
+		reg = <0x0 0xff980000 0x0 0x20000>;
+		interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru PCLK_HDMI_CTRL>, <&cru SCLK_HDMI_HDCP>, <&cru SCLK_HDMI_CEC>;
+		clock-names = "iahb", "isfr", "cec";
+		pinctrl-names = "default";
+		pinctrl-0 = <&hdmi_i2c_xfer>;
+		power-domains = <&power RK3368_PD_VIO>;
+		reg-io-width = <4>;
+		rockchip,grf = <&grf>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			hdmi_in: port@0 {
+				reg = <0>;
+
+				hdmi_in_vop: endpoint {
+					remote-endpoint = <&vop_out_hdmi>;
+				};
+			};
+
+			hdmi_out: port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
 	hevc_mmu: iommu@ff9a0440 {
 		compatible = "rockchip,iommu";
 		reg = <0x0 0xff9a0440 0x0 0x40>,
@@ -1196,6 +1232,13 @@ rmii_pins: rmii-pins {
 			};
 		};
 
+		hdmi {
+			hdmi_i2c_xfer: hdmi-i2c-xfer {
+				rockchip,pins = <3 RK_PD2 1 &pcfg_pull_none>,
+						<3 RK_PD3 1 &pcfg_pull_none>;
+			};
+		};
+
 		i2c0 {
 			i2c0_xfer: i2c0-xfer {
 				rockchip,pins = <0 RK_PA6 1 &pcfg_pull_none>,
-- 
2.47.2


