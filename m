Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD21CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 20:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vv2QqNe+UojS4k6Ug098w6fG5af5jXcReOpiKj9zEU8=; b=QzJhqP/pY4QbCQtk4QGIhetIrR
	Y/aGanKxUU61JHY3u+bZf1bOfIu68X9K6rpugUO9D1cozURF0FcHrQHKXyBUGODI/wUaJSYVKvOLB
	F7aL7N/IRLBOWwv38fQPZwQC0kWFJ4dSelen86dXeDkE8Ijbpc3zw+PoS6ZSoC6ctdjAMQQhg1jeE
	siQHrw5v8ZUzB/dDhydI5SZL1FcanRWxlNWb6oHpOMrGBtuztfVwyJ4+mBrFKSuD+rvZsMvFoHdkB
	DpwSexaSuNMit3IdXg5iTzJguxZnYxcuXIwa5kX6nR16ViGtqDu1p2TlJOGzgyM4c7ad6FsthOdTc
	o26i5FMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycFT-000000091N4-2xWE;
	Tue, 16 Sep 2025 20:25:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycEz-000000090kA-0fdX;
	Tue, 16 Sep 2025 20:25:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6287444DC4;
	Tue, 16 Sep 2025 20:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 380DDC2BCC7;
	Tue, 16 Sep 2025 20:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758054326;
	bh=OdDjeUrsbxYe5gyTTAMfg2jz6GQSgqKAHbK2zdue/s0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=C4KS5aRUOYF5wocufmuf97G4mdCvA4nqIq9eLu19lXxVMcFNMoBpkUUMWb4pbTgBJ
	 ev7r8X+MwmWhTbKLeUKNLxnwEVqwIxJwNNhzOmI/YOA0siR6PT4BQLZwSZX0O5a1Jt
	 hijKOleuESsXTOoj1c/EyAeMFKHNgLc7Ub9UQxLhkjvBSKnb/YtGWjXFJNPWsq8jtA
	 5/dmiJMUYbNh+SiwUTO/UZne2p2opGbfb3/ohuFeWeZ7UapxJfYQGdkfYbWmnVjARk
	 gbqGeCj2FYlDkOvodxgSy2LIYFKHVOIYWr8kyx7GMYvz1u7jTSBwbmMlLGmuxJnX96
	 fDLNmC7KpIeMw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23638CAC59D;
	Tue, 16 Sep 2025 20:25:26 +0000 (UTC)
From: Dang Huynh via B4 Relay <devnull+dang.huynh.mainlining.org@kernel.org>
Date: Wed, 17 Sep 2025 03:25:17 +0700
Subject: [PATCH 20/25] dts: unisoc: rda8810pl: Enable IFC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-rda8810pl-drivers-v1-20-9ca9184ca977@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758054322; l=799;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=ESVrh/e66fpCx8hkda0seGPWiRBFpNz918jLvjzC/2M=;
 b=xjdSUQMpB1QsdnW8tgHCeT8pweYzkXjix4jRKL4LWTM9cauqSrIz8lT0CyfI+75tbl+ectZHh
 CfYuGRCaLUQBLS7JKFKy7prh17FG7FrBkJ57XLn48PXdB9/L1RvywvP
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=
X-Endpoint-Received: by B4 Relay for dang.huynh@mainlining.org/20250917
 with auth_id=526
X-Original-From: Dang Huynh <dang.huynh@mainlining.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_132529_332848_34F73BB1 
X-CRM114-Status: UNSURE (   8.42  )
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

Enable IFC so we can use it with I2C, SPI, SDMMC.

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
 arch/arm/boot/dts/unisoc/rda8810pl.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/unisoc/rda8810pl.dtsi b/arch/arm/boot/dts/unisoc/rda8810pl.dtsi
index e90ae7845de7b79e55e9cd339a82313b423e0252..4b3ae19e9da41ee9ffa76dd4fff01824c07ce045 100644
--- a/arch/arm/boot/dts/unisoc/rda8810pl.dtsi
+++ b/arch/arm/boot/dts/unisoc/rda8810pl.dtsi
@@ -212,6 +212,12 @@ uart3: serial@90000 {
 			interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
+
+		ifc: dma-controller@f0000 {
+			compatible = "rda,8810pl-ifc";
+			reg = <0xf0000 0x1000>;
+			#dma-cells = <1>;
+		};
 	};
 
 	l2: cache-controller@21100000 {

-- 
2.51.0



