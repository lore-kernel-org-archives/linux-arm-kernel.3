Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC65C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 16:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvMdIH4nN1sFDJOlm2BIuEd8Qez9m/rrIfFo0iNwOy8=; b=00I5ejWVmD0QulP8B8GtPk3vih
	rdAGTCx8WHizhHAFYxIMuNq5Qk+UY9HRNwyIdHZl3OdrWhxgh5ldc2exZDZ7mBsHbuAlGmCVufDpZ
	+VVVIZtaqpARl4mgrC27WpV+aIiofG8U/3E8rLiRV7dYPGcUFD5PggjnY0ECNNYNXVgzNKyrl2lR0
	X6vKSca9bkhsCBhU9txinytilcYDYul025Er7hJ/1fpypdL4SDyS2tMw7cTVc8maVfD4KaQ7phdQF
	g+Np+BA70xDzFHLo8JEclH3NH+0oozFBGkcTX5pupWACjiMIm/kqmaBnnbxDdNPAjaJnL1BPFdCTe
	nibmM9TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2LD-000000017nB-08Er;
	Fri, 30 May 2025 16:12:19 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2Gy-000000016wp-0Sw4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 16:07:57 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-442f4a3a4d6so13960375e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 09:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748621274; x=1749226074; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvMdIH4nN1sFDJOlm2BIuEd8Qez9m/rrIfFo0iNwOy8=;
        b=lxc9EirUQItTdFXn1o5moBYI1iJipLUO1D/4PckTji1E8x6HQzUttV9+A+32w4M+06
         QvAxNg6xnJ7Q4lBtvKLcJhiz/+qh8k4uPjW/BIeL1cuYX6/VwkN1oIha7RqcOWwce0hy
         Z42GTPTGxwHUeXBrpcKC1GBjmZL/8sJ/yUm/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748621274; x=1749226074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bvMdIH4nN1sFDJOlm2BIuEd8Qez9m/rrIfFo0iNwOy8=;
        b=a9wzEbz7yO0UnMLV1XfDLoP0y1onEmlICmPDUeGDDDb3LEsbAM3yGo4gZBz7eVGmEH
         LTeOfLZFRFVk8uQYBZxVgBSIqcmVqSplKKdpGqt9dHz/aGBE1RA6a8kDbE+BHzl01Nfu
         2OH8UgGtxG678+uN3zIi4LrbR6xIHYs6LRuMsIHwoqPbWANoEm3RYkZeJAtDx7TMJQ/2
         gGdqSq9N5ofj1QMkeRnDPUgh6PsQs67MLY5HUucWEHdnNvODIFXvdOLmU3ZhxWUCugMC
         a7fEM13+C1VSqVM8laSzbDEEoABuHlJmfk3CXhLT6Fr1p8JgNkrMf35tvGka3NDn9+QP
         E6nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD5r0X74ctqRLwhJGgpDoF/8yS8nOhiOcto3pvDnpHeqtyRsUda7VwmBJXm91lIXs5lX7bOn9kdgRELQ+0XaUr@lists.infradead.org
X-Gm-Message-State: AOJu0YzFCi1ati7gcEYqOmHn6JxkI8j51vabgwMpLssMWfajle0uGgEE
	65A5uDe63HDMo0C8EsopXgeBoo3igJsKVjIY77sMqUpCNmDMUVVcbvk9Yb3guxL0m6Q=
X-Gm-Gg: ASbGncto3HbmUU97z0ZDLfONmEqp12i+C4gpbYpGMJMEYO7C/3a4TSxvi8mnQ3tn3hO
	E9qmWcStzr8eaAXUlCwMG/BqKVWxjC5OzIrnxzQ9WxvA4+ITONF0sBB3y6MYczuXZ+F+yYMZ7ku
	/pf9txEJtlP9qew2fD2BxSOOB4CK0D2aK9cWtEDJXemLQsRiwPs35/ExLd3XZeGwsegREkyYI+M
	mO25heja0ABod1f/brcDQZE9MbzEqgk6zSTuF/t8xgEBY3aQX5f8iMix/ZiYPXM3bR9ZR2wjnPa
	6XMFKIt9gE8mCbcWLZJeeYxVlcK0B/zVKObDjVTMomfvXoujuYwIh8HVXPHXdUlPWX7ltEZHU5R
	5U5H7EZgNE+DptY14YFAY2Ew4XxU0PdB8KX7nbfQ5TeSpBGXpgt8=
X-Google-Smtp-Source: AGHT+IEVAFgFPhAFYVuATFA6DOaPdpMyms7hoynJuR3YzzCeJCI8RlsrsWCeB+RKHnnB9DZQ0OrU0g==
X-Received: by 2002:a05:600c:4649:b0:43c:ec72:3daf with SMTP id 5b1f17b1804b1-450ce88aa5dmr54520215e9.14.1748621274332;
        Fri, 30 May 2025 09:07:54 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450dcc18a80sm9716365e9.38.2025.05.30.09.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:07:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 1/6] dt-bindings: mfd: convert mxs-lradc bindings to json-schema
Date: Fri, 30 May 2025 18:07:32 +0200
Message-ID: <20250530160748.2476088-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530160748.2476088-1-dario.binacchi@amarulasolutions.com>
References: <20250530160748.2476088-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_090756_150576_C1B09017 
X-CRM114-Status: GOOD (  20.70  )
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

Convert the Freescale MXS Low-Resoulution ADC (LRADC) device tree
binding documentation to json-schema.

The clocks and #io-channel-cells properties have also been added; They
are present in the respective SoC DTSI files but were missing from the
old mxs-lradc.txt file.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

---

Changes in v5:
- Fix description formatting.

Changes in v4:
- Fix typo Low-Resoulution -> Low-Resolution'
- Wrap lines at 80 char.
- Drop '|' from the description
- Describe what each interrupt is for.
- Move touchscreen-wires constraint for imx28 to the top level

Changes in v3:
- Add Reviewed-by tag of Conor Dooley

 .../devicetree/bindings/mfd/mxs-lradc.txt     |  45 ------
 .../devicetree/bindings/mfd/mxs-lradc.yaml    | 134 ++++++++++++++++++
 2 files changed, 134 insertions(+), 45 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.yaml

diff --git a/Documentation/devicetree/bindings/mfd/mxs-lradc.txt b/Documentation/devicetree/bindings/mfd/mxs-lradc.txt
deleted file mode 100644
index 755cbef0647d..000000000000
--- a/Documentation/devicetree/bindings/mfd/mxs-lradc.txt
+++ /dev/null
@@ -1,45 +0,0 @@
-* Freescale MXS LRADC device driver
-
-Required properties:
-- compatible: Should be "fsl,imx23-lradc" for i.MX23 SoC and "fsl,imx28-lradc"
-              for i.MX28 SoC
-- reg: Address and length of the register set for the device
-- interrupts: Should contain the LRADC interrupts
-
-Optional properties:
-- fsl,lradc-touchscreen-wires: Number of wires used to connect the touchscreen
-                               to LRADC. Valid value is either 4 or 5. If this
-                               property is not present, then the touchscreen is
-                               disabled. 5 wires is valid for i.MX28 SoC only.
-- fsl,ave-ctrl: number of samples per direction to calculate an average value.
-                Allowed value is 1 ... 32, default is 4
-- fsl,ave-delay: delay between consecutive samples. Allowed value is
-                 2 ... 2048. It is used if 'fsl,ave-ctrl' > 1, counts at
-                 2 kHz and its default is 2 (= 1 ms)
-- fsl,settling: delay between plate switch to next sample. Allowed value is
-                1 ... 2047. It counts at 2 kHz and its default is
-                10 (= 5 ms)
-
-Example for i.MX23 SoC:
-
-	lradc@80050000 {
-		compatible = "fsl,imx23-lradc";
-		reg = <0x80050000 0x2000>;
-		interrupts = <36 37 38 39 40 41 42 43 44>;
-		fsl,lradc-touchscreen-wires = <4>;
-		fsl,ave-ctrl = <4>;
-		fsl,ave-delay = <2>;
-		fsl,settling = <10>;
-	};
-
-Example for i.MX28 SoC:
-
-	lradc@80050000 {
-		compatible = "fsl,imx28-lradc";
-		reg = <0x80050000 0x2000>;
-		interrupts = <10 14 15 16 17 18 19 20 21 22 23 24 25>;
-		fsl,lradc-touchscreen-wires = <5>;
-		fsl,ave-ctrl = <4>;
-		fsl,ave-delay = <2>;
-		fsl,settling = <10>;
-	};
diff --git a/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml b/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
new file mode 100644
index 000000000000..782b2f4005a0
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
@@ -0,0 +1,134 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/mxs-lradc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale MXS Low-Resolution ADC (LRADC)
+
+maintainers:
+  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
+
+description:
+  The LRADC provides 16 physical channels of 12-bit resolution for
+  analog-to-digital conversion and includes an integrated 4-wire/5-wire
+  touchscreen controller.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,imx23-lradc
+          - fsl,imx28-lradc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+
+  interrupts:
+    minItems: 9
+    maxItems: 13
+
+  fsl,lradc-touchscreen-wires:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [4, 5]
+    description: >
+      Number of wires used to connect the touchscreen to LRADC.
+
+      If this property is not present, then the touchscreen is disabled.
+
+  fsl,ave-ctrl:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 32
+    default: 4
+    description:
+      Number of samples per direction to calculate an average value.
+
+  fsl,ave-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 2
+    maximum: 2048
+    default: 2
+    description: >
+      Delay between consecutive samples.
+
+      It is used if 'fsl,ave-ctrl' > 1, counts at 2 kHz and its default value (2)
+      is 1 ms.
+
+  fsl,settling:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 2047
+    default: 10
+    description: >
+      Delay between plate switch to next sample.
+
+      It counts at 2 kHz and its default (10) is 5 ms.
+
+  "#io-channel-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - fsl,imx23-lradc
+then:
+  properties:
+    interrupts:
+      items:
+        - description: channel 0
+        - description: channel 1
+        - description: channel 2
+        - description: channel 3
+        - description: channel 4
+        - description: channel 5
+        - description: touchscreen
+        - description: channel 6
+        - description: channel 7
+    fsl,lradc-touchscreen-wires:
+      const: 4
+else:
+  properties:
+    interrupts:
+      items:
+        - description: threshold 0
+        - description: threshold 1
+        - description: channel 0
+        - description: channel 1
+        - description: channel 2
+        - description: channel 3
+        - description: channel 4
+        - description: channel 5
+        - description: button 0
+        - description: button 1
+        - description: touchscreen
+        - description: channel 6
+        - description: channel 7
+
+additionalProperties: false
+
+examples:
+  - |
+    lradc@80050000 {
+        compatible = "fsl,imx23-lradc";
+        reg = <0x80050000 0x2000>;
+        interrupts = <36>, <37>, <38>, <39>, <40>,
+                     <41>, <42>, <43>, <44>;
+        clocks = <&clks 26>;
+        #io-channel-cells = <1>;
+        fsl,lradc-touchscreen-wires = <4>;
+        fsl,ave-ctrl = <4>;
+        fsl,ave-delay = <2>;
+        fsl,settling = <10>;
+    };
-- 
2.43.0


