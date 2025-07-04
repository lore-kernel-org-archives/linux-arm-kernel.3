Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E84C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 16:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UujN1t33SyhwG/TKawVHVwktQEIgDP0r9/yAW0efrXs=; b=0NcPIZvAx6AlHyndiujJ5GpJ9d
	egt6fj8/EXw4lG6y2dlQmvwlgsTH7dW4y78ckzXQWmkkwYOr9Neu1wECOP8ASonbrw2LLs4E5/ytY
	gWsNTMcKr73TBVGp6vQHUxSI57jGOfcFDRPcC4xv216bM5sF33sVZjkDfHJoMD6GoFiMEKMJHx7Qc
	tPHUotkecNBCo1BeTk4R4QdFYtnX3jtxqbswq0Hb6BneoeOLfEgmVgLRNmUzlW4fIGjjhRqsQyxgH
	jI3a6UYPEQUVAWVQhlWSLEaLZZGEhgQfa6HmV/8CWj3TFs9EZtXyGyXjDJ/YM0P24ycM2ZFatifWo
	r69SiZJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXj8N-0000000EwEk-2MtN;
	Fri, 04 Jul 2025 16:19:31 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXip4-0000000EtdL-2aRE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 15:59:35 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 831091F0007C
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Jul 2025 15:59:06 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 40293ACA6A7; Fri,  4 Jul 2025 15:50:58 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 682FEACA658;
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
Subject: [PATCH v8 6/9] ARM: dts: sun8i: v3s: Add support for the ISP
Date: Fri,  4 Jul 2025 17:46:23 +0200
Message-ID: <20250704154628.3468793-7-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704154628.3468793-1-paulk@sys-base.io>
References: <20250704154628.3468793-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_085934_802132_9DEA62B6 
X-CRM114-Status: GOOD (  15.73  )
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

The V3s (and related platforms) come with an instance of the A31 ISP.
Even though it is very close to the A31 ISP, it is not exactly
register-compatible and a dedicated compatible only is used as a
result.

Just like most other blocks of the camera pipeline, the ISP uses
the common CSI bus, module and ram clock as well as reset.

A port connection to the ISP is added to CSI0 for convenience since
CSI0 serves for MIPI CSI-2 interface support, which is likely to
receive raw data that will need to be processed by the ISP to produce
a final image.

The interconnects property is used to inherit the proper DMA offset.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
index bfe02295f45d..f63534a02706 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
@@ -695,6 +695,14 @@ csi0_in_mipi_csi2: endpoint {
 						remote-endpoint = <&mipi_csi2_out_csi0>;
 					};
 				};
+
+				port@2 {
+					reg = <2>;
+
+					csi0_out_isp: endpoint {
+						remote-endpoint = <&isp_in_csi0>;
+					};
+				};
 			};
 		};
 
@@ -753,5 +761,32 @@ csi1: camera@1cb4000 {
 			resets = <&ccu RST_BUS_CSI>;
 			status = "disabled";
 		};
+
+		isp: isp@1cb8000 {
+			compatible = "allwinner,sun8i-v3s-isp";
+			reg = <0x01cb8000 0x1000>;
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_CSI>,
+				 <&ccu CLK_CSI_SCLK>,
+				 <&ccu CLK_DRAM_CSI>;
+			clock-names = "bus", "mod", "ram";
+			resets = <&ccu RST_BUS_CSI>;
+			interconnects = <&mbus 5>;
+			interconnect-names = "dma-mem";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					isp_in_csi0: endpoint {
+						remote-endpoint = <&csi0_out_isp>;
+					};
+				};
+			};
+		};
 	};
 };
-- 
2.49.0


