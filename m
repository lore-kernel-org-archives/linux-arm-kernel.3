Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB6BE77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 07:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UjWRwJmepX1/tP10Gtcn2jZFD8Z/yI8Z/tGocsPqklA=; b=NJrW7sFg8HtsvHAuNPR9zWxpw8
	IRgBkH23hltk0SzEheBMmM8pkDj/5fbwMghtR2qkqMTs7F+rr6PFSH+LTYPx4ICJMe4Hp7LxqWrnR
	kcKWIJEpFRFZWH0OUyTocVoDTZYbfjGNl6xF6DeY1mjZk8IWkR2AXFZvXhyHZ3KBEl1A6ZwPb4HEb
	wrQh7JSM3ZwaKWNbaDI7xBF6iq/8pdiLMtaPchB+IQfPsX0CH86VBvPgF7cg0qPjQkqxssmtp4n8w
	MSGd0MZfEyuBM6ZV/976zCGbCDxBI299WWk2FMxs2b/+2JwRZkI+JLMYbvXBGIEo53UvnBRIFObaP
	5lrzmnOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4SO-00000003p3f-3J3x;
	Tue, 07 Jan 2025 07:56:56 +0000
Received: from mail-m15579.qiye.163.com ([101.71.155.79])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4L5-00000003nlY-1pAF;
	Tue, 07 Jan 2025 07:49:28 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 7f3b5a8c;
	Tue, 7 Jan 2025 15:49:19 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Frank Wang <frank.wang@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Liang Chen <cl@rock-chips.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 4/7] arm64: dts: rockchip: add usb related nodes for rk3576
Date: Tue,  7 Jan 2025 15:49:08 +0800
Message-Id: <20250107074911.550057-5-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250107074911.550057-1-kever.yang@rock-chips.com>
References: <20250107074911.550057-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGklDGVZPHR8ZGE4fSUJMSkJWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a943fbd53af03afkunm7f3b5a8c
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mxg6ARw5PzIRTBNLSSgZSFEf
	HjkwCzdVSlVKTEhNSUhNSk1KSEtJVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFOTENPNwY+
DKIM-Signature: a=rsa-sha256;
	b=EP9w8k7x7u+ZZ7FvCoIG2SBRWd6tGh08CcLq1zbeJngl10HlphTo96rDMC1Snn2/2S5vE6t6TwQibUiBNm537InwzHEaGS3+DbQ6UfAcJnyEZ9LnfoR2JZKLFKS9Lkdh2lAd7ypIsPLzpBHU8Z9CZM7fQfkodFlNU85OcsEYgXU=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=UjWRwJmepX1/tP10Gtcn2jZFD8Z/yI8Z/tGocsPqklA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_234924_759849_04F64890 
X-CRM114-Status: UNSURE (   7.81  )
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

From: Frank Wang <frank.wang@rock-chips.com>

This adds USB and USB-PHY related nodes for RK3576 SoC.

Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

Changes in v4: None
Changes in v3: None
Changes in v2: None

 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 133 +++++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 0486525fe596..b4f396421686 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -445,6 +445,58 @@ soc {
 		#size-cells = <2>;
 		ranges;
 
+		usb_drd0_dwc3: usb@23000000 {
+			compatible = "rockchip,rk3576-dwc3", "snps,dwc3";
+			reg = <0x0 0x23000000 0x0 0x400000>;
+			clocks = <&cru CLK_REF_USB3OTG0>,
+				 <&cru CLK_SUSPEND_USB3OTG0>,
+				 <&cru ACLK_USB3OTG0>;
+			clock-names = "ref_clk", "suspend_clk", "bus_clk";
+			interrupts = <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&power RK3576_PD_USB>;
+			resets = <&cru SRST_A_USB3OTG0>;
+			dr_mode = "otg";
+			phys = <&u2phy0_otg>, <&usbdp_phy PHY_TYPE_USB3>;
+			phy-names = "usb2-phy", "usb3-phy";
+			phy_type = "utmi_wide";
+			snps,dis_enblslpm_quirk;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,dis-u2-freeclk-exists-quirk;
+			snps,dis-del-phy-power-chg-quirk;
+			snps,dis-tx-ipgap-linecheck-quirk;
+			snps,parkmode-disable-hs-quirk;
+			snps,parkmode-disable-ss-quirk;
+			status = "disabled";
+		};
+
+		usb_drd1_dwc3: usb@23400000 {
+			compatible = "rockchip,rk3576-dwc3", "snps,dwc3";
+			reg = <0x0 0x23400000 0x0 0x400000>;
+			clocks = <&cru CLK_REF_USB3OTG1>,
+				 <&cru CLK_SUSPEND_USB3OTG1>,
+				 <&cru ACLK_USB3OTG1>;
+			clock-names = "ref_clk", "suspend_clk", "bus_clk";
+			interrupts = <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&power RK3576_PD_PHP>;
+			resets = <&cru SRST_A_USB3OTG1>;
+			dr_mode = "otg";
+			phys = <&u2phy1_otg>, <&combphy1_psu PHY_TYPE_USB3>;
+			phy-names = "usb2-phy", "usb3-phy";
+			phy_type = "utmi_wide";
+			snps,dis_enblslpm_quirk;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,dis-u2-freeclk-exists-quirk;
+			snps,dis-del-phy-power-chg-quirk;
+			snps,dis-tx-ipgap-linecheck-quirk;
+			snps,dis_rxdet_inp3_quirk;
+			snps,parkmode-disable-hs-quirk;
+			snps,parkmode-disable-ss-quirk;
+			dma-coherent;
+			status = "disabled";
+		};
+
 		sys_grf: syscon@2600a000 {
 			compatible = "rockchip,rk3576-sys-grf", "syscon";
 			reg = <0x0 0x2600a000 0x0 0x2000>;
@@ -515,6 +567,65 @@ usbdpphy_grf: syscon@2602c000 {
 			reg = <0x0 0x2602c000 0x0 0x2000>;
 		};
 
+		usb2phy_grf: syscon@2602e000 {
+			compatible = "rockchip,rk3576-usb2phy-grf", "syscon", "simple-mfd";
+			reg = <0x0 0x2602e000 0x0 0x4000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			u2phy0: usb2-phy@0 {
+				compatible = "rockchip,rk3576-usb2phy";
+				reg = <0x0 0x10>;
+				resets = <&cru SRST_OTGPHY_0>, <&cru SRST_P_USBPHY_GRF_0>;
+				reset-names = "phy", "apb";
+				clocks = <&cru CLK_PHY_REF_SRC>,
+					 <&cru ACLK_MMU2>,
+					 <&cru ACLK_SLV_MMU2>;
+				clock-names = "phyclk", "aclk", "aclk_slv";
+				clock-output-names = "usb480m_phy0";
+				#clock-cells = <0>;
+				status = "disabled";
+
+				u2phy0_otg: otg-port {
+					#phy-cells = <0>;
+					interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
+						     <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
+						     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>;
+					interrupt-names = "otg-bvalid", "otg-id", "linestate";
+					status = "disabled";
+				};
+			};
+
+			u2phy1: usb2-phy@2000 {
+				compatible = "rockchip,rk3576-usb2phy";
+				reg = <0x2000 0x10>;
+				resets = <&cru SRST_OTGPHY_1>, <&cru SRST_P_USBPHY_GRF_1>;
+				reset-names = "phy", "apb";
+				clocks = <&cru CLK_PHY_REF_SRC>,
+					 <&cru ACLK_MMU1>,
+					 <&cru ACLK_SLV_MMU1>;
+				clock-names = "phyclk", "aclk", "aclk_slv";
+				clock-output-names = "usb480m_phy1";
+				#clock-cells = <0>;
+				status = "disabled";
+
+				u2phy1_otg: otg-port {
+					#phy-cells = <0>;
+					interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>,
+						     <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>,
+						     <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+					interrupt-names = "otg-bvalid", "otg-id", "linestate";
+					status = "disabled";
+				};
+			};
+		};
+
+		vo1_grf: syscon@26036000 {
+			compatible = "rockchip,rk3576-vo1-grf", "syscon";
+			reg = <0x0 0x26036000 0x0 0x100>;
+			clocks = <&cru PCLK_VO1_ROOT>;
+		};
+
 		sdgmac_grf: syscon@26038000 {
 			compatible = "rockchip,rk3576-sdgmac-grf", "syscon";
 			reg = <0x0 0x26038000 0x0 0x1000>;
@@ -1732,6 +1843,28 @@ combphy1_psu: phy@2b060000 {
 			status = "disabled";
 		};
 
+		usbdp_phy: phy@2b010000 {
+			compatible = "rockchip,rk3576-usbdp-phy";
+			reg = <0x0 0x2b010000 0x0 0x10000>;
+			#phy-cells = <1>;
+			clocks = <&cru CLK_PHY_REF_SRC >,
+				 <&cru CLK_USBDP_COMBO_PHY_IMMORTAL>,
+				 <&cru PCLK_USBDPPHY>,
+				 <&u2phy0>;
+			clock-names = "refclk", "immortal", "pclk", "utmi";
+			resets = <&cru SRST_USBDP_COMBO_PHY_INIT>,
+				 <&cru SRST_USBDP_COMBO_PHY_CMN>,
+				 <&cru SRST_USBDP_COMBO_PHY_LANE>,
+				 <&cru SRST_USBDP_COMBO_PHY_PCS>,
+				 <&cru SRST_P_USBDPPHY>;
+			reset-names = "init", "cmn", "lane", "pcs_apb", "pma_apb";
+			rockchip,u2phy-grf = <&usb2phy_grf>;
+			rockchip,usb-grf = <&usb_grf>;
+			rockchip,usbdpphy-grf = <&usbdpphy_grf>;
+			rockchip,vo-grf = <&vo1_grf>;
+			status = "disabled";
+		};
+
 		sram: sram@3ff88000 {
 			compatible = "mmio-sram";
 			reg = <0x0 0x3ff88000 0x0 0x78000>;
-- 
2.25.1


