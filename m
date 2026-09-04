Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7151BC79F89
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 19:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hfhvNN0fjj6swoLbh/0FaAvtFZVMTHuJaXk4F3s84AQ=; b=nGyuU6uH03kj5JVcQDXyGAi598
	wvZHnw5VyEVOi02A7PmeDT4qUzZnXi1ggoQOi2cDRvwsvRbaMgJDt4uV13fm/hdJ+ndXWE+lwyCFU
	PdOGm3an662X3tL6aIlyY1JrkELi9LbX+Oa1eobKEudGoIXNHP81w2VpPosSuiRoYcrc22F0oWI0n
	gp2oYoHRvz1Vfm6kX9Gt7xajsG7eQ6cFBY9gCE0Qe0+H0iOk8YqfPP+3ouN7vfxF0sDutngBRPBVv
	Y2Q0uOa4SBe7x0aicXw+nhEh4FBzudXxAXcxVdFIFtiDGAonXWsnGo8toC7XHCev3URoReop3FA0p
	dn24Kc0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ZvH-00000003CeJ-43wD;
	Fri, 04 Sep 2026 19:50:03 +0000
Received: from mail.cyberchaos.dev ([195.39.247.168])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ZvC-00000003CZu-31gh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 19:50:01 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1788551397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hfhvNN0fjj6swoLbh/0FaAvtFZVMTHuJaXk4F3s84AQ=;
	b=orRiY2wupK3rLMxbW7L52E0Jw+dWTnnQVzD/aWVuK+WPPOXvHsSLmDRxg7jotHxutG2teS
	2UyI5PdGLzzh3x4DaxZX6cJBZeCPOU+ptB9S4BW4d30lyhcrTwJI2Y/7KQ6k6OBozv4T4Y
	95kGdKad823Wl8Vzt+JWP7iCbysTt3c=
Date: Fri, 04 Sep 2026 21:49:37 +0200
Subject: [PATCH 4/6] dt-bindings: interrupt-controller: apple,aic2: Add
 apple,t8140 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-apple-a18-pro-initial-devicetrees-v1-4-0c25401d165d@cyberchaos.dev>
References: <20260904-apple-a18-pro-initial-devicetrees-v1-0-0c25401d165d@cyberchaos.dev>
In-Reply-To: <20260904-apple-a18-pro-initial-devicetrees-v1-0-0c25401d165d@cyberchaos.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Hector Martin <marcan@marcan.st>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_124958_923582_0EEEBF43 
X-CRM114-Status: UNSURE (   7.33  )
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

The Apple t8140 (A18 Pro) SoC uses an AIC3 as interrupt controller, same as
the M1-M4 SoCs.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
index 1cb886785173..e3cadc5ad39d 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
@@ -46,6 +46,7 @@ properties:
               - apple,t6030-aic3
               - apple,t6031-aic3
               - apple,t8132-aic3
+              - apple,t8140-aic3
           - const: apple,t8122-aic3
       - const: apple,t8122-aic3
 

-- 
2.55.0


