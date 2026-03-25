Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C47F109C02D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gv6zYsFvAk5nI6Hr2X6Cdd9Va6QTcn6SLjG+pgjFN4U=; b=3u3uRfYI4Vzm0Pmzxchl9t0Cct
	zYI0UwzZ161fjwMF9DIjSekmSjmQ1kjgDjVu0TkeM/u49Ha6d1QV+nZMWGPmO0dM0TP3mARC9Bal9
	0goXLQcNNYQaIM+39xbRt6cQdE4zdNHyZqEjDZbCXlbWPIkqrj6KvV/QWojNfptWzn1SP3M/hY+rZ
	Lv2ZSC0EHr6jRcwcSGy0MDH3ssBrxrMIdq4Od7s2qP25tHEWQj2vvoUvr5zaPfwvcvFcp8oKHRTcu
	vkbLC4L5N7T+fhao9mrAPZ1JCpSiY+TKtZby2MX8oPAthod7cU/0PvY+juQ52mm2U1+Vx1EpIF1/c
	KYJLr+eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Pb6-00000003hVQ-2MHf;
	Wed, 25 Mar 2026 14:52:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PZk-00000003fiS-2GOP
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Mar 2026 14:51:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=gv6zYsFvAk5nI6Hr2X6Cdd9Va6QTcn6SLjG+pgjFN4U=; b=nT6vlGfmLMQMnOzNlHFOE20Yd6
	f8JH6R/C5o6A6zKjVHTkT7b7/7MsSlPDcJRfecrar+IGkOpBwEwUE4zyG2c2PjDdJApngQl4BoyLo
	QecLc2hI+DfgP8PnRNNnL6c+IHhusw9t8V494ZT5mWJLxj6AdLYwmb62zQEQNMlihIWqt/zhQ/5YJ
	7zYKFAfvel5/2GZEwYFceH1Id3hz/sZf82JcZpj6oxg31Bd+q2F5YTsog6W3dVV0mJMl970WCcOPr
	DFYhFlO8pibqRa+W3pfzBwonX5yHknw0v7l1Gt6nLI0ZGMYLacKE4aFCVLRz7kUTGZ+oUiMGFHEYX
	J4ZfAO7w==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PZf-00000006Oau-1NVA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:51:14 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1w5PZX-00050C-8q; Wed, 25 Mar 2026 15:51:03 +0100
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 25 Mar 2026 15:50:58 +0100
Subject: [PATCH v4 27/27] arm64: dts: rockchip: add rga3 dt nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260325-spu-rga3-v4-27-e90ec1c61354@pengutronix.de>
References: <20260325-spu-rga3-v4-0-e90ec1c61354@pengutronix.de>
In-Reply-To: <20260325-spu-rga3-v4-0-e90ec1c61354@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, nicolas@ndufresne.ca, 
 sebastian.reichel@collabora.com, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_145111_425347_CF9D725A 
X-CRM114-Status: GOOD (  10.09  )
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

Add devicetree nodes for the RGA3 (Raster Graphics Acceleration 3)
peripheral in the RK3588.

The existing rga node refers to the RGA2-Enhanced peripheral. The RK3588
contains one RGA2-Enhanced core and two RGA3 cores. Both feature a similar
functionality of scaling, cropping and rotating of up to two input
images into one output image. Key differences of the RGA3 are:

- supports 10bit YUV output formats
- supports 8x8 tiles and FBCD as inputs and outputs
- supports BT2020 color space conversion
- max output resolution of (8192-64)x(8192-64)
- MMU can map up to 32G DDR RAM
- fully planar formats (3 planes) are not supported
- max scale up/down factor of 8 (RGA2 allows up to 16)

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 44 +++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 7fe9593d8c198..87334636544f8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1273,6 +1273,50 @@ rga: rga@fdb80000 {
 		power-domains = <&power RK3588_PD_VDPU>;
 	};
 
+	rga3_core0: rga@fdb60000 {
+		compatible = "rockchip,rk3588-rga3";
+		reg = <0x0 0xfdb60000 0x0 0x200>;
+		interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_RGA3_0>, <&cru HCLK_RGA3_0>, <&cru CLK_RGA3_0_CORE>;
+		clock-names = "aclk", "hclk", "sclk";
+		resets = <&cru SRST_RGA3_0_CORE>, <&cru SRST_A_RGA3_0>, <&cru SRST_H_RGA3_0>;
+		reset-names = "core", "axi", "ahb";
+		power-domains = <&power RK3588_PD_RGA30>;
+		iommus = <&rga3_0_mmu>;
+	};
+
+	rga3_0_mmu: iommu@fdb60f00 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdb60f00 0x0 0x100>;
+		interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_RGA3_0>, <&cru HCLK_RGA3_0>;
+		clock-names = "aclk", "iface";
+		#iommu-cells = <0>;
+		power-domains = <&power RK3588_PD_RGA30>;
+	};
+
+	rga3_core1: rga@fdb70000 {
+		compatible = "rockchip,rk3588-rga3";
+		reg = <0x0 0xfdb70000 0x0 0x200>;
+		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_RGA3_1>, <&cru HCLK_RGA3_1>, <&cru CLK_RGA3_1_CORE>;
+		clock-names = "aclk", "hclk", "sclk";
+		resets = <&cru SRST_RGA3_1_CORE>, <&cru SRST_A_RGA3_1>, <&cru SRST_H_RGA3_1>;
+		reset-names = "core", "axi", "ahb";
+		power-domains = <&power RK3588_PD_RGA31>;
+		iommus = <&rga3_1_mmu>;
+	};
+
+	rga3_1_mmu: iommu@fdb70f00 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdb70f00 0x0 0x100>;
+		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_RGA3_1>, <&cru HCLK_RGA3_1>;
+		clock-names = "aclk", "iface";
+		#iommu-cells = <0>;
+		power-domains = <&power RK3588_PD_RGA31>;
+	};
+
 	vepu121_0: video-codec@fdba0000 {
 		compatible = "rockchip,rk3588-vepu121";
 		reg = <0x0 0xfdba0000 0x0 0x800>;

-- 
2.53.0


