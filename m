Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8396E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 05:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yew7QNpmco4NuHH9VzzxLNsuvr/GqUxyp+Y0CYtscSM=; b=YjLot9l8yC591WrGvztjvH63O3
	2l0TgKJuscC13CHuW4JVx62s2As7WJW9kWLoqBCpGQdCoJ4g+auqA7KW2jVrqNFqBdm2WdbT2ND3h
	Bkw/CqpkObdgkNYRwJVa+ODJ5QZum4zOjwE08Tg1GZi7pauPNpjGmf02SkXfmQUDkxjJMZquF13JA
	dN/S27XVQqU72EmRp+Slh/TbOPE169jzlR5n0SJvYv/KQ/p9HuJw8hFvM7T0Zvn0bbnZSqV6OGj97
	RVMCeDcrQKjb92zwl6QdQCpphsthTXwXzhfk3OO2ju9k008NB7zgLX+yG7wgTyvtZWBWCCol2+XAp
	iMXsucxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW7t0-0000000E5L8-1NmI;
	Fri, 10 Jan 2025 05:48:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW7kT-0000000E3H6-2KFH;
	Fri, 10 Jan 2025 05:40:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 58EF85C5D80;
	Fri, 10 Jan 2025 05:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ACE4CC4AF09;
	Fri, 10 Jan 2025 05:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736487595;
	bh=frtywl3wLzeQuIyk3GJEqbgkTJRh2VIXvwLzzjzOTNM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Exyo91DNOy1DaVs+EQxxa+V/bU0ZwmmlcgtCFQojGXWf/nDpY0EeAo6K+mPdEH9yl
	 +V+KIZHWQKyE64xNQMdIa4yn5EFfc3Ama5ZWrYSMCw15ph5SzMS4pcaH/4U6t0/4Z7
	 xMl+bEQRIWLkTw2sOazgpUXDlf6xq7vd5rV8/ZPWE5yfUsthZ0wPxC3obpvP11gcsT
	 k4omQ3nuNOQkjp/uyGaYoqf0B4Ny315lu1kZfBcc2vbHyWW6MFVvN3Ee+OVEqDU541
	 ti+GIGh7QgUlrBwxv8aVFDoohw2nA0C2IPFajON5iulcR8eUPuz/lAfVhhjjes0uj/
	 VXb89s0UCfOrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E0C8E7719E;
	Fri, 10 Jan 2025 05:39:55 +0000 (UTC)
From: Ao Xu via B4 Relay <devnull+ao.xu.amlogic.com@kernel.org>
Date: Fri, 10 Jan 2025 13:39:52 +0800
Subject: [PATCH 02/11] dt-bindings: display: meson-vpu: Add compatible for
 S4 display controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-drm-s4-v1-2-cbc2d5edaae8@amlogic.com>
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
In-Reply-To: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ao Xu <ao.xu@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736487593; l=2203;
 i=ao.xu@amlogic.com; s=20250103; h=from:subject:message-id;
 bh=7+BtboC52S07wz4NFzmNC6kZHvkpp2eBKVt3C4Xqx5Y=;
 b=CfujSyzUv9OLLfUTtlU/ZasbtyNhObfGZZzeJqGPSuymCtEYkqty8iYTDGqEc3XrrmliBV6r1
 pypNDhmrAXdCOb1JDhpEygzsZ+uDPnUt6CnWrJ0A1eycBeCoOwfv2gV
X-Developer-Key: i=ao.xu@amlogic.com; a=ed25519;
 pk=c0TSXrwQuL4EhPVf3lJ676U27ax2yfFTqmRoseP/fA8=
X-Endpoint-Received: by B4 Relay for ao.xu@amlogic.com/20250103 with
 auth_id=308
X-Original-From: Ao Xu <ao.xu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_213957_719116_6A0282FC 
X-CRM114-Status: UNSURE (   8.61  )
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
Reply-To: ao.xu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ao Xu <ao.xu@amlogic.com>

Add devicetree document for S4 VPU

Signed-off-by: Ao Xu <ao.xu@amlogic.com>
---
 .../bindings/display/amlogic,meson-vpu.yaml        | 48 ++++++++++++++++++++--
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
index cb0a90f0232190031430c08f936b8f0d3b217601..3d7eceb3724e81d9c911039507df072d332a028f 100644
--- a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
@@ -66,14 +66,13 @@ properties:
           - const: amlogic,meson-gx-vpu
       - enum:
           - amlogic,meson-g12a-vpu # G12A (S905X2, S905Y2, S905D2)
+          - amlogic,meson-s4-vpu # S4 (S905Y4)
 
   reg:
-    maxItems: 2
+    minItems: 2
 
   reg-names:
-    items:
-      - const: vpu
-      - const: hhi
+    minItems: 2
 
   interrupts:
     maxItems: 1
@@ -117,6 +116,47 @@ required:
   - "#size-cells"
   - amlogic,canvas
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: amlogic,meson-s4-vpu
+    then:
+      properties:
+        reg:
+          items:
+            - description: vcbus registers
+            - description: hhi registers
+            - description: clkctrl registers
+            - description: power control registers
+            - description: sysctrl registers
+        reg-names:
+          items:
+            - const: vpu
+            - const: hhi
+            - const: clkctrl
+            - const: pwctrl
+            - const: sysctrl
+        clocks:
+          items:
+            - description: vpu clock
+            - description: vapb clock
+        clock-names:
+          items:
+            - const: vpu
+            - const: vapb
+    else:
+      properties:
+        reg:
+          items:
+            - description: vcbus registers
+            - description: hhi registers
+        reg-names:
+          items:
+            - const: vpu
+            - const: hhi
+
 additionalProperties: false
 
 examples:

-- 
2.43.0



