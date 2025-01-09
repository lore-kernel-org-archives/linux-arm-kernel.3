Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4859FE7719A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 00:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YsIZZl60dEIPjl7pc2az7uHZ2HOwUEGN+MqA0/H9AGA=; b=yL3+71ZbFV7Q+NCfV9t2J+J7zj
	N9g70HXWbqHYSFUBrRiZMItR8XC+tdP0ukQfCpmRIHvNFaQ9csoxrder32aDZs1MLtg1GhVio1Tuz
	LtjAWm4aBru9ivSMsbLeh1TMdjA+rSHSFLRgvE6mmTHG7CXrmQuiQeRX/E0a76YnzkICBn093OgWq
	2N9BByKpBXxASJ/a+G68neqhGU3+7kJqaxVeMdRJyRRr06QgsYnEzqPpYn5ko8IjcH2iUXYMfMKbc
	Y75qauFswaTeBsA/j+ARXzeciw+/s3qyseCsrAu936mbb5dGkBLMuvj8YgLAVij7aqokxVgCvbMN8
	EP8ixp6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVgQp-0000000AF5g-143d;
	Thu, 09 Jan 2025 00:29:51 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVgOH-0000000AEb5-1bwa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 00:27:14 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-216281bc30fso6084265ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 16:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736382393; x=1736987193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YsIZZl60dEIPjl7pc2az7uHZ2HOwUEGN+MqA0/H9AGA=;
        b=UXubD2ousH2nIHyL0I/iVHtCZdnZ4lR/prqTwwJS0LX1jlgdh7mlciif7pCwZ1qQTk
         05W8azmE56rlfiWvlxuj20yNFWZPzkftvczJJIBahSof418NE5at2xvk1YbGkmbN9wky
         tCdnnU5N/35fDiMwbq+mpdIOTM+B8Fd/iVPTtyw0FxrrDAkrxr8ths7gLKOUgHg9sSKN
         zzAN86yHxvcntbtpS9dBfrO+4eFmQuVs2XdeejYeyUnaKyoDvPWV1qU24e3sqzCuQgN8
         Ez6rMDPXT3tO6u8tjyY0Gp2rIKTgetx2GMABtODvjY1J3zVj6fiSHkkiRvroTllIwZUS
         8rDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736382393; x=1736987193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YsIZZl60dEIPjl7pc2az7uHZ2HOwUEGN+MqA0/H9AGA=;
        b=kFBSVNMmlwuIDyWK9vdXirkIGAiUONET/YfpURHyR7p48JZld/XAEr2CLkLlASb9Zd
         rVoNZ70R7gas2cT0YI2Jymf1V06p3XyFq/QakIB+ODBo0R2C0NUuhtEbrTQuNqoY9J6q
         0HXnGgicVrkdfC4/AUyvuWZOtsiuPBOWWi9BqwFaEACrDH02BKlfEXvqaMvO1ydqUpMr
         V+NLSqVNipFGpYGr1F05qY8BJxLCeIQPAd4Bx03jGAYazNPWGVr55pgyMyUyHVMObBwS
         /DNk4TeRIIQZ6pbsuPV3JJte7S9UFSIxaSbYJkpiQP/TeOQhhzngQ+yYQ0alcUh8bvdL
         U16Q==
X-Forwarded-Encrypted: i=1; AJvYcCWjlUkT3Dtq60/HY5kgnkW+O+U/Fa/NaswbquLUWmGbrDwvWjyVg2382FI+bfwPGH5QLEYz9FXxFgl/KYTM4AcA@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2tAu0Y6M6N9L96pzSAMDvQxPr5vy4MObG8YZo5TLCRHeSxK/u
	mGYS2CApvnhrxhcLVu7DSNBzozI2CqLb+j6PT9GJwI40VtPu1vPV
X-Gm-Gg: ASbGnctP20ukSyVR+rVF9wkS1lI2mqjC0FwErkPYMa3z4J1fKiYLHe1XkwHn5eNxMLQ
	5YUJ/lm0tJkIAeomwjNTpcAl568YbKh/LkSE9Sv8ksNcOK9ceY1tuWTrn34Zzadv3EyD3lPtFzO
	zVnbhhxfin71TemYLRiy1o21Ix85EGWOrICazLreWN6XFqUOKaLcGGpU1Lmt8pZlhUOyV1Tqowe
	2O1Pq6cehf6c+hJW+N8dMOpy0DuMjzZu5DUUi4hKZR8ZnsSD+mLG/cjYbFefq32ZERBF+4qn3X/
	qjcsdPCOdakE9tPkEAnOAD4ULd9aHkZX63nnvadJQQ==
X-Google-Smtp-Source: AGHT+IFTwpCgtAWhcoiuknE8MbwvNCyYt4hh1A1hVKRcuqvUytlhUI6C1CnNX6kuasEuhW0eiQu9rA==
X-Received: by 2002:a17:903:2301:b0:211:3275:3fe with SMTP id d9443c01a7336-21a83f5243bmr69201615ad.17.1736382392607;
        Wed, 08 Jan 2025 16:26:32 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca01989sm333481435ad.239.2025.01.08.16.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 16:26:32 -0800 (PST)
From: Ming-Jen <mjchen0829@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	mjchen0829@gmail.com,
	sudeep.holla@arm.com,
	arnd@arndb.de,
	peng.fan@nxp.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	dmitry.torokhov@gmail.com
Subject: [PATCH v6 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
Date: Thu,  9 Jan 2025 00:26:21 +0000
Message-Id: <20250109002622.771-2-mjchen0829@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250109002622.771-1-mjchen0829@gmail.com>
References: <20250109002622.771-1-mjchen0829@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_162713_413852_09A3A03A 
X-CRM114-Status: GOOD (  13.78  )
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

From: Ming-jen Chen <mjchen0829@gmail.com>

Add YAML bindings for MA35D1 SoC keypad.

Signed-off-by: Ming-jen Chen <mjchen0829@gmail.com>
---
 .../bindings/input/nuvoton,ma35d1-keypad.yaml | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml

diff --git a/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
new file mode 100644
index 000000000000..9d262f87dca0
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/nuvoton,ma35d1-keypad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 Keypad
+
+maintainers:
+  - Ming-jen Chen <mjchen0829@gmail.com>
+
+allOf:
+  - $ref: /schemas/input/matrix-keymap.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-keypad
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  linux,keymap:
+    description: Keymap for the keypad.
+
+  keypad,num-rows:
+    description: Number of rows in the keypad.
+    minimum: 2
+    maximum: 8
+
+  keypad,num-columns:
+    description: Number of columns in the keypad.
+    minimum: 1
+    maximum: 8
+
+  debounce-delay-ms:
+    description: Debounce delay time in milliseconds.
+    maxItems: 1
+
+  scan-interval-ms:
+    description: Scan interval time in milliseconds.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - linux,keymap
+  - keypad,num-rows
+  - keypad,num-columns
+  - debounce-delay-ms
+  - scan-interval-ms
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/input/input.h>
+    keypad@404a0000 {
+      compatible = "nuvoton,ma35d1-keypad";
+      reg = <0x404a0000 0x10000>;
+      interrupts = <79>;
+      clocks = <&clk>;
+      keypad,num-rows = <2>;
+      keypad,num-columns = <2>;
+
+      linux,keymap = <
+         MATRIX_KEY(0, 0, KEY_ENTER)
+         MATRIX_KEY(0, 1, KEY_ENTER)
+         MATRIX_KEY(1, 0, KEY_SPACE)
+         MATRIX_KEY(1, 1, KEY_Z)
+      >;
+
+      debounce-delay-ms = <1>;
+      scan-interval-ms = <20>;
+    };
-- 
2.25.1


