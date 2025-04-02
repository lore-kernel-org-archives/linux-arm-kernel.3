Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E82C36018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 20:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=miiQgbVc/Fy7PZMHYxtwsXXU5MxHGcWvgj0JliIHdAo=; b=fLEl7l9hzRlZMU5ldsFzoumFrV
	FtE1qPq8dIFbKdjhbwdo8r6d3M4fbr1tgOvcaCRwsgIkNG/NvhIWStuv9SkupEk3fdsRSthvQaP0s
	L49tk87yCok61T+ruuEhonNnDpsZPojnlRFDjbd2YXnYSo27K6oOMVirBYqlT1GJ/zApnAnt3LIUu
	IhFqyTWcSjF7jdGkkPP2q0+whImxWEcUvmzTisJVLNsfFu9tNBFDoPJ642A5pHOUjPEQrORRZkaAs
	KqFYkroI4imU4q/y9GDd51wF3m0xXi5fp0v93styrhW/uDl+23Q+ZNyXIidLFRLpRWLz1Ymnbe7Ys
	H+AJOUNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u056V-00000007BLf-1HJy;
	Wed, 02 Apr 2025 20:54:31 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u051H-00000007AqG-2IrA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 20:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=miiQgbVc/Fy7PZMHYxtwsXXU5MxHGcWvgj0JliIHdAo=; b=bO4D2h
	n9CaRrILrppllC2U/zyLB6fq86N7gzmo2KWTwPtyRVcp9pnT3YXxPh3NQg88qQO6
	sLQXMLmMwHU9zvkGBTVOo3bP7vw/Ey45ewDtXTbaLH1USNo3UOVrkFFPE0gojTIo
	L8Z9tS/Ca7Fq9fuqx3TNMSpPSOPoT9Vn0qz1FcPfjQWLXaUlWZbhH7Z06OzxA/2M
	JflW43kHkgS97c0k57ntYcPSW4dwg6lg/H5uxTSsPJOg4J13DrdCK4V76Cp1tfXX
	AC47PIDc2e2Bs99Dx/iO0eHLFqe5vLzWDYImz9tIQEfDttgK30D1ihU4gR9Ik6hJ
	jcuq7RCJUabKLVpA==
Received: (qmail 2132930 invoked from network); 2 Apr 2025 22:49:02 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Apr 2025 22:49:02 +0200
X-UD-Smtp-Session: l3s3148p1@hnmGyNExuLwujnsv
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
Subject: [PATCH 3/4] ARM: dts: at91: calao_usb: simplify chosen node
Date: Wed,  2 Apr 2025 22:48:53 +0200
Message-ID: <20250402204856.5197-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250402204856.5197-1-wsa+renesas@sang-engineering.com>
References: <20250402204856.5197-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_134908_413458_BE32A0B2 
X-CRM114-Status: GOOD (  11.15  )
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

All devices use equal parameters in 'chosen'. So, the memory node can
bet put into the most generic DTSI.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/microchip/usb_a9260.dts         | 5 -----
 arch/arm/boot/dts/microchip/usb_a9260_common.dtsi | 5 +++++
 arch/arm/boot/dts/microchip/usb_a9g20_common.dtsi | 5 -----
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/usb_a9260.dts b/arch/arm/boot/dts/microchip/usb_a9260.dts
index 1de2864b4cf6..3b61e7145060 100644
--- a/arch/arm/boot/dts/microchip/usb_a9260.dts
+++ b/arch/arm/boot/dts/microchip/usb_a9260.dts
@@ -12,11 +12,6 @@ / {
 	model = "Calao USB A9260";
 	compatible = "calao,usb-a9260", "atmel,at91sam9260", "atmel,at91sam9";
 
-	chosen {
-		bootargs = "mem=64M root=/dev/mtdblock5 rw rootfstype=ubifs";
-		stdout-path = "serial0:115200n8";
-	};
-
 	ahb {
 		apb {
 			shdwc: poweroff@fffffd10 {
diff --git a/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi b/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi
index b094c31033b5..da32c5fdcc47 100644
--- a/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi
+++ b/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi
@@ -6,6 +6,11 @@
  */
 
 / {
+	chosen {
+		bootargs = "mem=64M root=/dev/mtdblock5 rw rootfstype=ubifs";
+		stdout-path = "serial0:115200n8";
+	};
+
 	clocks {
 		slow_xtal {
 			clock-frequency = <32768>;
diff --git a/arch/arm/boot/dts/microchip/usb_a9g20_common.dtsi b/arch/arm/boot/dts/microchip/usb_a9g20_common.dtsi
index b11ad0b29026..6bc307c91d65 100644
--- a/arch/arm/boot/dts/microchip/usb_a9g20_common.dtsi
+++ b/arch/arm/boot/dts/microchip/usb_a9g20_common.dtsi
@@ -9,11 +9,6 @@
 #include "usb_a9260_common.dtsi"
 
 / {
-	chosen {
-		bootargs = "mem=64M root=/dev/mtdblock5 rw rootfstype=ubifs";
-		stdout-path = "serial0:115200n8";
-	};
-
 	i2c-gpio-0 {
 		rtc@56 {
 			compatible = "microcrystal,rv3029";
-- 
2.47.2


