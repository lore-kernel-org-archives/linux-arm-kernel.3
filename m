Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99284D6CFA2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 20:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aggbRlb+OB+jD918+NWrqTGSqfk1kvSBq/eAJHlC7aA=; b=qR5YQR4/0WBo9X1ZMW5Zc+x79X
	fqTzzb1C15DmDTD1CFYyyq77JtiF+eu83Lq6Yf7A8Te0W+fWluxtD4Xw5GLnWtnn9T4u7vPto84cq
	QNiPWh0EUjryuR+Wy1sq55XyyHbQtjXn03kYYdbwfh/wxw0oDpD78E8bfsSO7YrpScPmiTuSYYq9k
	YfkS+R0b7N//AKROaMw4osWW429s5/Rd336iV/54JHsDFvp0oKXJ22tJmhx5ecmQrCQtqnVMuez2Z
	QUtAp4/HGmUED1tr+8dk5L132agBI2W615Q4/k0tnvjk23ZwHKYLE7QZh1ZZtynzTJPgEFDfTMzbP
	BQ8cTANg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj1E9-00000007jzb-2EdM;
	Thu, 22 Jan 2026 20:24:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj1E8-00000007jzV-3WE9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 20:24:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E84B6014C;
	Thu, 22 Jan 2026 20:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2730C116C6;
	Thu, 22 Jan 2026 20:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769113461;
	bh=jxDva29TmrpTbuXwfPS+LrQb+ngGyyCiK1VLf/CPIe4=;
	h=From:To:Cc:Subject:Date:From;
	b=l7tD99218rwrX90xlcBuLjn0U4w25QlHBncCKJ8ZFCIAxbPt4PRxDLSsM3qmOroyG
	 tJ6mUUQ/hSTn0IMhi9HJSBtEWPK1Wrm+q1iHyVt4rKbxQ8y9gcnFjpQ//Wfq+6XyFw
	 M/zpugqNM3HUWBMVAiwTwniCtxZrDINd0RFptALUWolNYUTN/5VVnrVPRKKjQWSN10
	 1oOQX+eBE27lUNurHlsMqczVE1028H9Es2y6HA5uOoUoJt3CBYLs9w2Aq6SYcq6ZOA
	 bA07/DwFSxSWFyscGX9WbbFwv8ibECKI2JjcKKGg4dECSun6kQQyPcQTJVzNYKb2Zw
	 miA2JWy7l7CSA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] ARM: dts: microchip: Drop usb_a9g20-dab-mmx.dtsi
Date: Thu, 22 Jan 2026 14:23:45 -0600
Message-ID: <20260122202345.3387936-2-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This .dtsi file is not included anywhere in the tree and can't be
tested.

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../boot/dts/microchip/usb_a9g20-dab-mmx.dtsi | 93 -------------------
 1 file changed, 93 deletions(-)
 delete mode 100644 arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi

diff --git a/arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi b/arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi
deleted file mode 100644
index 5b1d80c0ab26..000000000000
--- a/arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi
+++ /dev/null
@@ -1,93 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * calao-dab-mmx.dtsi - Device Tree Include file for Calao DAB-MMX Daughter Board
- *
- * Copyright (C) 2011 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
- */
-
-/ {
-	ahb {
-		apb {
-			usart1: serial@fffb4000 {
-				status = "okay";
-			};
-
-			usart3: serial@fffd0000 {
-				status = "okay";
-			};
-		};
-	};
-
-	i2c-gpio@0 {
-		status = "okay";
-	};
-
-	leds {
-		compatible = "gpio-leds";
-
-		user_led1 {
-			label = "user_led1";
-			gpios = <&pioB 20 GPIO_ACTIVE_LOW>;
-		};
-
-/*
-* led already used by mother board but active as high
-*		user_led2 {
-*			label = "user_led2";
-*			gpios = <&pioB 21 GPIO_ACTIVE_LOW>;
-*		};
-*/
-		user_led3 {
-			label = "user_led3";
-			gpios = <&pioB 22 GPIO_ACTIVE_LOW>;
-		};
-
-		user_led4 {
-			label = "user_led4";
-			gpios = <&pioB 23 GPIO_ACTIVE_LOW>;
-		};
-
-		red {
-			label = "red";
-			gpios = <&pioB 24 GPIO_ACTIVE_LOW>;
-		};
-
-		orange {
-			label = "orange";
-			gpios = <&pioB 30 GPIO_ACTIVE_LOW>;
-		};
-
-		green {
-			label = "green";
-			gpios = <&pioB 31 GPIO_ACTIVE_LOW>;
-		};
-	};
-
-	gpio_keys {
-		compatible = "gpio-keys";
-
-		button-user-pb1 {
-			label = "user_pb1";
-			gpios = <&pioB 25 GPIO_ACTIVE_LOW>;
-			linux,code = <0x100>;
-		};
-
-		button-user-pb2 {
-			label = "user_pb2";
-			gpios = <&pioB 13 GPIO_ACTIVE_LOW>;
-			linux,code = <0x101>;
-		};
-
-		button-user-pb3 {
-			label = "user_pb3";
-			gpios = <&pioA 26 GPIO_ACTIVE_LOW>;
-			linux,code = <0x102>;
-		};
-
-		button-user-pb4 {
-			label = "user_pb4";
-			gpios = <&pioC 9 GPIO_ACTIVE_LOW>;
-			linux,code = <0x103>;
-		};
-	};
-};
-- 
2.51.0


