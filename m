Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1942CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 10:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTnvRcu6CExjCOa3IR8OBLHNmSH5HcRjNeWV6GuDCTs=; b=iIwE+TbPT7bUdONUvPRsBj+/wZ
	sEL4YyX0SSpfnrv5N7WCQTfLRo7izK2hILUACkk8RsQMknSBHZXmDs2GwYQb5YE6dfn8KCKzN9AP4
	v6UKmMS9C1IxPKo0Kp+VAKFA7orNdlFcElZX5sLrQ4u017TOY+0ImJgyN2/i4SyKRv8mczxAkRDEb
	LQ51wNbRQr3Ie7VbpdM4CE20EL1+FP2CS4PaeB/TP21tcDCmhNxmQG1/UR7Cs9GR6dUbTTNw+fahm
	TW0c3nxgbyZB+JOsV85/GtedFf5OrcGTlxlHjOOJN1cnOnxAzttn6tqp2RZadOUNOFAjswhFLgZ1o
	3MPFrCaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMxt-0000000AUIb-2iZP;
	Fri, 22 May 2026 10:18:49 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMxp-0000000AUCx-3DXL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 10:18:48 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id D0B5737002A6
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 10:18:22 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 48CC2B408D4; Fri, 22 May 2026 10:18:21 +0000 (UTC)
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 5E19EB408CC;
	Fri, 22 May 2026 10:17:19 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 14/14] arm64: dts: imx8mp: add VC8000E encoder node
Date: Fri, 22 May 2026 12:16:53 +0200
Message-ID: <20260522101653.2565125-15-paulk@sys-base.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522101653.2565125-1-paulk@sys-base.io>
References: <20260522101653.2565125-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_031846_010413_CEA84D12 
X-CRM114-Status: GOOD (  10.78  )
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

From: Marco Felsch <m.felsch@pengutronix.de>

Add support for the Versilicon VC8000E multi-codec stateless encoder.
The IP integrated on the i.MX8MP supports H.264 and H.265 encoding.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index a3de6604e29f..4e63c2b16c1a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2290,6 +2290,17 @@ vpu_g2: video-codec@38310000 {
 			power-domains = <&vpumix_blk_ctrl IMX8MP_VPUBLK_PD_G2>;
 		};
 
+		vpu_vc8000e: video-codec@38320000 {
+			compatible = "nxp,imx8mp-vpu-vc8000e";
+			reg = <0x38320000 0x10000>;
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
+			assigned-clocks = <&clk IMX8MP_CLK_VPU_VC8000E>;
+			assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>;
+			assigned-clock-rates = <400000000>;
+			power-domains = <&vpumix_blk_ctrl IMX8MP_VPUBLK_PD_VC8000E>;
+		};
+
 		vpumix_blk_ctrl: blk-ctrl@38330000 {
 			compatible = "fsl,imx8mp-vpu-blk-ctrl", "syscon";
 			reg = <0x38330000 0x100>;
-- 
2.53.0


