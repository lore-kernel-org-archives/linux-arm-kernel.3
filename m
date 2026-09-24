Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5D2C98321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 15:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YAa8SPl2WxajP0/u/uNL7Vaj/LQWB4xEn5PDHgQpEqo=; b=qR62xXMIHg2W2OHEANTFM7Itzc
	2UXzewrGjNzywxK3Cts9SEUS0VKvSS4AyrxLilHRzjPq0dYOQW4hKPrUKnhsLuwrMlghIIJ0qCoIF
	fTVN57/vNOhkDV2vpmberOAtBtP3snc9wQPQavcGrg7gHgB5N9Mg2rE1xeUEDGJriSLW0lHwfqLWF
	pG9Sl4qA0Fc2rolpkhmV/IT1i2iec77eJc5hruEoJ3FLd4xrIJvxa63YAl1IjVH/FQlyQn8idwJx9
	3Q2Wr90Cz6+YpW/Mto9atHbUwzGAHO4Ym2DNtTBmGtV1fArZPnoovzXbB6v0knihrgk4jY40lkVKb
	h7gBq0JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lAI-0000000BM3A-3ENR;
	Thu, 24 Sep 2026 15:15:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lAH-0000000BM1r-1nD1;
	Thu, 24 Sep 2026 15:15:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D890E43B37;
	Thu, 24 Sep 2026 15:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD32AC2BCF7;
	Thu, 24 Sep 2026 15:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790262912;
	bh=jHTjyUhwbmdr3rZ/8ntP2rA+m2eMUqGo8zOOdp2Y5QY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WAP1ubUDPo1g7WaGyJvyMxlMxt4P2TJspbzeBNuq7RPVzMExY/W/E0yuTg5nocxBD
	 37xN9pb7ooL9kjicHg/03DVmrdMJNuqtHAvaHLb/oJO8/Hebe4sy4ynWC7rmnKwBbe
	 gng05qA7YbZK9uSrxq+PJ3vJZUvx37FHBEt+6FOqIBnlU2mofxQ6+IgYEWNysACfgZ
	 TOOI9Xl3vXKSs1nNdezKBPtTkYvBZENKbgPjHFO1WvtIGPZaQN1qWMUobH8nDBCDBu
	 JexBjwD3nEhi5Ec1kYpeVy326pF7Nvwvvz5ogvQxtSsYZPyBGKZ1BsPsN9ut7JBWm2
	 C8n9uBf7nqp1A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A489C98321;
	Thu, 24 Sep 2026 15:15:12 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Thu, 24 Sep 2026 17:14:28 +0200
Subject: [PATCH 1/3] dt-bindings: pwm: amlogic: Add core clock for T7
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-add-t7-sys-pwm-clk-v1-1-05b91e87f0a9@aliel.fr>
References: <20260924-add-t7-sys-pwm-clk-v1-0-05b91e87f0a9@aliel.fr>
In-Reply-To: <20260924-add-t7-sys-pwm-clk-v1-0-05b91e87f0a9@aliel.fr>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2506;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=OnCP0bAi6s6lcclaZx+bp76WGWFDL4G9lrIRokcYtRo=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9ZWu8oHL7rtNW2Wzchcu9uQp30tT43As6vON7ulfh76O
 XuB9BbrjlIWBjEuBlkxRZb+uZYn3l0+eubrHvUUmDmsTCBDGLg4BWAi3B8YGdqa3/m+yb8vsPKC
 pfqerIKi0uoK1RSVtexfc3zPGPz94MfIMGe7FGdNeuNL/YXdE25v4xE75v647sGqzfMzPGW3bzz
 HywMA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
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
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

The T7 PWM controller has a system clock (the register access clock)
in addition to the two input clocks of channels A and B. Add it as a
third clock, named "core", for the amlogic,t7-pwm compatible, and
require clock-names for this SoC for clarity.

The other compatibles are left unchanged. Add an example showing the
T7 usage with its fallback to amlogic,meson-s4-pwm.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 .../devicetree/bindings/pwm/pwm-amlogic.yaml       | 37 +++++++++++++++++++---
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
index c337d85da40f1..9212a40d9fe48 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
@@ -62,7 +62,7 @@ properties:
 
   clock-names:
     minItems: 1
-    maxItems: 2
+    maxItems: 3
 
   power-domains:
     maxItems: 1
@@ -135,17 +135,38 @@ allOf:
       properties:
         compatible:
           contains:
-            enum:
-              - amlogic,meson-s4-pwm
+            const: amlogic,t7-pwm
     then:
       properties:
         clocks:
           items:
             - description: input clock of PWM channel A
             - description: input clock of PWM channel B
-        clock-names: false
+            - description: gate clock for the PWM controller
+        clock-names:
+          items:
+            - const: clk_a
+            - const: clk_b
+            - const: core
       required:
         - clocks
+        - clock-names
+    else:
+      if:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - amlogic,meson-s4-pwm
+      then:
+        properties:
+          clocks:
+            items:
+              - description: input clock of PWM channel A
+              - description: input clock of PWM channel B
+          clock-names: false
+        required:
+          - clocks
 
   - if:
       properties:
@@ -182,3 +203,11 @@ examples:
       clocks = <&pwm_src_a>, <&pwm_src_b>;
       #pwm-cells = <3>;
     };
+  - |
+    pwm@60000 {
+      compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
+      reg = <0x60000 0x24>;
+      clocks = <&clk_a>, <&clk_b>, <&core>;
+      clock-names = "clk_a", "clk_b", "core";
+      #pwm-cells = <3>;
+    };

-- 
2.49.0



