Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA144E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 02:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y8dhTpLIBr5me5F35lRQFrvVcb4wHxn4cA08Itluul0=; b=gofNUYf2qWbLpZXNY607KOXSkA
	ZyH6GEFnQXaVd/ZwXu4gMcE8tjA2GoGrwb14Us24VUNgPmYR9/Q5qs3qxpGqkQp2I3rIcaN+LXZjY
	LicYUhMjP5l/ctNzNQlF46vQCQX+9Ly/iXn4+/KbF3nf2FATZI7drKp316/wK4/uy5rRCoepKvHIG
	uMTBWI62o9eszh68S4Mog8EEFzfgyLcmspuhLArqNnYh0nPiosqB0YAVacDvbkdeA7zA708LE0qWX
	n9lVy0lwGamelq1gRVOM+dwGOxi7M1sofCa9ptZMV/shWbWiy15+CgdAAE5q5Ikpo6x9+Lt3k6BhT
	ARrQzrgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIetV-0000000BGl1-2R24;
	Wed, 04 Dec 2024 02:13:37 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIeqa-0000000BG6J-2OII
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 02:10:37 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2155157c31fso3345965ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 18:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733278235; x=1733883035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y8dhTpLIBr5me5F35lRQFrvVcb4wHxn4cA08Itluul0=;
        b=nV3PtZy38BAjYym4U37dporWFgP1MVFXD32VCSKhBEjv1hMhMMxFfmJA7SXQPRpyEM
         m+mEZLYAZ7AgVW4ZtDGsbBYwVc3ZW0xD+wpLIRuEcdUZZZT+tcU69bGxiaLhYOrkpSzM
         UvUsgZqESy/0SJQSraSqQ0Zp5vu9vsTs8u366wsTgfSMiLMd7dSvnv2adAm6ESr0Mkhl
         dcZ/jSSWYglv25Gqb7lKr5SNZQ2U5l/OtHrohul4DxPBd1BSsOgnbvcz7ecKjucJvoeb
         yF8YFDgbl0/Fqyi2gPxvfkvkLnST9DxjYfHJvKJAB+949FAA0PIDshDGHbS/6AodkHvf
         t9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733278235; x=1733883035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y8dhTpLIBr5me5F35lRQFrvVcb4wHxn4cA08Itluul0=;
        b=wYtb1EQNQQ/f30gPdbOCqZy8YRGk0IBSxTh2Ywev9D6Po/I6opTFOqbAgefh1ImCdk
         nXjR0EqIB4YJVtiHcuut1p7csL94mQokDc4uyJyPrk+U36Abbu14o1eRTz+s4NmtY9OU
         th83keUKgo/INHHKhkSzQhTOTmyrVh6VLGB6xxRkMB5s8vjgV9Tt6Bzayf2vu3llZvDN
         MWHigWgsjaSgEMYywVljR5e8p38IVJaXP35XpQaFAembDWsDe4wWSnGvEzOhL7Dr4NBQ
         Cl48ih0DCu3IvT1g8LI0Wb2FiyiuBMQWvpO0mh4opdpFyTp1AWxSiAnMtPB8l04p8Id8
         m1xA==
X-Forwarded-Encrypted: i=1; AJvYcCUoeJ1STI24cj1s7PBzv2Olx2ildrp5rAmcYKBXwDhBCWkd/7aEChdBLL+29zO4lKbZEypoZQzKCDT2HN9ggO93@lists.infradead.org
X-Gm-Message-State: AOJu0YzABHeVfpqNsB4R03TLHE9RwbVf5cDbCbZknyOIO1ez3dxiaRpV
	/KT+N0/O2Q4hNkOcWbbgFfcOHAl0AQyKKrPJ6ueWb1a6yWpMSSFc
X-Gm-Gg: ASbGncspE2M4df2civasalEyqxXNkLMapXou+JKLzp97ejxTwPJrE+FpbpaflD5tDS6
	I5vJPO6WJ01WeUOeTk1BsNEvX+W19EfSR/9nnGZNCNR8a1XeJjFQEORCBldkkZlaMUicit5llV8
	EQvTd/vI3gg3cbKGXtH8DdRxO7Mc34fjzngZt+yni43WJ7TXJd5DpQOSTxE9nOXM3tdvv8pifqr
	w5iyxuLvxUvF9kW1Hxe4vtKhdwkFpmlZRJC8HnOWkBK/Wriy0u3m9vW/WpKpOvQcsY0+O3gpbAq
	HAVVyIOnizWzVxIX/4Z4hCJIif3FeTJjKH0=
X-Google-Smtp-Source: AGHT+IHv34fl1zF21h28QS1304jqN3qm1y2mC9/dqDbZryhdc9R6IjuT3cNWpoVXgTk9IJ3grX7J5w==
X-Received: by 2002:a17:902:db10:b0:215:65c2:f3f2 with SMTP id d9443c01a7336-21565c2f650mr253229155ad.6.1733278235600;
        Tue, 03 Dec 2024 18:10:35 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2156815bcfesm62785115ad.215.2024.12.03.18.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 18:10:35 -0800 (PST)
From: Ming-Jen Chen <mjchen0829@gmail.com>
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
Subject: [PATCH v4 2/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
Date: Wed,  4 Dec 2024 02:10:14 +0000
Message-Id: <20241204021014.5083-3-mjchen0829@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241204021014.5083-1-mjchen0829@gmail.com>
References: <20241204021014.5083-1-mjchen0829@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_181036_606146_704F72E6 
X-CRM114-Status: GOOD (  13.45  )
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

Add YAML bindings for MA35D1 SoC keypad.

Signed-off-by: Ming-Jen Chen <mjchen0829@gmail.com>
---
 .../bindings/input/nuvoton,ma35d1-keypad.yaml | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml

diff --git a/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
new file mode 100644
index 000000000000..54a81583bf2b
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
@@ -0,0 +1,69 @@
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
+    const: nuvoton,ma35d1-kpi
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
+  - debounce-delay-ms
+  - scan-interval-ms
+  - linux,keymap
+  - keypad,num-rows
+  - keypad,num-columns
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/input/input.h>
+    keypad@404a0000 {
+      compatible = "nuvoton,ma35d1-kpi";
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


