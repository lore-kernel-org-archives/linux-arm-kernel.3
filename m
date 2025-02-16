Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B39FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 09:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WyP6xZadxIiPxhHK5VEbhsiz7PBbk/d5bR4lsljXq8U=; b=xDzSAJSGh2Ne2h1kUv4IdUnj5V
	mPxYGGDkGC3J1yB+Y2v/x3O7IGH1/vQyKpJd5lXeIYVIINOQE+vSfH+GNaE3hN2MNCOpBHc9roc12
	X2XDR8+COhkH66Fc1iRdDoj8FRN04kg/YXPtXSl3tz7e+h/nJNubMNZup/DD0f41sNuwwRdU5gdE3
	6/uirskr9bjLr9VvlcFbXtFnxJwUJJlkAORAN3mCmQ37SA/sa2JqBaT49PxIUZC9XLE2eAVnSDx1s
	YsJ600WgDNdloFp8HICIQ3xLlnknZzpNeP5SLayR0gdsydXQMb8vBt9QmwrSdKtvJyYWk3mQ5+Ad3
	2U58t0Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjbLr-00000001b3Q-38Pu;
	Sun, 16 Feb 2025 09:54:15 +0000
Received: from fhigh-b6-smtp.messagingengine.com ([202.12.124.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjaxe-00000001XWN-1dO8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 09:29:15 +0000
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 44B2C2540112;
	Sun, 16 Feb 2025 04:29:13 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 16 Feb 2025 04:29:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739698153; x=
	1739784553; bh=WyP6xZadxIiPxhHK5VEbhsiz7PBbk/d5bR4lsljXq8U=; b=q
	g9zjZuon0q2bsWE5XgnnblRp2D2IoDuD3pUASdCKkb8xFK+pOQBWAjcMappj1CFm
	5iL9jZcQ8rJJ82cXM4oVdx/LoRp0B8Gbjn05oH2hQP7jT9WeFlhUo2sDf+UN1VKX
	ml2LZfdCW1SpB+RRqV7ivNSRoQLYdyLv/1DjDulTUUYTmWVbIXN+B3TMqjq3Otfx
	pVBcVLr4lCCDz5GB0vYzPnDEYwfIYvA5xTGr9DRP4AtnSaT7H5TygD4EY5Sz5QH7
	pfnlEdBl3fVT5NlMjqOUkLzdR2x8VK2FvlvJezzWgBmhJRNncMBP2tWUCXr1SbYV
	0egf6j+bacUgr2snRddQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739698153; x=1739784553; bh=W
	yP6xZadxIiPxhHK5VEbhsiz7PBbk/d5bR4lsljXq8U=; b=0+yeca89eOgpD0+HR
	KHyBW51IF9OOjFuyjbIFFVaAZ3ONhIY2QOJ2eWaELkvtEaQVnV8BliMEOJwlRm8R
	cbXI7V7O9EkwamouFysCyPFN7jx3ViLTB9667p7qXQDWuNPSUXd9Fp4epNzjl6kJ
	ZgbBOh8nswsRdQeCOgnssv3QflOUTnagTSSESDbrOiDBO9k+y0vHOraypzXMozNt
	kf1vDQkfp0oCw26kguziXUbJ4WyRDW2D7UqzUe/dm/L1rZU7HB7cpZvyoThqzkpO
	SpZyjUdUEl50k1xBxSL+GvknPVifqlnoWONQc2YD/8SBmtsYU43w2wKEHvaa0WoJ
	9cOZw==
X-ME-Sender: <xms:6K-xZwDfxQGAV0j4GNMAvmQASEP26_8CfrbzLe4FiD0DPZLDtVOl6Q>
    <xme:6K-xZygPkGMv5jBfdifjqCNNBMajwXOB2zJUQvcDR8yJlcA-6OrPfp9K8E4nKlMUj
    PI4NRvPjq1bHxWCHQ>
X-ME-Received: <xmr:6K-xZzm8NHItBgZYu6QLW0r5nkbjCY9065ESlyPDqUuq4SkUuW3I5D7yNM59bUYLiT13cV0nVWD6R4SPgSUUtfh80fH9zZvLV22lpWlWrlqo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehheduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhosghhsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfi
    gvnhhssegtshhivgdrohhrghdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtges
    ghhmrghilhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorh
    hgpdhrtghpthhtoheprghnughrvgdrphhriiihfigrrhgrsegrrhhmrdgtohhmpdhrtghp
    thhtohepmhgrtghrohgrlhhphhgrkedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkh
    hikhhutghhrghnleeksehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:6a-xZ2zG_jjfc1P5M2wwqTfZUyEeH6anp27XRqnBH7037fdAeRC7Kw>
    <xmx:6a-xZ1RIk_p9JwvNzc2nE7g0sABJCdCHd9VoQ9JopudnN_HlYkoADw>
    <xmx:6a-xZxbgBwo_0lRe5FNpR2yzCdPJh40U0JUBXY2z29-RcMDEaZe2nw>
    <xmx:6a-xZ-S-k3Mys1xCtV0RAQbG2amABo0RmZAmJdtd-siK5JLZyGdnEA>
    <xmx:6a-xZxrThefBKyMtkLV-8CM_ut926Us41zO_LJUWHGo5zfIdr8dHvsNS>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 04:29:08 -0500 (EST)
From: Ryan Walklin <ryan@testtoast.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH 6/8] arm64: dts: allwinner: h616: add LCD, LVDS and PWM pins
Date: Sun, 16 Feb 2025 22:27:13 +1300
Message-ID: <20250216092827.15444-7-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216092827.15444-1-ryan@testtoast.com>
References: <20250216092827.15444-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_012914_514522_BC3DC61D 
X-CRM114-Status: UNSURE (   9.24  )
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

From: Jernej Skrabec <jernej.skrabec@gmail.com>

The Allwinner H616 (and its H618, H700 and T507 package variants with
the same die) have 28 video output pins for RGB/SPI and LVDS display.
These are in GPIO Bank D and are multiplexed.

In RGB mode, pins PD0-PD23 are for 24-bit RGB pixel output, pins
PD24-PD27 are for clock, DE, HSYNC and VSYNC, and PD28 is a PWM
backlight control.

In LVDS mode, pins PD0-PD9 are for LVDS0 and LVDS1, and can be
configured by the H616 display engine for either one high-resolution
(dual link) or two low resolution displays.

Add device tree nodes for the LCD, LVDS0, LVDS1 and PWM pins.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
[ryan@testtoast.com: add RGB, LVDS1 and PWM pin assignments]
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 242bac95840f8..806ad87705abc 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -322,6 +322,32 @@ ir_rx_pin: ir-rx-pin {
 				function = "ir_rx";
 			};
 
+			/omit-if-no-ref/
+			lcd0_rgb888_pins: lcd0-rgb888-pins {
+				pins = "PD0", "PD1", "PD2", "PD3",
+				       "PD4", "PD5", "PD6", "PD7",
+				       "PD8", "PD9", "PD10", "PD11",
+				       "PD12", "PD13", "PD14", "PD15",
+				       "PD16", "PD17", "PD18", "PD19",
+				       "PD20", "PD21", "PD22", "PD23",
+				       "PD24", "PD25", "PD26", "PD27";
+				function = "lcd0";
+			};
+
+			/omit-if-no-ref/
+			lvds0_pins: lvds0-pins {
+				pins = "PD0", "PD1", "PD2", "PD3", "PD4",
+				       "PD5", "PD6", "PD7", "PD8", "PD9";
+				function = "lvds0";
+			};
+
+			/omit-if-no-ref/
+			lvds1_pins: lvds1-pins {
+				pins = "PD10", "PD11", "PD12", "PD13", "PD14",
+				       "PD15", "PD16", "PD17", "PD18", "PD19";
+				function = "lvds1";
+			};
+
 			mmc0_pins: mmc0-pins {
 				pins = "PF0", "PF1", "PF2", "PF3",
 				       "PF4", "PF5";
@@ -348,6 +374,12 @@ mmc2_pins: mmc2-pins {
 				bias-pull-up;
 			};
 
+			/omit-if-no-ref/
+			pwm0_pin: pwm0-pin {
+				pins = "PD28";
+				function = "pwm0";
+			};
+
 			/omit-if-no-ref/
 			spi0_pins: spi0-pins {
 				pins = "PC0", "PC2", "PC4";
-- 
2.48.1


