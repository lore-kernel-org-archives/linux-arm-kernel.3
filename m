Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79352CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 20:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=36QFNbwKpWQBiZ/Fe/Z9uxp+qsQjQ+OgtXnHKonsaEA=; b=47CXqf0+JtZbQLnnZqQYfZfeJq
	8jakmPl5TkKuDahLdDrSKUEuNQ9++fK71+KCDnGXa4TCwzfJoOsnJK1q+xw97fWV00hEYla+vSLin
	V4pnSt13U9SWN1p7LCt2nmBQ91sDIKgNuGOyLCFmJU+cAUrDFE78AmGPat8dURQsl8Pad+XzkCIH4
	W9qoJcfkzcpfft+g1cJki3TBHzS+xYTUryturhXn/eEAQ9PAIoGUODFNNAiDM7fmd8qUTUJ6xw1p7
	BDwI5x7GUbhuz0FE9MralH8lKktNWVcD6t4FOMdAoOJwoj+D3hPRIfZtVyrm10afhmi+Nf2f9vqWc
	EUM/4fGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyc3p-00000008zOv-4C1a;
	Tue, 16 Sep 2025 20:13:58 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyc3o-00000008zNp-0M3c;
	Tue, 16 Sep 2025 20:13:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758053282; bh=36QFNbwKpWQBiZ/Fe/Z9uxp
	+qsQjQ+OgtXnHKonsaEA=; b=CzM2wqYQ1WOJb/8Rjo+g2lPSmj/n9yIXv7DHCra2ylSTUZTetO
	rljZfJ2xBoXxhoE+ULS1fN2e/pIqbURiQQWZZZAmWPoWcv2KZBAr/9yK4PKZZ9pHpojPU3OEiWv
	lfDlhVhsyXWBsbzOXCpOQgsyAo880BRWWHs0Hs5xSvHloIASIcQL9eHLOKqNv8Hhrq4uE+qJUzP
	kOkyfRKrqnzfI+oNiAUiHMV+7u0PHOG5bNlMMQwXtUOE/xWFth2l/NrZZPSmj+j5hIemNWVcrVG
	TuFAAq9mYhmF8UcV3TuS2xGQevf3q4cBGZVAeduaGxDcf43/8hGOHpTkERpu/5GsKrg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758053282; bh=36QFNbwKpWQBiZ/Fe/Z9uxp
	+qsQjQ+OgtXnHKonsaEA=; b=0u96kyB746Y0WhgRMmjOIkFjt9a6HosKTwmMRJtCouDDLKSdeB
	NSHiXR8/3PkwjeHIOxrDQbkSLZyhn5liqiDA==;
From: Dang Huynh <dang.huynh@mainlining.org>
Date: Wed, 17 Sep 2025 03:07:18 +0700
Subject: [PATCH 01/25] ARM: dts: unisoc: rda8810pl: Add label to GPIO nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-rda8810pl-drivers-v1-1-74866def1fe3@mainlining.org>
References: <20250917-rda8810pl-drivers-v1-0-74866def1fe3@mainlining.org>
In-Reply-To: <20250917-rda8810pl-drivers-v1-0-74866def1fe3@mainlining.org>
To: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Dang Huynh <dang.huynh@mainlining.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_131356_265108_D3FC3256 
X-CRM114-Status: UNSURE (   8.51  )
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

So we can add devices to these GPIO nodes for each board.

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
 arch/arm/boot/dts/unisoc/rda8810pl.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/unisoc/rda8810pl.dtsi b/arch/arm/boot/dts/unisoc/rda8810pl.dtsi
index f30d6ece49fb33d9c5c3ad9522c83bb8e4f8b488..6553fc102c6751696e75e4de614fc3428d182061 100644
--- a/arch/arm/boot/dts/unisoc/rda8810pl.dtsi
+++ b/arch/arm/boot/dts/unisoc/rda8810pl.dtsi
@@ -39,7 +39,7 @@ modem@10000000 {
 		#size-cells = <1>;
 		ranges = <0x0 0x10000000 0xfffffff>;
 
-		gpioc@1a08000 {
+		gpioc: gpioc@1a08000 {
 			compatible = "rda,8810pl-gpio";
 			reg = <0x1a08000 0x1000>;
 			gpio-controller;
@@ -76,7 +76,7 @@ timer@10000 {
 			interrupt-names = "hwtimer", "ostimer";
 		};
 
-		gpioa@30000 {
+		gpioa: gpioa@30000 {
 			compatible = "rda,8810pl-gpio";
 			reg = <0x30000 0x1000>;
 			gpio-controller;
@@ -87,7 +87,7 @@ gpioa@30000 {
 			interrupts = <12 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		gpiob@31000 {
+		gpiob: gpiob@31000 {
 			compatible = "rda,8810pl-gpio";
 			reg = <0x31000 0x1000>;
 			gpio-controller;
@@ -98,7 +98,7 @@ gpiob@31000 {
 			interrupts = <13 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		gpiod@32000 {
+		gpiod: gpiod@32000 {
 			compatible = "rda,8810pl-gpio";
 			reg = <0x32000 0x1000>;
 			gpio-controller;

-- 
2.51.0

