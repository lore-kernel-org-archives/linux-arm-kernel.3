Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F12C44500
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 19:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZdXKtmIEuJrtqSvdiabYiC6Ln4JkpgsnTVdQrUl4fM=; b=XBBCBnXfKjFRECA+zIzK3zxSco
	bWxCs8iTYILXOlhn1/n6ZU3BM7nBAXri43Nb3k2vN6uVL97vlcVYmioqRphRDnrnuupFQvP9kDftY
	6+qoaBTJ1QNNVG/LDo+Qpx9+aRhfWLwcQIfbkvvIwxUdsZ1uTu9x98sRuXC2sfYy/+9KS+6UGK0+8
	cZW3fyXRoI3T+yF+CG2nPrbavAyJzzpohr/Yn/tlOfPj0ALGZMumBHKs2xkaKCDCMkGEV9Y2xRtls
	cly41i3u+x9KMMXhHZGmhFrQlEQOhG8Pna67hwzN/5bAiX+1iEjjMDRjqZpW9Rq4TTQmOeDmhud4Z
	6NvyIH2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg5vw-00000008hRA-3X26;
	Sat, 04 Jul 2026 19:21:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg5vv-00000008hQe-1oU1;
	Sat, 04 Jul 2026 19:21:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3ADD440794;
	Sat,  4 Jul 2026 19:21:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2AD1C2BCC6;
	Sat,  4 Jul 2026 19:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783192906;
	bh=qTdriu943CBSGqpOSZgwkmagkjYfITvCJGhf7IcjgQw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QPwbxMpXjxqOf43NEBy3z1ALslcIWVuvkjPW9uJDIT3yLOfBFC5RvhY7OSfra09e5
	 mzaevUZ3/9X8+TOPYKJgXZAqg48eL8izX0vxthq1bbkBVneWbcIIWpwXUrGK6xDalT
	 JjJ0lBQXl94VicHq4suXcLce/z6uJcoBGtBTeMPfUzDR3hTMvUUXOYJ/7jPrjDokP3
	 0wxudwX6WHkdDwfAoToVlxsRn62rWjAbsaEtapV+77qBltpKC0TQaRZbJsDruj0npV
	 m3ktDmw9IUp0sCBV7PntiQnnf6xvb5kadWSyMhE2OY8UWioVjV4/I3F8BnBh/ix+1f
	 +E9DX/xeG9Y6g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF022C44500;
	Sat,  4 Jul 2026 19:21:45 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Sat, 04 Jul 2026 22:21:42 +0300
Subject: [PATCH 1/2] ARM: dts: mediatek: mt6572: rename fixed clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260704-6572-phase1-v1-1-61c2fe6be19c@protonmail.com>
References: <20260704-6572-phase1-v1-0-61c2fe6be19c@protonmail.com>
In-Reply-To: <20260704-6572-phase1-v1-0-61c2fe6be19c@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783192904; l=2336;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=SimJbn1seivrKmmRN96xb6J0kutHD3BQPIniNyDo7go=;
 b=c+Av2aNOkGN2greCY8UEhfA8rgi89AtUEVMFHxzvYp2a72Wv61tz27SXDVF8HqMAkkxfmlYAK
 3DNmltYVtOUDqqlorG25pEcknnMlMcZ7fLA3BB//ECcFmakEaij/WCw
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

Old-style naming like uart_clk, system_clk and rtc_clk doesn't actually
reflect hardware on the mt6572 SoC.

For example, uart_clk is used as parent for various parts of the SoC
like AXI bus, MMC controller, SPI, etc. While it usually shouldn't be
used as active parent, uart_clk is a wrong name. The same logic applies
to the rtc_clk, that is also used as input for MultiMedia subsystem
clock.

Therefore, rename all uart_clk, system_clk and rtc_clk to clk26m, clk13m
and clk32k to properly describe the hardware.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 arch/arm/boot/dts/mediatek/mt6572.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/mediatek/mt6572.dtsi b/arch/arm/boot/dts/mediatek/mt6572.dtsi
index ac70f266d698..fa0e5df766c2 100644
--- a/arch/arm/boot/dts/mediatek/mt6572.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6572.dtsi
@@ -28,19 +28,19 @@ cpu@1 {
 		};
 	};
 
-	uart_clk: dummy26m {
+	clk26m: clk26m {
 		compatible = "fixed-clock";
 		clock-frequency = <26000000>;
 		#clock-cells = <0>;
 	};
 
-	system_clk: dummy13m {
+	clk13m: clk13m {
 		compatible = "fixed-clock";
 		clock-frequency = <13000000>;
 		#clock-cells = <0>;
 	};
 
-	rtc_clk: dummy32k {
+	clk32k: clk32k {
 		compatible = "fixed-clock";
 		clock-frequency = <32000>;
 		#clock-cells = <0>;
@@ -64,7 +64,7 @@ timer: timer@10008000 {
 			compatible = "mediatek,mt6572-timer", "mediatek,mt6577-timer";
 			reg = <0x10008000 0x80>;
 			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_LOW>;
-			clocks = <&system_clk>, <&rtc_clk>;
+			clocks = <&clk13m>, <&clk32k>;
 			clock-names = "system-clk", "rtc-clk";
 		};
 
@@ -91,7 +91,7 @@ uart0: serial@11005000 {
 			compatible = "mediatek,mt6572-uart", "mediatek,mt6577-uart";
 			reg = <0x11005000 0x400>;
 			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_LOW>;
-			clocks = <&uart_clk>;
+			clocks = <&clk26m>;
 			clock-names = "baud";
 			status = "disabled";
 		};
@@ -100,7 +100,7 @@ uart1: serial@11006000 {
 			compatible = "mediatek,mt6572-uart", "mediatek,mt6577-uart";
 			reg = <0x11006000 0x400>;
 			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_LOW>;
-			clocks = <&uart_clk>;
+			clocks = <&clk26m>;
 			clock-names = "baud";
 			status = "disabled";
 		};

-- 
2.54.0



