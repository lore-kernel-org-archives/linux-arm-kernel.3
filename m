Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852CAC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 16:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ixfcIAAexUl2WSfXY24foaU0s0qcPAN9Tsal26az1zc=; b=hcINJc4kenu8xz
	X7Kb9ndDRb6q1eqXmUWy/qcYMNUHgtRuQt+4xb1pJBx+mXtvwaCx0XemaTnp/PbQmNVcqfU9l9lxp
	EICeUeVUpygbWho/B4/PRTH3FjL87agFCVKfIdDKfjqQs4NPPY/t2HM/4rfbe+i0YsZvyjbCOKpnk
	RLaRXv2948wU1hggCzrcP6XVJbkfMfYnPjeMuAi8i+pHdWD8rLC5rCGuwAcqzKY1XfX63em02m4S4
	B5yTx/F1TdojO0qFwqcEESuLQpTZmZKa/bDMYCY0uACZ83ZR1Xd9MUhTaKEANQUNWPlxX6w3X8d1I
	ATBKzOfxNXO0R8O8t4ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdtyE-0000000Azdz-1DLc;
	Fri, 31 Jan 2025 16:34:18 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdtqV-0000000AyKn-46ZN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 16:26:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ixfcIAAexUl2WSfXY24foaU0s0qcPAN9Tsal26az1zc=; b=KyfUpu
	7WfYr9xPnq93SQd43N+Mvu3MMFxMVZ+huYsYTx2VXe4UeOUzf449nAx2FojFpgtf
	JMjgq375iljCpYTMhRsbnUTBpMAXAVfn6gbb4QbTmy3IS7yPIiy2VVh4FkEOxlw3
	c3emE5QJcxnkb+gdrySQMgO9VUJdnmiqM6VQCnOzNYnlGx7X8zj+1x3HzEZaPMFe
	NcFQTwFlekLzgR7SnC9tCXctjxTvxq98mnpvFOEROzZ5oB6C8wCayV2DcaE0SwR+
	KTjHqV3Fr21whlfqhCvYv/Osp/BObn1HIjEbZqQhCkP8nCyffBfKtV1ZdIpU1IXV
	XP73pF2VL0r1WUDw==
Received: (qmail 1738719 invoked from network); 31 Jan 2025 17:26:18 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Jan 2025 17:26:18 +0100
X-UD-Smtp-Session: l3s3148p1@S3uSAAMtrB/Uph5e
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] ARM: dts: at91: calao_usb: fix wrong polarity for LED
Date: Fri, 31 Jan 2025 17:26:12 +0100
Message-ID: <20250131162611.33338-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250131162611.33338-4-wsa+renesas@sang-engineering.com>
References: <20250131162611.33338-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_082620_291325_7E4A3D15 
X-CRM114-Status: UNSURE (   9.95  )
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

It is active high per testing via sysfs. Also matches the very similar
usb_a9263 variant.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/microchip/usb_a9260_common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi b/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi
index 8744b5f6f792..5eb844f2df9d 100644
--- a/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi
+++ b/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi
@@ -122,7 +122,7 @@ leds {
 
 		user_led {
 			label = "user_led";
-			gpios = <&pioB 21 GPIO_ACTIVE_LOW>;
+			gpios = <&pioB 21 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
 		};
 	};
-- 
2.45.2


