Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341F7EA719C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 12:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=duDa3+ZscPYRkPNsXgchEpJheiwlOl2UgtFoR/YB8xI=; b=WJaOuQ8Zrho7GbydfTl7PJGnnf
	6xkY9C1uvLUBGsLOzLpCTfc3cgRlfM+u5f92VxB6iJcg2reVbiCX5GE3V2gKEUu9UfScKfI/wxTkZ
	LNh/WOL1VwBZ4YqIiwqQWxdYPMkGi6T1X/+wolsbx8SQ00lG/u/p5kbNsnsVt7Ue+1X6A+jSvreXb
	muDiHjpc/vDp3NtsWV7NZCwa0AqcbwK9TY0Y9km9vsiqHSv3jayxVjqaqn7GzPWawd1Q5Qv00xR2k
	OExQ/0GjWmXTHQ13WKYApWabH4n0t8/uQSWue1ySfexR0QOdWPuKOm/PeKl6oWJvMs3hByRPO4t5L
	5d9Jp0Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wERYh-00000005n3E-3JJG;
	Sun, 19 Apr 2026 12:47:31 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wERYZ-00000005n0X-0oeo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Apr 2026 12:47:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=duDa3+ZscPYRkPNsXgchEpJheiwlOl2UgtFoR/YB8xI=; b=x7bzI3DB1vfv4hzWVy3R3UERTd
	IQ3620hBREs2Tss9v3pVrUUbwzCADuuaY0inaH+fW+5IMJl9Uktzjw3g4Y2GccB6GxyyYZ0mcSekj
	0Y3QgSSVAODkn59XX5TQhghT+0q7VakCOXYCQSAD1vcmHRK3qS294U3UfI7hq8J6Asatm+MoPxZNb
	Jomi5vOwTnsx8iHBVKhoziG0F9B0PUAWKhXIwMK5BEKDEHEFCNE4SZz9AGdEPBnXX2CcZ/ZzUs17L
	LnZSFqk/HZMPRL3+BG+MOikOTQv35JKDrIxZIoO9HKUPqJeRTMgzQRqOEcvxh0b+yjF+R9Q1lVi9Z
	v1gc3/9w==;
Received: from user-5-173-16-91.play-internet.pl ([5.173.16.91] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wERYW-0000000FcUF-0Ifs;
	Sun, 19 Apr 2026 14:47:20 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Sun, 19 Apr 2026 14:46:09 +0200
Subject: [PATCH 3/4] arm64: dts: allwinner: h616: add hstimer node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-h616-t113s-hstimer-v1-3-1af74ebef7c5@mmpsystems.pl>
References: <20260419-h616-t113s-hstimer-v1-0-1af74ebef7c5@mmpsystems.pl>
In-Reply-To: <20260419-h616-t113s-hstimer-v1-0-1af74ebef7c5@mmpsystems.pl>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776602788; l=1167;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=mj0JDjZUFHZ4rOn28SnspZzqXtvUOmaAZYgt95OujCs=;
 b=VHTIDceAoy0tODkhQAo0zsJJo39Q4ejDDRU3zeRqv4VuebSPNJyYgQu61A8WfHEf0mXE/VxJ6
 2E9gAmFxeOPDUZl7AHLpUjzuWEM+w/gjcrAEIG4MW9iRo+qR4RdJGza
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_054725_414188_E2DC9F57 
X-CRM114-Status: UNSURE (   9.11  )
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

Describe high speed timer block on Allwinner H616.

Tested on Orange Pi Zero 3:
- hstimer is registered as clocksource
- switching clocksource at runtime works
- after rating increase hstimer operates as a broadcast clockevent device

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index bf054869e78b..0713a17264ec 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -237,6 +237,15 @@ timer0: timer@3009000 {
 			clocks = <&osc24M>;
 		};
 
+		hstimer@3005000 {
+			compatible = "allwinner,sun50i-h616-hstimer";
+			reg = <0x03005000 0x1000>;
+			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_HSTIMER>;
+			resets = <&ccu RST_BUS_HSTIMER>;
+		};
+
 		watchdog: watchdog@30090a0 {
 			compatible = "allwinner,sun50i-h616-wdt",
 				     "allwinner,sun6i-a31-wdt";

-- 
2.43.0


