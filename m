Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0A4606A322
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 08:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q+DxE9Zm;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a33VnfPI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fUtBDBFlnuwqHCLsz+VPCk4N74H4c6MrUI5YYlRszuU=; b=Q+DxE9ZmZQhfjG
	EW4wm2cQaPf7iDe5TZC1AnTM8BYoxjT1X0wUl7U5EzwmPrb9f+FTc1fAi1xogGuF3PLGUCLaDycTC
	+jlnsnYRYozsOMZmvU0RKGvnM2s3+mwlc+XwCTRcDxwdIDCH5xnirgN80aUszAgW1/QQZxKZ4TSsU
	+0gwisQVwOYk40tlCHmRxpksPjZjiKnuxHx5Lq9VDzNamt9TJT5oC5Y26cCS+LlfwWoJibvCA4x/3
	BtTn4eDjuzvgv0WaRizbk0vbSRaCrtnKB7gmmc20cRNCBBBFsQR6y+sn6JiMp/V3A5EQLLl//B857
	oKGGzKkcipVBicEYVrhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcoY-000000044zM-46rE;
	Tue, 27 Oct 2026 08:45:51 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcoT-000000044wN-343K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 08:45:47 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-89ff475a152so1548776b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 01:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793090745; x=1793695545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fUtBDBFlnuwqHCLsz+VPCk4N74H4c6MrUI5YYlRszuU=;
        b=a33VnfPI28AZxuMvxthp1JsA4B+jm5YdtGbL3frZ4rHH98aVhYD5J116Tqg54qpNIM
         liTsUMCY5miUYkyeOMOe12f88k7Rx4mGdFDdCI9IFGaYa2pzUWRzU3Oa+eSo3c5qeYvw
         AV3S8obpAJwBljpkzVRVe0/6TW4xAgc0woLGau2aRsdTVUFGthimbkAZbTbwsay3vQai
         JIDfzNKYR44EZJayTWQVyKxKLVahbj6pHAQ6xq787dIvT5OAmN9MydSN9U7wb1mGyFQX
         28d44NkAucs7bIh0RqxaTkbAB7MUEgClr5d2pCOPfE9yf1V2K30wuQONZ4bzl78tOmtk
         kX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090745; x=1793695545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fUtBDBFlnuwqHCLsz+VPCk4N74H4c6MrUI5YYlRszuU=;
        b=pxDxCdD+g0YT0zUFkQA5wAcqh+SWYsrgghabQZ75qm2yEYdIKmVd42SqjbJINnkQAN
         mkG5TNCKBvKPXPUKSG9Rg5Rvk+wGenbm4defsqfkyeKl8tr0Sq/hWigm1JCCekGbeGeD
         tV+jJbg3RnZC+SSnLE4Hww0nHsUbcwdoEOxdwusuSVz0Tm3BCiotaXzy/tw/09W6bQm6
         DVf7LK6Z/TD7iIUX9c3KtJEOdoCo+jWJHv+++VqJMHFpHgWATpkmCFhCbJ7zXGrM1Dla
         ZK4DHJlYgiOzBzfvpKd54rC3uqP2WiORYWKkGtShJs7Vt+qRd7a2TAziEpN17vMogQTC
         30wg==
X-Forwarded-Encrypted: i=1; AKwUvBwQw+e/yYpTK5gJoW3pSHxNo7xksxWfEkRE1KdY8T0NKuqlaHYXIc308M0t5QqC/X5fUxIHFH0Ne0Gr6MnY0ChU@lists.infradead.org
X-Gm-Message-State: AFq9FYJV/a8va2I6YFp2jW1DHC+MnRXFW/3O58SDo1uzB4y6aYFgq701
	lwG5EOoBAfiGL3P9NqcAk/OI41sIs51EFyPx8uMmbeCiFzF3q+71g+84
X-Gm-Gg: AYBFou1BWA9saH7u9LlHamA8S6HT6p9705GdnGeY/mbAuANy/02Wo7aeAto9Ih3Jhx7
	HjHEPgclisugOK8dI/c9aq8ptT1F62Dx0cOc2xfvTrnZmXZKoP823WnBnArcOE+xXIyELmikINj
	GY3s65PCdZ5UZojWn7yGNko1TONXsSXPWjSt2mxgd6cF4QhTA8DsrcSqc9wu5oCXy6Qxv7Cnm7M
	9Khr3RxEUqT764WlY0MIA6xxJCT5n+vsiS6bJvtTQApWilIHWmCKT98FRgXBuj+h55Of2d7obga
	nYYcBz4LezC45zRuhbiGowTwWk1B0aZCKlSGBOWC1+XB7D5fprCY7IRgizjZz3EW36KJ3ROVoPg
	FYPLHfoaMoucB2Yy7P6qeMDyKcGPrPyxFZfHmILPmw2vSJ+MTOUB144YTSLrUA4sX6iJj1uFu/2
	dwIv7aWBG/r+JusvRZqOr09Pse4jIg1igHezTNUNz16L4mbaj0fDv4ngN+CJPBU75OUXx7rYIT0
	Gl0rmMFlCp4tjAeSD2EmID27ET34gutQiZY6fiNL0KaSnyEzF3DQ8YvWuOzHmigsnLYdw==
X-Received: by 2002:a05:6a20:ef03:b0:3e2:1a24:fb82 with SMTP id adf61e73a8af0-3e7bfa2023bmr5501098637.16.1793090744450;
        Tue, 27 Oct 2026 01:45:44 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdad8f2c611sm267581a12.10.2026.10.27.01.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:45:43 -0700 (PDT)
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
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [PATCH v5 1/3] dt-bindings: mfd: rk8xx: add board level power hold GPIOs
Date: Tue, 27 Oct 2026 16:45:07 +0800
Message-ID: <20261027084511.1992-2-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261027084511.1992-1-yaozhonguwl@gmail.com>
References: <20261027084511.1992-1-yaozhonguwl@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_014545_786763_CCB8BE67 
X-CRM114-Status: GOOD (  15.25  )
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
the system power controller, so add them to all seven RK8xx schemas.

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
 .../bindings/mfd/rockchip,rk801.yaml          | 24 +++++++++++++++++++
 .../bindings/mfd/rockchip,rk805.yaml          | 24 +++++++++++++++++++
 .../bindings/mfd/rockchip,rk806.yaml          | 24 +++++++++++++++++++
 .../bindings/mfd/rockchip,rk808.yaml          | 24 +++++++++++++++++++
 .../bindings/mfd/rockchip,rk816.yaml          | 24 +++++++++++++++++++
 .../bindings/mfd/rockchip,rk817.yaml          | 24 +++++++++++++++++++
 .../bindings/mfd/rockchip,rk818.yaml          | 24 +++++++++++++++++++
 7 files changed, 168 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
index 7c71447..bfba394 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
@@ -29,6 +29,26 @@ properties:
     description:
       Telling whether or not this PMIC is controlling the system power.
 
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
   wakeup-source:
     type: boolean
     description:
@@ -71,6 +91,10 @@ properties:
         unevaluatedProperties: false
     additionalProperties: false
 
+dependentRequired:
+  power-hold-gpios: [ system-power-controller ]
+  power-hold-delay-ms: [ power-hold-gpios ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
index da23915..7895c31 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
@@ -48,6 +48,26 @@ properties:
 
   system-power-controller: true
 
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
   wakeup-source:
     type: boolean
     description:
@@ -102,6 +122,10 @@ allOf:
         clock-output-names:
           maxItems: 2
 
+dependentRequired:
+  power-hold-gpios: [ system-power-controller ]
+  power-hold-delay-ms: [ power-hold-gpios ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
index eb5bca3..b719b07 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
@@ -31,6 +31,26 @@ properties:
 
   system-power-controller: true
 
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
   rockchip,reset-mode:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [0, 1, 2]
@@ -138,6 +158,10 @@ patternProperties:
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml
 
+dependentRequired:
+  power-hold-gpios: [ system-power-controller ]
+  power-hold-delay-ms: [ power-hold-gpios ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
index 50dfffa..0be2bb9 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
@@ -43,6 +43,26 @@ properties:
 
   system-power-controller: true
 
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
   wakeup-source:
     type: boolean
     description:
@@ -113,6 +133,10 @@ properties:
         unevaluatedProperties: false
     unevaluatedProperties: false
 
+dependentRequired:
+  power-hold-gpios: [ system-power-controller ]
+  power-hold-delay-ms: [ power-hold-gpios ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
index a58d945..a834a9c 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
@@ -44,6 +44,26 @@ properties:
     description:
       Telling whether or not this PMIC is controlling the system power.
 
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
   wakeup-source: true
 
   vcc1-supply:
@@ -101,6 +121,10 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/string
         const: gpio0
 
+dependentRequired:
+  power-hold-gpios: [ system-power-controller ]
+  power-hold-delay-ms: [ power-hold-gpios ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
index 2cb6d17..2c05275 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
@@ -55,6 +55,26 @@ properties:
 
   system-power-controller: true
 
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
   wakeup-source:
     type: boolean
     description:
@@ -189,6 +209,10 @@ allOf:
           patternProperties:
             "^(BOOST|OTG_SWITCH)$": false
 
+dependentRequired:
+  power-hold-gpios: [ system-power-controller ]
+  power-hold-delay-ms: [ power-hold-gpios ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
index 90d944c..319c0f2 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
@@ -43,6 +43,26 @@ properties:
 
   system-power-controller: true
 
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
   wakeup-source:
     type: boolean
     description:
@@ -105,6 +125,10 @@ properties:
         unevaluatedProperties: false
     unevaluatedProperties: false
 
+dependentRequired:
+  power-hold-gpios: [ system-power-controller ]
+  power-hold-delay-ms: [ power-hold-gpios ]
+
 required:
   - compatible
   - reg
-- 
2.55.0.windows.3


