Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6B2E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 09:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4KGrCiIlPUGsJUkmSNeRDBiTzjQ27Y05cIVQuYTCvps=; b=kqJ4PywL2s9aCwYl4gFLglsB/4
	eOswrMIKV4ds7vNK6qSzWLP5lsGHi/2cRo1cOf28PeDxLsdPInkHq7dKyscb/RB50HG8raiPxrQDE
	9Kk0MAVW+CWA4a4L7H6KXhs1LK5ytZIo2GRDJCTntYpa0ssNuNBGEp9b9o78G171nGhwhIptLxVjT
	db00yydAXemrs0+EwTmg91MPhTz5KYfrjJYIdTDxig6UGg2Bd+vsu8/O+Z1y0Fvxh8q4e0f3Je6hT
	hOzwZ6tGC1TKD4g+dddbln5B4WrMbldXNMj9bOxzi24QTqQp9M9HNqzdWYzZHnvtxMZz/IOGR+G9/
	xz5fYcGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTx4-0000000CwHm-1J91;
	Tue, 17 Dec 2024 09:33:14 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTdT-0000000Cr4M-3sjF;
	Tue, 17 Dec 2024 09:13:01 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout4.routing.net (Postfix) with ESMTP id 8DAE7100827;
	Tue, 17 Dec 2024 09:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1734426778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4KGrCiIlPUGsJUkmSNeRDBiTzjQ27Y05cIVQuYTCvps=;
	b=EPWjSnPi3iPrRl+MH5kp1dFTlS2UM1hXdHq15HtFngHvIEHLzbwQAmdcyji5ek7cQ3riPJ
	t5kj3jt9aBDQtslWjcQA+dLj8krvazqdyIysM+Kw0dVmd3MS0arZinvLvQkcwcoWyjsgDw
	9DUg3z7vw7Bg5CJVdkixsQ0dGXtYkiI=
Received: from frank-u24.. (fttx-pool-217.61.150.187.bambit.de [217.61.150.187])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id D3FA610030F;
	Tue, 17 Dec 2024 09:12:57 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 10/22] arm64: dts: mediatek: mt7988: Add pcie nodes
Date: Tue, 17 Dec 2024 10:12:24 +0100
Message-ID: <20241217091238.16032-11-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217091238.16032-1-linux@fw-web.de>
References: <20241217091238.16032-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 52a3750b-10e6-4221-bddd-4d42af3ebb3d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_011300_254702_1ED4E5E9 
X-CRM114-Status: UNSURE (   9.11  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Add pcie controllers for mt7988. Reuse mt7986 compatible.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 152 ++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 209d170bce7f..74c75d5149d7 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -373,6 +373,158 @@ mmc0: mmc@11230000 {
 			status = "disabled";
 		};
 
+		pcie@11280000 {
+			compatible = "mediatek,mt7986-pcie",
+				     "mediatek,mt8192-pcie";
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			reg = <0 0x11280000 0 0x2000>;
+			reg-names = "pcie-mac";
+			linux,pci-domain = <3>;
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+			bus-range = <0x00 0xff>;
+			ranges = <0x81000000 0x00 0x20000000 0x00
+				  0x20000000 0x00 0x00200000>,
+				 <0x82000000 0x00 0x20200000 0x00
+				  0x20200000 0x00 0x07e00000>;
+			clocks = <&infracfg CLK_INFRA_PCIE_PIPE_P2>,
+				 <&infracfg CLK_INFRA_PCIE_GFMUX_TL_P2>,
+				 <&infracfg CLK_INFRA_PCIE_PERI_26M_CK_P2>,
+				 <&infracfg CLK_INFRA_133M_PCIE_CK_P2>;
+			clock-names = "pl_250m", "tl_26m", "peri_26m",
+				      "top_133m";
+			pinctrl-names = "default";
+			pinctrl-0 = <&pcie2_pins>;
+			status = "disabled";
+
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &pcie_intc2 0>,
+					<0 0 0 2 &pcie_intc2 1>,
+					<0 0 0 3 &pcie_intc2 2>,
+					<0 0 0 4 &pcie_intc2 3>;
+			pcie_intc2: interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		pcie@11290000 {
+			compatible = "mediatek,mt7986-pcie",
+				     "mediatek,mt8192-pcie";
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			reg = <0 0x11290000 0 0x2000>;
+			reg-names = "pcie-mac";
+			linux,pci-domain = <2>;
+			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
+			bus-range = <0x00 0xff>;
+			ranges = <0x81000000 0x00 0x28000000 0x00
+				  0x28000000 0x00 0x00200000>,
+				 <0x82000000 0x00 0x28200000 0x00
+				  0x28200000 0x00 0x07e00000>;
+			clocks = <&infracfg CLK_INFRA_PCIE_PIPE_P3>,
+				 <&infracfg CLK_INFRA_PCIE_GFMUX_TL_P3>,
+				 <&infracfg CLK_INFRA_PCIE_PERI_26M_CK_P3>,
+				 <&infracfg CLK_INFRA_133M_PCIE_CK_P3>;
+			clock-names = "pl_250m", "tl_26m", "peri_26m",
+				      "top_133m";
+			pinctrl-names = "default";
+			pinctrl-0 = <&pcie3_pins>;
+			status = "disabled";
+
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &pcie_intc3 0>,
+					<0 0 0 2 &pcie_intc3 1>,
+					<0 0 0 3 &pcie_intc3 2>,
+					<0 0 0 4 &pcie_intc3 3>;
+			pcie_intc3: interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		pcie@11300000 {
+			compatible = "mediatek,mt7986-pcie",
+				     "mediatek,mt8192-pcie";
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			reg = <0 0x11300000 0 0x2000>;
+			reg-names = "pcie-mac";
+			linux,pci-domain = <0>;
+			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
+			bus-range = <0x00 0xff>;
+			ranges = <0x81000000 0x00 0x30000000 0x00
+				  0x30000000 0x00 0x00200000>,
+				 <0x82000000 0x00 0x30200000 0x00
+				  0x30200000 0x00 0x07e00000>;
+			clocks = <&infracfg CLK_INFRA_PCIE_PIPE_P0>,
+				 <&infracfg CLK_INFRA_PCIE_GFMUX_TL_P0>,
+				 <&infracfg CLK_INFRA_PCIE_PERI_26M_CK_P0>,
+				 <&infracfg CLK_INFRA_133M_PCIE_CK_P0>;
+			clock-names = "pl_250m", "tl_26m", "peri_26m",
+				      "top_133m";
+			pinctrl-names = "default";
+			pinctrl-0 = <&pcie0_pins>;
+			status = "disabled";
+
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &pcie_intc0 0>,
+					<0 0 0 2 &pcie_intc0 1>,
+					<0 0 0 3 &pcie_intc0 2>,
+					<0 0 0 4 &pcie_intc0 3>;
+			pcie_intc0: interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		pcie@11310000 {
+			compatible = "mediatek,mt7986-pcie",
+				     "mediatek,mt8192-pcie";
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			reg = <0 0x11310000 0 0x2000>;
+			reg-names = "pcie-mac";
+			linux,pci-domain = <1>;
+			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
+			bus-range = <0x00 0xff>;
+			ranges = <0x81000000 0x00 0x38000000 0x00
+				  0x38000000 0x00 0x00200000>,
+				 <0x82000000 0x00 0x38200000 0x00
+				  0x38200000 0x00 0x07e00000>;
+			clocks = <&infracfg CLK_INFRA_PCIE_PIPE_P1>,
+				 <&infracfg CLK_INFRA_PCIE_GFMUX_TL_P1>,
+				 <&infracfg CLK_INFRA_PCIE_PERI_26M_CK_P1>,
+				 <&infracfg CLK_INFRA_133M_PCIE_CK_P1>;
+			clock-names = "pl_250m", "tl_26m", "peri_26m",
+				      "top_133m";
+			pinctrl-names = "default";
+			pinctrl-0 = <&pcie1_pins>;
+			status = "disabled";
+
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &pcie_intc1 0>,
+					<0 0 0 2 &pcie_intc1 1>,
+					<0 0 0 3 &pcie_intc1 2>,
+					<0 0 0 4 &pcie_intc1 3>;
+			pcie_intc1: interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
 		t-phy@11c50000 {
 			compatible = "mediatek,mt7986-tphy",
 				     "mediatek,generic-tphy-v2";
-- 
2.43.0


