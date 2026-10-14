Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30089CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 06:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4D8/exwtCTqGMf/c8iqAaxyXZTI2Vr6tJjNc+wCHYY=; b=GvHaXQcdf7pY7xwVaao2YeUNGl
	II+yUb4tcvPH1Gc1G5RLprE1MfH/sWG+3Bv0QcOm4V22QO/BncajBjokBoYQCafjp6qpvNa+mrbB/
	ALSEV3W92h2Cjlhc7w2U0xyrGWebX6nUyz9HF50+CX7RBiwNX3OKlgw+bvvLSVi7zC0CDYdj7J0A9
	H2bCE23+udofHsmuCx3QZykPkRDmLJ/13ShP6f1Ffh2/xo4Hn+yFtdLckXkzWAzI9PjErbVUQ7VCO
	s5fPleQcoeYMJWNS5EESXnmXtN+bS1AmDRv1ZqzQlwUSEG5TSaydFYKn2pqKM+KPTap7U2/pjhFV4
	uz5UovcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsv1-0000000EfOZ-3SRB;
	Wed, 14 Oct 2026 06:56:55 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsum-0000000EfHE-0XUg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 06:56:51 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1791960983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C4D8/exwtCTqGMf/c8iqAaxyXZTI2Vr6tJjNc+wCHYY=;
	b=0oKN9JcTE7LhpCmgCZyPLuWsvS4Yu6/00qWNRd0PMNmV4kzOI9tRDOaMGBX2YRvVoQGDat
	o0uyaXIH+CpeEUvMCMio3PLh5cQYAmqUoECKf20miCe+LV9lTyUv4M9huE1cqZ9ornf+cQ
	Jc+6gy8HllBCF+o9unO6xnj+ZgC+E4I=
Date: Wed, 14 Oct 2026 08:56:16 +0200
Subject: [PATCH v2 09/10] dt-bindings: arm: apple: Add M4 Pro/Max based
 devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-apple-m4-pro-max-initial-devicetrees-v2-9-961edd8d661b@cyberchaos.dev>
References: <20261014-apple-m4-pro-max-initial-devicetrees-v2-0-961edd8d661b@cyberchaos.dev>
In-Reply-To: <20261014-apple-m4-pro-max-initial-devicetrees-v2-0-961edd8d661b@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Hector Martin <marcan@marcan.st>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>, Linus Walleij <linusw@kernel.org>, 
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_235640_337295_9FB9C242 
X-CRM114-Status: UNSURE (   7.47  )
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

These devices were offered with M4 Pro/Max SoCs.
Add the corresponding compatibles:

- MacBook Pro (14-inch, M4 Pro, 2024)
- MacBook Pro (14-inch, M4 Max, 2024)
- MacBook Pro (16-inch, M4 Pro, 2024)
- MacBook Pro (16-inch, M4 Max, 2024)
- Mac mini (M4 Pro, 2024)
- Mac Studio (M4 Max, 2025)

No iMac with M4 Pro/Max SoC was released, and the Mac Pro was not
updated in this generation.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/arm/apple.yaml | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 7c3e7131a5e7..da6f043ad07a 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -144,6 +144,15 @@ description: |
   - MacBook Pro (16-inch, M3 Max, 2023)
   - Mac Studio (M3 Ultra, 2025)
 
+  Devices based on the "M4 Pro" and "M4 Max" SoCs:
+
+  - MacBook Pro (14-inch, M4 Pro, 2024)
+  - MacBook Pro (14-inch, M4 Max, 2024)
+  - MacBook Pro (16-inch, M4 Pro, 2024)
+  - MacBook Pro (16-inch, M4 Max, 2024)
+  - Mac mini (M4 Pro, 2024)
+  - Mac Studio (M4 Max, 2025)
+
   The compatible property should follow this format:
 
   compatible = "apple,<targettype>", "apple,<socid>", "apple,arm-platform";
@@ -434,6 +443,24 @@ properties:
           - const: apple,t6032
           - const: apple,arm-platform
 
+      - description: Apple M4 Pro SoC based platforms
+        items:
+          - enum:
+              - apple,j614s # MacBook Pro (14-inch, M4 Pro, 2024)
+              - apple,j616s # MacBook Pro (16-inch, M4 Pro, 2024)
+              - apple,j773s # Mac mini (M4 Pro, 2024)
+          - const: apple,t6040
+          - const: apple,arm-platform
+
+      - description: Apple M4 Max SoC based platforms
+        items:
+          - enum:
+              - apple,j614c # MacBook Pro (14-inch, M4 Max, 2024)
+              - apple,j616c # MacBook Pro (16-inch, M4 Max, 2024)
+              - apple,j575c # Mac Studio (M4 Max, 2025)
+          - const: apple,t6041
+          - const: apple,arm-platform
+
 additionalProperties: true
 
 ...

-- 
2.55.0


