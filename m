Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF751C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 09:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQa8Yzw+cMbDUpFAsFR44Rt1drTyNsziGK+ruesC2cA=; b=YKfJsXT/BQrKMzuG1ZRjtM7E4R
	zO7oPrqzgJ7cF3UwCWcoruo44Xeia4fgYOp7l6ti9IyctiDZAs3rqYoK1YGk4YYb6BACNp6GKMJRu
	M6DbXjjwsqwZAB97EDrwTb2QV4VSngXv7N03bqfFg5wgf26ZINFXt2p2ekJKrtAA+qCbZWhbKCLQt
	Jt0nCC7hGQT9+hqqQrDMpFaxN3OXlHbQ+bnjW9hVkfU22vBaj6c/Omo7QSYlZstq3mvyRfE/Dt1En
	lxYWQyN4c6oRANUtuVeM/Q14/qC+6Hb7Yem1/nbHAOEl+1+FzHk/d/mCIxsLvMoo+ciVRelI6uhvi
	cYaxBf5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQbl-0000000GGC1-42Tm;
	Mon, 24 Aug 2026 09:04:45 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQbW-0000000GFx5-2Ik3;
	Mon, 24 Aug 2026 09:04:32 +0000
Received: from neptunite.hamster-moth.ts.net (unknown [IPv6:2400:2411:160:2f00:e616:f172:fe90:f1b5])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B031C14;
	Mon, 24 Aug 2026 11:03:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1787562184;
	bh=C2rKS+teZoKMQfluRGdL4Oe8gFk9wbGJj4eEUmXqiYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QZXpGMcIY0J04Kc3DSzXY25RNLURjNL0CSoZEyhY3+SsM7dnRqTzij8jd9H7F1Fx5
	 067lFPSFn0gDr9TBVkpbNu860/cqczU6JSphpLpwz02FLh/n9sBoIiFdpFc/ywnmfV
	 bWEmEn3fRWKeO6kjd0Z9bEUL7PVQ4mZFOx1hLw2Q=
From: Paul Elder <paul.elder@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: Xu Hongfei <xuhf@rock-chips.com>,
	michael.riesch@collabora.com,
	stefan.klug@ideasonboard.com,
	mehdi.djait@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul Elder <paul.elder@ideasonboard.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v2 2/5] arm64: dts: rockchip: add ISP nodes to rk3588
Date: Mon, 24 Aug 2026 18:03:59 +0900
Message-ID: <20260824090406.3695880-3-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260824090406.3695880-1-paul.elder@ideasonboard.com>
References: <20260824090406.3695880-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_020430_756790_CC119E71 
X-CRM114-Status: UNSURE (   7.85  )
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
No change in v2
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index fc1fdbfd3162..22b78465a823 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -3590,6 +3590,63 @@ gpio4: gpio@fec50000 {
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
+			     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH 0>;
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


