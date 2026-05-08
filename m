Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6ECCD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 07:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gNG1g0n8LMPp2Imhp2FyidFA5lCgJxJIKfNA3xVPUd0=; b=kIRuOyDKapAHalfFYeETIPJDJK
	N44/1e+2s2inObyYUELap0OtEIaPgJ5oKq4Xk6OCx8rd1BVtWuIzKW37ZXCGwQUxET8V33YitNhcS
	u9DWvVso8xVz+FPK59HvYy0d395OfkBwwdFI9n5CpbGXfRawNiGJNv98SuNykE14tSZMPSF+4da94
	4hnuIEIQ5AhjrtM9oz5ETAjRDtyd7EFDGzb3vqHv8ipN85qqEnAOmlr8Ihyofcc3vNGbW3y6+XMWP
	dl0yCtCVrvAdEoCxrr4psZcFCmdnEmWbYOA6f7cjzAajUIUm2gv/QKVvDm8aRL8Uoxhv0VIqULO7n
	zj1vr3OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFlf-00000005rcy-1A0x;
	Fri, 08 May 2026 07:37:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFla-00000005rUh-3ycx;
	Fri, 08 May 2026 07:36:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3607D6091C;
	Fri,  8 May 2026 07:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA2F6C2BCF6;
	Fri,  8 May 2026 07:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778225817;
	bh=KzRKiBbR6C7gp1fPdQcsXZjAFHQM3qTiU5u+nEQqa/c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UkDeS5oCrNrzxKQew+G53HGTxB1MYTx6Co7IWuM1XckGXng9KljcoUY9S/RSCW/tB
	 j0jq8sEbjzj07FjhVVXSMIwwMARkBn4uKKiKlu7E+TMyEIcbOa1w8mAwNQam2YUkre
	 ZqGtXWltExH/LLOYNnpJpj3drEvn5XQD9onjUnVKxeMwlbDXfElz0j9s8WeyAZ+btW
	 IQn/D597gzVsfopuCPhQ2a1ZlH+is02YtVWTmgKBks16RoOVpFIf0IFrfPXrfdLteE
	 TwNQWdlwlxZqF0/+o1mYK1e4nS/zGQgI2FSu1ISEzaa6R/bzDNTqggy406akahzia2
	 m8NIJjjdyGS4g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5573CD37AA;
	Fri,  8 May 2026 07:36:57 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 08 May 2026 07:36:55 +0000
Subject: [PATCH 2/3] dt-bindings: interrupt-controller: Add support for
 Amlogic A9 SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-a9-gpio-irqchip-v1-2-9dc5f3e022e0@amlogic.com>
References: <20260508-a9-gpio-irqchip-v1-0-9dc5f3e022e0@amlogic.com>
In-Reply-To: <20260508-a9-gpio-irqchip-v1-0-9dc5f3e022e0@amlogic.com>
To: Thomas Gleixner <tglx@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778225816; l=1795;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=6Ljc1slqURABvNOkxflZQUxRIhozTfJrbGsFoDMyXeA=;
 b=FGj3PF7NeRbke8xYI6Q3J8mraEC49BIYBCUw3ET5JId6vNWy/5ET7h6d/GXrJJR3ROg1CM244
 Ix0Lkab3dU4Au7D4014LTpdOow2YnWClYCdjc0VvCspyBWm2aqbmrT7
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Update dt-binding document for GPIO interrupt controller
of Amlogic A9 SoCs.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../amlogic,meson-gpio-intc.yaml                    | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
index d0fad930de9d..d26671913e89 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
@@ -38,6 +38,8 @@ properties:
               - amlogic,a4-gpio-intc
               - amlogic,a4-gpio-ao-intc
               - amlogic,a5-gpio-intc
+              - amlogic,a9-gpio-intc
+              - amlogic,a9-gpio-ao-intc
               - amlogic,c3-gpio-intc
               - amlogic,s6-gpio-intc
               - amlogic,s7-gpio-intc
@@ -56,7 +58,7 @@ properties:
   amlogic,channel-interrupts:
     description: Array with the upstream hwirq numbers
     minItems: 2
-    maxItems: 12
+    maxItems: 20
     $ref: /schemas/types.yaml#/definitions/uint32-array
 
 required:
@@ -76,9 +78,20 @@ then:
     amlogic,channel-interrupts:
       maxItems: 2
 else:
-  properties:
-    amlogic,channel-interrupts:
-      minItems: 8
+  if:
+    properties:
+      compatible:
+        contains:
+          const: amlogic,a9-gpio-ao-intc
+  then:
+    properties:
+      amlogic,channel-interrupts:
+        minItems: 20
+  else:
+    properties:
+      amlogic,channel-interrupts:
+        minItems: 8
+        maxItems: 12
 
 additionalProperties: false
 

-- 
2.52.0



