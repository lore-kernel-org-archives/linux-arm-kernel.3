Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F26606A329
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 15:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D4ddVrfb;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l9vNgP/o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0lnaBOUQQ4XDI1nNodunw8QSDiqgsme6k9gqV20nFXM=; b=D4ddVrfbkr/SKg
	Vab1DJnc2NqjsWL7zw1ZKLI3YrXFB7rHpODCW5j62YT2Cdokd/FoX/aCz27LqkFd+QBOpJ6QMIMlM
	c5EIqRVwSk4goglTLeGmP50kxHoBOatyoND8FWdNal5v9K657HBJp3S62LFxIF175t65AKK9WJj7O
	vEJSl+fTBjQ3/Zt9eOIy7TYEn4miJgtHHSxSFn8GpC+dMkL/GlxpXOoDWZ5UvaIMGLgMqL2Fq5zfh
	PDfZOXJ1gESQBgoLq5E0hcM3lBWugfcEfa+ytn6r8sfaQlGX9C+qj4yGk+HJPk8mW2vgj++EnCdR6
	gCwmBPTX1+pgWG3qoVnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNXgP-0000000Ecwn-36wU;
	Sun, 01 Nov 2026 15:41:21 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNXgI-0000000Ecu2-48D1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 15:41:19 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso854017a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 07:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793547674; x=1794152474; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0lnaBOUQQ4XDI1nNodunw8QSDiqgsme6k9gqV20nFXM=;
        b=l9vNgP/op+8WLSezfIiPlPIUJjZemTSvob26ZVdV+7PrajP2aTRehl2LtnLAemkNKN
         CbkqRsJt8WugePWmvM3OnpDoNeg7aSa0e5ZzseykYiUQ1e6qJU9jWirJQ9O1UWSvSmWq
         mgzsdOkNfWG3yezqGHQCu16JO46B7Bp9HGPVBXOnYfMh5sjo+cM5bUKjssQs99lIMnvz
         sCvJ+8/ABQN543liJSg+4bGtEaPRgNGomxu9DQlt4nCnR43OL6a4sbYMRrOqrPTeZ7ql
         j3mqI4BcmXZtmCT2VLB81zf7KwVH9CJ+qtKXUlPuxtz4njiWJ1rN9ZiRKpZSEUI/fQUg
         hoZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793547674; x=1794152474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0lnaBOUQQ4XDI1nNodunw8QSDiqgsme6k9gqV20nFXM=;
        b=n8GZTSk8AtOYAfdg1BXQGDdYaJim7+n9rtA4IX/xv3e4YTjB782CU6cZXjBuBzoLvR
         2Ezs+DN+XT2AO424tiRlWrIBrBoRB0al+0arXFtocM+VAkYswQZKiRKo22ML3CHd9dtN
         klci/0RA6xk6l3BurR3+ZX0WQ3fnaQsOJvVqUBBlbxtDDUvaMMMsrAZTRs7r/UlrGDMi
         lXGesVQt037cnkumqO6+JCRdzPpcB84vzNysLUhLRlcjCLeW2jEH3r12HRcu58DvA/W+
         BKByedHS6toOCa0EGWrGmQdsWxvSvldeAV2Yy+5y9ni6r42snQ0ED38w1P3f95hlh13R
         XpGg==
X-Forwarded-Encrypted: i=1; AKwUvBy4MPG6cAPbG/J7ytQlQgpYgdtYPJD/LpSQ3JLrZvxzZPskcsFFewvDkzcK5Bx9qR94GtZBqXgoBYw7WHAIBJne@lists.infradead.org
X-Gm-Message-State: APuU4Z+4fV95fC7dMuMhMFVl2FCesERZ2eOZUBvsQSIcDSIYpfsMH3BI
	h5eyL6fzjEW/Swn/ILif0NCkqx8ByMEE18gtvVWGskuBmBgFwQct0g24
X-Gm-Gg: AYBFou3DCaDDclcMxx/748PFL/5mZTU/U2/rFb8RtrXC02J4vWcjx2BPjod6xHyDmZm
	hde4GZqXdpvthtjLk8HmP1uNUHNC2vJh8/ovWk1jSlX665xczw1liLc4d5q5LhNHa1HVBfmJfyB
	I2i5Nzi6QoX2hYXn/bop9dL0besOeluiC3FGL8CLNDe+1pCIUGJc8csVAqTlu44kIRWdL3OXzQR
	NVBlErLY90k3orEa8hSegxE3zx3rYeJYoy5wEOmN1UCTvUKAJmqkt3vtEKefaJJqDImuo8DxUXX
	s/aSOBHzIDdccSSo7WBvQI5bkE3teixciLwIT28vVtqhI40nAzW5nysGWsVnWIgoEqJHjfWN4nZ
	4keMVgvZ3Ov9Tg0OFke+RW0Cd8VHEbDUPvQA1aIl4uiDVzVwH3zvEWRvx1xZwCF33C7aJczeOrp
	ta0EBqe7eJyAdl7YvZ8MoYfEu8+ARVvwn3DLno5+vYFDMlBwFi+p4aUMVQ3APGsDsMVChAiwrML
	91jOKAdK9WWoknoxC3O8KhEyM7T860bp5kqrmkWxthX/iGwr73S9vthr8c2YU7jD74GT3FTnVNr
	p/SxGcQM1nfgWOp9nQw0EMZjSIzAHXvSGL3N9AacLA==
X-Received: by 2002:a17:90b:4c08:b0:3ac:8741:e2e8 with SMTP id 98e67ed59e1d1-3ae8957cb02mr6684585a91.8.1793547673934;
        Sun, 01 Nov 2026 07:41:13 -0800 (PST)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845984absm10776958a91.10.2026.11.01.07.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:41:13 -0800 (PST)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	Joseph Chen <chenjh@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Yaozhong Li <yaozhonguwl@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/3] dt-bindings: mfd: rk8xx: add board level power hold GPIOs
Date: Sun,  1 Nov 2026 23:40:50 +0800
Message-ID: <20261101154053.3874-2-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261101154053.3874-1-yaozhonguwl@gmail.com>
References: <20261101154053.3874-1-yaozhonguwl@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_074117_261598_6674F6D1 
X-CRM114-Status: GOOD (  21.43  )
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

Some boards route "power hold" lines from the SoC into the board's power
circuitry. Those lines have to be held asserted while the system is
running and released before the PMIC shutdown request is written,
otherwise the rails can drop and come back up instead of staying off.

Add power-hold-gpios to describe those lines and power-hold-delay-ms for
the settle time. The driver reads them for every RK8xx variant that is
the system power controller, so define them once, in a schema shared by
the seven RK8xx bindings, and reference it from each. The bindings
switch to unevaluatedProperties: false so that the shared properties are
allowed, except rk817, which keeps additionalProperties: false and lists
the two properties: it also references dai-common, of which it only
allows a subset.

The array is bounded at two entries. Firefly's vendor kernel handles
exactly two such lines, pmic,hold-gpio and pmic,stby-gpio, and its board
files use one or both of them, with an RK808 and with an RK818.

The lines are released from the PMIC's power-off path, so they are only
meaningful when the PMIC is the system power controller. Require that.
A board adding these lines is expected to switch to the generic
system-power-controller property at the same time, so the deprecated
rockchip,system-power-controller spelling is not accepted here.

Assisted-by: LLM
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 .../bindings/mfd/rockchip,rk801.yaml          |  5 ++-
 .../bindings/mfd/rockchip,rk805.yaml          |  3 +-
 .../bindings/mfd/rockchip,rk806.yaml          |  1 +
 .../bindings/mfd/rockchip,rk808.yaml          |  5 ++-
 .../bindings/mfd/rockchip,rk816.yaml          |  5 ++-
 .../bindings/mfd/rockchip,rk817.yaml          |  4 ++
 .../bindings/mfd/rockchip,rk818.yaml          |  5 ++-
 .../mfd/rockchip,rk8xx-power-hold.yaml        | 42 +++++++++++++++++++
 8 files changed, 65 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/rockchip,rk8xx-power-hold.yaml

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
index 7c71447..38108fe 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
@@ -76,7 +76,10 @@ required:
   - reg
   - interrupts
 
-additionalProperties: false
+allOf:
+  - $ref: rockchip,rk8xx-power-hold.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
index da23915..ddf2b2f 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
@@ -87,6 +87,7 @@ properties:
     unevaluatedProperties: false
 
 allOf:
+  - $ref: rockchip,rk8xx-power-hold.yaml#
   - if:
       properties:
         '#clock-cells':
@@ -108,7 +109,7 @@ required:
   - interrupts
   - "#clock-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
index eb5bca3..5ca76dd 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
@@ -136,6 +136,7 @@ patternProperties:
         enum: [gpio_pwrctrl1, gpio_pwrctrl2, gpio_pwrctrl3]
 
 allOf:
+  - $ref: rockchip,rk8xx-power-hold.yaml#
   - $ref: /schemas/spi/spi-peripheral-props.yaml
 
 required:
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
index 50dfffa..d51f815 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
@@ -119,7 +119,10 @@ required:
   - interrupts
   - "#clock-cells"
 
-additionalProperties: false
+allOf:
+  - $ref: rockchip,rk8xx-power-hold.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
index a58d945..c0c8dec 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
@@ -107,7 +107,10 @@ required:
   - interrupts
   - '#clock-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: rockchip,rk8xx-power-hold.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
index 2cb6d17..6207c42 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
@@ -55,6 +55,9 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios: true
+  power-hold-delay-ms: true
+
   wakeup-source:
     type: boolean
     description:
@@ -157,6 +160,7 @@ properties:
     additionalProperties: false
 
 allOf:
+  - $ref: rockchip,rk8xx-power-hold.yaml#
   - $ref: /schemas/sound/dai-common.yaml#
   - if:
       properties:
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
index 90d944c..c9b863a 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
@@ -111,7 +111,10 @@ required:
   - interrupts
   - "#clock-cells"
 
-additionalProperties: false
+allOf:
+  - $ref: rockchip,rk8xx-power-hold.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk8xx-power-hold.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk8xx-power-hold.yaml
new file mode 100644
index 0000000..6be3e1e
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk8xx-power-hold.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/rockchip,rk8xx-power-hold.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RK8xx PMIC board level power hold GPIOs
+
+maintainers:
+  - Yaozhong Li <yaozhonguwl@gmail.com>
+
+description:
+  Properties shared by the RK8xx PMIC bindings for boards that route power
+  hold lines from the SoC into the board's power circuitry, which have to
+  be released before the PMIC is asked to power the system off.
+
+properties:
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description: >
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, as the lines are released as part of its
+      power-off path.
+
+      The lines are released in the order listed, and power-hold-delay-ms
+      elapses once, after the last of them.
+
+  power-hold-delay-ms:
+    default: 0
+    description:
+      Time to wait after releasing power-hold-gpios before the shutdown
+      request is written, to let the lines settle.
+
+dependentRequired:
+  power-hold-gpios: [ system-power-controller ]
+  power-hold-delay-ms: [ power-hold-gpios ]
+
+additionalProperties: true
-- 
2.55.0.windows.3


