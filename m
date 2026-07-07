Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05CDC44500
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 08:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TE6fxPaU+LUiziMgyvgeiYBZXwhy0M3LvlV9yMFf+Sk=; b=lLAyxCg3C5uTHCZHc1fY4SZ18T
	WxmRT6B0KS6V8Do486hStBM5+G2aSUZRx1wMdtoT4TQ52TYKNIUc6tfuiBL0fOQGndI+wJ5Al/1ZV
	32pWFiH4PSlZDQw3Jt1hh+MSviSKx7EQTwhnipfwP69fs1PSMok3Na+q5UHkLyyM1GYp5qglWrHL2
	OPpRj0KVIRZ+i2IlZChb7UalfRn7+7hkL94J2V7Xzh8wFDLEajRFvwRSCR/yWfDaTY61LHrvaZbhE
	GcvzuqwZE4UscrZ2zjIZqOT9i8wHAclqI9j7iSo7IGqni6lSboiV6KHkffZVXQcJJndB95vcmXvwN
	1uGYjPMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0ke-0000000EOnR-3tGc;
	Tue, 07 Jul 2026 08:01:56 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0kc-0000000EOly-2kYZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 08:01:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 86350C8F1E9;
	Tue,  7 Jul 2026 08:02:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1AAA2601A3;
	Tue,  7 Jul 2026 08:01:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D43C711BC0D28;
	Tue,  7 Jul 2026 10:01:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783411308; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TE6fxPaU+LUiziMgyvgeiYBZXwhy0M3LvlV9yMFf+Sk=;
	b=pcaf08cI7nznLNsSX28aAZQQcs88EfWnutmeDXwx8yQXBVI1E2Lb6GV/LEi6S+pmNkJpIN
	M9cWkxp+S0Y+YEOYwqRnMiuXNQcwQJPf7e8yJviMFBqVWDhcq9MQlAFpB3eaRbVqEo+caF
	JNRCA2uE2VO6yZ2BnKpCxrDsrr9vH0p50lmlXEQ11TXkS2kqIVUDV7KVWkB2TDaFF6K70O
	wz4vzZPxS/sLE+tFtyRPS3VEMtWeKo1F+7Yrs/8md4ADsUGmfO40h/P3KhBafnwenP0bWB
	wNqaPJS0px59REyLbwMtEOh3/7/o06RsuhGyCKOVlV0Qd6yavGqmiCLotGFbQQ==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Tue, 07 Jul 2026 10:01:27 +0200
Subject: [PATCH v7 1/5] dt-bindings: vendor-prefixes: Add AAEON vendor
 prefix
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-dev-b4-aaeon-mcu-driver-v7-1-ca6c59abd672@bootlin.com>
References: <20260707-dev-b4-aaeon-mcu-driver-v7-0-ca6c59abd672@bootlin.com>
In-Reply-To: <20260707-dev-b4-aaeon-mcu-driver-v7-0-ca6c59abd672@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 =?utf-8?q?J=C3=A9r=C3=A9mie_Dautheribes?= <jeremie.dautheribes@bootlin.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_010154_871738_57983045 
X-CRM114-Status: UNSURE (   7.63  )
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

Add the AAEON vendor prefix to support the AAEON SRG-IMX8P MCU driver
devicetree bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c7591b2aec2a..0f84ee93b3a8 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -32,6 +32,8 @@ patternProperties:
     description: 8devices, UAB
   "^9tripod,.*":
     description: Shenzhen 9Tripod Innovation and Development CO., LTD.
+  "^aaeon,.*":
+    description: AAEON
   "^abb,.*":
     description: ABB
   "^abilis,.*":

-- 
2.55.0


