Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44715C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 14:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZdXKtmIEuJrtqSvdiabYiC6Ln4JkpgsnTVdQrUl4fM=; b=4T1gqm5jxwUiYvHdtNE3b5iu6r
	A5dSL85cKCGijV5DdCFBNw/yjm7FCHgvk0deQIk82rVKBF5fzk8WvWe1ZPIKJ5bua1ofVfwKgxJ4o
	CqgDP0bi249vnKlPxTC/TOK8BLptTPohJh+eFz9gXO1Jzw61ZgYvpHHfLbxrXMb/HV/ZA789JjQYL
	e8YUzpEfKOg9xtu4Es+AFMW01gOvOQTgcdRltYlOaWdBLs6sSJ7Us1Hg3D/mWHMkELplOXp6GgXvN
	mY6PABFm8wlHoyjp7gzJRIr/36YvyfZVMgrTli2p6Fmu6e9I0kUh53Xg5A9EQjR5/Wm9jh1RYCauQ
	rD3IzAfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whplw-00000002lg4-16O8;
	Thu, 09 Jul 2026 14:30:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whplu-00000002lf2-24Ft;
	Thu, 09 Jul 2026 14:30:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A43CD61382;
	Thu,  9 Jul 2026 14:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E4ECC2BCC9;
	Thu,  9 Jul 2026 14:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783607437;
	bh=qTdriu943CBSGqpOSZgwkmagkjYfITvCJGhf7IcjgQw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uGsGBr9mH5qy72a8tGVMwU9Gn4de88iSkZsjsyoPk2N6YMAwphHkHjRmgyhyBa15p
	 QSNHap7pPzlR8DWEEtXbTGmyYVRc3JyXpiq+aOhjG647dsYB7u/FKs7qjeJsINKKR6
	 rVngQ3jwbEeGhFOUgWdATU0Ys9Vo3GHUfiM7OE+jmy2MLKgdGVk7rEhyhSHUNqPi9t
	 Fe5Rxbm28bXocTKOgUhpToz72azs1E43FIS843ahLFdR7UD6qvA2GcsCW7sUTXY0YF
	 Nv56FS8h7ErS5SG6/RQUh1KFKy3Cqa1kWLQ5j8kZy5t0T6O+atMBbO4fWmFhtdbmal
	 kORphNnewNWLA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F03BC44506;
	Thu,  9 Jul 2026 14:30:37 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Thu, 09 Jul 2026 17:30:27 +0300
Subject: [PATCH v2 1/2] ARM: dts: mediatek: mt6572: rename fixed clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-6572-phase1-v2-1-1fd4a69542ab@protonmail.com>
References: <20260709-6572-phase1-v2-0-1fd4a69542ab@protonmail.com>
In-Reply-To: <20260709-6572-phase1-v2-0-1fd4a69542ab@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783607435; l=2336;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=SimJbn1seivrKmmRN96xb6J0kutHD3BQPIniNyDo7go=;
 b=VNI59q6VB4Q6KgEj6fN0jBXh2LcuBZP4Qhr0xeTN/qHjNCT/57zhZwCFs1cMbQWusZ2WWzEZ7
 Ymkjm9tkdETCUN41G+AD0y/m2EvZwp3Dgau03S0wre1mnCRnG/9K8PK
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



