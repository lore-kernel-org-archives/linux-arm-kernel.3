Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98E4CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 20:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DW1/S0HVtCpYcF972l1YzNF340ZyEzAGVm8BR6/or/8=; b=qiNI0g1H3As5GOAtCLr24Wid2a
	VAEzD2bxOYOInMlKrgXs7gzl8MNccaUB8C1l/dGmz209lMuiCv9zqvXr/Kz5HVzQjvt5vgs8E4x65
	1JTMfmdwq86If4SB5tKLIh+S5kJpg6FeSBfapKH0GAU8eclqEa81g9SBDsKmcYKdtc4FdquykPzuD
	X42zNmWSbXrMvAlqferYdqmsTYyy7IjOtp5nGSanxocWTk/a5JTg3RSQD7106jh+WXkIGFxTBuVle
	2AUyRN/vS+tHNiCyAhTSE1o3mcfrlbyYfi7amMZfJnrhIFddMkN5zW0RCWqtD+3EDnd9aHEpbeF7D
	Uy7CPQ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycF7-000000090vP-2eBP;
	Tue, 16 Sep 2025 20:25:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycEv-000000090iF-3bcU;
	Tue, 16 Sep 2025 20:25:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F8B944074;
	Tue, 16 Sep 2025 20:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00F17C4CEF9;
	Tue, 16 Sep 2025 20:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758054325;
	bh=g8WKS6OWWxn2i9b93Vms3rDWq8kUvZxINbkSWPCdUAg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ngdC1s+8aKoELBX4ttC402zvWkjkBhpUXSFAfc8yZIPOIJQESQSAmr92qwfyf4ISL
	 aV71PAQWX5zh/MDkk89hEAG6X1g5iO1KTkUznbCOZOFoQxfLcfOKLVFR93qLPdZoGU
	 TfF+S8w5u/Ru+Hf758byUnWrjqdV1Gpk3rMef10MINTa/RUFAPPu4YFuBLM7wHjCN9
	 4WSRAOnBUBR06RovRp6a8scMic+jYtIVJ0vTRod+T3bx9Aj/8iAsISJa8sdMSZtrGb
	 BsFvzyES5fd9H8Wv8hmQ31rxJSFA+Em+eeGxOhJzdEYDzVY5D8/Oljd2fOxCXO/06R
	 gITtXiOdLeB9w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7723CAC59B;
	Tue, 16 Sep 2025 20:25:24 +0000 (UTC)
From: Dang Huynh via B4 Relay <devnull+dang.huynh.mainlining.org@kernel.org>
Date: Wed, 17 Sep 2025 03:24:58 +0700
Subject: [PATCH 01/25] ARM: dts: unisoc: rda8810pl: Add label to GPIO nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-rda8810pl-drivers-v1-1-9ca9184ca977@mainlining.org>
References: <20250917-rda8810pl-drivers-v1-0-9ca9184ca977@mainlining.org>
In-Reply-To: <20250917-rda8810pl-drivers-v1-0-9ca9184ca977@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758054322; l=1425;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=gehgcAARQ8SuL4G+2lQ4aVqQ18cLEbIKhDsg1ccbtlY=;
 b=vkVKhU4yFFQMGNx4j1vlk9SkqiDmkH60RhCQ7wo0S9uGQumeaKqLqNlS0OScNrteBhazOecZ8
 T9KNvTq6xRZAUqrRvG/mu3SAX3P636QQs8gFg7biuveiCHR5chOs6NK
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=
X-Endpoint-Received: by B4 Relay for dang.huynh@mainlining.org/20250917
 with auth_id=526
X-Original-From: Dang Huynh <dang.huynh@mainlining.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_132525_943002_69B725DC 
X-CRM114-Status: UNSURE (   9.62  )
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
Reply-To: dang.huynh@mainlining.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Dang Huynh <dang.huynh@mainlining.org>

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



