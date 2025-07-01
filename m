Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19650C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 20:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1Pm4R2SaLqeGZBQerDPMC30xn0rfVixArsIVpICw4j8=; b=PzMmEvS+T8NkJLzc+KWz/thS8D
	biZxRIIc5rLcqf/Lu2TEDEGYbW1xxTqcy+t0MpC3/qMyQz9p7FCls3ruBeEtE+84tgaGRVDnfCwWw
	6M3hjOOEwJN4xLXRj3B7fZI7dJGF8UTAwq0SfEK/z22jWQFOnqp19QGBNJMETgXWGTMee2Ao2QqYO
	a3KQ/x0vL4an1Cv6K8HcMBI2mkjVoyEnfx9MHuedJfd2Ur8pLvAoFEBbRPu4/AuVvCmPdU0+GYxlL
	APyHtV4D2CNfnjKqCGYm+xA4UXhaV2buJ7JnPvTy1Ks/rx4LLb8dmgu57oWH8cah6VqIPsko9il+1
	E+C2UvQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWhbP-00000006Zy2-3nVj;
	Tue, 01 Jul 2025 20:29:15 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWhTK-00000006YsT-39r7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 20:20:55 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 41ED51F0004D
	for <linux-arm-kernel@lists.infradead.org>; Tue,  1 Jul 2025 20:20:53 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id BEE9EAC96B2; Tue,  1 Jul 2025 20:20:52 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id B7FD1AC9699;
	Tue,  1 Jul 2025 20:15:43 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 1/2] ARM: dts: sun8i: v3s: Add RGB666 LCD PE pins definition
Date: Tue,  1 Jul 2025 22:15:33 +0200
Message-ID: <20250701201534.815513-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_132054_944288_9857F395 
X-CRM114-Status: GOOD (  10.66  )
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

The V3s (and other packages) supports RGB666 LCD output on PE pins.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
index e82cf312da25..fa54510319ac 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
@@ -411,6 +411,15 @@ i2c1_pe_pins: i2c1-pe-pins {
 				function = "i2c1";
 			};
 
+			/omit-if-no-ref/
+			lcd_rgb666_pe_pins: lcd-rgb666-pe-pins {
+				pins = "PE0", "PE1", "PE2", "PE3", "PE4", "PE5",
+				       "PE6", "PE7", "PE8", "PE9", "PE10", "PE11",
+				       "PE12", "PE13", "PE14", "PE15", "PE16", "PE17",
+				       "PE18", "PE19", "PE23", "PE24";
+				function = "lcd";
+			};
+
 			uart0_pb_pins: uart0-pb-pins {
 				pins = "PB8", "PB9";
 				function = "uart0";
-- 
2.49.0


