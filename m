Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE79E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 10:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nOjqWSTi8dqRWSxylXoTbFPFNKc68E/UXp6mVZs9+qY=; b=ZtkXv5aUm2vJY7Eu+07X6npCQE
	jwmCclNFQM7hBdAp4bNv3myfLowjj9nb3opE4NOaZbHjc4x60AqfUY1mZfL8jow4j9ZrWU2hEiMIy
	I1hGa2uWo2i8QURQQJ+MX5kxJwQD/alNzMuG4Ab3Nonxw6Svy6GEiuOHhbyLC6/2M6G4odwnWbI1Z
	VDHuTKh5Dzmoz7mDOHgCZEhi4UZxX1Iuz3GuAQ4jaCc+scJ2AZV9NU7SX/G+TGxFYwdAZf+iGvIha
	0YNyulfyTpYmMMifbVY0EJWJ6xAln/BBuOxyQRBnOfn9PVTF5XfJ3ciphoP5URTvsKXvkyGDmMq4R
	zQUtXETg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Ik-0000000FZHf-26Ft;
	Thu, 05 Dec 2024 10:41:42 +0000
Received: from mail-m12776.qiye.163.com ([115.236.127.76])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Dn-0000000FXfi-1TWl;
	Thu, 05 Dec 2024 10:36:37 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4cf7c96e;
	Thu, 5 Dec 2024 18:36:31 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liang Chen <cl@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] dts: arm64: rockchip: Add rk3576 pcie nodes
Date: Thu,  5 Dec 2024 18:36:20 +0800
Message-Id: <20241205103623.878181-4-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241205103623.878181-1-kever.yang@rock-chips.com>
References: <20241205103623.878181-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0pKSFZMTE1JTUtOGBpLHUtWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a939664885503afkunm4cf7c96e
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OVE6Txw*KjIvMw0OTCxPCxkv
	FxZPFB9VSlVKTEhISEJPQkJJT0lMVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFPQktCNwY+
DKIM-Signature: a=rsa-sha256;
	b=LQ3Q+qn60/AGQS3EAHD+WipqNSolNfA08BN5ZnVmYZNpJXptOAZfbqhhNJzM2p0ALfsyj9XliK+w2/0tI9AffDFJK55Js4U2f3jlzfvKmINAbxWzAnQ2RgqzkK5X+0MDRnJOU8Pzt2XQK7+UqOT10ScZqAHfhvogBlVnlkb6NH8=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=nOjqWSTi8dqRWSxylXoTbFPFNKc68E/UXp6mVZs9+qY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_023635_619224_37F1EC77 
X-CRM114-Status: UNSURE (   7.40  )
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

rk3576 has two pcie controller, both are pcie2x1 used with
naneng-combphy.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 111 +++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 8938ec7c3bb4..888af56530e8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1016,6 +1016,117 @@ qos_npu_m1ro: qos@27f22100 {
 			reg = <0x0 0x27f22100 0x0 0x20>;
 		};
 
+		pcie0: pcie@2a200000 {
+			compatible = "rockchip,rk3576-pcie", "rockchip,rk3568-pcie";
+			bus-range = <0x0 0xf>;
+			clocks = <&cru ACLK_PCIE0_MST>, <&cru ACLK_PCIE0_SLV>,
+				 <&cru ACLK_PCIE0_DBI>, <&cru PCLK_PCIE0>,
+				 <&cru CLK_PCIE0_AUX>;
+
+			clock-names = "aclk_mst", "aclk_slv",
+				      "aclk_dbi", "pclk",
+				      "aux";
+			device_type = "pci";
+			interrupts = <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "msi", "sys", "pmc", "msg", "legacy", "err";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie0_intc 0>,
+					<0 0 0 2 &pcie0_intc 1>,
+					<0 0 0 3 &pcie0_intc 2>,
+					<0 0 0 4 &pcie0_intc 3>;
+			linux,pci-domain = <0>;
+			num-ib-windows = <8>;
+			num-viewport = <8>;
+			num-ob-windows = <2>;
+			max-link-speed = <2>;
+			num-lanes = <1>;
+			phys = <&combphy0_ps PHY_TYPE_PCIE>;
+			phy-names = "pcie-phy";
+			power-domains = <&power RK3576_PD_PHP>;
+			ranges = <0x00000800 0x0 0x20000000 0x0 0x20000000 0x0 0x00100000
+				  0x81000000 0x0 0x20100000 0x0 0x20100000 0x0 0x00100000
+				  0x82000000 0x0 0x20200000 0x0 0x20200000 0x0 0x00e00000
+				  0x83000000 0x9 0x00000000 0x9 0x00000000 0x0 0x80000000>;
+			reg = <0x0 0x2a200000 0x0 0x00010000>,
+			      <0x0 0x22000000 0x0 0x00400000>,
+			      <0x0 0x20000000 0x0 0x00100000>;
+			reg-names = "apb", "dbi", "config";
+			resets = <&cru SRST_PCIE0_POWER_UP>, <&cru SRST_P_PCIE0>;
+			reset-names = "pipe", "p_pcie0";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			status = "disabled";
+
+			pcie0_intc: legacy-interrupt-controller {
+				interrupt-controller;
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-parent = <&gic>;
+				interrupts = <GIC_SPI 280 IRQ_TYPE_EDGE_RISING>;
+			};
+		};
+
+		pcie1: pcie@2a210000 {
+			compatible = "rockchip,rk3576-pcie", "rockchip,rk3568-pcie";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			bus-range = <0x20 0x2f>;
+			clocks = <&cru ACLK_PCIE1_MST>, <&cru ACLK_PCIE1_SLV>,
+				 <&cru ACLK_PCIE1_DBI>, <&cru PCLK_PCIE1>,
+				 <&cru CLK_PCIE1_AUX>;
+			clock-names = "aclk_mst", "aclk_slv",
+				      "aclk_dbi", "pclk",
+				      "aux";
+			device_type = "pci";
+			interrupts = <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "msi", "sys", "pmc", "msg", "legacy", "err";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie1_intc 0>,
+					<0 0 0 2 &pcie1_intc 1>,
+					<0 0 0 3 &pcie1_intc 2>,
+					<0 0 0 4 &pcie1_intc 3>;
+			linux,pci-domain = <0>;
+			num-ib-windows = <8>;
+			num-viewport = <8>;
+			num-ob-windows = <2>;
+			max-link-speed = <2>;
+			num-lanes = <1>;
+			phys = <&combphy1_psu PHY_TYPE_PCIE>;
+			phy-names = "pcie-phy";
+			power-domains = <&power RK3576_PD_SUBPHP>;
+			ranges = <0x00000800 0x0 0x21000000 0x0 0x21000000 0x0 0x00100000
+				  0x81000000 0x0 0x21100000 0x0 0x21100000 0x0 0x00100000
+				  0x82000000 0x0 0x21200000 0x0 0x21200000 0x0 0x00e00000
+				  0x83000000 0x9 0x80000000 0x9 0x80000000 0x0 0x80000000>;
+			reg = <0x0 0x2a210000 0x0 0x00010000>,
+			      <0x0 0x22400000 0x0 0x00400000>,
+			      <0x0 0x21000000 0x0 0x00100000>;
+			reg-names = "apb", "dbi", "config";
+			resets = <&cru SRST_PCIE1_POWER_UP>, <&cru SRST_P_PCIE1>;
+			reset-names = "pipe", "p_pcie1";
+			status = "disabled";
+
+			pcie1_intc: legacy-interrupt-controller {
+				interrupt-controller;
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-parent = <&gic>;
+				interrupts = <GIC_SPI 266 IRQ_TYPE_EDGE_RISING>;
+			};
+		};
+
 		gmac0: ethernet@2a220000 {
 			compatible = "rockchip,rk3576-gmac", "snps,dwmac-4.20a";
 			reg = <0x0 0x2a220000 0x0 0x10000>;
-- 
2.25.1


