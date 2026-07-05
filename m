Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8454AC44500
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 13:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMj9GNSdDzh25GFJ9IBTaLzS4NDohAAkb9apxkNivbQ=; b=P54nV0NhRQajBiRiaQdcZx3Z4x
	H33fm2UsqSQp645KdIn8dZOa1LQL9vswrT/hrer7D7kS3S10t7w61Rbm/sTnVR609fErvxP5G+6TH
	bFOx+lJrs6JUzwyfeGOTIt0cJw7NEmjuOv9F9rl+DFqymrbGniKyOXebHkD1Y0y2ZNXIR/lQr6vog
	a0OSiGTElwDEA0/jtcOLBa/qE/Xs5hyKZ7cAOl7xkQWAlw6ua6miGc8xbJupwPLXPYVlH4iJ7Zrp9
	eZAB9GtkpKf5+qY6uyCia7gyZKl4dX4qdOcxp8oAfyS0cXmbmANZZIdFrR/gi58RcnXhNweLasVHD
	vCCqsM5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgMjE-00000009KED-1oSA;
	Sun, 05 Jul 2026 13:17:48 +0000
Received: from [2a0f:4ac0::3a11] (helo=mail.cyberchaos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgMjB-00000009KB4-1ofw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 13:17:46 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1783257452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IMj9GNSdDzh25GFJ9IBTaLzS4NDohAAkb9apxkNivbQ=;
	b=ky/b63Cdc8k592Y8f7ay2zEleKPXz1mh88SQVn0CqpQZxHHBOGU7y4DQ3mg4W3kuhD54vP
	wPWyAHXZZRSUGH04OIai+1bPqj5hyKbqh5Ai2C1vlxd2i/Xdte5K9DhaBR6G+JQ77kmsN/
	X1QJ1Fn48jHHexcHYbgs40Je45xqv7o=
Date: Sun, 05 Jul 2026 15:17:21 +0200
Subject: [PATCH 02/10] dt-bindings: interrupt-controller: apple,aic2: Add
 apple,t8132 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-apple-m4-initial-devicetrees-v1-2-e5655ee56523@cyberchaos.dev>
References: <20260705-apple-m4-initial-devicetrees-v1-0-e5655ee56523@cyberchaos.dev>
In-Reply-To: <20260705-apple-m4-initial-devicetrees-v1-0-e5655ee56523@cyberchaos.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Hector Martin <marcan@marcan.st>, 
 Linus Walleij <linusw@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org, 
 Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_061745_641332_F277C53D 
X-CRM114-Status: UNSURE (   7.28  )
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

The Apple t8132 (M4) SoC uses an AIC3 as interrupt controller, same as
the M3 predecessor.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
index d0d9a90e96e7..7171c8c09fea 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
@@ -44,6 +44,7 @@ properties:
       - items:
           - enum:
               - apple,t6030-aic3
+              - apple,t8132-aic3
           - const: apple,t8122-aic3
       - const: apple,t8122-aic3
 

-- 
2.54.0


