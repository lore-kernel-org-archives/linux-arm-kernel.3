Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63736C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 21:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0dnMWA+YuZshFWD3BrZmtv8GjkhhZbLjVNnaO5/kDcQ=; b=ADgksj2/k9AkJt
	oD4ES3jtyAkSYa1kqtcrXZeIsuQ9z4ri1tCI/TWsgv0KHPDLoJaUHge2fTLsJxeJ2Xl86LU9YRV/J
	TPTr2xjSo/EHgioKU5aS+v/c1chCFP5xhYHs4bAzPx///AFYl8Us7Ak7yiULPo20CX+aVfhhMYx7M
	MQNxQB2q8VlkutrVZkYhtbP1fIIvkLcidfO+a/Mk6lKuYeaIJP4HgPp84UWM3TT1kTXL1rFi+Ivep
	zZuuuL/x/e5LJVGZeiNDSCxh9LJA+Rutk1Cg0HKitxHvsr058litobNiwvhjHUMy/zckg/QIR5YLC
	hMkFMQrqSjOUbp2Fsatw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyBT-0000000BPjx-0ikp;
	Fri, 31 Jan 2025 21:04:15 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyA8-0000000BPeZ-2K6K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 21:02:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=0dnMWA+YuZshFWD3BrZmtv8GjkhhZbLjVNnaO5/kDcQ=; b=a9gyrH
	woOvz2v1MZgMAcqn+/+5h+pdMm95ViUIgEY2rljF6rIK2SiSa9qEHJWXsyluBTsR
	Oq9mUGvYyzg5GLIQZKSEELpVVo/xGQNT/4u+cPw2udyN2WWig3XmhZOPvaDk7Vy3
	9mA60JwDoREzf/xUDmHp10Jce3oTnm5gPDNSQZ+RAN7bLA0QzwdgO8YGHkCSclce
	sxa1noLHsaSZsSk8g7/17OJVtVR40Wkv4S0jPv7qwrwN4e7BM8c8FbZcmeG3NxFl
	5GD3Yd3jfx1BKpAgldekJgLUj/6PobVNxTY5lviknFgkWqCpsGhy8s18zgFXlULr
	CYsJZmkpUzhSIyHA==
Received: (qmail 1802004 invoked from network); 31 Jan 2025 22:02:49 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Jan 2025 22:02:49 +0100
X-UD-Smtp-Session: l3s3148p1@/7p93QYtrFfUph5e
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/4] ARM: dts: at91: usb_a9263: fix wrong vendor
Date: Fri, 31 Jan 2025 22:02:36 +0100
Message-ID: <20250131210236.36212-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250131210236.36212-6-wsa+renesas@sang-engineering.com>
References: <20250131210236.36212-6-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_130253_456814_6047FE15 
X-CRM114-Status: GOOD (  10.01  )
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

The board was made by Calao, not by Atmel.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/microchip/usb_a9263.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/microchip/usb_a9263.dts b/arch/arm/boot/dts/microchip/usb_a9263.dts
index ef529ec5dd6f..23240f2c8a16 100644
--- a/arch/arm/boot/dts/microchip/usb_a9263.dts
+++ b/arch/arm/boot/dts/microchip/usb_a9263.dts
@@ -9,7 +9,7 @@
 
 / {
 	model = "Calao USB A9263";
-	compatible = "atmel,usb-a9263", "atmel,at91sam9263", "atmel,at91sam9";
+	compatible = "calao,usb-a9263", "atmel,at91sam9263", "atmel,at91sam9";
 
 	chosen {
 		bootargs = "mem=64M console=ttyS0,115200 root=/dev/mtdblock5 rw rootfstype=ubifs";
-- 
2.45.2


