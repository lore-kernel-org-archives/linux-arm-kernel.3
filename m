Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7312CCD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 13:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQf9HV1kJe9QuSV63atEChSm9EINfgHOzkniR1z+XIk=; b=sG+rfzM//NRm5Kyu1rtI5MQtT3
	VCyq1ItLWXrdg2/jt6cY7wWxMLeF0VbbjzUtQ9c9GAfuAZkNlhvKNViYNLsLgTLWASprHSPhQuiLe
	Unj95uOQl39n2N5kdk+IidMbltA/9oomzon1GTxoqa5W+eFLrfW6EFOE+yqx3y6jkwHp+BvvwAV9k
	nwKvnBOONIzeIIc3pNAOoTdJzeH8sshx/ET4FD/dYDuB67ReRz+BaZKX46BCa+Kc92f2dEZst59SK
	YL8ZzpVG3oanCUPt61kh/4NQcKUxBu2T0aNGC9wW52m1R3yOtY8z/FYOqoBpj7MRyyZaYC8z1YFwR
	MHwiGL9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM3nX-0000000AoVv-3WOU;
	Sun, 10 May 2026 13:02:19 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM3nV-0000000AoUk-2Ke7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 13:02:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sQf9HV1kJe9QuSV63atEChSm9EINfgHOzkniR1z+XIk=; b=JXtnoFOTyvcCFbcT5mx3MDXD1j
	fi/m5EU3GBPzTFUFimzzNUeohg8xvNmoXOASWvb2MKR7KHo1XdiuEwYrnY+enjjKKX/juVRBxQMTh
	8Mnf86+/og/CSuMp/8vKqCee39VBfK6BHuyeEyoG5b2qfHGlG0qyUffRWmlq6qinguG0Qusdcdywv
	DrDaPp1W1p3j+0iMFUfn1V+wp/Ni8+BH5MuIAdrJHUP2OJT5skvMS2stgJ8pyaXyV8SYsPfEAwiLN
	5R9gR2+waAyuvpjfNgh20AyYZQbR6mD3l2KasZTt1Kgx2YaH5hfKPqOLxTl97cabM4A0ujsQZncMp
	Dw8nZCAA==;
Received: from user-188-33-36-99.play-internet.pl ([188.33.36.99] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wM3nS-0000000DQb8-2khN;
	Sun, 10 May 2026 15:02:14 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Sun, 10 May 2026 14:57:22 +0200
Subject: [PATCH 1/3] dt-bindings: iio: adc: Add GPADC for Allwinner A523
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-sunxi-a523-gpadc-v1-1-4f6b0f4000fb@mmpsystems.pl>
References: <20260510-sunxi-a523-gpadc-v1-0-4f6b0f4000fb@mmpsystems.pl>
In-Reply-To: <20260510-sunxi-a523-gpadc-v1-0-4f6b0f4000fb@mmpsystems.pl>
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
 linux-kernel@vger.kernel.org, Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778417853; l=1939;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=xdbmT5ZW7GBoQzuCduM7GoLy1ivg6Gv7iVshcr4SKOE=;
 b=+fLEdNfcGSL6q7kzk+Ig5Sr2kuXJVWe3+SHYOmbUDS87rrnQ6fhMO9DC/AKCCxgCFF3Q10qPu
 X+6KaQkpiD+AIwZYYzl51hk38WXOrIVbGw13bG+w05h71LjATWN5uwv
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_060217_789032_C70C979B 
X-CRM114-Status: UNSURE (   8.85  )
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

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
 .../iio/adc/allwinner,sun20i-d1-gpadc.yaml         | 37 +++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
index da605a051b94..89da96cd705f 100644
--- a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
@@ -17,6 +17,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun50i-h616-gpadc
+              - allwinner,sun55i-a523-gpadc
           - const: allwinner,sun20i-d1-gpadc
 
   "#io-channel-cells":
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
@@ -40,6 +46,35 @@ properties:
   resets:
     maxItems: 1
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          items:
+            - const: allwinner,sun55i-a523-gpadc
+            - const: allwinner,sun20i-d1-gpadc
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+          items:
+            - description: Bus clock
+            - description: Module clock
+        clock-names:
+          minItems: 2
+          maxItems: 2
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


