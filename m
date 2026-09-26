Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBC7C98338
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 14:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XgN6b8D14rl9Xk9OFZqu9qpCw4GNdvG/TpBFPo8UFbQ=; b=LBmOkmT4DCTr+ZUo+vXkIbOI/i
	Ey1SDnAFuAOm7jHliIAikm2w6eBdyTUpYl6k3tUfd6ybQ2oKfqiNWdZEZ1PB3u7tYQqzhQMQ1ykhR
	jFU80e8J+ZGFXeEvVO/ljX3f8GuHRaRO/B008hmJ4SMJhZIE5sTREfN/t2j5MlT11L4YNkvNONiTQ
	V3K9P6qGrW7qNme2oGoX41b6UzHjf/n4LOdP7Lso1lfTMHKPnrzdYZ5s7basKHG5OzjHcw8/41lVe
	B6XlBtMvgBQORwTrYarBJfJfLDhUOjwQH/wNQswo/qUxgZbSfgrbMucW+6JzxPS/FDOci34zX3m1q
	CIdDLKXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xATlI-0000000FY7O-2dpq;
	Sat, 26 Sep 2026 14:52:24 +0000
Received: from mail.cyberchaos.dev ([195.39.247.168])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xATl7-0000000FY3M-2rUT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 14:52:15 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1790434328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XgN6b8D14rl9Xk9OFZqu9qpCw4GNdvG/TpBFPo8UFbQ=;
	b=DQAhH2ZAqIN7QQBnxXDzaZyP9sinunuyfonYsCkzWN6AtTE7nHXnSx092lzacB10qnQ3e1
	uKOAYNeTL52yfr+CLhfJPhpsqoV4f9sLSASHaXd2zRr4IMhP2l0d/uu9SG9tWhKr00brIT
	jQmKVSJOH3igDw5dZrbjQ4XKhINjqgY=
Date: Sat, 26 Sep 2026 16:51:45 +0200
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: apple,pinctrl: Add t8140
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-apple-pinctrl-t8140-v2-1-620bd11cd2a1@cyberchaos.dev>
References: <20260926-apple-pinctrl-t8140-v2-0-620bd11cd2a1@cyberchaos.dev>
In-Reply-To: <20260926-apple-pinctrl-t8140-v2-0-620bd11cd2a1@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>
Cc: Yureka Lilian <yureka@cyberchaos.dev>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_075213_939851_3E45033E 
X-CRM114-Status: UNSURE (   6.66  )
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

The pinctrl_ap GPIO controller on the MacBook Neo crashes upon reading
REG_GPIOx for certain pins. These pins, which are also listed in Apple's
device tree, are described by the gpio-reserved-ranges property.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
index bc6d41b63b5d..f2eac9b9a727 100644
--- a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
@@ -17,6 +17,7 @@ description: |
 properties:
   compatible:
     oneOf:
+      - const: apple,t8140-pinctrl
       - items:
           - enum:
               - apple,t6020-pinctrl
@@ -52,6 +53,8 @@ properties:
   gpio-ranges:
     maxItems: 1
 
+  gpio-reserved-ranges: true
+
   apple,npins:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: The number of pins in this GPIO controller.
@@ -90,6 +93,15 @@ patternProperties:
 
 allOf:
   - $ref: pinctrl.yaml#
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: apple,t8140-pinctrl
+    then:
+      properties:
+        gpio-reserved-ranges: false
 
 required:
   - compatible

-- 
2.55.0


