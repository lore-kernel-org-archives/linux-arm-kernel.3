Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C63D59D8C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 20:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vZPflG+he1U64nbI+yk8p4zF79ylOHh79VYoaogOdCc=; b=2bFJGh0U4WuIm5FjIP4F/ENisd
	N5pgRVxG+PolLyPzR7zNliG6yXl8GDCOIDOLwEL2ndC8PsbApNiPKuD3rumJbsJHeLq0DMBYGRIrg
	g0IKcZcuO+r6pKiQ7l229+2s4fgJTWJwQAb0AvbcfrOtf61o5o+xOO1VL1i4Bivdld1I6jiIda6Te
	IuB7cku4NvBAggHCDrtjr2FxeI2UWgFpLB9Ck+EIOvg2lgOkUlTVivtjGw9os/KF+pkiK7vHVhK/K
	ITowB2mrBizQeyKBupkTD4FGbe/gVX5KaVG1qWiL/EEvz3uO7P1aeJGZ6y7gQobvSAMWwvrTQDPSF
	n8VRKZZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU9pG-000000013an-3Bau;
	Fri, 12 Dec 2025 20:33:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU9pF-000000013Zl-0xAX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 20:33:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7CF87601AF;
	Fri, 12 Dec 2025 20:33:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B6FDC116B1;
	Fri, 12 Dec 2025 20:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765571596;
	bh=QBowjkhrZT9dUgwW3OEeOfAAxYk8PKAFF0Wg/jajdWo=;
	h=From:To:Cc:Subject:Date:From;
	b=GIsLIGzr6vy2YxvKlDttWnjjUxOyJ1HXsqpyTT/BFbzSfrUw+wrUukuAIxoCNiOC9
	 GiFMQY1MILLU4SjbDrhUO2MHB2ZiquHSUyTpk9C6JSiKyf0opAdMDxPbVHR2PuQaGY
	 lp2ijscFgiSeUfSXLG8Daxkkzhd25L4uM1B2G+c/522jGOBNemHQy+Ksp/+GtIoe7i
	 FwBSQxCnVJf250dy3B4PnBqJh7hd7lxlYezbM1LLPKl718/mH1NvnMM8ep9n+mmXRG
	 pVRZQrG5OhpCnbfwijZrZlNQn2+ICZQkSvyGfhqwvBdicY9OaadK98pawMUqPFqdaG
	 y01Ou1LsNcCNQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: dts: microchip: Drop usb_a9g20-dab-mmx.dtsi
Date: Fri, 12 Dec 2025 14:32:14 -0600
Message-ID: <20251212203226.458694-8-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This .dtsi file is not included anywhere in the tree and can't be
tested.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../boot/dts/microchip/usb_a9g20-dab-mmx.dtsi | 93 -------------------
 1 file changed, 93 deletions(-)
 delete mode 100644 arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi

diff --git a/arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi b/arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi
deleted file mode 100644
index 5b1d80c0ab26..000000000000
--- a/arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi
+++ /dev/null
@@ -1,93 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * calao-dab-mmx.dtsi - Device Tree Include file for Calao DAB-MMX Daughter Board
- *
- * Copyright (C) 2011 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
- */
-
-/ {
-	ahb {
-		apb {
-			usart1: serial@fffb4000 {
-				status = "okay";
-			};
-
-			usart3: serial@fffd0000 {
-				status = "okay";
-			};
-		};
-	};
-
-	i2c-gpio@0 {
-		status = "okay";
-	};
-
-	leds {
-		compatible = "gpio-leds";
-
-		user_led1 {
-			label = "user_led1";
-			gpios = <&pioB 20 GPIO_ACTIVE_LOW>;
-		};
-
-/*
-* led already used by mother board but active as high
-*		user_led2 {
-*			label = "user_led2";
-*			gpios = <&pioB 21 GPIO_ACTIVE_LOW>;
-*		};
-*/
-		user_led3 {
-			label = "user_led3";
-			gpios = <&pioB 22 GPIO_ACTIVE_LOW>;
-		};
-
-		user_led4 {
-			label = "user_led4";
-			gpios = <&pioB 23 GPIO_ACTIVE_LOW>;
-		};
-
-		red {
-			label = "red";
-			gpios = <&pioB 24 GPIO_ACTIVE_LOW>;
-		};
-
-		orange {
-			label = "orange";
-			gpios = <&pioB 30 GPIO_ACTIVE_LOW>;
-		};
-
-		green {
-			label = "green";
-			gpios = <&pioB 31 GPIO_ACTIVE_LOW>;
-		};
-	};
-
-	gpio_keys {
-		compatible = "gpio-keys";
-
-		button-user-pb1 {
-			label = "user_pb1";
-			gpios = <&pioB 25 GPIO_ACTIVE_LOW>;
-			linux,code = <0x100>;
-		};
-
-		button-user-pb2 {
-			label = "user_pb2";
-			gpios = <&pioB 13 GPIO_ACTIVE_LOW>;
-			linux,code = <0x101>;
-		};
-
-		button-user-pb3 {
-			label = "user_pb3";
-			gpios = <&pioA 26 GPIO_ACTIVE_LOW>;
-			linux,code = <0x102>;
-		};
-
-		button-user-pb4 {
-			label = "user_pb4";
-			gpios = <&pioC 9 GPIO_ACTIVE_LOW>;
-			linux,code = <0x103>;
-		};
-	};
-};
-- 
2.51.0


