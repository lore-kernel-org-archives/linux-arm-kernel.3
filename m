Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CD0C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 16:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xoEX/dn4HyN+62SnRnsbKwPUXGvzzqi3u5k3tvnUotg=; b=ahtP10GtV1uEjW/I8fbhmr1MJn
	IM3oTL/DaGu5o0hyejDv1n5RlFhHuOAGarfqPWwiwMV3Dm7dHy3rpAnw60TtpSVTxiAIxGx652VvJ
	9u/Ym9xYpbdorikGGEoL/szoiJJz2gBw6jiE/dykZ3ctz5Agva8CdriwE3sx+R4XlWJi7tMiyTW3d
	67sJSJku9gZmtvnTkHhn2iKy+FQfQepx5AJJoCHPkc9Jj5JB+t1bM/zEmYwTuhldBKEp0t5EiXmmh
	CXqOH4HFiayQx/12rgJLRakrvSJ081Iy6nrVmKNqqMFR3hiHHb2smgdDX8vJItwyUU0MgvSuZgOQ7
	muyvYeBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXiz4-0000000Euos-2GGq;
	Fri, 04 Jul 2025 16:09:54 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXioR-0000000EtUv-2MKC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 15:58:56 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id A23581F00036
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Jul 2025 15:58:53 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 55B45ACA6B3; Fri,  4 Jul 2025 15:51:41 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id C5661ACA659;
	Fri,  4 Jul 2025 15:46:40 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v8 7/9] ARM: dts: sun8i: a83t: Add MIPI CSI-2 controller node
Date: Fri,  4 Jul 2025 17:46:24 +0200
Message-ID: <20250704154628.3468793-8-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704154628.3468793-1-paulk@sys-base.io>
References: <20250704154628.3468793-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_085855_765985_DDE50197 
X-CRM114-Status: GOOD (  13.17  )
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

From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

MIPI CSI-2 is supported on the A83T with a dedicated controller that
covers both the protocol and D-PHY. It is connected to the only CSI
receiver with a fwnode graph link. Note that the CSI receiver supports
both this MIPI CSI-2 source and a parallel source.

An empty port with a label for the MIPI CSI-2 sensor input is also
defined for convenience.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi | 43 +++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi b/arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi
index 6f88d8764e6a..cc107c6030de 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi
@@ -1062,6 +1062,49 @@ csi: camera@1cb0000 {
 			clock-names = "bus", "mod", "ram";
 			resets = <&ccu RST_BUS_CSI>;
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+
+					csi_in_mipi_csi2: endpoint {
+						remote-endpoint = <&mipi_csi2_out_csi>;
+					};
+				};
+			};
+		};
+
+		mipi_csi2: csi@1cb1000 {
+			compatible = "allwinner,sun8i-a83t-mipi-csi2";
+			reg = <0x01cb1000 0x1000>;
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_CSI>,
+				 <&ccu CLK_CSI_SCLK>,
+				 <&ccu CLK_MIPI_CSI>,
+				 <&ccu CLK_CSI_MISC>;
+			clock-names = "bus", "mod", "mipi", "misc";
+			resets = <&ccu RST_BUS_CSI>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				mipi_csi2_in: port@0 {
+					reg = <0>;
+				};
+
+				mipi_csi2_out: port@1 {
+					reg = <1>;
+
+					mipi_csi2_out_csi: endpoint {
+						remote-endpoint = <&csi_in_mipi_csi2>;
+					};
+				};
+			};
 		};
 
 		hdmi: hdmi@1ee0000 {
-- 
2.49.0


