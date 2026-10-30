Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1967E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 03:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0INeRWiT;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JSLfYpqA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=641clQSedyAr6js8nLvcdTQj43W5pE3bK82vlQ2g1uE=; b=0INeRWiTWt64OM
	nGdsZ/NKX57YehKIMrFMtbD9nl9t+0ecdzHsHN+ud72yHmuzXRdnyyWCdrfB2P4AVx23MEkN65saJ
	Rr69S+ilLkHepXhSDRUHdi1sCHvOWa3IVUZF+E37uaEo9m3CG1CdRjVrvrR2Qb8+0FKS6Nt6DQMRO
	66ZHTEM/UPmaO9kQXln4vyBG3zi+Q8qcaeK9yBlitob8eTv7U9MlQ/ay7VuPwFkSJLr2i8DDvLA9+
	tOrxGkX+NDCqx1vYu8pv4Xkhl/kM7qqROSbMjFZEMw5Qvu9NhM9yFqJ018RQgDLqaAZsoZ9xSh4X9
	UQ7hXt4gg+kp9rG4b3tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMd5S-0000000AiZ2-2b6z;
	Fri, 30 Oct 2026 03:15:26 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMd5O-0000000AiXt-1NxL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 03:15:23 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso70605a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 20:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793330121; x=1793934921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=641clQSedyAr6js8nLvcdTQj43W5pE3bK82vlQ2g1uE=;
        b=JSLfYpqAhXDplYsBtjo2ggAf9M1ddfwZ593BNUBbo2A00N2qvITG5xNZbK92bNmK8h
         LOHgFQ7v4Y5jY3dUVknfsPIPAPIwWXhRxqMG3ZwudFRCTlTRSIN/gHo0qMv25MKigjX4
         105fg/M7ozZjZLhmvyIxyE10dVZhWoiHszs9Rviu4sd1eAT0ug/UDwTrIEAo8RQdmL4U
         ixBHxKjSEjTaz9q0/9vkXwBMlMIOgZcurxJ6mJSQdUW190iNpLsSb06Z6xXcDg89efW2
         WDiq4p7D5LPjn9EHmYkCXhaBk++bg4LEDQhddi6IDLHQA8zp86JQAWMtCEgUs1mi/lVw
         l5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793330121; x=1793934921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=641clQSedyAr6js8nLvcdTQj43W5pE3bK82vlQ2g1uE=;
        b=EArMyWzwbZiClG3H7YIl9qVuegBqsaVFaf4kP+nKQMzcNF/ZnjHvlMf/Vh3UywEPux
         YkUvJnNmgJ2c5+A9rVUxkC23oeFDd/0Vf7G6gx8EgD5ynlc2h2UVQtDVPaKIRVR3knkC
         iQt23fLbARGp20dyHcdDW6IsMWEOj0VUiR36Bdoa9fvekcIk+T6h1nrlBEporlQUVXSP
         eWn2xGUUx1YO+jcF69J4i+DUFH0/UU/9JkoDQHJ2vaT++bCSKsUh2Qt3rbCOApx91JZ3
         znERsHAHLCnkQwJdRVx2mBe2J3YcZWsBjqWxI0B1TI2tPPJ3dkdUH0sKDwKeyTJDNqtD
         lsUA==
X-Forwarded-Encrypted: i=1; AKwUvBzHXqkqauCZeIkVYMNFhKlhgwC6C9AOJGUwVGlusC5XzSjjr4DMK4TDr2ZLoWzueJzOTMq8Gfp06QZ9fQIYRR3K@lists.infradead.org
X-Gm-Message-State: AFq9FYJrDpVldGFuQ/s/XtgnQpM0Dw5FmStdW9aoDW/ST42yt1tH8wYv
	XdFxm3c7Pa2J3CZ1M06ozGkW/KN+fomg9kg7U5AF1SjkdvGRUK4H4Tje
X-Gm-Gg: AYBFou2Qutqbp0/G92l7hEdIKfsHXqZM5tkc6JpHNEHQGi5tXFRTOKpVH9KbU4wHBM2
	kOMcazv47fe2tNEaOcIL76qVQJYMBKgbdDv40TqjBwij+7PvYgk76YkICUDpgjeubD6AkOAhPP9
	h6pUU5nfx63e0SlH9NILSJUh1fWPR71q8KJBc4WOTkOZusp7KM1hmgEH2356yz+ByWyrCGg60eX
	Xlb0NKqgryk00X17isCfTX4Fl0bs/tsPxT/KnJHHgkat0Vilr39qAeDqsCSItt9C40J1+GjS/Vh
	0tncZqnYKGUT11+mU2zQmqYs+apvCW1+V3IzW3Bzl5jEM7J8/EyM5CHrN8C9EdxQqOPzb+F+Lsf
	8gpI7UCEZCYGKpPLy7LopG/D9a1V5DsbWdV9EdWpKKmjC/Bx23/YRpnkIdbGM5FjcBKvMajHtL9
	TLWEV/c0XNrM9kqa0WK50BwIN7nK3YIkJsAfZWb9GriWQZa85Sej3cBYYbUZ73nubUwOMjuJd+p
	jnzn6qk0P7RSkdb5heo2AtPRMxHEcba4FPY5fkPGBFTRRZlgDN4X7zXCSkTDEflZ9a6rTiTxILr
	3AqyKerFYLWGB6TLpm6gz/lfhDuWpxa9D9d7dHBFBBH5Fz7Ch9c9C1blHBCtkPk3UcN4Qz/Lzsa
	eV/XsaBkFlw8ip2E=
X-Received: by 2002:a17:90b:1a8f:b0:3ad:eb38:9778 with SMTP id 98e67ed59e1d1-3ae897994dcmr757560a91.48.1793330120801;
        Thu, 29 Oct 2026 20:15:20 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e2a703esm6590630a91.0.2026.10.29.20.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 20:15:20 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v3 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
Date: Fri, 30 Oct 2026 11:15:00 +0800
Message-Id: <20261030031501.130290-2-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261030031501.130290-1-cwweng.linux@gmail.com>
References: <20261030031501.130290-1-cwweng.linux@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_201522_378773_2CA0100D 
X-CRM114-Status: GOOD (  16.52  )
X-Spam-Score: -2.1 (--)
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

Add a devicetree binding for the Enhanced Analog-to-Digital Converter
(EADC) found on Nuvoton MA35D1 SoCs.

The controller provides eight external analog inputs which can be used
as single-ended channels or as four fixed differential pairs: 0-4,
1-5, 2-6 and 3-7.

Describe the four hardware interrupt outputs, ADINT0 through ADINT3.
ADINT0 through ADINT2 are associated with the corresponding conversion
interrupt flags, while ADINT3 is shared by the ADIF3 conversion
interrupt and the ADCMPF0 through ADCMPF3 result-compare interrupt
sources.

Also describe the functional clock, optional reset, optional external
reference supply and optional DMA request.

Expose the controller as an IIO channel provider through the
DT #io-channel-cells property. The cell identifies the logical EADC
channel selected by the reg value of the corresponding channel child
node.

Restrict the channel binding to features supported by the MA35D1 EADC
hardware and use the common single-channel representation for
single-ended inputs.

Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 .../bindings/iio/adc/nuvoton,ma35d1-eadc.yaml | 175 ++++++++++++++++++
 1 file changed, 175 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
new file mode 100644
index 000000000000..97144a8eeb5c
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
@@ -0,0 +1,175 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/nuvoton,ma35d1-eadc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 Enhanced Analog-to-Digital Converter
+
+maintainers:
+  - Chi-Wen Weng <cwweng@nuvoton.com>
+
+description: |
+  The Nuvoton MA35D1 Enhanced Analog-to-Digital Converter (EADC) is a
+  12-bit successive approximation converter with eight external analog
+  inputs and one internally connected VBAT input.
+
+  The external inputs can be used as eight single-ended channels or as
+  four fixed differential pairs: 0-4, 1-5, 2-6 and 3-7. The internally
+  connected VBAT input is not described by a channel child node.
+
+  The controller provides four interrupt outputs, ADINT0 through ADINT3.
+  ADINT0, ADINT1 and ADINT2 are generated by the corresponding ADIF0,
+  ADIF1 and ADIF2 conversion interrupt flags. ADINT3 is shared by the
+  ADIF3 conversion interrupt flag and the ADCMPF0 through ADCMPF3 result
+  compare flags.
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-eadc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: ADINT0 conversion interrupt output generated by ADIF0
+      - description: ADINT1 conversion interrupt output generated by ADIF1
+      - description: ADINT2 conversion interrupt output generated by ADIF2
+      - description: >
+          ADINT3 shared interrupt output generated by ADIF3 or by the
+          ADCMPF0 through ADCMPF3 result compare flags
+
+  interrupt-names:
+    items:
+      - const: adint0
+      - const: adint1
+      - const: adint2
+      - const: adint3
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  vref-supply:
+    description:
+      Optional external reference voltage connected to the VREF pin. If this
+      supply is absent, the controller uses its internal 1.6 V reference.
+
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    const: rx
+
+  '#io-channel-cells':
+    const: 1
+    description:
+      The cell selects the logical EADC channel identified by the reg value
+      of the corresponding channel child node.
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^channel@[0-7]$':
+    type: object
+    $ref: /schemas/iio/adc/adc.yaml#
+    unevaluatedProperties: false
+    description: |
+      External EADC channel description.
+
+      For a single-ended channel, single-channel specifies the external
+      analog input number (0 through 7), while reg provides the logical IIO
+      channel index.
+
+      For a differential channel, omit single-channel. The reg value selects
+      one of the four fixed hardware differential pairs: reg 0 selects 0-4,
+      reg 1 selects 1-5, reg 2 selects 2-6 and reg 3 selects 3-7.
+
+    properties:
+      reg:
+        maximum: 7
+
+      single-channel:
+        maximum: 7
+
+      # Differential pairs are fixed in hardware and are selected by reg.
+      diff-channels: false
+
+      bipolar: false
+
+      common-mode-channel: false
+
+      settling-time-us: false
+
+      oversampling-ratio: false
+
+    allOf:
+      - if:
+          not:
+            required:
+              - single-channel
+        then:
+          properties:
+            reg:
+              maximum: 3
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - '#io-channel-cells'
+  - '#address-cells'
+  - '#size-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        adc@40430000 {
+            compatible = "nuvoton,ma35d1-eadc";
+            reg = <0x0 0x40430000 0x0 0x10000>;
+            interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "adint0", "adint1", "adint2", "adint3";
+            clocks = <&clk EADC_GATE>;
+            resets = <&reset MA35D1_RESET_EADC0>;
+
+            #io-channel-cells = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            channel@0 {
+                reg = <0>;
+                single-channel = <0>;
+            };
+
+            channel@1 {
+                reg = <1>;
+            };
+        };
+    };
+
+...
-- 
2.25.1


