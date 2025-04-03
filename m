Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D43C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 06:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fw5J2bwP9Wx3DIVhWgD5cLvSR6UG2CRnpvSbLDR6590=; b=kaueN2qLDH3NzfJYWOjicU/WlC
	0bCIj5cgUG8ujR7RoiFq8/Vj2gDEp4f+FBjYiBmPXU4PjYe+ski50mmLXBECMuvhWe1U+8IZvvonD
	PT0ahwYNvujqw/WhRmO1CIC23u01S4LPVJnL8pym18VOnfO1+CXfRK5VWdSiKiCtdg1+YX8dog26l
	SaJ6IVj7vlELf1qhNFUmjzHqaXvooBZ6Q/w5NsCLu8EkJOLLGaWGuUwx+1X5d3BwsN4p18VO10PcU
	M2KIzTeBJZYy2vkeYOXweC3D9Dx759kybHIsx4BwQlkapg+jTTmhZZLJTdokEMfkRb4IM3yBJaaOj
	kg1mV7hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0EKw-00000007yCH-0ALY;
	Thu, 03 Apr 2025 06:46:02 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0EIr-00000007xol-0MWO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 06:43:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=Fw5J2bwP9Wx3DI
	VhWgD5cLvSR6UG2CRnpvSbLDR6590=; b=lxowoy/sdt9UgZr73cE4HCc1dJy/oA
	vu7H2fYCj5km55fjVAcEkAJmQwtmDP0H4f/e8K1q+ZniXifzlittJK1GHCNyuKwD
	gCVhgX6Kqw6aWiC6j419LbN627mSfHUGgUU3S3v6Fj+XLUt6MBLkt3AoYwEL4Xkg
	6e1srJos7T+ci49GqdvHX+4mWOcnrPa+xo0g11FL2Ed2SJW6x9rGrPZHn7nbNDHA
	MqF38i7nstRUsf591X/bf1sss72SDSdu/YI74jqZxSEeBE7vHWVe+Z+QAvYJKkrx
	orrWawS4bGr4ZKpXdNLk2c6hWdS24WL+/Awifzm+bL6cLc/d/Bf6nWbQ==
Received: (qmail 2262937 invoked from network); 3 Apr 2025 08:43:45 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Apr 2025 08:43:45 +0200
X-UD-Smtp-Session: l3s3148p1@ZQpiF9ox2qUujnsA
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
Subject: [PATCH] ARM: dts: at91: usb_a9g20: add SPI EEPROM
Date: Thu,  3 Apr 2025 08:43:37 +0200
Message-ID: <20250403064336.4846-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_234354_098187_F39C48EA 
X-CRM114-Status: UNSURE (   8.33  )
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

Schematics and board layout indicate that versions with a dataflash
instead of an EEPROM might exist. Let's handle that once we have
hardware to test.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/microchip/usb_a9g20.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/usb_a9g20.dts b/arch/arm/boot/dts/microchip/usb_a9g20.dts
index bdaf35c6526e..555291cd30b3 100644
--- a/arch/arm/boot/dts/microchip/usb_a9g20.dts
+++ b/arch/arm/boot/dts/microchip/usb_a9g20.dts
@@ -12,3 +12,17 @@ / {
 	model = "Calao USB A9G20";
 	compatible = "calao,usb-a9g20", "atmel,at91sam9g20", "atmel,at91sam9";
 };
+
+&spi0 {
+	cs-gpios = <&pioC 11 GPIO_ACTIVE_LOW>;
+	status = "okay";
+	/* TODO: Some revisions might have a dataflash here instead of an EEPROM */
+	eeprom@0 {
+		compatible = "st,m95640", "atmel,at25";
+		reg = <0>;
+		spi-max-frequency = <2000000>;
+		size = <8192>;
+		pagesize = <32>;
+		address-width = <16>;
+	};
+};
-- 
2.47.2


