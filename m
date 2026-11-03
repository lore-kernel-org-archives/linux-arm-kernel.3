Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE85606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f/qalo8o;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GqfXIDZI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=; b=f/qalo8oipda+6
	kBn/FplaB/5w6ikXvmK8LiUMN5GFgCDDXZRaIfTM6XyVVbUWh7mr5wEkwarQiA9HxFgpJSnpX0wX6
	cMULz7RH/hZX1QHcyo0tIIWUnMXHwSdzo5EG/ySkyH55vGT2miUpeLoolwNXyZ5gsULoavS+3NuAu
	zYAzXQ9jFgZ6fl/6bCyVj+tsXO6v2gG185bwvt9pQS4bYYmLsMhfRJsT1q3MPCb2BgQrVz5ITxYvC
	4RLOEc1jfxnlAL6+JcEuHtIAOG6sXrj3MoYQACQOR7BXwzdZv/3b94jozBXUfzgRocb+uljEBy6iL
	GYFNhxQlAt5SOOKLJukA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOA4R-00000001bId-1TfZ;
	Tue, 03 Nov 2026 08:40:44 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOA4K-00000001bGT-3HaB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:40:40 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-716b58a4365so49551eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 00:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695235; x=1794300035; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=GqfXIDZIzkeeudb1pTCdfmvClQWfFW52csN7dcb1zeaNO1d6PLvkot+b3IRQDljYpW
         gZcosPlnVBNYzCNSnAzDqaZEfLGActuXCMLFEYuszwNh6pT96o1AdYaWkFwH88lbylOW
         j+t7rXzQ3Mex6iHh3GjgBfNektlfa8f8agEJVbF4BLz1XnTZA3uBn0QMAhClChmwmx/r
         hQ7DBGuY037XXt911O2e2T+IozvpfK8T+O7EfyNlN0WOWd+W6F34VDip3qhjHpiTjWZ9
         KpsRSEWhQUUu05+7i1//dso/Yf2e44XIWixMz3dVjOgKR61sK+avcv1FOIY8Z4mFZpHV
         4uuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695235; x=1794300035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=JJshftgB7Hqcy/RQukbeiQJMJkvFCywP0anIKZctrO1ADFOcXnFG+64T1bONoZ9Pqv
         ABuG0D5UZoamLeaUKzQX/FEIpmLWuBqbSBbQjpDjORju+LLWRY9AQXiwof0Xt0by8hWU
         IHqXex4yCH/eAtc3XzMB9QqaHBlKUmS7aBuZfo6HsQPinEqr/9a9NW3mIeItN5nkylCl
         npPqU8RvtQC4qOl+gB1FmLC9l/aaRiApecWeooMRhACHeQHaWZIh9DZKqaADWS6OGR90
         r7i27lPToFeXeunF9BGqG3FLD51+sj+jqgOPUzNAybBC59GotG4YclMHEZVS5b5CdLb8
         lOIA==
X-Forwarded-Encrypted: i=1; AKwUvByhQI5fVqUNeKcU0vKZ4mKzDzhkVIMdfTatWrLGxtONPIknUipIkcUuiEC43QfoPV8M2/2WK2ksTE/1RN13gt4o@lists.infradead.org
X-Gm-Message-State: APuU4Z/dcMRBpd64zSVzD3QixP1xB1l6ux5i2WjxXeBbbrQJ07ixaacS
	bqEkl1s+QMxmv41Jgl76Jh+i/7GRZRKfOMUolnC7f1HMswy5hL3RjRAE
X-Gm-Gg: AYBFou2cv/qbG+wmNnG16CfsKR3IRkfgU+Exzqo4tHQlc3ngQiZ9erVmb7f61Y0iXXr
	LShCzsCMf+G6fZwpJBN42i7OuFXGjSnn3TtD1d4v7wGpVbSfgRZqBP9aAOXuTEQGKof5OtogyNu
	0RVKdn/B1w+6bQGypAMcJLEZlY1ssNJoMgpY1KA1uJZCLPJBLqXMRCuFFzd7UmAZJrKzcKV7CP5
	SsnOujNLCYZJFFCJV/QDu61aQdiC2hesDR7Z98mkA/tV0d4c1FHgfvI1WCZBY7GZfGTCj580wEV
	7cJoTlWk5Rdg8xkVYWH5ZezTOx879LKzXJDFfQhvk8TCdNe/m2Z/6u/17H7TIY9/LrXN8Cz7g8r
	e1m18/xCdPVGh5TNsl5PwWdUWHAwjF3ey3Y+GacLEA84z+GDZhPH8KP+DkLtQM52bOW1UuthADG
	7SZUWllv98RfqRN6zx3LqTgBB2w0geI5K9+Txkvsr1KWCne38lVCATyLBn6SMoXtPhxKS6gP1WJ
	A2PzUeHk6Fz+8YnNIT8n76TI8Xo4DNn+apiQ0R1aXg4MqxAB/79Q/Rsf2n4PYJAlZZWJdHQQvf/
	FclA4D3HF+5POCXxD7qOSQ+q2TUAcvJz7dQQI2fG2Bo0CEONiqikYvIVvMIkSA173jcc64b0w8+
	rqoc8qD2dqLOHLQnaSdS6IqlzH0Wf3ngMYZhfCGQ75axsXyVAeFNGN7ZfTkKBne3LVCH7HAWp9g
	vymD8Z6lZETMekjTZXgsMGDXIW2IMWqko4MHrQcRBMniD3HwwYqMo=
X-Received: by 2002:a05:6820:a50f:10b0:6ff:3c41:8153 with SMTP id 006d021491bc7-714f299c8cfmr4772331eaf.54.1793695235466;
        Tue, 03 Nov 2026 00:40:35 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f3081097sm10520397eaf.13.2026.11.03.00.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:40:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 01:40:26 -0700
Subject: [PATCH v11 1/5] dt-bindings: pwm: allwinner: add h616 pwm
 compatible
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-h616-pwm-v8-v11-1-07abb59575c3@gmail.com>
References: <20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com>
In-Reply-To: <20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com>
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
X-CRM114-CacheID: sfid-20261103_004037_537435_31515EEB 
X-CRM114-Status: GOOD (  13.16  )
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


