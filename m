Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A04C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbhnIX0LPgAXdQzxD3mczZeY/HFs3iKi7JECXxezbkc=; b=I3g0y/1aYoinxxex0vx2YAAtbT
	jnZeCWVjn0BaGmQsUzepxBXsGPqEa4lDzCGV3LysnVzamITqVL0Nvm7dDSgiOYE57BCZROmkLHIKN
	pGR4xBqvL4QROX+8ze1bo7gdNCNyf5RNN+Yq0RgtuN6gzfauWsOEVRhAiaEB5dx/Ybi+A9guAjBxR
	X2LYV/8npdRQOIxTV0dNxzgsRzaLQbAqByL3DIStSfT8uT1DTKwCWJRfLuDaUgeH2JKpuO9ZVLMrP
	yy02fRD2gtYiReZK6yPj1JyRjOCohMW62nFQxLgaN5OOZd4Rz48GtCnETn2BiXZUYg0L9bpOgDD7N
	FW0tapfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90dU-00000005XRu-0XjC;
	Tue, 22 Sep 2026 13:34:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90dN-00000005XPS-1sUP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:34:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DD78460DFF;
	Tue, 22 Sep 2026 13:34:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC491F00899;
	Tue, 22 Sep 2026 13:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790084048;
	bh=rbhnIX0LPgAXdQzxD3mczZeY/HFs3iKi7JECXxezbkc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KSr3+o9CspX4V96LrzeFak2AXcrzj4Pu6unetSfSxwNP2EgsI3PUCuli4cF8KA+5E
	 k7CzRR9FLQ46foTWcduGz2O6VxyZHaU0LyWgTfrJIDQk9smjqMysXRAMtmp/s31pBx
	 o6olwU16qK/y+v+tM3+IyuzZN+q2S7DTjyITRMVVXoygwpX5tnLe6vptHQmaz5ZUDW
	 zFqWJRYkvhfyC7Q26v2b+wRb/6QIhyBZAPL1ukLTwJJFF7qzXBwdHbrTDOS6rXb5wO
	 /1O3Hz8bvPd9jw2Q3LOXeQnSlc2bFS/v4fuCIFwn0GJEvlAgbyiOg/BLvE45D0tDuI
	 Gg94boNpqEGgg==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 22 Sep 2026 15:34:00 +0200
Subject: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-mali-c55-renesas-dts-v1-1-cd63cdb51033@kernel.org>
References: <20260922-mali-c55-renesas-dts-v1-0-cd63cdb51033@kernel.org>
In-Reply-To: <20260922-mali-c55-renesas-dts-v1-0-cd63cdb51033@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
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

From: Daniel Scally <dan.scally@ideasonboard.com>

Add the Input Video Control Block and Arm Mali-C55 ISP to the device
tree file for the RZ/V2H(P) SoC.

[Rebase onto v7.3-rc1, place the nodes in address order, and sort
 the interrupt properties. - Linus Walleij]

Assisted-by: LLM
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 52 ++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 639693d464a7..beba6c053a40 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -1839,6 +1839,58 @@ queue3 {
 			};
 		};
 
+		ivc: isp-input@16040000 {
+			compatible = "renesas,r9a09g057-ivc";
+			reg = <0 0x16040000 0 0x230>;
+
+			clocks = <&cpg CPG_MOD 0xe3>,
+				 <&cpg CPG_MOD 0xe4>,
+				 <&cpg CPG_MOD 0xe5>;
+			clock-names = "reg", "axi", "isp";
+
+			interrupts = <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&cpg>;
+
+			resets = <&cpg 0xd4>,
+				 <&cpg 0xd1>,
+				 <&cpg 0xd3>;
+			reset-names = "reg", "axi", "isp";
+
+			status = "disabled";
+
+			port {
+				ivc_out: endpoint {
+					remote-endpoint = <&isp_in>;
+				};
+			};
+		};
+
+		isp: isp@16080000 {
+			compatible = "arm,mali-c55";
+			reg = <0 0x16080000 0 0x200000>;
+
+			clocks = <&cpg CPG_MOD 0xe2>,
+				 <&cpg CPG_MOD 0xe4>,
+				 <&cpg CPG_MOD 0xe5>;
+			clock-names = "vclk", "aclk", "hclk";
+
+			interrupts = <GIC_SPI 859 IRQ_TYPE_LEVEL_HIGH>;
+
+			resets = <&cpg 0xd2>,
+				 <&cpg 0xd1>,
+				 <&cpg 0xd3>;
+			reset-names = "vresetn", "aresetn", "hresetn";
+
+			status = "disabled";
+
+			port {
+				isp_in: endpoint {
+					remote-endpoint = <&ivc_out>;
+				};
+			};
+		};
+
 		dsi: dsi@16430000 {
 			compatible = "renesas,r9a09g057-mipi-dsi";
 			reg = <0 0x16430000 0 0x20000>;

-- 
2.55.0


