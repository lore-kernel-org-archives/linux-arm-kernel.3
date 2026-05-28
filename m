Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF29CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 23:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yDcx6lW5aytrLTXfKmWILbstBnIgvrFkJjC3wzo813A=; b=cD0VNbSuvQqHLsEhB/K0XFdaVq
	+HeRItvbHtxZov3m9wCRb4wQk7oS7Sc1GrwBZQHkMy84ifclTJB0nLLwrtHUt1EIf8UdSAkHbenNz
	fVsZDlTWL2cR2r+W2Q6X4YOenLSnsES3DIWS/M9MrCxo5U/sLvXHhRKz+4em6jSy50da8ZXgJr34X
	q14E8x5KtH6j4M38oYVfGUk55qE8cM2KAyJ60HmaoJNONRXVnfdreqOwQ+qpmjWJ5jRnlSWAEPoTC
	fpHlA4NsNXHJt7hzi4ryvb7QGnWUXoLKXoLzsm+1fVoIZbl61WdkZFw0jKaKjZeGo1f8foHuSkEiK
	FDlqbpQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSk5c-00000006WrU-19SB;
	Thu, 28 May 2026 23:24:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSk5Q-00000006Wdc-1eBu;
	Thu, 28 May 2026 23:24:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=yDcx6lW5aytrLTXfKmWILbstBnIgvrFkJjC3wzo813A=; b=tnl1vefNE0jodkLw2SQoJyDOBM
	OFqs+VmF6Ub81ecu8Ny64Gc9nL4ys834kBr0IhQbd57OSkzIHN4f27lhRlzd5xw6WwZtFMnhcLF1q
	SPoak313OlyowApb9ySRuFJsgHGD/7k+QgrGQ0rDdcrNRBSG+6jUq0+J1db87J62a3PwGpmhHZ+fV
	54BPt3oBqAquZZjvMa2rp5DFKw+jVHZtELppv/GxX0uyo3KwJc1SOWm6xg+uWJimuWduaLhwWxvNu
	U8iSUtRWyM/QKJo4weE80r1sChPR5ksWv5kQ+qJHA6LJVjYzcM4GSUaffKrsRIrU7NRs1UZJZSzs5
	Iuu0DDlw==;
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	amadeus@jmu.edu.cn,
	jonas@kwiboo.se
Subject: [PATCH v3 1/5] arm64: dts: rockchip: Add USB nodes for RK3528
Date: Fri, 29 May 2026 01:23:54 +0200
Message-ID: <20260528232358.4054610-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260528232358.4054610-1-heiko@sntech.de>
References: <20260528232358.4054610-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_162424_456295_8EA5C2E9 
X-CRM114-Status: GOOD (  11.29  )
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

From: Jonas Karlman <jonas@kwiboo.se>

Rockchip RK3528 has one USB 3.0 DWC3 controller and oneUSB 2.0 EHCI/OHCI
controller and uses an Innosilicon-USB2PHY for USB 2.0. The DWC3
controller additionally uses the Naneng Combo PHY for USB3.

Add device tree nodes to describe these USB controllers along with the
USB 2.0 PHYs.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 80 ++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index 77d314716b43..03cd00f88dbb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -336,6 +336,33 @@ pcie_intc: legacy-interrupt-controller {
 			};
 		};
 
+		usb_host0_xhci: usb@fe500000 {
+			compatible = "rockchip,rk3528-dwc3", "snps,dwc3";
+			reg = <0x0 0xfe500000 0x0 0x400000>;
+			clocks = <&cru CLK_REF_USB3OTG>,
+				 <&cru CLK_SUSPEND_USB3OTG>,
+				 <&cru ACLK_USB3OTG>;
+			clock-names = "ref_clk", "suspend_clk", "bus_clk";
+			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&power RK3528_PD_VPU>;
+			resets = <&cru SRST_A_USB3OTG>;
+			dr_mode = "otg";
+			phys = <&usb2phy_otg>, <&combphy PHY_TYPE_USB3>;
+			phy-names = "usb2-phy", "usb3-phy";
+			phy_type = "utmi_wide";
+			snps,dis_enblslpm_quirk;
+			snps,dis_rxdet_inp3_quirk;
+			snps,dis-del-phy-power-chg-quirk;
+			snps,dis-tx-ipgap-linecheck-quirk;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,dis-u2-freeclk-exists-quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,parkmode-disable-hs-quirk;
+			snps,parkmode-disable-ss-quirk;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@fed01000 {
 			compatible = "arm,gic-400";
 			reg = <0x0 0xfed01000 0 0x1000>,
@@ -349,6 +376,30 @@ gic: interrupt-controller@fed01000 {
 			#interrupt-cells = <3>;
 		};
 
+		usb_host0_ehci: usb@ff100000 {
+			compatible = "generic-ehci";
+			reg = <0x0 0xff100000 0x0 0x40000>;
+			clocks = <&cru HCLK_USBHOST>, <&cru HCLK_USBHOST_ARB>,
+				 <&usb2phy>;
+			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&usb2phy_host>;
+			phy-names = "usb";
+			power-domains = <&power RK3528_PD_VO>;
+			status = "disabled";
+		};
+
+		usb_host0_ohci: usb@ff140000 {
+			compatible = "generic-ohci";
+			reg = <0x0 0xff140000 0x0 0x40000>;
+			clocks = <&cru HCLK_USBHOST>, <&cru HCLK_USBHOST_ARB>,
+				 <&usb2phy>;
+			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&usb2phy_host>;
+			phy-names = "usb";
+			power-domains = <&power RK3528_PD_VO>;
+			status = "disabled";
+		};
+
 		qos_crypto_a: qos@ff200000 {
 			compatible = "rockchip,rk3528-qos", "syscon";
 			reg = <0x0 0xff200000 0x0 0x20>;
@@ -1281,6 +1332,35 @@ combphy: phy@ffdc0000 {
 			rockchip,pipe-phy-grf = <&pipe_phy_grf>;
 			status = "disabled";
 		};
+
+		usb2phy: usb2phy@ffdf0000 {
+			compatible = "rockchip,rk3528-usb2phy";
+			reg = <0x0 0xffdf0000 0x0 0x10000>;
+			clocks = <&cru CLK_REF_USBPHY>, <&cru PCLK_USBPHY>;
+			clock-names = "phyclk", "pclk";
+			#clock-cells = <0>;
+			clock-output-names = "clk_usbphy_480m";
+			power-domains = <&power RK3528_PD_VO>;
+			rockchip,usbgrf = <&vo_grf>;
+			status = "disabled";
+
+			usb2phy_otg: otg-port {
+				interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "otg-bvalid", "otg-id",
+						  "linestate";
+				#phy-cells = <0>;
+				status = "disabled";
+			};
+
+			usb2phy_host: host-port {
+				interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "linestate";
+				#phy-cells = <0>;
+				status = "disabled";
+			};
+		};
 	};
 };
 
-- 
2.47.3


