Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5BFFED3F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 17:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nq+36Gmi7io5ZhSvvC4/950fCuZd8ugXAHy5lU6swsY=; b=G7LelAg1rSHF2Qq3lKlmvfOasd
	CCYN/EtAh4boc0m653M+c0KF/5DWWICN9ojCxuaYadhsneth+eC1OeBCcFBjKxikKEigVufQZlz9z
	mI6IJedLg8HrNfAyaGV+u1WGPzvr1YPSFfcnEeRtjFDu7fmeRLrNY5mM7sOozUcbyqIlw2vKqY4sm
	BTcez9BeHBdhQzE4YL0NUm/hujPhEiy0iQ7mQUlHT2j0K5ww035EiJ2gc6EGy1SYDyINNOiZw8Wm7
	J8P7qeYIYBEwqCMqSGzuPbYPGZG/bQoFv7vWd8i5cSTecuSWHIqIzdkpJbSnoS2h9KSJS2EvdFoba
	tWitnZYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGKoN-0000000DcD3-2AwY;
	Fri, 24 Apr 2026 17:59:31 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGKoI-0000000Dc9s-3UMt;
	Fri, 24 Apr 2026 17:59:28 +0000
Received: from neptunite.hamster-moth.ts.net (unknown [IPv6:2404:7a81:160:2100:5216:c7b6:205:5f59])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45DE01E48;
	Fri, 24 Apr 2026 19:57:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777053464;
	bh=QKMIRFf+egZTLlRGURczjRcS1xEDrJXoY7l0Wd95zZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=orR6Gr+6Egau2xm0MyviEZYvZwUYNU/i7QITxtNiF6EvwO2U0u06JeYL/cbzcsQnu
	 zalf26n88lyT1fQY45zFO+I4GXVYyIM6xGAE/jgLgn8AuQW5tyg8vOhm5nXwezLDIN
	 W5eTPyL7zw4G3fooR8PHewgqAzhB8nxN11RU73CA=
From: Paul Elder <paul.elder@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: Xu Hongfei <xuhf@rock-chips.com>,
	michael.riesch@collabora.com,
	stefan.klug@ideasonboard.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul Elder <paul.elder@ideasonboard.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [RFC PATCH 2/5] arm64: dts: rockchip: add ISP nodes to rk3588
Date: Sat, 25 Apr 2026 02:58:47 +0900
Message-ID: <20260424175853.638202-3-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260424175853.638202-1-paul.elder@ideasonboard.com>
References: <20260424175853.638202-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_105927_514731_23DFCFDC 
X-CRM114-Status: UNSURE (   7.67  )
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

From: Xu Hongfei <xuhf@rock-chips.com>

Add device tree nodes for the ISP and their iommus on the RK3588.

Signed-off-by: Xu Hongfei <xuhf@rock-chips.com>
Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 8b98e5c3cc8b..607b03d55dfd 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -3535,6 +3535,66 @@ gpio4: gpio@fec50000 {
 			#interrupt-cells = <2>;
 		};
 	};
+
+	isp0: isp@fdcb0000 {
+		compatible = "rockchip,rk3588-isp";
+		reg = <0x0 0xfdcb0000 0x0 0x7f00>;
+		interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "isp_irq", "mi_irq";
+		clocks = <&cru ACLK_ISP0>, <&cru HCLK_ISP0>,
+			 <&cru CLK_ISP0_CORE>, <&cru CLK_ISP0_CORE_MARVIN>,
+			 <&cru CLK_ISP0_CORE_VICAP>;
+		clock-names = "aclk", "hclk", "clk_core",
+			      "clk_core_marvin", "clk_core_vicap";
+		power-domains = <&power RK3588_PD_VI>;
+		iommus = <&isp0_mmu>;
+		status = "disabled";
+	};
+
+	isp0_mmu: iommu@fdcb7f00 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdcb7f00 0x0 0x100>;
+		interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "isp0_mmu";
+		clocks = <&cru ACLK_ISP0>, <&cru HCLK_ISP0>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3588_PD_VI>;
+		#iommu-cells = <0>;
+		rockchip,disable-mmu-reset;
+		status = "disabled";
+	};
+
+	isp1: isp@fdcc0000 {
+		compatible = "rockchip,rk3588-isp";
+		reg = <0x0 0xfdcc0000 0x0 0x7f00>;
+		interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "isp_irq", "mi_irq";
+		clocks = <&cru ACLK_ISP1>, <&cru HCLK_ISP1>,
+			 <&cru CLK_ISP1_CORE>, <&cru CLK_ISP1_CORE_MARVIN>,
+			 <&cru CLK_ISP1_CORE_VICAP>;
+		clock-names = "aclk", "hclk", "clk_core",
+			      "clk_core_marvin", "clk_core_vicap";
+		power-domains = <&power RK3588_PD_ISP1>;
+		iommus = <&isp1_mmu>;
+		status = "disabled";
+	};
+
+	isp1_mmu: iommu@fdcc7f00 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdcc7f00 0x0 0x100>;
+		interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "isp1_mmu";
+		clocks = <&cru ACLK_ISP1>, <&cru HCLK_ISP1>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3588_PD_ISP1>;
+		#iommu-cells = <0>;
+		rockchip,disable-mmu-reset;
+		status = "disabled";
+	};
 };
 
 #include "rk3588-base-pinctrl.dtsi"
-- 
2.47.2


