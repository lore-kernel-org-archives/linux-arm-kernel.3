Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B87C55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 21:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mq/C7RB1k+jJBxtWuGdu+hRvxYIcrl2ZqGrbd1/PVa4=; b=VkaaDxIsQxn3ibIUAihfWgJwUU
	j1lqYfUnFkAdhOu153UAF6FZdkRVNBxo00c91hr8OUl32/gpK8/55feVTHoRUvg+Hx/qZmRyZE9UO
	KjZJvQKEIME0mXKscUxM2gmnf8IC5OM2nsu9IXwa0v64bimLHTdHzvfIOFhJ2A99SP8p2fL8GaJWO
	fOCYsqe76tW1rLDhrdPpjvPYkpvEqArGi5rRhqVUAfeowIrrV/j/pZ3PjHHYItA+SO0CYr0aNw76e
	+2qJ/7R6wm49jtLmtENfJxkD4Xv7yopBE4UbQ+lLA9ScZz2Ix+9gWO44d4xn+IkfzS8l7SkAI232v
	gUdUB/hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqHSU-0000000F7zg-1m1i;
	Sat, 01 Aug 2026 21:41:30 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqHSR-0000000F7xf-2ra8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 21:41:29 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1785620485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mq/C7RB1k+jJBxtWuGdu+hRvxYIcrl2ZqGrbd1/PVa4=;
	b=fLnD8MAGbJyCcSBEzaey+h7VBLnveTeK+V1x454NZmiFik5coTCsyLRo3FLKieM9EZQw3k
	LnrEpoF6NLc9EKWCN0MuQ0UTyxvTBKc+pOu1Y0yvH4C5VMzrJUu5K19afe20XXgpDZ+Ifm
	JexVP6++MUi/lqSYhXCyz+zqfMZTLcs=
Date: Sat, 01 Aug 2026 23:40:35 +0200
Subject: [PATCH v2 5/9] dt-bindings: pinctrl: apple,pinctrl: Add t8132
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-apple-m4-initial-devicetrees-v2-5-5cb07cc275da@cyberchaos.dev>
References: <20260801-apple-m4-initial-devicetrees-v2-0-5cb07cc275da@cyberchaos.dev>
In-Reply-To: <20260801-apple-m4-initial-devicetrees-v2-0-5cb07cc275da@cyberchaos.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Hector Martin <marcan@marcan.st>, Linus Walleij <linusw@kernel.org>, 
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-pwm@vger.kernel.org, Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_144127_886263_EC12FB12 
X-CRM114-Status: UNSURE (   9.30  )
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

The pin controller on the Apple silicon t8132 (M4) SoC is compatible
with t8103. Add "apple,t8132-pinctrl" as SoC specific compatible under
"apple,t8103-pinctrl".

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>

---
This should be pulled via the pinctrl subtree, since it depends on
"dt-bindings: pinctrl: apple,pinctrl: Add t6030 and t6031 compatibles"[1]
which has been applied in the pinctrl tree. Thanks!

Link: https://lore.kernel.org/all/20260709-apple-t603x-initial-devices-v1-7-55b305833123@jannau.net/ [1]
---
 Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
index f08d2c4f5784..bc6d41b63b5d 100644
--- a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
@@ -23,6 +23,7 @@ properties:
               - apple,t6030-pinctrl
               - apple,t6031-pinctrl
               - apple,t8122-pinctrl
+              - apple,t8132-pinctrl
           - const: apple,t8103-pinctrl
       - items:
           # Do not add additional SoC to this list.

-- 
2.55.0


