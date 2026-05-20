Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C2A7CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 14:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFalp3WAgAi9MOnT6TY3HIU2AWIehrVMXUG7sEmV9as=; b=FHPwf2dPM38bSafuC7bFGtrLj1
	xUylS30vJ9L638ZtE1dUTBhOJai+sT+47KPAozA5VfHUniqdGmV3zjFc+nMy5iU8Q11KVhsdqLrWF
	JZInN0H2FnIVXgklPBRZiv3GEOYF+yIdW0CgxXWVN+AVoQmor69shUT3aDUOL6GDXsZFcviS1v9Mh
	Jvgy0YjNfwBSGGmRw0mVudzQJPO4XGk5YXpDMAL/pmHa9g28Y58Sj6UhYKABF2LY+Q70mgaVByLu2
	qSVQPjdnzDWQAn1sgTbHbUy6LW+VGmVXTSQ/SFjUozck+KJ2a5MpzJagokWDk5IxlIBth6CHsOZGQ
	tyIZVTWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPhuU-00000004oX3-0FWk;
	Wed, 20 May 2026 14:28:34 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPhu1-00000004oCx-1qJI;
	Wed, 20 May 2026 14:28:08 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779287281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VFalp3WAgAi9MOnT6TY3HIU2AWIehrVMXUG7sEmV9as=;
	b=VB5SP8HAKxJ/evHYz2oBI67bD4Q4B/8/aDknPDh+49ym5xX7SNNHixvJe7ajAITDtmfETf
	4bHKhXZshsTgz9Ns6IJ1981+EsBMZkfLjU+QYQghpx4/t1lUYgI9gS3oGTxbl1u2fWNgOZ
	5JdujQ+ACan9yrn4HJmmZ3315V0kmkD2LLHwTJWB5L8hU37iIIa1diKJla48vU+YPoc6ip
	TwwX9dbXbYd34n+VPOwkeaQSaJNBGYHR1l8WRcLoueXErJfiPoLCZSkUpBUPl4a7p4R/O6
	g1cni8GYE7/Mz/JR/GrqG0ejWb8G0kPZwjc5LcTagHVu7d13XqMpKve4gcL/gw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779287281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VFalp3WAgAi9MOnT6TY3HIU2AWIehrVMXUG7sEmV9as=;
	b=93aGGazXPspBydCnunlRZnMXyodGbB+A0V7J/LIqRoA9uDbf97loaRRX9gnizP6M5ZQf6R
	Eq7EIdK9eLlqx2BQ==
Date: Wed, 20 May 2026 16:27:59 +0200
Subject: [PATCH v5 7/8] dt-bindings: raspberrypi,bcm2835-firmware: Drop
 unnecessary select
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-rpi-otp-driver-v5-7-b26e5908eeac@linutronix.de>
References: <20260520-rpi-otp-driver-v5-0-b26e5908eeac@linutronix.de>
In-Reply-To: <20260520-rpi-otp-driver-v5-0-b26e5908eeac@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779287277; l=1155;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=EBbnYhbRo0d+VU8z2ObRFO0eA0vleo9MiChog9LUENM=;
 b=WAZcB6652Pc0oNVqoPMUj/u63sly+g4T3QqAjDQ7gY96y3i2SFqOAkUh8POAmm6VgLYtcP4uh
 OlOxSnxvXl5CEgPETwSxHnx69opdnkzn3IQ67hNX5Dy9NfMVhKaQJA0
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_072805_638060_CE38FBF5 
X-CRM114-Status: UNSURE (   6.91  )
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

The select schema is not necessary because the
raspberrypi,bcm2835-firmware compatible is already matched by the
compatible string values. The documentation says "Most bindings should
not need select", so remove it.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml           | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index a3a5243b91706..7cf9a6fa1e5be 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -10,15 +10,6 @@ maintainers:
   - Eric Anholt <eric@anholt.net>
   - Stefan Wahren <wahrenst@gmx.net>
 
-select:
-  properties:
-    compatible:
-      contains:
-        const: raspberrypi,bcm2835-firmware
-
-  required:
-    - compatible
-
 properties:
   compatible:
     oneOf:

-- 
2.47.3


