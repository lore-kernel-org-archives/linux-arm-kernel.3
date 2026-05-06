Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52096CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHxIIdNZP/GM1WNtCzRWtqkwrd59+f6pkF9jEZfKEuY=; b=FXnz4ksLmhHVPWnyEdn7EQrsu1
	d1w5ZRm6QNqd6W+REsRfAqxcuenF8lHwR0UNxL39jiXOO6Biks2zOf3br9r9Yq83I5IFrxOTNtvie
	Jnnpa+rS7mdyQNcszeAzjdLP3c7FI/ZieS+5p8RBINv38cfufP+zxO1BXQGiTYzslhsNs7aV5U0qY
	Emoo59UoNEs63CJwI/h7zSkFWBkyIj+tbFE288xh4fSwz7MzEs+InrWxhD4sKFZQhNDgck8d0EvLU
	SsB2OsEelQOT2rifddv5zdBYqquhipROXQ7VKd13VIqoRp1lvc9JE5JqRCRMgjErKU9cfW65vcPs0
	f+jbVwvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdtq-00000001Fpm-1lpA;
	Wed, 06 May 2026 15:10:58 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdto-00000001FnR-0AZi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 15:10:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MHxIIdNZP/GM1WNtCzRWtqkwrd59+f6pkF9jEZfKEuY=; b=Cr+OajGhME6QFoe1JJzLpRTjys
	m0ETy9kvLbFuTg2EnqTKIMvLbWrMucgorKW0l5tTJMTe22c4k8YCFIyZ5mAtuw+6Xbtx4XhhoFhzX
	YZAvgrJ+KnfpYXpLLVTshVQlC22WHIaybJFdRRp/TYCoBdNRHdjTQxxsNfmHXukFJT5rnoJZJAOTh
	xC/lierVURJcsYvms1lnXbls82B7cwa3TVYEGtfkE06AZS0M6VSfizZnxjOn3OD1EMeHnaE9/hMw9
	NSlug8K6lrX2bEAG9nOYdMFQYsmbeJlOx5Pdwnej5LeCwUjoYTaAAbnTAC9qm3DGMFZUIHcL0K6iV
	06iDcTiQ==;
Received: from user-188-33-36-99.play-internet.pl ([188.33.36.99] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wKdtk-00000003auw-1Ieu;
	Wed, 06 May 2026 17:10:52 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Wed, 06 May 2026 17:10:28 +0200
Subject: [PATCH v4 3/4] arm: dts: allwinner: d1s-t113: add hstimer node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-h616-t113s-hstimer-v4-3-591d425863d6@mmpsystems.pl>
References: <20260506-h616-t113s-hstimer-v4-0-591d425863d6@mmpsystems.pl>
In-Reply-To: <20260506-h616-t113s-hstimer-v4-0-591d425863d6@mmpsystems.pl>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Michal Piekos <michal.piekos@mmpsystems.pl>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Andre Przywara <andre.przywara@arm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778080247; l=1181;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=AZ/Zmj6bxiVSpb1BJYvgfM1oOy31/LD1MQmu0NZTr2g=;
 b=kb7ff0LSblEwP7boEqHpI9OtTFZiCNuH8u0t8A0njdqrV6Lz5l5dJh23PHQ/JF/GtFxBSbUhF
 mbe3BRl9p2UDcDQ9sViAGcsrcBaT96sqwdMaeA8OC1u6lDsPa5jw5kN
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_081056_411917_28F25FA9 
X-CRM114-Status: UNSURE (   9.04  )
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

Describe high speed timer block on Allwinner D1S-T113.

Tested on LCPI-PC-T113/F113:
- hstimer is registered as clocksource
- switching clocksource at runtime works
- after rating increase hstimer operates as a broadcast clockevent device

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 82cc85acccb1..a849b0380386 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -295,6 +295,15 @@ timer: timer@2050000 {
 			clocks = <&dcxo>;
 		};
 
+		hstimer@3008000 {
+			compatible = "allwinner,sun20i-d1-hstimer";
+			reg = <0x03008000 0x1000>;
+			interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_HSTIMER>;
+			resets = <&ccu RST_BUS_HSTIMER>;
+		};
+
 		wdt: watchdog@20500a0 {
 			compatible = "allwinner,sun20i-d1-wdt-reset",
 				     "allwinner,sun20i-d1-wdt";

-- 
2.43.0


