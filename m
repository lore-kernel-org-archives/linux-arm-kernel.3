Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30A1C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 19:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Df0qVoIieqjjEhBzdqcHOwOToHca3H1+qfzqQwJ0z38=; b=vCOMuG/TplI8JZz1VE5ljIYnXr
	nqO0g4QyxWN/9g9/Vpx59+Sol/Q+7T8ZLySG14BN8ecIWKZv+SnoSYzIxwfhZYccST2AhUmdBiz/e
	oCQ9x2lICxm77YVfrtp2MbhlJ7kILT4IaZd+jvG6PuERz/Mjy6woDD+7cWFn2C1bzwPixINAS1h0E
	fixmwryygR93iAvBB7FaprYa+OY1wTKfzPIjYc4+mra15xrWonAk7RQu1sVEtsA/qL5Pt9yhpmK0T
	ZkdQ3+bmsk52UxJfg9Y5dfUnbrWIhawXWUlFTKZ3M7LVgI6TCTclIlBBD92GzUNCW34wVkTyPv9fh
	4nlf4m1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtsHy-0000000ErKi-48BT;
	Tue, 11 Aug 2026 19:37:31 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtsHi-0000000Er5u-1PJP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 19:37:15 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1786477029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Df0qVoIieqjjEhBzdqcHOwOToHca3H1+qfzqQwJ0z38=;
	b=b8ssyBADm4qvUgS7OmXEcd6X22iItiyjN1pOuO1r5NM811kVzDtl/RrUF57jdc78UWMN2Y
	3KCpKJYyuSdYoGGQeLT8PSOIRV72K4KE0YcZi+L/oMZwpMYIq/55Lu6TvhCA7jjarIpbsj
	o98ep4mCbmUJRIZvT//uwRysyHD1muA=
Date: Tue, 11 Aug 2026 21:36:59 +0200
Subject: [PATCH v3 6/9] dt-bindings: i2c: apple,i2c: Add t8132 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-apple-m4-initial-devicetrees-v3-6-6bf32d45ad0b@cyberchaos.dev>
References: <20260811-apple-m4-initial-devicetrees-v3-0-6bf32d45ad0b@cyberchaos.dev>
In-Reply-To: <20260811-apple-m4-initial-devicetrees-v3-0-6bf32d45ad0b@cyberchaos.dev>
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
X-CRM114-CacheID: sfid-20260811_123714_540567_1611D494 
X-CRM114-Status: UNSURE (   7.76  )
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

The i2c block on the Apple silicon t8132 (M4) SoC is compatible with
t8103. Add "apple,t8132-i2c" as SoC specific compatible under
"apple,t8103-i2c".

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/i2c/apple,i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
index d39f5e3f1df4..641f24b0ef4b 100644
--- a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
@@ -27,6 +27,7 @@ properties:
               - apple,t6030-i2c
               - apple,t6031-i2c
               - apple,t8122-i2c
+              - apple,t8132-i2c
           - const: apple,t8103-i2c
       - items:
           - enum:

-- 
2.55.0


