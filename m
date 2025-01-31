Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8710CC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 21:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1LGZwXFDvGhM2ypSbrPOE8q4tiwj4t7HCxUVFxGryRM=; b=ZjOLHkhHXVRg2p
	IbuUkd3RwKlvksLbNA1M+j8oGrYOYH8oKskBd61L6de/hlTekTOPXh3qQK1fbRTlYspeu4lGILJu8
	Vdcsn696jL8IH+bEik7cx9eq1/vUJE49rDuSZcW44hHj1DC+dv7irLNAubRkcVtZcOCmdxDP64xzI
	ttWXb4bhN6/zRX2+CxrqPqJYxN5jcztlXQ3OJAyjOKPkrjek5qvmto1tHKQFrkO9ErH0srgAaeISQ
	LmZc1p0Loks2TZEqhdK4/fMVFSed9s0fktLVd+IwkrBN8OMl4pTFr12SkKvJK9++e5lg+uXAlQiFY
	hlLGpkWYK/vKq07zdJ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyFJ-0000000BQ7R-0F8M;
	Fri, 31 Jan 2025 21:08:13 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyAB-0000000BPfR-0jHS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 21:02:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=1LGZwXFDvGhM2ypSbrPOE8q4tiwj4t7HCxUVFxGryRM=; b=NWH3uh
	s5RuVe0hw/ORsnRuoXaFiRYGWgT1BC8PIfCA287KPDAAJ/qU/diMW573fzZGek6X
	cbFxYAmt81qpYUYuwo+8amFtxBdDuTCFJ2ZjopfZwlV49znf4sXNTbw37Xwsh5aF
	jbOpKVuK0wPo00OIw+tA+bhBu/rzGW0E9KdQOYXjvFWlld4IbUfYqseWSy5biqx7
	W634PAXcbv51pD4M4CJIuzGkUVchKxEgvHqy7+obLXyQzsi1xbMJ3omIuNkqWWHJ
	uLeWCiqbIY/STvSnNVrxwv42Z8MTjsPMX3sEShfEMIh74ifq7j0XnX5q9IP5TUA0
	GRkO8H3TMe03ZKOQ==
Received: (qmail 1802101 invoked from network); 31 Jan 2025 22:02:53 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Jan 2025 22:02:53 +0100
X-UD-Smtp-Session: l3s3148p1@VAu03QYtrBHUph5e
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/4] ARM: dts: at91: calao_usb: fix button nodes
Date: Fri, 31 Jan 2025 22:02:38 +0100
Message-ID: <20250131210236.36212-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250131210236.36212-6-wsa+renesas@sang-engineering.com>
References: <20250131210236.36212-6-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_130255_484279_B55C8A7A 
X-CRM114-Status: UNSURE (   9.25  )
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
Cc: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Adhere naming to DT schema. And remove the unneeded #*-cells. Found by
'make dtbs_check'.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/microchip/usb_a9260_common.dtsi  |  4 +---
 arch/arm/boot/dts/microchip/usb_a9263.dts          |  4 +---
 arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi | 10 ++++------
 3 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi b/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi
index 19084ba75883..ae369ff04267 100644
--- a/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi
+++ b/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi
@@ -128,10 +128,8 @@ user_led {
 
 	gpio_keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
-		user_pb {
+		button-user-pb {
 			label = "user_pb";
 			gpios = <&pioB 10 GPIO_ACTIVE_LOW>;
 			linux,code = <28>;
diff --git a/arch/arm/boot/dts/microchip/usb_a9263.dts b/arch/arm/boot/dts/microchip/usb_a9263.dts
index e1f6dd7ed2d4..bc85d8aaf378 100644
--- a/arch/arm/boot/dts/microchip/usb_a9263.dts
+++ b/arch/arm/boot/dts/microchip/usb_a9263.dts
@@ -156,10 +156,8 @@ user_led {
 
 	gpio_keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
-		user_pb {
+		button-user-pb {
 			label = "user_pb";
 			gpios = <&pioB 10 GPIO_ACTIVE_LOW>;
 			linux,code = <28>;
diff --git a/arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi b/arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi
index 08d58081201a..5b1d80c0ab26 100644
--- a/arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi
+++ b/arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi
@@ -65,28 +65,26 @@ green {
 
 	gpio_keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
-		user_pb1 {
+		button-user-pb1 {
 			label = "user_pb1";
 			gpios = <&pioB 25 GPIO_ACTIVE_LOW>;
 			linux,code = <0x100>;
 		};
 
-		user_pb2 {
+		button-user-pb2 {
 			label = "user_pb2";
 			gpios = <&pioB 13 GPIO_ACTIVE_LOW>;
 			linux,code = <0x101>;
 		};
 
-		user_pb3 {
+		button-user-pb3 {
 			label = "user_pb3";
 			gpios = <&pioA 26 GPIO_ACTIVE_LOW>;
 			linux,code = <0x102>;
 		};
 
-		user_pb4 {
+		button-user-pb4 {
 			label = "user_pb4";
 			gpios = <&pioC 9 GPIO_ACTIVE_LOW>;
 			linux,code = <0x103>;
-- 
2.45.2


