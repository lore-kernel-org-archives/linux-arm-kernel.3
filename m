Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC014C36018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 20:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uzga02gahQxraS2M+4bHTPzRSV1Qy0HHYmWPiH16T9o=; b=XsJgE8C0C4e1Om14XCRq69mhlr
	Kt7knY5fBMO0G1H1CF+DWqPx6JGq7nY0azBAF7Mf2Q0WEpNKLo2FeTJgTslYXy2W4HT06igLVdVci
	P9LLL8dlaxQm8YC/CosepreuSECtLlp+nUJDkUA5QUUY2B/BHpdyYndedDSYHBvR1j1Ts/uQs0d43
	xUC1HxyOne4ATKJnxj34M0GW6kEGd8kmxaYAtWgv+Gf6dzEzuG0743YYySdB0rxUvGIQ97Hxg6QEf
	eHbt9UQHssgAHNuEJs88HDeMRSKrE9IE/djoJ0KzphgLrxJSTRfsoOICRoTDQK4qHVwp17Aq/I30y
	Y8hSSD1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0533-00000007B3G-3jKV;
	Wed, 02 Apr 2025 20:50:57 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u051H-00000007Aq8-2CPF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 20:49:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Uzga02gahQxraS2M+4bHTPzRSV1Qy0HHYmWPiH16T9o=; b=cSH2Pf
	cJ4Ib1+KODs94a6JqGeqS1ALQq1MDEU7tYDZxXO3l3Ty5AhxwRclQrXgyJMNn/+V
	Lx/U/GaXJqLSjpPHQgUFd+4h5JiYgc+LIng/cmlbWW21X854lFTPu3lpHb/lFBZs
	Akq1nxUSw0omIOMLQsiMSvWVCTBUkMNSAgs4I7PrjFdOlqMkhW1/OIQhhQovpoW9
	55rQeCicHZpJXzQUWZaJNIMdMO2RlxuOgzKLnpkC9Lcfb9/TP+Di8Bj0los2P72t
	/lFUsiBfKsRIhnnHt27NwEU5OdTE+gPpstdAt/jcFVwRSH60dd9ksbOqM4jBRpJ/
	0VUjjyeq70nTopOw==
Received: (qmail 2132837 invoked from network); 2 Apr 2025 22:49:00 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Apr 2025 22:49:00 +0200
X-UD-Smtp-Session: l3s3148p1@bJ5lyNExoLwujnsv
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/4] ARM: dts: at91: calao_usb: simplify memory node
Date: Wed,  2 Apr 2025 22:48:51 +0200
Message-ID: <20250402204856.5197-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250402204856.5197-1-wsa+renesas@sang-engineering.com>
References: <20250402204856.5197-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_134908_412223_E7C859D6 
X-CRM114-Status: GOOD (  10.96  )
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

All devices have 64MB RAM. So, the memory node can bet put into the
most generic DTSI.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/microchip/usb_a9260.dts         | 4 ----
 arch/arm/boot/dts/microchip/usb_a9260_common.dtsi | 4 ++++
 arch/arm/boot/dts/microchip/usb_a9g20_common.dtsi | 4 ----
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/usb_a9260.dts b/arch/arm/boot/dts/microchip/usb_a9260.dts
index e7f7b259ccf3..de19904e9e91 100644
--- a/arch/arm/boot/dts/microchip/usb_a9260.dts
+++ b/arch/arm/boot/dts/microchip/usb_a9260.dts
@@ -16,10 +16,6 @@ chosen {
 		bootargs = "mem=64M console=ttyS0,115200 root=/dev/mtdblock5 rw rootfstype=ubifs";
 	};
 
-	memory@20000000 {
-		reg = <0x20000000 0x4000000>;
-	};
-
 	ahb {
 		apb {
 			shdwc: poweroff@fffffd10 {
diff --git a/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi b/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi
index 8c3530638c6d..b094c31033b5 100644
--- a/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi
+++ b/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi
@@ -16,6 +16,10 @@ main_xtal {
 		};
 	};
 
+	memory@20000000 {
+		reg = <0x20000000 0x4000000>;
+	};
+
 	ahb {
 		apb {
 			dbgu: serial@fffff200 {
diff --git a/arch/arm/boot/dts/microchip/usb_a9g20_common.dtsi b/arch/arm/boot/dts/microchip/usb_a9g20_common.dtsi
index f1946e0996b7..b11ad0b29026 100644
--- a/arch/arm/boot/dts/microchip/usb_a9g20_common.dtsi
+++ b/arch/arm/boot/dts/microchip/usb_a9g20_common.dtsi
@@ -14,10 +14,6 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory@20000000 {
-		reg = <0x20000000 0x4000000>;
-	};
-
 	i2c-gpio-0 {
 		rtc@56 {
 			compatible = "microcrystal,rv3029";
-- 
2.47.2


