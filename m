Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD4CF3D5FF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 11:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NsDDl+yTVHlLP7IF4N9Zv94wAjZ2/9tT1ZDu4kPuHBo=; b=xZxBuL1zG3KNnl0KdzJcjo82S0
	8XT2dinAfaAcNCIGDzusd9o341R2GsfvatjebrDyEcx2y/hPWN15SXU6HW+QOxyB0/kN1YcbQP8hx
	2oUELMVdud3BGeAI8s/EdGJ09tTY9VhborZ0+LHBGSnBZ+sJs18TxdKIJH2ujYu/XN71sE+VQ2AM3
	49jeXhYZTkv4MYw4uC4YBMmBIqgLL8K7tZDEOSkKtcMnJiuIrKiwAm0pf7W8RT4HUSPjxJqWb9Zzm
	LlyO8U7w1iT6k86ty1VfmqfyAUe5j3F58qz0hhKeJWTXzmvryRSgxeIOfdMMSgHwOu+cJfRSEPqht
	mscV29xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6oYh-00000009seM-0GQd;
	Sun, 29 Mar 2026 11:43:59 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6oYc-00000009se2-47a1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 11:43:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NsDDl+yTVHlLP7IF4N9Zv94wAjZ2/9tT1ZDu4kPuHBo=; b=gmnaP2Ru3ijtE98GSZLZm60+Q0
	1ytO42TKS2P8gr9TgacXNM9uO3fEsNCJx24+7HshblRxD5WM5cRFrT6VfF60rcUcbP7O5TRku6jLJ
	fU+buNxWIW/em4KSYlHf56IG6PCbZMpKGse07p9BR+8AnIKu5L0TRZ+RKZBfouEjxjMTuugu2wrJn
	2qx9ykfl8AXqtTM9QHm0W5wpfv/Xq3YILNbLXL3LvP97x/6Rit/wV6wleQuoOzZ1yJjHVvTLJvESj
	Zyava6JzNEmwq5X0v78pXq8jZ29H8sn2iNWy8YRWbWFx6Z9U2+HSxoiNfgtFDmnxb3nFXjTzlidLS
	wKMdvR7g==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1w6oYZ-0000000GCr0-2xJN;
	Sun, 29 Mar 2026 13:43:51 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Sun, 29 Mar 2026 13:43:04 +0200
Subject: [PATCH] arm64: dts: allwinner: enable h616 timer support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-h616-timer-v1-1-5966d0420a66@mmpsystems.pl>
X-B4-Tracking: v=1; b=H4sIAEcQyWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyML3QwzQzPdkszc1CJdAxOzVLPEZGNTE8tUJaCGgqLUtMwKsGHRsbW
 1AIEalLBcAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774784592; l=2614;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=/x2bgSPLjMPRtMCgOrqMlQDlUtZoPJY2aQ5+GW5XhUs=;
 b=spZzLnfw6iqy8vd4Ucz8b5Px8716PU/4p8eh3j3FODFnmcEIO/5YaErEhymPRcQs5tASum502
 EzC93QHzr4kBPyVseWeQXwSStYugkMDwwOxbP1esOY3pLVhLUfgdolM
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_044355_504890_36996D8A 
X-CRM114-Status: UNSURE (   9.97  )
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

Add support for timer by reusing existing sun4i timer driver.

H616 timer is compatible with earlier sunxi timer variants and provides
both clocksource and clockevent functionality. It runs from 24 MHz
oscillator. It can serve as broadcast clockevent for wake up from idle
states.

Tested on Orange Pi Zero 3:
- timer is registered as clocksource:
- switching clocksource at runtime works
- timer operates as a broadcast clockevent device
- no regression observed compared to arch_sys_counter

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
Test results:

Clocksource switching:
  cat /sys/devices/system/clocksource/clocksource0/available_clocksource
    arch_sys_counter timer
  echo timer > /sys/devices/system/clocksource/clocksource0/current_clocksource
    [ 5031.105997] clocksource: Switched to clocksource timer

Clockevent configuration:
  cat /proc/timer_list
    ...
    Tick Device: mode:     1
    Broadcast device
    Clock Event Device: sun4i_tick
     max_delta_ns:   178956969070
     min_delta_ns:   1000
     mult:           51539608
     shift:          31
     mode:           1
     next_event:     9223372036854775807 nsecs
     set_next_event: sun4i_clkevt_next_event
     shutdown:       sun4i_clkevt_shutdown
     periodic:       sun4i_clkevt_set_periodic
     oneshot:        sun4i_clkevt_set_oneshot
     resume:         sun4i_clkevt_shutdown
     event_handler:  tick_handle_oneshot_broadcast
    ...

Cyclictest measurements:
  Dominated by system scheduler latency and do not reflect clocksource
  precision.
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 8d1110c14bad..bf054869e78b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -228,6 +228,15 @@ cpu_speed_grade: cpu-speed-grade@0 {
 			};
 		};
 
+		timer0: timer@3009000 {
+			compatible = "allwinner,sun50i-h616-timer",
+				     "allwinner,sun8i-a23-timer";
+			reg = <0x03009000 0xa0>;
+			interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&osc24M>;
+		};
+
 		watchdog: watchdog@30090a0 {
 			compatible = "allwinner,sun50i-h616-wdt",
 				     "allwinner,sun6i-a31-wdt";

---
base-commit: be762d8b6dd7efacb61937d20f8475db8f207655
change-id: 20260328-h616-timer-046e6ac3549e

Best regards,
-- 
Michal Piekos <michal.piekos@mmpsystems.pl>


