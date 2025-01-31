Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB467C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 16:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i9cXZBXvS7yT/u5Gd5r3rTLgf02jRz5YmvpnmpgTlkk=; b=lxUuSMCUsj5WTk
	m63BLxr7HiL60cr7ysYquPGyO/qjZw2fY6UA1FoRDIxXbLW12RSmBDhFFKgHhrabKoDdWjkWe2ecJ
	1+7eXs90eoTbQgwpgZ2kajik4ZIwJ+2avL1E3YLqhmPgRpyQzWJ5v9YlFx7HT2Zpu/tlktUJY3x14
	i7Uh6rGUja2K3AJp87ECG8mTGVgt9WJK9HEkqRdzgk9IlPirEf76K7QFuA9Do/rWCQWWzYZgo8bAG
	PHvvWo2L/gIMZP2u0oE6VQ1zdNb3d7mYbErFPZLgqvt8kZ5TZMQWVGDaojQlSZaGwiRLTTamwMbpY
	0BsYxkLncNgSjw7tOhaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdtzV-0000000B00u-3rcT;
	Fri, 31 Jan 2025 16:35:37 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdtqX-0000000AyLM-03wK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 16:26:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=i9cXZBXvS7yT/u5Gd5r3rTLgf02jRz5YmvpnmpgTlkk=; b=ehG2pi
	1OFruMxtkMQpW7PQaGwzAiPNpN5tL2zVXUzGZctjJnvtXF6d9n6bkxNOmZ1dQkWX
	lBJlNzx3Tm9ap5NhA7QxreuCCGR5YvHaZECUjG9jo57jzsQ6OdH09WJgFHaMHDtt
	mzK/RFbCmca6fX56hkn+qsSFnW3ZMASuo47d9GnpJ6IEsv5nMLXpZSb1kAmx0R/h
	hwUFDLZOPzpoCXXL1+/CmkLH7J1pvXAIOz+97jS4tXSAdrWKsl4vYqW+e6r3MivJ
	06dzQ2k2xi2whHxyUBQaDOc8sRREMCqHl+6PE18mYhkRLf2X9KCkJfaWeXjIqUxj
	eshMJLohWcDKPHTQ==
Received: (qmail 1738766 invoked from network); 31 Jan 2025 17:26:19 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Jan 2025 17:26:19 +0100
X-UD-Smtp-Session: l3s3148p1@ETOhAAMtrGbUph5e
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] ARM: dts: at91: calao_usb: remove heartbeat for User LEDs
Date: Fri, 31 Jan 2025 17:26:13 +0100
Message-ID: <20250131162611.33338-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250131162611.33338-4-wsa+renesas@sang-engineering.com>
References: <20250131162611.33338-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_082621_336159_22DBE47D 
X-CRM114-Status: UNSURE (   9.83  )
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

Default DTs should be minimal. It is cumbersome carrying a custom patch
disabling the heartbeat just to use the LED for own cases.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/microchip/usb_a9260_common.dtsi | 1 -
 arch/arm/boot/dts/microchip/usb_a9263.dts         | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi b/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi
index 5eb844f2df9d..9672a5626cae 100644
--- a/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi
+++ b/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi
@@ -123,7 +123,6 @@ leds {
 		user_led {
 			label = "user_led";
 			gpios = <&pioB 21 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "heartbeat";
 		};
 	};
 
diff --git a/arch/arm/boot/dts/microchip/usb_a9263.dts b/arch/arm/boot/dts/microchip/usb_a9263.dts
index 45745915b2e1..ef529ec5dd6f 100644
--- a/arch/arm/boot/dts/microchip/usb_a9263.dts
+++ b/arch/arm/boot/dts/microchip/usb_a9263.dts
@@ -151,7 +151,6 @@ leds {
 		user_led {
 			label = "user_led";
 			gpios = <&pioB 21 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "heartbeat";
 		};
 	};
 
-- 
2.45.2


