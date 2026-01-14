Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41168D3CC84
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 23:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cE0Lkb67ht9M5oQ7LmpBhT0gYI8iCahxni7CTG1vi3Q=; b=uC5/oYR5etkJDIknoxEXA2G+jK
	VUOX/LqIfq36jRcJm3tcDPtfQHTCbtnzvSwi7E98Jd7aBrneKXWwGJ7tJ8Fh4k1U3LcLKVgboc7kV
	4FbfFOz4tM++Y2hOGBSNYpYr3AlqHXLnrVjAOky9jXrl0G3utVrHicr/tZj8Vx37GLQdL71y6k4Lm
	yZ1T3eMQOCo6REfNsisAjflFU8sLFMaw56Ulyi7tI2f1O36JwOO8El6T1ClOtwAnU0uE7YVX3+d0U
	ToKoz1d79PxQJf5034TwVYmzeTIQag6tBiDXaDdUnQ45ii/Nb4lk//kPUoy5RjIPVX9xK1xRo2sVE
	Pe2NDz1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg9xY-0000000B1jD-04Fz;
	Wed, 14 Jan 2026 23:07:28 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg9xW-0000000B1hF-1Lec;
	Wed, 14 Jan 2026 23:07:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=cE0Lkb67ht9M5oQ7LmpBhT0gYI8iCahxni7CTG1vi3Q=; b=1XyKGZllCxrjUC/zx+CIFFpFK1
	NdaeviO4BrLi6sg645eOuUWqE+4L9w5zxQhl/uosKFixmQuajHXd8gzDHkYKAhTzGPPHbSVfA4db1
	BNqOflLqVymqWb+N3oGaxoT6YyOP3OVc1ourlUDpr0iimYhi1LOQWX4+Wo6g4BE/KMNv3Kzi9imyr
	SD0/iDEzc8dvpdaKlSKl+/zaaASwbcnnkL6tKWVzT/GU8QXWW9CXA3zkbeGy3/KyM4Uiok4KP0/Yl
	kxJPHYtSVdlgbs5sSG+xL/3kOTTdOWAV69U28sGwtoh94Kxg4aO2Ws3jUAKAsq73QEV45Q+geU1hR
	CqyuE0HA==;
Received: from i53875b96.versanet.de ([83.135.91.150] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vg9xT-002N2m-Qu; Thu, 15 Jan 2026 00:07:24 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v3 2/5] arm64: dts: rockchip: Add HDMI node to RK3368
Date: Thu, 15 Jan 2026 00:07:04 +0100
Message-ID: <20260114230707.4175162-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260114230707.4175162-1-heiko@sntech.de>
References: <20260114230707.4175162-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_150726_384923_99F3A674 
X-CRM114-Status: GOOD (  12.16  )
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

Add the HDMI controller node to the main SoC devicetree and hook
it into the VOP.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 43 ++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index f9e24b25274b..98d350768fd2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -883,6 +883,11 @@ vop_out_dsi: endpoint@0 {
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
 
@@ -941,6 +946,37 @@ dphy: phy@ff968000 {
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
@@ -1204,6 +1240,13 @@ rmii_pins: rmii-pins {
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


