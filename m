Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C7CCA0EE5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 20:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IM2BixBWqTnSd5rdvDosbSdlY6FT94Amkomr+wiaILg=; b=md5KMmizK7R4Wqx2aRlhEVTt+u
	BO1xNxyhwZB8EtiWXa7aNlYd16eKq0kNtbxaPPfbq5CuP95YAPhRMruIHUbord9554HpsUlMw0t9V
	HWTOK5IPO0Kv3R9FLpKreg8QYM48HKpLso/I4ovg0n0PRvuwX9ojT76F3bI/MkHkVADpiRKmQr48P
	+59DPFWgUr8/r+FpuapLjj2gJzSxWed43nLAW6v+4qery2+qHIHNqR91HVuBAPxFoWwacUgrj1irI
	GGKzF614Wr9Q7CLJ21/aurba0vgNnAuZrPCOeOgxSnfBQ4/4QX0/r9og0p93gJ+Ee+LBG88tIOjqR
	cOwju4ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulvgV-0000000Bwsx-1Ezh;
	Tue, 12 Aug 2025 20:33:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ultHj-0000000BfKX-2b9G
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 12 Aug 2025 17:59:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=IM2BixBWqTnSd5rdvDosbSdlY6FT94Amkomr+wiaILg=; b=j+oSNb5XkjekPSn7pTRa5366hJ
	tJHyyX7pndhBd0MG5DzKEFtO8QXwH5Qi3tcNbFf5LVH0ul5A113BmbcuVVywBZQPIP6K8T+6xX5ww
	lhNZxypzzL1/JujD4xddxRS4V2joTD4AXxnKViBavhcP48A3APUe5+HGLAvWRjucMFzLjjvHayoW1
	k8AHj5rpyZM7Sy8tB+ksOvNqMzjbqXB7BIKPHNhEXbTepVthOFWrYLZ1PPs+IXEy3TAmrzAiFqE2e
	Tn/3dLldbuhhOMOUEn2ew+lkuZv0reYU73UyyQIJFy2UyBuOPO7SDJATw20ieJSRV6wnT8tEezq/L
	S0/W6UXw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ultHf-0000000Ft3R-02aV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 17:59:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E925417EE;
	Tue, 12 Aug 2025 17:59:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2CC1C4CEF0;
	Tue, 12 Aug 2025 17:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755021575;
	bh=gTNQRpJNsegfD6QsXYbhdr6zYCeN0parfn9aqx8WjLg=;
	h=From:To:Cc:Subject:Date:From;
	b=LrFQOx2SO2nY7CFh4Qngy3zJq8WfeEvwK/TFxKW2h9PQx1L+bFj92wt1Q0cC5xuz1
	 NYIbuaHqzir7bDKPjpUbikXuv1IBGPgPW4xGA3XvDaJjoLQNHfDF4JNsHMxi+M1Et2
	 sWJ+JIlSzQtzSd/r+kDK4mGSettZfapmCWib73E8ulCSbDRT8+D8rVd0+tIITBi5lM
	 8JWSoN4tZ+y0GNnt2PxEIov08e1HRO4Kczx2gy9R1FymE+w2Jm6tC/NwMo7W6UxJLv
	 xle2EMKeMX2ngR4TMrM6Yq62phLrD4/bx9AT/4iQahF9ZtZuKtW58gp/O08fMBmgV/
	 Xof+Os5herYNQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 328315FBD7; Wed, 13 Aug 2025 01:59:32 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: allwinner: a527: cubie-a5e: Add LEDs
Date: Wed, 13 Aug 2025 01:59:27 +0800
Message-Id: <20250812175927.2199219-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_185939_324287_B90550DD 
X-CRM114-Status: GOOD (  12.12  )
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

From: Chen-Yu Tsai <wens@csie.org>

The Radxa Cubie A5E has a 3-color LED. The green and blue LEDs are wired
to GPIO pins on the SoC, and the green one is lit by default to serve as
a power indicator. The red LED is wired to the M.2 slot.

Add device nodes for the green and blue LEDs.

A default "heartbeat" trigger is set for the green power LED, though in
practice it might be better if it were inverted, i.e. lit most of the
time.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 .../dts/allwinner/sun55i-a527-cubie-a5e.dts   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
index fce2b7d1ba3d..cb2a2b62a2b2 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
@@ -6,6 +6,7 @@
 #include "sun55i-a523.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "Radxa Cubie A5E";
@@ -28,6 +29,24 @@ ext_osc32k: ext-osc32k-clk {
 		clock-output-names = "ext_osc32k";
 	};
 
+	leds {
+		compatible = "gpio-leds";
+
+		power-led {
+			function = LED_FUNCTION_POWER;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&r_pio 0 4 GPIO_ACTIVE_LOW>; /* PL4 */
+			default-state = "on";
+			linux,default-trigger = "heartbeat";
+		};
+
+		use-led {
+			function = LED_FUNCTION_ACTIVITY;
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&r_pio 0 5 GPIO_ACTIVE_LOW>; /* PL5 */
+		};
+	};
+
 	reg_vcc5v: vcc5v {
 		/* board wide 5V supply from the USB-C connector */
 		compatible = "regulator-fixed";
-- 
2.39.5


