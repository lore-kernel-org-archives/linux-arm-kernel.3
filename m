Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400C3D711C8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 22:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zwkSUf1QvLLcJU9mPvH8pFnBrytT0Sq1HnqcCTtXD8w=; b=3Zvkm8P5TJxXMLdacVu7C12Gl7
	OPj7xmcRTizJUOWnVGYjIyJY6KQIBwV235r0TJSndlxbA60ao5iAw2EVk5iMoKpTPLsLJbXoLC4KY
	7ws4lxYWjM5uj+k/aODZZ0f2rNWHPQQ8swSeHYW3Gtu232c3NdyTMH0cWVkUARY1tQ7kMj7pKwz5t
	dCe78gvMuO3AXRo5mbYD2YSudt1nTw7Lxm2wQJWwT5xbD8ubQuejZLHuo1l9+dhGCusVhC+Nxbqz7
	0Bo7BVDTFKYH9ZvPp7VACKg4hRfv7XF/bm3vubiVItE0qjwZivp1y7ieXh9jh/SDpSnZPz6Z5uUzQ
	VjvQEDmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWMog-00000009HZg-0txu;
	Thu, 18 Dec 2025 22:49:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWMoa-00000009HXB-0M01
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 22:49:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BD6E44432E;
	Thu, 18 Dec 2025 22:49:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7CC41C116B1;
	Thu, 18 Dec 2025 22:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766098182;
	bh=etnOPKtYKB3s4gRzuPiCpjilG+Q6bKbMiIq4AECF5d4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WB+P3KriD02CQyZ3xQ+z/IYgOHp0OjXpDcMNW3ItY/xa8YklEV63y8ojDVvtQBET/
	 8fpQwsY6JKr22OsLlhmFJz3dubNS05DHJyocErhY9NyswSWRcrX9AZs2HZZUlMX46B
	 LrY1KQXz61P303X5lV8gzdzj+ZYi86PySmwHEAp9ep6N52tsdE6x57N8HDgSc4hOTn
	 dGBcjSVv/0RZ4gbV4cYrAnyMkF9A0pX8uUcMOz74liesIvlf43d+r4d8gr8OrQWICZ
	 KkKA85uHrIeY55pl+X2xz+elbxCwwre3EQantL5t+SyOOY+MuEWElsXXdWbQMA7j+9
	 wmxjQlZIG7kFA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C74DD711C8;
	Thu, 18 Dec 2025 22:49:42 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Thu, 18 Dec 2025 22:49:06 +0000
Subject: [PATCH v2 1/5] dt-bindings: mfd: maxim,max77759: add charger child
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-max77759-charger-v2-1-2b259980a686@google.com>
References: <20251218-max77759-charger-v2-0-2b259980a686@google.com>
In-Reply-To: <20251218-max77759-charger-v2-0-2b259980a686@google.com>
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
 Amit Sunil Dhamne <amitsd@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766098181; l=1858;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=7Z+OfAwjbAkzdqPSTAxyljLhXicf0T4G1279sUdm3LY=;
 b=NYQG8juDPo2XeqgvzUfn+5NDPn30xfqT6cDA5knYDKoPM7jhRybeGeNk7u4BE08n2rSr/z1BA
 laoPDdVtOFZDPHqk+OpHYd57jiWUyBcj9PxmtevU7BhZHCTP3QVMoJF
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_144944_181665_F364B005 
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

The Maxim MAX77759 MFD includes a charger function. Extend the max77759
binding to include the charger. Also, update the example to include
charger.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
---
 .../devicetree/bindings/mfd/maxim,max77759.yaml    | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
index 525de9ab3c2b..1cffdf2e5776 100644
--- a/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
+++ b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
@@ -37,6 +37,30 @@ properties:
   nvmem-0:
     $ref: /schemas/nvmem/maxim,max77759-nvmem.yaml
 
+  charger:
+    type: object
+    description: This is a dual input switch mode battery charger for portable
+      applications. It supports wired and wireless charging and can operate in
+      buck and boost mode.
+
+    allOf:
+      - $ref: /schemas/power/supply/power-supply.yaml#
+
+    properties:
+      compatible:
+        const: maxim,max77759-charger
+
+      chgin-otg-regulator:
+        type: object
+        description: Provides Boost for sourcing VBUS.
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+    required:
+      - compatible
+
+    unevaluatedProperties: false
+
 required:
   - compatible
   - interrupts
@@ -95,5 +119,14 @@ examples:
                     };
                 };
             };
+
+            charger {
+                compatible = "maxim,max77759-charger";
+                power-supplies = <&maxtcpci>;
+
+                chgin-otg-regulator {
+                    regulator-name = "chgin-otg";
+                };
+            };
         };
     };

-- 
2.52.0.322.g1dd061c0dc-goog



