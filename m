Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4007E87847
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 16:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iv2/16VnKv0xj7dzCIsq/6ykvwxz9Vm1Oxs1q8ZKaVA=; b=l9kTiYREH0yUUTz3oaZpe38mF/
	AT9SVj6LjgAYmjerZ/37jk7/nllDIrUsbGnnDr/G2iJo2CxgkHFpojxyHbj/WytQUIlzwvsCwkPXJ
	1+hqRB2Mpwcv1VrMH05mSqi0rM3l+mBrfS6iREMeiT73hBNNCa21HcXQ5y+fk0RXYIcN+FyR1b0F7
	JGggJ+uerxOsnWNVB0Eei9nneMg1wnEspmayUnfgC0dRFX5JSMjKGhTiPSMzCdMpojmGgXQcI4kRK
	ffk/OPdozv55WKbFTj/TSj9tkp0nTwZvFFkH1mSWTIZluPXEXR6Y0oBqgWAHZVYDn66iBeNJ3OSqS
	FoE4/W7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJ9q-00000006vmE-3tlz;
	Tue, 03 Feb 2026 16:21:42 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJ9m-00000006vkH-3fgi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 16:21:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0AC36C24383;
	Tue,  3 Feb 2026 16:21:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BE8CC60728;
	Tue,  3 Feb 2026 16:21:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EDB15119A8888;
	Tue,  3 Feb 2026 17:21:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770135695; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Iv2/16VnKv0xj7dzCIsq/6ykvwxz9Vm1Oxs1q8ZKaVA=;
	b=IhJaT0Ou/kPgEgJQh5skMhWgrBzndqcfICme9vUHZfia6yIm3tp6/EDpLEYNlMh4eoJaB1
	+5drPdkwQT+eUDHXCS6R05Nz4zvUu+GZAPQpEGG3ivAKv/eSmbMSspsScE+MYjrqdtadAB
	8RpcIglgtj9Ls+5+Slm46o7CoxwpaGbjwa3BtiT3FMeJgsa7Muty/Xa3M21tXiSeYB+xaX
	ETmMNTkDig4Mx1Yq7Va9LABP76/OeVuYhthcHpBQvwqUr63b1JeiBxcUwLFX6LPgAoWScE
	tVlti3rn0Q8Ihcxwhj901ddDkWJFPgTC/v2JHo9zxW/MD4NVN5dOUHcWERYC5g==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Tue, 03 Feb 2026 17:21:10 +0100
Subject: [PATCH v3 1/5] dt-bindings: vendor-prefixes: Add AAEON vendor
 prefix
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-dev-b4-aaeon-mcu-driver-v3-1-0a19432076ac@bootlin.com>
References: <20260203-dev-b4-aaeon-mcu-driver-v3-0-0a19432076ac@bootlin.com>
In-Reply-To: <20260203-dev-b4-aaeon-mcu-driver-v3-0-0a19432076ac@bootlin.com>
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
 "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=972;
 i=thomas.perrot@bootlin.com; h=from:subject:message-id;
 bh=FXR1urZyHxRMQhEV+YAE1Dupsb+CKUg3wI8EMI1En5g=;
 b=owEB7QES/pANAwAKAZ/ACwVx/grtAcsmYgBpgiCHHJdMGQyfnwVKTPYFRXLxHw0FYtCoHkC2W
 uj9FJzILRCJAbMEAAEKAB0WIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCaYIghwAKCRCfwAsFcf4K
 7WvJC/9SpUNhoDdX7+9IAoTUB/v+MkNNL5RbRfufer1AeRcJ5JWN159wm3yunjcDD1XzO2ogmDE
 8vwMKJ3nJOEuXYo70lspF9dT6azJ/a+P3cySfcc37Q2LTAIf3Vi471TXXt8x80UtFDr6GhSqDZG
 p4gfDXuv7+Ab/RMpBC8bw4ENMl6UPLy7st0WiSAJmIeUjCuDOpfGFTSPQ4aSADIH6I9VlQVqNom
 QSCkggI9xPez4xclj6m08AyYvDobRP6fpKia9qScRGuSpnGlhQP6+z9qt2OQb4SuHYdLhYcp0mx
 Iz3WR/WVriZS0Abmlq7FgxPJlt8eJSvZ/P+aKFzxvUSwTtTNeru0aDMeEoKW9drMKwAsOYTVIfg
 fSEMkz7qa0BIlxM1KPrURwtlq/MJEZdmMIUclF9Q5e/0tTS5HH5sLTxS5ECBmTGV8bfWIEUs5Eu
 0ofRm9KHlhsAvTLvbDuzKPCy89NatJI11YlgT0zg6vE+VlbPN18BjnX3nEFgmHnA05gK4=
X-Developer-Key: i=thomas.perrot@bootlin.com; a=openpgp;
 fpr=874077C6A6A30A2303A812219FC00B0571FE0AED
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_082139_061957_60D7387D 
X-CRM114-Status: UNSURE (   8.34  )
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
index c7591b2aec2a74560a4f687fe7a2070ca21b0752..0f84ee93b3a8473719ee92f8c046e350c4a20825 100644
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
2.52.0


