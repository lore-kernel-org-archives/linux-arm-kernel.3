Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9FEAFF8864
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 10:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=As6ZBk4C50Ztj8e2ha9+tle4FDPExjLzugeDmo/Ec94=; b=41iZhJ9cDpCU9Kgi7XUbm2NYfP
	Ne6NwZSVO7cM5JRJRboIQGEKdo/l0pmbyOhyymQ4FxIEic7O9cUTdj0AxiPn4izjB6isvEHZfm+NP
	MHcB9drw+1gawKI2fyGipne5Mhr0bLIAgV8En8m4dICSFK8+fDB7LL+TTJZ+zA6xvjWywWFgila1z
	ppeIGsjAY06M4oDmrAa6FkyRiuRiSRSmCarTIFDLv9XhPd7y66oX6DNPi0egTck2CkRiuWyA3XU1k
	wVEcyiTsDZ3zH7HrcDME+xFjj4FrRRo791hU6fp7XO+CkKV6uNUBLV+timrZ0b1eojkUyJuuGaj26
	tjJF+nCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGwXI-0000000FRHA-3XSH;
	Sun, 26 Apr 2026 10:16:24 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGwXB-0000000FRDt-36pg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 10:16:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=As6ZBk4C50Ztj8e2ha9+tle4FDPExjLzugeDmo/Ec94=; b=f5UJfnpd7FZcEGzV2AC7OMV8WB
	S4yt0NRE3YMUidrW1HwK7eW6undC6fVyAb5FVBs9cT+6W/pLU16cloakIgBCjvodd2nMiQKRFRodK
	g+9ckC3cS6W3KlVdybbGfoT2sUJLzvSGoF1rWba94MmsKulXAM47swBT8t6E7rOGRKdRcUwwv2Pik
	VP0zyPnjv294W2rhebOcFraZuoIc4bulGHMSI9tT4LeCO9G7L+8xrO679v/+Uk1jNLx2WND9o+I31
	/7KrXU40g+hmab1IlPst2V/TpHZPJI4U4TLbLxpxm9moge3sEQMVyf8qb6Bd6BTHOF+9yswh/8cRg
	OeXeDx5A==;
Received: from user-188-33-36-99.play-internet.pl ([188.33.36.99] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wGwX9-0000000CBP1-12M6;
	Sun, 26 Apr 2026 12:16:15 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Sun, 26 Apr 2026 12:15:28 +0200
Subject: [PATCH v2 3/4] arm: dts: allwinner: t113s: add hstimer node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260426-h616-t113s-hstimer-v2-3-e65e9dc0c9da@mmpsystems.pl>
References: <20260426-h616-t113s-hstimer-v2-0-e65e9dc0c9da@mmpsystems.pl>
In-Reply-To: <20260426-h616-t113s-hstimer-v2-0-e65e9dc0c9da@mmpsystems.pl>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777198529; l=1131;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=WB+FLCQ1pB6/hLLpL8qe5azyJH79mgJP5EWQCmjzLQg=;
 b=mpfCT2u6GufWLMtPwwuQchKqLEF/UtLqs0dd8cGyVMPhzR78lkFYR71DSiYs0yI0tGb529pND
 Pnmsyt39wvFA6Sh4fCGWO2Mpx3MFBSLa1pkvRfSc605LHb8LXd1O6b7
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_031617_950828_CF2DB3DB 
X-CRM114-Status: UNSURE (   9.35  )
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

Describe high speed timer block on Allwinner T113-S3.

Tested on LCPI-PC-T113/F113:
- hstimer is registered as clocksource
- switching clocksource at runtime works
- after rating increase hstimer operates as a broadcast clockevent device

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
 arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
index 424f4a2487e2..40e76cfc8a1d 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
@@ -34,6 +34,17 @@ cpu1: cpu@1 {
 		};
 	};
 
+	soc {
+		hstimer@3008000 {
+			compatible = "allwinner,sun20i-d1-hstimer";
+			reg = <0x03008000 0x1000>;
+			interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_HSTIMER>;
+			resets = <&ccu RST_BUS_HSTIMER>;
+		};
+	};
+
 	gic: interrupt-controller@1c81000 {
 		compatible = "arm,gic-400";
 		reg = <0x03021000 0x1000>,

-- 
2.43.0


