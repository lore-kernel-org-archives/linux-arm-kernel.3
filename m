Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEF7109E528
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 22:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3GWPkO9q5K293+rSyCByZjroAzShsUUBdXbmQ0QPeA8=; b=R+uqsqsIwxPUuZvcwHgwZInaIO
	77dDNuXoe6CnCCVHPuKusimhlrNi1QW1fS5qJdq1B6PppdHQAk31T1jqy7qY3O5TaDu0FxHpbU+s8
	0Cztbtoa1JG/E7AkJaK+0S8ZBj/9A3TsaY+NUovcEFJRYK6xUBsArei3fwmQMhr1jBjCoos4IFsYN
	81XUuhM8rmSfPIvFCYW6O7RSxcsioZlCGQD1aBoLO0IekXF8JHm5EHvJQDiCtVYT/HA2YKMWzbzZc
	8xVczVyFNoAgvKQDacdgUc7YakqnzpnjJrdWgse5UuXtYekyyFTcIbjn8q4iUTg5URQ0J1tmrBM8S
	Ajc4RM+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Wcc-00000004M7b-3mzj;
	Wed, 25 Mar 2026 22:22:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5WcW-00000004M3n-2sHD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 22:22:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 69C2643C75;
	Wed, 25 Mar 2026 22:22:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30C08C116C6;
	Wed, 25 Mar 2026 22:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774477355;
	bh=9UCX6c9kBue4B3sgbyp0P1Fi4/nUyuZVOM3nKzPEbWs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LXpL4/p+3x2GYazbMumdPJ2u0s4HQn9WONBeVb9KuNqoRECEJnYzgV62TPBISI4HI
	 Iqp790T4+F4A9fD843kXcVg1Som7DXB2K/33XuNn9DPJEn4YVnIyZzc7K9k8Wg/tYt
	 ENIDnHJ5i863lJbZSYBcOfmFSCaTc6f9ZZwIE/A/HfSXDgrxyAwW2DqiTqGlE3be6e
	 DiW3UTchGsxv65duWRfMxOqdFJ/g6pd5Dt1cBmqBHpDltPCmTy7iIsQbhRnJCfL1o7
	 s5CmltsEo8KIfquu2hNIOL7UYXxekWnsjQRfyOVPCI4+aw1KgvKaAQpnoalH/axvB1
	 QQoXKCthNx2ig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D4B6109E527;
	Wed, 25 Mar 2026 22:22:35 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Wed, 25 Mar 2026 22:22:22 +0000
Subject: [PATCH v9 1/6] dt-bindings: mfd: maxim,max77759: reference
 power-supply schema and add regulator property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260325-max77759-charger-v9-1-4486dd297adc@google.com>
References: <20260325-max77759-charger-v9-0-4486dd297adc@google.com>
In-Reply-To: <20260325-max77759-charger-v9-0-4486dd297adc@google.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Lee Jones <lee@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Mark Brown <broonie@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>, 
 Amit Sunil Dhamne <amitsd@google.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774477354; l=1898;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=vVEQb41vA+t6rlDPrzI7KwMZCc1WnDQaHQOICIfZd9s=;
 b=3j8YrSqS2bsLk/cq1k+cPifauF6cnA/HvyVgV3zfi6ELmpRQH1eCykwiBpndv7iy2yRq7X+Nb
 dlkLgbGkw+XDPWm5EOdSmAvy1c1LmTTfrfNnRNTWTGW2hotstxIGsab
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_152236_778107_A6E10B74 
X-CRM114-Status: UNSURE (   9.76  )
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
Reply-To: amitsd@google.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Amit Sunil Dhamne <amitsd@google.com>

Extend the max77759 binding to reference power-supply schema, so that
PMIC node can reference its supplier. Also, add regulator property to
control CHGIN (OTG) voltage.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: André Draszik <andre.draszik@linaro.org>
---
 .../devicetree/bindings/mfd/maxim,max77759.yaml          | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
index 525de9ab3c2b..42e4a84d5204 100644
--- a/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
+++ b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
@@ -16,6 +16,9 @@ description: |
   The MAX77759 includes Battery Charger, Fuel Gauge, temperature sensors, USB
   Type-C Port Controller (TCPC), NVMEM, and a GPIO expander.
 
+allOf:
+  - $ref: /schemas/power/supply/power-supply.yaml#
+
 properties:
   compatible:
     const: maxim,max77759
@@ -37,12 +40,18 @@ properties:
   nvmem-0:
     $ref: /schemas/nvmem/maxim,max77759-nvmem.yaml
 
+  chgin-otg-regulator:
+    type: object
+    description: Provides Boost for sourcing VBUS.
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
 required:
   - compatible
   - interrupts
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -59,6 +68,11 @@ examples:
 
             interrupt-controller;
             #interrupt-cells = <2>;
+            power-supplies = <&maxtcpci>;
+
+            chgin-otg-regulator {
+                regulator-name = "chgin-otg";
+            };
 
             gpio {
                 compatible = "maxim,max77759-gpio";

-- 
2.53.0.1018.g2bb0e51243-goog



