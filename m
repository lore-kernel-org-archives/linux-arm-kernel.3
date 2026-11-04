Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EBE606A328
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 09:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OWidVUTJ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r10tdY/k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZRQErjs2YgeDf8s5xj884w9gADjkocnjTDloPkEx5rw=; b=OWidVUTJ2EKyQL
	bvCyHAkR17hebaata1cICsKZOqzobaQiFoSOcMfINrov7Y+ZBUm2SGNwSsESIP7f9brnDPYbVkskU
	1cXOfZRsNEWXET/7Qo3R43NfphSQEVskyVV++qSAD+w7j07lsJ3FJiM5FeHGWoCiEK3W2SBlJ52tK
	pySeA5Nx/ODglq+VK/dHu6ofCPzvGcb1U3prxr3gM/EeGQOnPp+MZ+/e/vHGgdkcFuN727c+Pv6nO
	cIXe2XwnZjaF+uVu/7I78kN275b41CiKUGeGnWigCSgSniBbSoSpmNtRsINcsRrhj7EatVX+lhc6j
	6+/g43xWQUm4Dgacq05g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOX2O-00000004q95-0WkC;
	Wed, 04 Nov 2026 09:12:08 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOX2J-00000004q7c-2yv6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 09:12:06 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso190355a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 01:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793783523; x=1794388323; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZRQErjs2YgeDf8s5xj884w9gADjkocnjTDloPkEx5rw=;
        b=r10tdY/kiLqj2/R0agisfPKmlSgYFcY/CXLCWWzyaicbmE1tz+RYKVJIYOsLsdCVm2
         7xLviiQutXCYyPnBa28oUFZSskijhE2AfGL0xHp8VMnLriLBwGl2wIvCeMS2b7LbkixU
         qPr1zQI0V5n2oubxSMB39Qi5sOKFmYHRG5P3BBWfDITO9fO3JFcXB9v0lXVQDk/zV1TF
         /bJ0lWjVYWvmVYlpCulwoVO2D3xzo5ArEjWf8nyIBHtuhRjTw+J+RBVl78lpU+QTaRSH
         FKZebRiK+NE1i9gVHL+QXJyXl/dSu0Vg13ytQUK2E9u16blqVk9MltxPY8ussBHjmZLJ
         Dlog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783523; x=1794388323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZRQErjs2YgeDf8s5xj884w9gADjkocnjTDloPkEx5rw=;
        b=zcAZb1DonrYuwF4dKIvZewzeonMFB29+TFXnKkbMuX6F7nlAP4ybu/9x+y81+UDq/G
         M2mKzf1dRZcc77v/pqmNJZLb/pqAM898K5x49mwEPxYrBlYTrZdO6QQXsDciDXQA/S7l
         9rR1/q1yItgDuU/WQ4diZB7cjoApAys7qtA12nNbppup6SbjgLIjhFT2xZZyQ0Nm1kwq
         s4Nl3QJ6gGNbky1RIZnyQxs9CHYl89kRA0nKyh61HBzdPQUCz3gD++v+qgLKID5FEcJZ
         GpTtw+24GvN20pHqC/PeKUHPcxCjofUlemGn7jxVtRO/flzwV2BRDd/BskLrjfvUhp6z
         QIIA==
X-Forwarded-Encrypted: i=1; AKwUvBwbrjK6J0kf400vXJ3DvE6mX2Fs9r1ofSutmhsAMYHpqHBtU1L0Ih3RBiglOxH/+dTVV7590HY+weoYPFgz10dL@lists.infradead.org
X-Gm-Message-State: APuU4Z9rxn8pe+Cj7F4MKw3H3+g2Pdfzp756dt/2001GkE9N/AffE8fn
	Q1CEQsWRvm05r0xIuliYfO8Ed3lWKIAOiayjsFAvU+SiSBjSrRdJeRym
X-Gm-Gg: AYBFou3vyaqznkgmJG2epIp3tS47dGxaYvcQjzHlMtwu/j9mYXdFyGY0LjkFhy5fAf9
	NttOBjdUUcxxFsqasxKdv7tkJpRYVlGbTEJq/ErdfbcgHl6B2snQbks0B6W6HEW8JiDVuCdtGjc
	TrNBDDDNFPDIV4QwzBEidRQCw1bfrT+buuq4bZ4u9iLhkTf1Kuoi0lfKxqfMaIdAt+dRXkL8G0E
	vegk0QSlK1hpIwrkNcJp5Uo0tX304tILjoNgJ7XUr7MfDs2u1XQtyWNXyfg6CDVW0FZkuJh+bjF
	kHpa2PTlvkAJyhTZ6BDfvkvjU/syG6rSDrCKxNty7bNejehX1cfLnCjvOdiYImM1jOidyORvofW
	/HHtKqFzzUR/TJmk4dnH2ur8hAyjA+mH4KopHJ5ImqwJVdQWDM+oNs8wdtBrZYFInHGqCZAfPF9
	ggd/wezanonRJzr1wlrV6UIC9amJwDT4N8Y68ihutnC4Lddsr8MHX1yx0qzUQiEgneAoInD5Dvp
	YEMtKQdbrfJo4EpZvzk6boVw7Qc5ZOJAM+Mb278WMudBVffuNAfu0w6mMTsAJnSH5TxXS5X/4xt
	evUJRPcG3aDq//imhms8UI6euTvieJkSeFXsCu28pzkgPirIPGbocikqn4csc4WXpykKekZzzXS
	LkgRRIZqMerwcGc8=
X-Received: by 2002:a17:90b:33cb:b0:3a0:ace4:d2b4 with SMTP id 98e67ed59e1d1-3ae8973643cmr10988729a91.23.1793783522643;
        Wed, 04 Nov 2026 01:12:02 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b09369c638sm3167257a91.0.2026.11.04.01.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:12:02 -0800 (PST)
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
Subject: [PATCH v4 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
Date: Wed,  4 Nov 2026 17:11:35 +0800
Message-Id: <20261104091136.151269-2-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261104091136.151269-1-cwweng.linux@gmail.com>
References: <20261104091136.151269-1-cwweng.linux@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_011205_018431_A8E34CCA 
X-CRM114-Status: GOOD (  16.43  )
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

Add a binding for the Enhanced Analog-to-Digital Converter found on
Nuvoton MA35D1 SoCs.

The controller has eight external analog inputs. They can be used as
single-ended inputs or as the four fixed differential pairs 0-4, 1-5,
2-6 and 3-7.

Use the common ADC channel properties to describe the physical input
independently of the logical channel index.

Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 .../bindings/iio/adc/nuvoton,ma35d1-eadc.yaml | 163 ++++++++++++++++++
 1 file changed, 163 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
new file mode 100644
index 000000000000..85b0feac0236
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
@@ -0,0 +1,163 @@
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
+      - description: ADINT0
+      - description: ADINT1
+      - description: ADINT2
+      - description: ADINT3
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
+    description: |
+      External EADC channel description. The reg property identifies the
+      logical IIO channel index.
+
+      A single-ended channel may use single-channel to select an external
+      analog input independently of reg. If single-channel and diff-channels
+      are both absent, the external analog input is selected by reg.
+
+      A differential channel uses diff-channels to select one of the fixed
+      hardware input pairs: 0-4, 1-5, 2-6 or 3-7. Each single-ended input
+      and each differential input pair may be described at most once.
+
+    properties:
+      reg:
+        maximum: 7
+
+      single-channel:
+        maximum: 7
+
+      diff-channels:
+        oneOf:
+          - items:
+              - const: 0
+              - const: 4
+          - items:
+              - const: 1
+              - const: 5
+          - items:
+              - const: 2
+              - const: 6
+          - items:
+              - const: 3
+              - const: 7
+
+    allOf:
+      - not:
+          required:
+            - single-channel
+            - diff-channels
+
+    required:
+      - reg
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
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
+            clocks = <&clk EADC_GATE>;
+            resets = <&sys MA35D1_RESET_EADC0>;
+
+            #io-channel-cells = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            channel@0 {
+                reg = <0>;
+                single-channel = <2>;
+            };
+
+            channel@1 {
+                reg = <1>;
+                diff-channels = <0 4>;
+            };
+        };
+    };
+
+...
-- 
2.25.1


