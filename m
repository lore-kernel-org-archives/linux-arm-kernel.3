Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016EFC624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 07:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ddYS7wJ9yUY21uyKnAjdwbwJewZ3nAAkQKuj5tFPrhE=; b=17f64IQEJGSSqpU8rvoVo7Cbqy
	c6nsYje2c1tlJgG2UuWl28KDJIltFTo9yumPd5CDUYruEqGqs/IDhUtETIGqHqltM1F6+NGZXDn0I
	BxVA+Yf++TI/w0a8p1kLblp7faU/JUbkXovXETXm1imiq1aqQ7GXhu/9oD/3wlRWnn2vsBBUVTgYx
	tYFPsWFS6j6olzJAegkVf0kpkuIA5pJFi9YZqCZfMuk4ikaUNSUOZG5stkamqpWJuBNbpCzxjXfpf
	IoN4SNYeSH2cl+OaPSS75P5iilYbs/VhQT/zN2oEFkvPurwEvKXIMIHGuxTWvkjKpZeFdcfF6GpFR
	ROhR4zVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Na4-000000019Ql-006H;
	Fri, 04 Sep 2026 06:39:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2NZz-000000019Ky-07Eh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 06:39:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4630A447C3;
	Fri,  4 Sep 2026 06:39:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C71EC4AF1C;
	Fri,  4 Sep 2026 06:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788503954;
	bh=yPJ/Wf+HqVabQxtpcgjsXKaO54YJ3TI9hIUNNN34bvM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=N7jN0ARsJvZivzubVuu8vqdYKE2MBEKomLG6QyMyEgivK2BULXuX3bp96CMnvwPAC
	 qiohHR1/eNoNSPyDMrVaL0AYOb8ITlReDblabihli9Y96XO8wgquyyixu80gGVKs4c
	 WR1XIiHIRmchYO7mKhc5/BPieu1YGc3yJwJCIrrGTS5AxmDOeQaPh4ovFEjd6/NCC7
	 OrwrC662+DTGOR+83ucVAGMM5ETuvYfgbTSpbkD8o9dTsNCrfgc6jhdkMQ//RyJr3F
	 eXCVdxodLpP5fckFTKekqwZVvtDfGqls5s46fP4Xho72AjJhjpXRpUaqsD89BYpE/U
	 0Zb/QBx6ssKzg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC34C79F85;
	Fri,  4 Sep 2026 06:39:13 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Fri, 04 Sep 2026 14:38:12 +0800
Subject: [PATCH v6 05/13] dt-bindings: gpio: pl061: add Ambarella CV75
 variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-cv75-v5-v6-5-e918514cb3b1@ambarella.com>
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com>
In-Reply-To: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
Cc: Long Zhao <longzhao@ambarella.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Long Zhao <zl020895@163.com>, Lee Jones <lee@kernel.org>, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788503951; l=1865;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=IvHuWjRWqe2GmNP+ujYSmH5KztId+5pd7GEzVRxQiIc=;
 b=9awv2H/6OPgoOrKIfYBIBsoB6+FPJzmgGLFpuHhv3d4js+dye2ijWwVDlPOZIE3v2V7yW+OSB
 gmWcsT5soz0BKXkrXyes6HqLyDuCI2/JiKqCR8FlP+DOeCtp553Ss+g
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
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
Reply-To: longzhao@ambarella.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Long Zhao <longzhao@ambarella.com>

Document the Ambarella CV75 GPIO bank compatible and the synthetic
arm,primecell-periphid used with the PL061 binding.

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 .../devicetree/bindings/gpio/pl061-gpio.yaml       | 32 +++++++++++++++++++---
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml b/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
index 4d970e55104b..5a6d95e84df2 100644
--- a/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
@@ -15,7 +15,9 @@ select:
   properties:
     compatible:
       contains:
-        const: arm,pl061
+        enum:
+          - arm,pl061
+          - ambarella,cv75-gpio
   required:
     - compatible
 
@@ -24,9 +26,13 @@ properties:
     pattern: "^gpio@[0-9a-f]+$"
 
   compatible:
-    items:
-      - const: arm,pl061
-      - const: arm,primecell
+    oneOf:
+      - items:
+          - const: arm,pl061
+          - const: arm,primecell
+      - items:
+          - const: ambarella,cv75-gpio
+          - const: arm,primecell
 
   reg:
     maxItems: 1
@@ -46,6 +52,10 @@ properties:
 
   clock-names: true
 
+  arm,primecell-periphid:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Override for the PrimeCell peripheral ID.
+
   "#gpio-cells":
     const: 2
 
@@ -64,6 +74,20 @@ required:
   - "#gpio-cells"
   - gpio-controller
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ambarella,cv75-gpio
+    then:
+      properties:
+        arm,primecell-periphid:
+          const: 0x000e8061
+      required:
+        - arm,primecell-periphid
+        - gpio-ranges
+
 additionalProperties: false
 
 ...

-- 
2.34.1



