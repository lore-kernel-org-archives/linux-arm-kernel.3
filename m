Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA753CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 05:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+93HxxN7yIZfnUG0TZsyW59HsKIWE1ABkVgFQlDrzjw=; b=xh1zl9Cw2V94lQXDdsDOx12YrB
	5Oot5OmsIRjDyM673e445t2enLKOha8uRT4IcLDqDDfVKQNYMumufrPiKvxOia9ECworOpmTLs+S/
	Bvn9ukDp8iT3y6UqQ7TlDOFj2v9ICZkqzHgwoYkBHGIx1lGDSstj7oL2yhZdBQnI+AjeEep+mMHl6
	7CZ4YeXv6IOZdtvzqcYU0BKAaV6Sk/e0q1zxM+dyzFn0xvILjHsIMeg8Uig6dgV8Bgg48E7oPWWTD
	y59sC2Z8Y3+zmzJr4a+C1SXgL0zrv176Lj7s2VUr9tJ0N4J1v/B0/GG/pPpR8ZOTJeUSrdSWmtsaV
	LODJXOhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO7gA-0000000ABDH-2tJ4;
	Sat, 16 May 2026 05:35:14 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO7g6-0000000ABBo-35QT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 05:35:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+93HxxN7yIZfnUG0TZsyW59HsKIWE1ABkVgFQlDrzjw=; b=b6bn1rz3awLLRdlWMDVCgd4ubq
	0Fhy2oT6Ng/PS8MtrWkt2ewNCbSlFU81lWAz4d/gupJFIOIddjczsTUbccqG/7WoM7PeGqsx01M6e
	SEbkWA+wV90mlWWjUweyBt6wEJy+2hT1N84pd5JHsuRg+UQA+40gNKyQliEOzERLAAzJLKkoPb72l
	RFAvpx/ZkJlr/eyY/McD0mWdaKtRWEShZhhGXcqqjYcDZjCwARtP5FCJ0GiI5t9Rmq416fktTUeaw
	cD4ShUFlVB7VMwtywHoYOdLK4IunbS4URfk+DZwjfn0KYQoaFdElL1QRyVvY53vDdxoSEj9ut7/s8
	gHubnyxw==;
Received: from [91.102.182.218] (helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.3)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wO7g4-0000000GeDC-10wA;
	Sat, 16 May 2026 07:35:08 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Sat, 16 May 2026 07:34:14 +0200
Subject: [PATCH v3 1/3] dt-bindings: iio: adc: Add GPADC for Allwinner A523
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-sunxi-a523-gpadc-v3-1-a3a04cff2620@mmpsystems.pl>
References: <20260516-sunxi-a523-gpadc-v3-0-a3a04cff2620@mmpsystems.pl>
In-Reply-To: <20260516-sunxi-a523-gpadc-v3-0-a3a04cff2620@mmpsystems.pl>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Maksim Kiselev <bigunclemax@gmail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Michal Piekos <michal.piekos@mmpsystems.pl>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778909655; l=1829;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=iVKolaSgIipYjQbKkBTYus5BLxNsCP7aniEDBmtsS58=;
 b=dNa6nvUg/GEDjIL6hyUiuVL4nymIy38aSx4UJanAcfJXiJiRgIj9YzMM5w1YTWqpw+EonPSdz
 XBCZ7pufOLtDNkWNP6ubVt2aBmr4n5gzqbCDD5Nm/H+GNVvodpaj+Vj
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_223510_945819_BFE27474 
X-CRM114-Status: UNSURE (   8.80  )
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

Add support for the GPADC for the Allwinner A523. It differs from the
D1/T113s/R329/T507 by having two clocks.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
 .../iio/adc/allwinner,sun20i-d1-gpadc.yaml         | 32 +++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
index da605a051b94..6467800d30e2 100644
--- a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - allwinner,sun20i-d1-gpadc
+          - allwinner,sun55i-a523-gpadc
       - items:
           - enum:
               - allwinner,sun50i-h616-gpadc
@@ -29,7 +30,12 @@ properties:
     const: 0
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
 
   interrupts:
     maxItems: 1
@@ -40,6 +46,30 @@ properties:
   resets:
     maxItems: 1
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun55i-a523-gpadc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Bus clock
+            - description: Module clock
+        clock-names:
+          items:
+            - const: bus
+            - const: mod
+      required:
+        - clock-names
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names: false
+
 patternProperties:
   "^channel@[0-9a-f]+$":
     $ref: adc.yaml

-- 
2.43.0


