Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135CFCA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 17:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IIaLHqLfczp2WSTHVC4Rvnq/860RhjCcxMIPJTtCu64=; b=Hj8goXScaq29ALHBm6bhjYn9HD
	0tOa4X65LR9+ZG2WgZJrGDrao8wsYCBqTx3R6UY+FWi4jFIaoM4Ac8BoE5KsqaTUZH2lUUTXWsTnA
	6mI4/jcyge8oDPmxr1AeAE0u978Q5xzR7fVG4EBXswl17QBZT5nI674h5Gc2Caoj8Fo/sINZzkqvu
	lroN09P6B9G/5Il84Sz/7H9H+GKuKryiT3ycv3U4OGi0Lhwyt+PaCZ7KckXYWdV4KndJh2cXiCm7Y
	eIg8kIJBIaW8rYQ+RQ+p31BM1Z7uRdYPIfNtF+GrkE+/QgdCmifZXJTiHDWFZiFbbkffkrriY1a5d
	34nmE8/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFaQf-00000008IFp-27hy;
	Sat, 10 Oct 2026 17:00:13 +0000
Received: from [195.39.247.168] (helo=mail.cyberchaos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFaQc-00000008ICY-38ZM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 17:00:12 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1791651589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IIaLHqLfczp2WSTHVC4Rvnq/860RhjCcxMIPJTtCu64=;
	b=NIH0gOEKawcZEoKToZJit8hHZ8QV1A86PclbH2LjiXQV6CETqwp96dIKA6rHXqVzoFv00Q
	H3df6orfiLIWzuhIeNooVOxn80HJzIS1V3z3XIXMcHSijMScE2L0JegtSIEKsCLvgN9+1A
	ZMoKXLbobIvYNiyP31UZX6ZoxP15PfA=
Date: Sat, 10 Oct 2026 18:59:23 +0200
Subject: [PATCH 02/10] dt-bindings: interrupt-controller: apple,aic2: Add
 t6041 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-apple-m4-pro-max-initial-devicetrees-v1-2-781fb3f2d9f6@cyberchaos.dev>
References: <20261010-apple-m4-pro-max-initial-devicetrees-v1-0-781fb3f2d9f6@cyberchaos.dev>
In-Reply-To: <20261010-apple-m4-pro-max-initial-devicetrees-v1-0-781fb3f2d9f6@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Hector Martin <marcan@marcan.st>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>, Linus Walleij <linusw@kernel.org>, 
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_100011_075512_B5E83A37 
X-CRM114-Status: UNSURE (   7.86  )
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

The Apple t604x (M4 Pro/Max) SoCs use an AIC3 as interrupt controller,
same as the previous M3-M4 SoCs.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Sven Peter <sven@kernel.org>
Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
index e3cadc5ad39d..fa9d89cb40b1 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
@@ -37,6 +37,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              # Do not add additional SoC to this list.
               - apple,t6000-aic
               - apple,t6020-aic
               - apple,t8112-aic
@@ -45,6 +46,7 @@ properties:
           - enum:
               - apple,t6030-aic3
               - apple,t6031-aic3
+              - apple,t6041-aic3
               - apple,t8132-aic3
               - apple,t8140-aic3
           - const: apple,t8122-aic3
@@ -134,6 +136,7 @@ allOf:
               - apple,t6000-aic
               - apple,t6020-aic
               - apple,t6031-aic3
+              - apple,t6050-aic3
     then:
       properties:
         '#interrupt-cells':

-- 
2.55.0


