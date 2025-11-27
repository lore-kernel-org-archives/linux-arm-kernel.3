Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F367D11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 13:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=58EXseqRRaEpX0i6JdbbsX9dgi/fbB1jVeNNdBUEjzA=; b=C5HF9GAQ2Hty5Vh+gmpQuV0qT/
	MfcNbr4ntCPHcPCqB5AM1UdYyKb+E+V81O88lJzrNPjgATqd8ZBGA4aPi2v1GKwnICjGsWw5aATkd
	bJB/RTL6RcJgKgOIjiJ0GtSOOD/iKKQEKWNKEhtoQrPXT4uvh1Fz+lIdEgAuud1IhdiIBVE19gBxe
	dm6iHzaXZEFDUmI1KWBETiv4+NlRQIO0CjkGmNnMfEzHTsZXp+o2ZsWUmOT+4Z2FVPJkN5vCZm8dm
	yHXGZaIm2PHAYxkmoeLeL+6R6gLyzxL20Lw+x+OZbpvis1qo4aGhavTmdyZ6j8n1S1yWqchxjy5Pl
	FWkjfimw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOboI-0000000GeMX-07UU;
	Thu, 27 Nov 2025 13:13:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOboE-0000000GeM9-3pPC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 13:13:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C7A7433E1;
	Thu, 27 Nov 2025 13:13:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0790C4CEF8;
	Thu, 27 Nov 2025 13:13:16 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: renesas: r9a06g032: Add Ethernet switch interrupts
Date: Thu, 27 Nov 2025 14:13:13 +0100
Message-ID: <53d45eed3709cba589a4ef3e9ad198d7e44fd9a5.1764249063.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_051318_969720_C404F128 
X-CRM114-Status: UNSURE (   8.33  )
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

The Ethernet switch device node still lacks interrupts.  Add them.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
"[PATCH net-next 04/11] dt-bindings: net: dsa: renesas,rzn1-a5psw: Add
RZ/T2H and RZ/N2H ETHSW support"[1] will make interrupts and
interrupts-names required.

Based on the example in the DT bindings[2], Compile-tested only.
To be queued in renesas-devel for v6.20.

[1] https://lore.kernel.org/20251121113553.2955854-5-prabhakar.mahadev-lad.rj@bp.renesas.com
[2] Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index 71d655b0565af1a5..5530eb9e891fa45c 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -453,6 +453,12 @@ switch: switch@44050000 {
 				 <&sysctrl R9A06G032_CLK_SWITCH>;
 			clock-names = "hclk", "clk";
 			power-domains = <&sysctrl>;
+			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dlr", "switch", "prp", "hub", "ptrn";
 			status = "disabled";
 
 			ethernet-ports {
-- 
2.43.0


