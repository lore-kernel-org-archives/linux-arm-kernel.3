Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B548CA6017
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 13:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9MYQFCxh1yQ7ROqRBAiqvcdcm8W2x8q2IXByiIDFhMY=; b=wbA9xtknrCfxmNyqA2+IaR2rwi
	6AUTUQn38j234nIeFUbaw/aQLJdFfuaJ3L/HwstBEmh+Kn4CaMPw5shLN8pmqHRj0jIiQRGkN5dbS
	XMTKcx4LLrt8SidTraFbGJ3xprFrdcRRyLzneTjMLIJ5xnN6+vBcD0QZ4wHZ5UcybLDK3pEzdbgJA
	0aCeBZlH0dPIYHxzHqvHD4d/0pDwttzCeen/YuvyaEhhfdlFx4Wjv8YO2OrdcDyRjVn9nFXKvIId+
	MHH0Qwxyhi7yijnFAlEAzCIVsyWMM1hOSb6ckRCIAaC9aSJkNGLtNpjU1ZP7yEM6H5qcgbkPtdHkq
	AdtOSvqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWh2-000000083QF-13sT;
	Sat, 10 Oct 2026 13:00:52 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWgp-000000083EJ-3OHv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 13:00:41 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48c14a06c95so543327f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 06:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637238; x=1792242038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9MYQFCxh1yQ7ROqRBAiqvcdcm8W2x8q2IXByiIDFhMY=;
        b=FwaTHyhsyutryim4EtoKSYTzBLA/PjSe51mjNqrBfndjbm02/+Ee0dNwQ/wmn6zMRS
         P0P+pX7w5PeuqpiiBvQNYDDSxIYsrJIhrbwrPmitKEEk/wxQpgqMbKGu2NmEqS95aiOB
         yb3XOKgnqU5KWDWtBA6weFtFrOY/VCx2Gr8ZrAuRsbVGJY6WfwvUfvPq0qeEwf7VfsF0
         ndjj5lyxC38rCzO3EdkPCsjgcX8da1KQeZr+xHAj43T6dEH3tDZOMaHieJvVkry+uZlo
         Vg5y2/AitTgtIfuLmYq1PXmk8pm+Iy6PYSj/l4hbYelyHPDf5/7H8MGqffGRGzedoZPG
         cSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637238; x=1792242038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9MYQFCxh1yQ7ROqRBAiqvcdcm8W2x8q2IXByiIDFhMY=;
        b=Nv0Xky6T9T3MLVgZjxRZUi7M8bd7KyNTdRE8AHFXGYHYRpMlWN71OqdbByvCdX0b44
         OMQrdH/fP6Kifx13Vb4pRKwSWJpVjyk+NkYzGq9uu6IOUo055qCDsxesTlXmEEH7XbXe
         bthecCgv2b2f1z0NByM6uJvp/Ul2IOfM64yRwP8EKdTgCDfkhG9tFJT59D7exRRV+dzy
         L2f7UknPwk8+7gZ53c24+LgKz/JXao7niILwkJlXNXkC3XBGL2CKaV+Gr/tWHPXAqvaO
         8z7utcHagr4N/46p3st2akVXcf0Avf8sZoswkNeqBMjeYul72PmTqyY95aOQvRhQDV4E
         G2pQ==
X-Gm-Message-State: AFq9FYJn1LP1YHKTAnNvDiH48vklsvAaPpSQRo7+5VSbI2y4/IjVPxsg
	WCFiuqrwbvxVE+ONtqA7yMQy+RH3N/umOvpctYe2+fAzfZLod3/HA9Yd4cnj+gemOzmSTA==
X-Gm-Gg: AYBFou0jXGwJXmHjDKboACho/qcPEcLEGahCo+yLpZW8z6Cvhm7LusTkSXtXDELDvsb
	TWYmYDSG3djqkRWn4Jav1D0lK+jTGIDQ87aMOBlOhsYNpRtXUSVZMilLRHGAE0KSpYj00qjZ2lt
	+G1fI4CSS2UKa+KIuLnzKP88e8RHCjS8ud0lseT+JjlfoSPJWi/7lFAOKWYdeQP9qk4IA/H89JX
	Ib1jaLPnCwqiTpE3zo+zIdXFsJp8LROM9sdSAzUep+Yk3lg1ZjGXs1XPQ3ERlxn/cHbvtu3QWlN
	rFgOEXnRcWeAL5B0cFbxC+h0jORO2v9HYX8n+n8K2VkmVCkyL0T3oXGaDPQCoOUqZZvLXotW9hh
	EIj5AOB72R4ytUIIk115r1MQXdvp+mazZDb2Stik4B8TozgoZItrImJ3z4U4k+XF4xGZHFreaFL
	Sw/bfaQXlN7dIQOeqz9GWUmq1TPgjxR/cwSb+eJWYqych0D+5sGkv8aAZKTtW5UDPqzdYOGffVn
	XPpnTw7LPOZjnLR7Bzq7yM9dn6qo9W9HOQbQYTjYBk/uSu/2PhZyVK2n9zWdsq/HoRY6ihSUlx3
	4aaDF+okr/y80yK7xnw+XtU80w/hDkR3X2kxSdwtfYGHx+kMtaH+JP3qgdHAQw==
X-Received: by 2002:a05:600c:8718:b0:4a1:7259:349e with SMTP id 5b1f17b1804b1-4a18e4e0a33mr89706675e9.27.1791637237809;
        Sat, 10 Oct 2026 06:00:37 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:36 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 08/24] dt-bindings: gpio: Add ZTE ZX279128S GPIO controller
Date: Sat, 10 Oct 2026 13:59:46 +0100
Message-ID: <20261010130024.177503-9-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_060039_885963_BFE6B72A 
X-CRM114-Status: GOOD (  12.62  )
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

Describe the register-clock consumer and GPIO banks.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/gpio/zte,zx279128s-gpio.yaml     | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/zte,zx279128s-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/zte,zx279128s-gpio.yaml b/Documentation/devicetree/bindings/gpio/zte,zx279128s-gpio.yaml
new file mode 100644
index 0000000000..132c7126fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/zte,zx279128s-gpio.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/zte,zx279128s-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx279128s GPIO controller
+
+maintainers:
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description:
+  The ZTE zx279128s has several identical GPIO banks. Each bank has 16
+  lines and is described by its own node.
+
+properties:
+  compatible:
+    const: zte,zx279128s-gpio
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-line-names:
+    maxItems: 16
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - gpio-controller
+  - '#gpio-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx279128s-crm.h>
+
+    gpio@94407000 {
+        compatible = "zte,zx279128s-gpio";
+        reg = <0x94407000 0x40>;
+        clocks = <&lsp0crpm ZX279128S_LSP0_GPIO_PCLK>;
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
-- 
2.55.0


