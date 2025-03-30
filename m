Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E13C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 12:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SeMBAm/2P6IyhZnTGlI8exsZftW0RddS8BxM/fztF3Y=; b=PIthCl4rg5nANKfhmJ9LxXghgW
	1GZ61foPAxjEL7s6DM+jONjfSRrPG5B4GBuqUUxmOhV3VCXA3+wJE3Loxalz64k1kzxvzkfJr7oqO
	FSh7f/qCmIWBB4+gt1ZbtsM7OHK/k2Y6XTDP+jNG7hI4KAPeOsZ+9NQuBANUqZHcY7l24hkIiGhRk
	OpncZ610KxsxZfb6UChEhvK81nVYO1nZmDte5wOMVT6RO8ehzqQZ7JfvMPqU5gkgnK89MKkWySUO+
	lacJXeTw9TXTDYQIddC6cncI4bEFOTuQUtRj6NXljIpc1YUlw0buw9pblICCx8IClw0izHfjbT4cA
	wzVssSOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyrba-0000000GBRF-34YP;
	Sun, 30 Mar 2025 12:17:34 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyrYP-0000000GB8p-162Z
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 12:14:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=SeMBAm/2P6IyhZnTGlI8exsZftW0RddS8BxM/fztF3Y=; b=UXoYVI
	jgomgfyRfS8Ze24Num+3qtMJqRnoHUex4LstH1mGKRk6u9nhX+y55IbqNUXJfrus
	ofRy/tp6DHUDJ0TSZDXcmTiIboU7M8zcVOFwnEijP4u8B97YiVbRbwKRYypWLExc
	fO2ZM2hfqfy4wmuJejQ8nYHnZ0aAwogAxrDnkMLpzyJxS4dZjg3/S3hM6Oq5VLzu
	fp/uGFkOIS55JupglYB6wq6AdKlxByIttqH6t9Z6my8rd7vT1/BZDFel33BX1QXE
	ZLrWwgh1YZZvIvSYa3T9r8GzZNwKvxqfho6WODcLsDH8K3yAvwtW6I8OUm8w+Mfq
	vkGIrQYo5GGGOPTA==
Received: (qmail 855706 invoked from network); 30 Mar 2025 14:14:11 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Mar 2025 14:14:11 +0200
X-UD-Smtp-Session: l3s3148p1@KBqyPY4x2lBtKjBa
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/5] ARM: dts: marvell: fix faulty ohci/ehci node names
Date: Sun, 30 Mar 2025 14:13:24 +0200
Message-ID: <20250330121326.9069-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250330121326.9069-7-wsa+renesas@sang-engineering.com>
References: <20250330121326.9069-7-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_051417_571571_BCF1D8FF 
X-CRM114-Status: GOOD (  10.19  )
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

They should be named "usb@".

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/marvell/kirkwood-db.dtsi             | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-dir665.dts          | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dts | 2 +-
 arch/arm/boot/dts/marvell/kirkwood.dtsi                | 2 +-
 arch/arm/boot/dts/marvell/orion5x.dtsi                 | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/kirkwood-db.dtsi b/arch/arm/boot/dts/marvell/kirkwood-db.dtsi
index 6fe2e31534af..8bacaeb4f4bd 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-db.dtsi
+++ b/arch/arm/boot/dts/marvell/kirkwood-db.dtsi
@@ -39,7 +39,7 @@ sata@80000 {
 			status = "okay";
 		};
 
-		ehci@50000 {
+		usb@50000 {
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/marvell/kirkwood-dir665.dts b/arch/arm/boot/dts/marvell/kirkwood-dir665.dts
index 2f6793f794cd..36394d1ab3e2 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-dir665.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-dir665.dts
@@ -129,7 +129,7 @@ i2c@11000 {
 			status = "okay";
 		};
 
-		ehci@50000 {
+		usb@50000 {
 			status = "okay";
 		};
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dts b/arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dts
index e3b41784c876..051579fc36b8 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dts
@@ -63,7 +63,7 @@ serial@12000 {
 			status = "okay";
 		};
 
-		ehci@50000 {
+		usb@50000 {
 			status = "okay";
 		};
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood.dtsi b/arch/arm/boot/dts/marvell/kirkwood.dtsi
index 815ef7719d13..8a1338e672b3 100644
--- a/arch/arm/boot/dts/marvell/kirkwood.dtsi
+++ b/arch/arm/boot/dts/marvell/kirkwood.dtsi
@@ -263,7 +263,7 @@ cesa: crypto@30000 {
 			status = "okay";
 		};
 
-		usb0: ehci@50000 {
+		usb0: usb@50000 {
 			compatible = "marvell,orion-ehci";
 			reg = <0x50000 0x1000>;
 			interrupts = <19>;
diff --git a/arch/arm/boot/dts/marvell/orion5x.dtsi b/arch/arm/boot/dts/marvell/orion5x.dtsi
index 2d41f5c166ee..939259c57e05 100644
--- a/arch/arm/boot/dts/marvell/orion5x.dtsi
+++ b/arch/arm/boot/dts/marvell/orion5x.dtsi
@@ -146,7 +146,7 @@ wdt: wdt@20300 {
 				status = "okay";
 			};
 
-			ehci0: ehci@50000 {
+			ehci0: usb@50000 {
 				compatible = "marvell,orion-ehci";
 				reg = <0x50000 0x1000>;
 				interrupts = <17>;
@@ -218,7 +218,7 @@ cesa: crypto@90000 {
 				status = "okay";
 			};
 
-			ehci1: ehci@a0000 {
+			ehci1: usb@a0000 {
 				compatible = "marvell,orion-ehci";
 				reg = <0xa0000 0x1000>;
 				interrupts = <12>;
-- 
2.47.2


