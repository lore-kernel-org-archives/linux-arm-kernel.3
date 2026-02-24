Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2E8EEC2BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 01:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pe2DpBXAHba9/2IVE0YLQzbBaYfiE8iFwhSM8VbXqH0=; b=UW4V26SYFyn4aRgr9zHe7Nque3
	sbjJxgNh5XBoB0TW/cVYFarfH9z2uSEpfMTToNUTSkjpg90T9TJcV20sjqfoYdIOE5AjJfxYbbyqU
	z4G+DtmFmCQq9DdQd4+z6JPVeXALC25DIe4Phw7uY53WqWRLFUwJiBsDDoPL8Rwq/04kVdD7coCdc
	qcsFbUkDVl/TUWvO4hqVegD0rc0NrNlxdFaQr4RdRVdmEINW3EMmMZYtfhshJF7QPMV1PQsFTlC7x
	jqudgjzt9wIrDDSGhoHj/13hOsGqJNvHbGV5JFaXs2HSVXrRkZ3/geKpzjwLk5bYaBHYGMG1CkwjZ
	Q1rA1wgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhUp-00000001ILy-2Fi8;
	Tue, 24 Feb 2026 01:45:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhUl-00000001IIj-01G7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 01:45:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C685F444D6;
	Tue, 24 Feb 2026 01:45:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 960DBC19423;
	Tue, 24 Feb 2026 01:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771897549;
	bh=x3MSxPPiAQzrpW8S8tocji0xTxlKoglgHtkqvwONCMI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LbD/GgsLey4B0YHVfAtUzZ8CaZjmUCYpFaU6r7Xwy9Ny1QQHhnUzQdZby2tmzUFTW
	 wEJF+RBsD6r02dsWBqbmqqPhx1h/4FHtJ3GZhGz0/37Ylrq8rrCylXQSuPI5wCHDfA
	 JmtvG1cEl1oC+r2SsX6T+lydhbEmGuIqzAN6gYGh8vdZT/jEIZ/aat9Fz/V9jQPddq
	 MyqFtE1MsS1cx8jK6Eh4gmC3QjCoOQCdzotGhucbKEeaDqUwZxYHh0bcl0XDk81RVA
	 s7X6s7ajay+lhjhf/psEo2LlK36Mr5s9tsF1uk9aSJDw5yHKy+rRQlAGVuWTmm9ke2
	 Ml3fd4aofscmA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 850F3EEC2B7;
	Tue, 24 Feb 2026 01:45:49 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Tue, 24 Feb 2026 01:45:31 +0000
Subject: [PATCH v8 1/6] dt-bindings: mfd: maxim,max77759: reference
 power-supply schema and add regulator property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260224-max77759-charger-v8-1-eb86bd570e9c@google.com>
References: <20260224-max77759-charger-v8-0-eb86bd570e9c@google.com>
In-Reply-To: <20260224-max77759-charger-v8-0-eb86bd570e9c@google.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771897548; l=1953;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=wKn6cXtOjQRJU9Be07/BXhWg1aULQ813q+DzUXVKIVU=;
 b=rRGl4pacliEVITMjItHJPU9Ij3Y7g7tvRHzFqoB11ipQezFgQYJ09nT4Ex6/nJjaRmtA9kGGP
 IkpZOr32ZRgDED4hULy+g41ZhoF6rCUQI1GaFr3SEt1EiOHACzCMlMb
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_174551_107260_9DE47AEC 
X-CRM114-Status: UNSURE (   9.64  )
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
index 525de9ab3c2b7b431e48497330640857540625b1..42e4a84d52043c09bd073dec391a3bd76dbd359b 100644
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
2.53.0.371.g1d285c8824-goog



