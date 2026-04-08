Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B771610F9964
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 17:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UBIjXtimEC8z6iE9BfKGji+xfAx6FZDoerR+pykd9LE=; b=ezEw9vxdyLwR6EjD/KJ+1gQ23r
	yYGSlN1pqwYAnZbYubEhcRfZcNXumO+6nPJdkTPaNM5KE2Io5OBhuaE+NmA5L/t2UNcYoXluW6TYW
	QWzo2nPAnxMb6JRSayRcQ0YRcQlP6NukfjjU+rp0QYVU3JGVXpHdo1E1lsluXcbYi62y90Uhea5Se
	GxcPPfSVD1E6+69hbKbEUiC3lGkd88eWbfNq8DDTDsLsuFGn3wp+QtiwOu43YM9YdOCx/C2eYka+K
	h2r2zsJwvT6RWnNLi9npCoTtGobPTcbUsapjNsCGB7HSk+GhqsDCotRJtSqekc4fPn5ZlTrWbe6P3
	jPRJt4qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWbk-00000009AfY-2mew;
	Wed, 08 Apr 2026 17:22:28 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWbg-00000009Ae9-3nFs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 17:22:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3C5DF1A31F5;
	Wed,  8 Apr 2026 17:22:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 11FAD603CE;
	Wed,  8 Apr 2026 17:22:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 689D01045017E;
	Wed,  8 Apr 2026 19:22:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775668940; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UBIjXtimEC8z6iE9BfKGji+xfAx6FZDoerR+pykd9LE=;
	b=G+weuG8bwIawZYAgD3gCT2/VfWHmq7yaCDI4SMM982Q+a/XttsJWCezVFRx/Ekc/UmxMX9
	XyhouRvZk+Zi85mQIgCf0ZAMYZQWRVyzS31nn382MCY4Geue0r8kCb8id8Q90F7DNycfys
	6w9nzlb1D3tDDCQscy2re1ug10YoqKF2fkTxaL+68yeH5qxeA0wYQBXhIC3H/fRqKcoFEa
	O70BWec315TfLIMcCKt8RloyXhzNAyuhr6o6owAtisLUHm3flI38oPYxHBKipy7hY3cgvM
	5DufpwUlpohkwx2chd/lWyM1Dk0ZX96Edk2tbaje2/5KW/si1Cveuywz0150Dw==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Wed, 08 Apr 2026 19:21:54 +0200
Subject: [PATCH v5 1/5] dt-bindings: vendor-prefixes: Add AAEON vendor
 prefix
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-dev-b4-aaeon-mcu-driver-v5-1-ad98bd481668@bootlin.com>
References: <20260408-dev-b4-aaeon-mcu-driver-v5-0-ad98bd481668@bootlin.com>
In-Reply-To: <20260408-dev-b4-aaeon-mcu-driver-v5-0-ad98bd481668@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=916;
 i=thomas.perrot@bootlin.com; h=from:subject:message-id;
 bh=AGFAvWQk7zbxUAEt/PCMZqut0lt2/9FHvDQ2czbP9Tk=;
 b=owEB7QES/pANAwAKAZ/ACwVx/grtAcsmYgBp1o7DI3w+rVUWZTe7H38X421b6sLX2EXxPl9Sm
 kxhfXFiGl+JAbMEAAEKAB0WIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCadaOwwAKCRCfwAsFcf4K
 7SvtC/oD6PgRkmSR74B35Eq7t21wwxQYtIB5T9r++AIM768VV9/eluT+EdWwdAo0+i4F4BgppHi
 ignu26bRlRzGee1SDTAxETaRm7O9EheK14gcaVe4kQChmaohFHawAsTaMCvKWaxpMjWMkQFyyha
 0UFqp2vjRXB+Re8ggnyVK1lK8ukvZT7qAIlv2+CG6iQ8cPS3WcINITzY/nd8yeR3UHGhxIqzamz
 QjmC1Gv/Du4zlgvTiGwAHGYzpLQZ/gAw5f7WWAESyr4AbEUGThpWtHr6ZVYhpNOj5lDWvRzyfPv
 RM0X23enTGhzAWDKcV74xSElLIvtO86B0J4VKqR6MY5ylmIibc7X6TRnyfcvwtp3M7NIF25K/Y9
 TvFxnXrDjQqUsSCVk+VOttkiQEL3AI7MWxiksQe6b+ypYpIJijNmqbBHk+zCDP5GR+hkTHzrrJT
 7jDaNCL5pn2HIIjeCQiyqaBpiZ5WkMxgHhL8W55eyY2ab64gI7P+2CA1FZlfyOiDodb1w=
X-Developer-Key: i=thomas.perrot@bootlin.com; a=openpgp;
 fpr=874077C6A6A30A2303A812219FC00B0571FE0AED
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_102225_105280_600291F2 
X-CRM114-Status: UNSURE (   7.26  )
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
2.53.0


