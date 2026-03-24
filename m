Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CF4FEC0F7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 19:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TM2DP092hskmM2RxaM2LB3v7gKNIlq0ovjIXOQs9+P0=; b=d74pfk5YYYJDvr8QtOzHdxZ0yC
	R8e5wqboB+0dO3Zi4QQI+aNUDI5zOljKsgeENKHZPStj1u2G7PtcyZv6HMrUve4Hx84+VPOWimHN1
	efdTF84HVJmKRdaLMmXiIsPPygoMkB1i+yBl4oxKYWxw09MUdvcYHlI/74807/nRdegLenGeOsU8c
	bmeLgyOcinsENKT9KZ0BcGmjtMuJMzKWFreH7qbns2iVtaFeRwK1D6Tv2LBkt2bf4yTDbDRja5P/K
	TcCtU7dKGhgxoVvB1OdGMfpb7koqkGds+czU479frIjlQ/36wAPVmI0eGBoU/NsudsdL/5pUZTQlK
	6rAjY5Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57N7-000000028yj-3Yye;
	Tue, 24 Mar 2026 19:25:01 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57N0-000000028tO-0pCr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 19:24:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 575961A2FD3;
	Tue, 24 Mar 2026 19:24:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 23AB1601A0;
	Tue, 24 Mar 2026 19:24:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 75039104510FD;
	Tue, 24 Mar 2026 20:24:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774380287; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TM2DP092hskmM2RxaM2LB3v7gKNIlq0ovjIXOQs9+P0=;
	b=AIJf2nsu1Xny3excqeLKgyKBelSfOeBWWGVVzbv0/2z1TcR/BRSB1paYXZu9Fj7eQbbQj0
	CQXZpAK4ez0CCgL5810RrbyqiMiYlnq5V1Ms9pzcqwH2M5c9HDtHahcR5RTIz8BilmMw5P
	ixN3oxVeCDqOoPswcbsZEE0roQ7TNUVrt/SPlemPn4Hjf7DdZ1BVqLN68zRnYARQrr5nGg
	MLW7qocJDA+7B6ISgoSke/t6U5JFwfrzrBQc9lpR+pYq3/T1bgN0NW+6NqVLZuqwLytgQJ
	OvkptfSJ34I/xbVkY0brhmGvac5vKMUW1wFm04Rl1uxrkg1FxdD15YdjV05AIw==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Tue, 24 Mar 2026 20:24:27 +0100
Subject: [PATCH v4 1/5] dt-bindings: vendor-prefixes: Add AAEON vendor
 prefix
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-dev-b4-aaeon-mcu-driver-v4-1-afb011df4794@bootlin.com>
References: <20260324-dev-b4-aaeon-mcu-driver-v4-0-afb011df4794@bootlin.com>
In-Reply-To: <20260324-dev-b4-aaeon-mcu-driver-v4-0-afb011df4794@bootlin.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=972;
 i=thomas.perrot@bootlin.com; h=from:subject:message-id;
 bh=8TrHU4hzG9jr3+WmGmkzip34kt3Cu/9DQjiFtGVa7UI=;
 b=owEB7QES/pANAwAKAZ/ACwVx/grtAcsmYgBpwuT2Kd58wahK84WAtZw6eMJgCXIkdog5o2R4g
 lP7K588teiJAbMEAAEKAB0WIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCacLk9gAKCRCfwAsFcf4K
 7ZqPDACLSA2ImO2DZkyG5z1qL4EBemwiUD0EM1TzOUA6x1rVmhAJa4i9KK4EzOi59Bs/wfP1xxa
 BS1N9RgJKtIcBKZiytjoekht5parai1YFZEkcanXIxz3jxytLtpyOP5HaGVNdPAyWqjExaKiN1Z
 hxxDxL+BcajXALRtmqSDp+si3sA+RQ3NwWCtuG39DoZL4exu3c7ABXxRMtojxb5oBsyrBGsmZvu
 g+fbCrCAyk4VxCZJPURSSNYDisnRPhSLj60th4Fk8h64EB1W4O5b4AzigrTY52VVL1POR5rUwRJ
 /xwykzYQjF8SIkzWDtbIoFE5hpkqZoBcGnNr/UkGjqbhO/9PERl8jxLSXh5FYGlHLq/SQSfblIZ
 EkrKXeZ3gpkjbLmgVCmiyDTHNti3CVVzL3GGZ4XZzKggNtFtIXIrmnhPwDiWS2W99thZecWhHgM
 iWWsiu7kXZ6MXAAg85/R3Da0CDE2me6bPvjusrmEJJqLcwyUiYqyKi15/2d0UqkfNhAOM=
X-Developer-Key: i=thomas.perrot@bootlin.com; a=openpgp;
 fpr=874077C6A6A30A2303A812219FC00B0571FE0AED
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_122454_369516_15D39D4A 
X-CRM114-Status: UNSURE (   8.39  )
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
2.53.0


