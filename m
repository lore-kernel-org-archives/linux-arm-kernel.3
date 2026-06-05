Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D8BCD6E6E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 22:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d4yYSQXe7OPOMWceP4wbNkjroxC66deeYVcmM1POKAw=; b=Rl7cLMpMbJB22QqV84SSJm7jrO
	oakn6vT9JpVIlF177I9XYX+JCsP2tHPh7gOeIeigSpGr3ckcVvn/qmdE/XY2b8ghjXNo22KeJwiJ+
	XxNwVtRbK4IbGLQ28/c8o+iOucZPBlF8QDjj/PP1BfLpC47Hhs3XfxGrK+FkEmPQshy3BIKlesp3A
	VbxxJe4OC09v4QqNSLirKAf/UkoJrhu4dKE8F/UI/yHTfe+r4FmFJrt9FtbhW49+eU0iIhuam51jl
	3wdvGvHGnsckgV2DNC9Oiu2Mv/KxY1c42T55OIS/aeve5DNpmyE0x0levLnODvNcmoG881kH/Soyh
	7wn1hqAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVcij-00000001FNQ-37sL;
	Fri, 05 Jun 2026 22:08:53 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVciX-00000001Eq2-3thB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 22:08:43 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wVciF-0000LW-J7; Sat, 06 Jun 2026 00:08:23 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Sat, 06 Jun 2026 00:07:02 +0200
Subject: [PATCH 16/17] arm64: dts: rockchip: add rga3 dt nodes to rk3588
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260606-spu-rga3multicore-v1-16-3ec2b15675f7@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
In-Reply-To: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_150842_199762_3BCCD6C5 
X-CRM114-Status: GOOD (  10.30  )
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
Link: https://patch.msgid.link/20260521-spu-rga3-v7-28-3f33e8c7145f@pengutronix.de
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
(cherry picked from commit 25ee898961a2c661e4cd72bc98f0060f1cd11222)
picked from linux-next to have the necessary RGA3 nodes available.
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 44 +++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 4fb8888c281c8..a4f44af512375 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1262,6 +1262,50 @@ vpu121_mmu: iommu@fdb50800 {
 		#iommu-cells = <0>;
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
 	rga: rga@fdb80000 {
 		compatible = "rockchip,rk3588-rga", "rockchip,rk3288-rga";
 		reg = <0x0 0xfdb80000 0x0 0x180>;

-- 
2.54.0


