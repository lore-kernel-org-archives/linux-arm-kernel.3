Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6229EA719A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 12:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2BKUeRAw6ts3xVXKTWrENRqOPfrQujq1taYcPu1ViSY=; b=T0IH+iXrqvNVmigA1ioLLw+4b8
	WIGWuqKT7M1oGWuBb0ERnPnYC601hiNGBZSbxk5OiMMG9gbhXT5j/m5HZ+Q/u7loz6u0d8FlVUuU3
	X1i9zWpE9RzbuJX08fQA2gOZpA9CJAARw6ToJi0RUYcfLC6tcJYYKlcLwLQcz7R4q4IQxlIg8b61C
	j63Oy5ltTq+TUBIDBtp+Wkkx2WiDwVU8X28w2hHfKDCoGR4o9jsMi7ohlt4j0dv9D0xbkaSSKEqq3
	bizkhF1JzPK/KkV7aOohYE2a0hcIZq3wTf931FXy5sm/ZvHb0wbbvFSCEpPNXEEFAwSBVvmd/UhAd
	1iYUbquw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wERYi-00000005n3W-0pFd;
	Sun, 19 Apr 2026 12:47:32 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wERYZ-00000005n0W-0agV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Apr 2026 12:47:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2BKUeRAw6ts3xVXKTWrENRqOPfrQujq1taYcPu1ViSY=; b=WHYyn43zrwSsNZHvME77Khnubn
	z32UzaMgwVlhoL7jAJBnnIuj7T3EUdmVUQBow5D4T1VWf4K9NvR2oEPpSbRZdzrrCWwQO1Z2LCpw+
	BsJfPC+xZ3129MMuBG1utOo5W025gj89Awhkigpa00yLPS05cXxummsln/dSPE37bmxzopZmIVEdy
	2Qjv52bUPT4DtEQOfEONr8YBe4sT5+Yaqi9G4cEpfaloZ3Ys4G2Hz+PJSL8U3rwwFh8xIClnbESJg
	/Dw0Rx2tZH/UpkmHoYbjvzjHrorlnAyG7ACaWiV4tDbPwsRc3/DTUXPA5wiIOJDPHgh7I589nDoSH
	Z3eKIf4A==;
Received: from user-5-173-16-91.play-internet.pl ([5.173.16.91] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wERYW-0000000FcVm-3A4V;
	Sun, 19 Apr 2026 14:47:20 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Sun, 19 Apr 2026 14:46:10 +0200
Subject: [PATCH 4/4] arm: dts: allwinner: t113s: add hstimer node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-h616-t113s-hstimer-v1-4-1af74ebef7c5@mmpsystems.pl>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776602788; l=1183;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=XIZIjEbSaQwU8SHGIG2f7vQGlj5NsG6mt1shAs4DnYk=;
 b=TWIqqEA3ErGL3FCRddP1xCmGyg6MgptJEaxLHGDfIlXCIwxmqmSSlTDe+7h5M1kN/P9BSgKau
 jlIiAaWCfkTBQMbfJDBTIr2MWKsAwz5QTib25pUuAMasN+08WxHdfMO
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_054723_652693_419200F9 
X-CRM114-Status: UNSURE (   9.54  )
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
 arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
index 424f4a2487e2..f811ae0924d6 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
@@ -34,6 +34,18 @@ cpu1: cpu@1 {
 		};
 	};
 
+	soc {
+		hstimer@3008000 {
+			compatible = "allwinner,sun8i-t113s-hstimer",
+				     "allwinner,sun50i-h616-hstimer";
+				reg = <0x03008000 0x1000>;
+				interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&ccu CLK_BUS_HSTIMER>;
+				resets = <&ccu RST_BUS_HSTIMER>;
+		};
+	};
+
 	gic: interrupt-controller@1c81000 {
 		compatible = "arm,gic-400";
 		reg = <0x03021000 0x1000>,

-- 
2.43.0


