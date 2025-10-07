Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF8CCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 08:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KYxsjaRTr0YIDX0OaHNzNaauOe6QZoKyZEM1XGczKEM=; b=unjJJWztNMhNZH5qex1tkYkQJQ
	JqtDYoV0iow9MPW8qeud1zET/phhjf61basP1nr2XPJH6ekmeinQ6jrJzvOheBSAB6362jSIS66iL
	gP+t+7DX5RrMehDZP2pN6vjKToZj58wpnpzDbECjgc6ciJaKQYm+ZTzfvrxRB07Z0uPLSfNkwhjgv
	DYyx8oSX+XV9J2/5SQCUEWiqhmNkeZWN4BX7z6QCuBzwylTOqsFZj+Ezq7OkPJ2/D3z/4oZY1vSB5
	fDq2mr1cCcdDFnZohhPF7Xv+rdlbEOJ4PoIOqGWiQ5XlqfbpjcLheCL0iZ4nNuVb+TsL9JS8TTPj7
	h1xrN57w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v638T-00000001ZAN-3xDV;
	Tue, 07 Oct 2025 08:33:29 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6381-00000001YVE-042e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 08:33:06 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1v637z-0002Hb-5k; Tue, 07 Oct 2025 10:32:59 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 07 Oct 2025 10:32:07 +0200
Subject: [PATCH 14/16] arm64: dts: rockchip: add rga3 dt nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251007-spu-rga3-v1-14-36ad85570402@pengutronix.de>
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
In-Reply-To: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_013301_120400_9E8E201C 
X-CRM114-Status: UNSURE (   9.33  )
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

Add devicetree nodes for the RGA3 peripheral in the RK3588.
They are based on the vendor downstream device nodes, but were adjusted
to work with the rockchip-rga and iommu driver kernel.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 46 +++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 70f03e68ba550d6b9142131dcca86e8ded36e2f1..08885d9c19e0c104ab0f723ec161b83998cfb9c7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1172,6 +1172,52 @@ rga: rga@fdb80000 {
 		power-domains = <&power RK3588_PD_VDPU>;
 	};
 
+	rga3_core0: rga@fdb60000 {
+		compatible = "rockchip,rk3588-rga3";
+		reg = <0x0 0xfdb60000 0x0 0x200>;
+		interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "rga3_core0_irq";
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
+		interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
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
+		interrupt-names = "rga3_core1_irq";
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
+		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
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
2.51.0


