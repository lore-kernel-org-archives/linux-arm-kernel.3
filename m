Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5DB6084184
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 19:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1v5JV9wb;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WOxgidXm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=; b=1v5JV9wbHksjTs
	n4uONKY1ODANoDDoqAmxz+uJo9RQI2efZh8j2wE78gH1TW47epGUQgU7zJakKgqc/XVkTpZ45TX70
	NQQiycP512Eq6tc4oLefwhqhRZ1xVLLogUthsdvzYaVjsnGJDKz3KctsmmKA66ZSmabRKFkaEOkcc
	Dj89gzFJBR5olwQ0EqWUIxkSsEH/BXhtDc6kyDDCtdZnYpUBNEznxVEo9TjMBteBT/nPGx5e5fnkw
	IfQZbL+OND2Yr0KMkSTp0AQ/vkWtF3KOA342QGyenl5INZFrXxw8Ht4JDr7jVj0bQhmmm39wxJ98U
	kRqi3wY+4oV4rbiOOqvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgbb-00000006b4L-3IiR;
	Wed, 04 Nov 2026 19:25:07 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgbZ-00000006b15-2HWm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 19:25:06 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-5326cdde017so366612b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 11:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793820304; x=1794425104; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=WOxgidXmQqYYfN9uPPlEiBiNrnEuwAG91JPaQ9w+QMoOLa2hCKZPee5Q1dRIiVlJnP
         i/O2YbV/ovwxiYZcydD5T2MJVjR67Z8HDsb2Pqovb4JTAfW7vvkeHvhwyIwZJ7KmnRxD
         58iTV+suNTyWy0JVSUxUkVQJcgni6dpuZhwwvEuI6ptguYc8HCkdozD3Co0hLsvjc+YN
         Btcxvb5tkwsMHCuIxYmZPrFOytF7mzBQbVnKCRDghZWoEMVcriagJ9iL5hLcAHLCohcR
         AOITcIQHr8xRy7KlUpOL7whe+fU+ZKB8uRKo0qABaE3Yiccl/hurymPHArZ1DchntDmV
         zi/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793820304; x=1794425104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=1sE3/7QAP6NSuFvqhLjgJnmZuek8CEaZsPLfWtNpKCvN3/0BkGcutTL/OhANl+OZ/i
         R8QIJQsREy+AxKYTnpdlgSHsrJsHH3aM5pLlK0B8uU6fsDwTcuYhhgyndGPVhkBF0p4K
         pTr2f/9shV8GP8zM6BN4fuhGdxAaR/dhOjXUurR+W42eknUhHE7HGfoMYwJOznJ3B6eN
         TJIuyhNztOQ+ZE4PJgNsiTMjnH47Xo2NlNgMrCYSavXyvLl3KeziClkr7XvZCjH5ZULr
         AquHoObaMOOoIgZX2YeYbuX7bDaYsy6JDQjPgoLScaE4VeU7ElRNM9GsR1fy47J7i2Ks
         5h/g==
X-Forwarded-Encrypted: i=1; AKwUvBy/HEymUl1ALw3rhWuqusuZf3ghbMvzhlI4jxzsJZxq5I3M7ttkvC08hf7xY0+OcarhIL1ij6agrNtxu1rcFD85@lists.infradead.org
X-Gm-Message-State: APuU4Z8R4ExF0DaaTXWTAttuKbmTkDjn2D0dXKnYIF3ebIvsw3zJKijY
	ImwuU0o/q234oQflmQ33NWGHYWxLVtuJF1Joea3GDvm1VbiGritFO/PZ
X-Gm-Gg: AYBFou3gMKd7ge5y6e+Oie2LmLV+gXOovwIam2r6N1pr98J5jJlsNS9ogQU3Ca1Keza
	VMxD7mgdTh1xchnKMggFZNEszfHQkksTuVMWX9OtPxhtYFasDzZuqWGQOMzzSzOsmNi0zF5hXl9
	MxZjNKPM/xBrp2x1S1EJI25iGZh03qdHiEoJBqYuNf8HOohIJMPEAZp+gxEn0sMKWQ/V3jDorGb
	vrAht+faqF53D6ci626KVhBmuRtRGtWsr6aRzeMDXiPVIUpsFrVhgITAN/YXnEgwNdC0pC5Mh9t
	JHOtKbh9oIjjBdkbbyJg2AVlVWuCm+zM5ilbwFAMzIB8XE3jWVY/ILSnSpHlQwmWCJ/j8MlJ2Ox
	qLq7B5XitEBJmwE94SmTmW7Pp+G5WTNv0lqOEpPEN7iBhkP7ag0lRNygDe54S41lkZ9qWINM8BD
	maSUN83jNz0llGB4TxU4EvmKLc5ALnURvF69x2rOISlv2B/9rODKOoiR5XVyS22IUu7K5HB32KJ
	m0BebLR6kdTywyZaCQ7ieCd/GeY2CDIxxaOMrnkl7zwWV7WJCUGVIAATKvUWWqh2Rqe0By+x4YN
	gOCedCZ1MTaxUkytMxSiHef+pcqk39KUzFrcVbiEL2fhvPA0srny68Sl75fYUOvNPf7dH6T9vmq
	Bi/A6kSZ0ozzeJrsha3zhbHD34ZYtyaOjQJKMq+ANKG44+9Tw14izUPcHpZSXTtEdFsxRuvf4pw
	iHA6W/hOmamOeF8TZRtgw0RzU0wTb9XRRa0Xfw+BBzWiiDniuPrdENpQUoIkOdQnEy5gqUltrw3
	A0=
X-Received: by 2002:a05:6808:50a1:b0:539:596f:6623 with SMTP id 5614622812f47-5640de36536mr13164089b6e.64.1793820304255;
        Wed, 04 Nov 2026 11:25:04 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9c7bbcesm2328723b6e.1.2026.11.04.11.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:25:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 04 Nov 2026 12:24:51 -0700
Subject: [PATCH v12 1/5] dt-bindings: pwm: allwinner: add h616 pwm
 compatible
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-h616-pwm-v8-v12-1-8ed39b0dba69@gmail.com>
References: <20261104-h616-pwm-v8-v12-0-8ed39b0dba69@gmail.com>
In-Reply-To: <20261104-h616-pwm-v8-v12-0-8ed39b0dba69@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_112505_595609_A5958089 
X-CRM114-Status: GOOD (  13.35  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Richard Genoud <richard.genoud@bootlin.com>

The Allwinner H616 PWM block differs from the A10 and H6 blocks, but it
uses the same input clocks as H6, so extend the existing Allwinner PWM
binding.

The block has six channels that can generate PWM waveforms. Each channel
also has a bypass that turns its output into a clock suitable for consumers
such as the integrated X-Powers AC200 or AC300 Ethernet PHY.

Require #clock-cells for H616 because the bypass clocks are part of its
provider interface, while continuing to disallow the property for the older
variants.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../bindings/pwm/allwinner,sun4i-a10-pwm.yaml      | 33 +++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
index 1197858e431f..3b1819c8630c 100644
--- a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
@@ -14,6 +14,13 @@ properties:
   "#pwm-cells":
     const: 3
 
+  "#clock-cells":
+    const: 1
+    description:
+      The cell selects the PWM channel whose hardware bypass path is exported
+      as a clock. Its rate follows the selected shared pair source and divider;
+      the PWM period, duty-cycle and polarity logic is bypassed.
+
   compatible:
     oneOf:
       - const: allwinner,sun4i-a10-pwm
@@ -36,6 +43,7 @@ properties:
           - const: allwinner,sun50i-h5-pwm
           - const: allwinner,sun5i-a13-pwm
       - const: allwinner,sun50i-h6-pwm
+      - const: allwinner,sun50i-h616-pwm
 
   reg:
     maxItems: 1
@@ -62,7 +70,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: allwinner,sun50i-h6-pwm
+            enum:
+              - allwinner,sun50i-h6-pwm
+              - allwinner,sun50i-h616-pwm
 
     then:
       properties:
@@ -83,6 +93,27 @@ allOf:
         clocks:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h616-pwm
+
+    then:
+      properties:
+        clocks:
+          minItems: 2
+
+        clock-names:
+          minItems: 2
+
+      required:
+        - "#clock-cells"
+
+    else:
+      properties:
+        "#clock-cells": false
+
 required:
   - compatible
   - reg

-- 
2.53.0


