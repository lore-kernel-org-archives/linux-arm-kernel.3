Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3146D262B3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 01:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dcqUk4SSOVrj2sf9mBUFj/rCmEY8ODklLn1EvBVFnwc=; b=wbjs4+KhyMHnFSAP5nseErFMxJ
	j8/rqpzkCSvXWldBsMZ5iKb5l96LkVwMotenALTPMz2actb+nmT9+//UCo+fLrzS8c4L3c91TCeOd
	3Td3SCmzlnwFMoX7kDCeaP3TQ6esnj10BrJ1yL7WM5Wjmt3v6L5M0zEmTyvMEwjwMikMxifKU9DRQ
	qdk40mtMeZS6Eiw5uEw89aaEamw9373rpfCcHBJjQudZN/2IcTlSO+h3U+E7rIVR4DuAxDuAlMYBq
	/HdBaZjNMC5E0nJm5ak0HgVq6qQTzoxx8NmvJ6581DhxVwkjyi7ffDLDPVoFw+c842YXrjzAH4ZiK
	DkqTEXjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viMa6-00000004gVj-2bUm;
	Wed, 21 Jan 2026 01:00:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viMZz-00000004gSi-27uW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 01:00:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F0A8443A4;
	Wed, 21 Jan 2026 01:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CB3BC19424;
	Wed, 21 Jan 2026 01:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768957214;
	bh=vME9erZ8v4/3XnAfc41aTNJXW0Ogk90LyJ2PO02vRi4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NkQuit1+YerIgsdmdqI/BDECqvOz01CTzj2LHnEFZcddYZHm8EWI9l9pQPrsIotih
	 ZzeZL2zKAm81FLHkMg01woe5JGMg4hgVsD7ayb3qLpyUtpRm6XitsAJqxqRRw7cUyJ
	 HU1K7vF/TY2xNcwRkZnrBbINsEKGYeFMS1yh7/zcS1ffwlO6RCsi+cXT+VmTo1uvEB
	 AJ9Dk3IIl6XrNZ4mAdXxCJG+j0lldSZkYXp5JmXr6omBxYwDKUup8GJzK+a4wG4Bgr
	 GD41RO1+JNML9VIdcCL36S4wCgAxwfC1UvkzCm2v3ltEoOqYk4JN0kCzf2ISXcAImZ
	 N5zbLay+qKGsQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ACF1D2629F;
	Wed, 21 Jan 2026 01:00:14 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Wed, 21 Jan 2026 00:59:35 +0000
Subject: [PATCH v4 1/5] dt-bindings: mfd: maxim,max77759: reference
 power-supply schema and add regulator property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260121-max77759-charger-v4-1-694234c8ded1@google.com>
References: <20260121-max77759-charger-v4-0-694234c8ded1@google.com>
In-Reply-To: <20260121-max77759-charger-v4-0-694234c8ded1@google.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Lee Jones <lee@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>, 
 Amit Sunil Dhamne <amitsd@google.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768957213; l=1953;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=a3JQ5uiaaaZKvPLZencodzGQn/qwlSwCMZMZqJW9xWs=;
 b=/Dkg+PTGUGK0kXU7AFdyUc7uWzaQgeKdzrr+LNPm1d7Z3kGJx+PyKcod2eCmhdDA/0gr8N07g
 VbQRheR1gV0DqUBOgEvWxytslVvvQoR6kYG6YxRvC4yflAjgDBzQvsT
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_170015_593518_C9FE5095 
X-CRM114-Status: UNSURE (   9.18  )
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
2.52.0.457.g6b5491de43-goog



