Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6B2D10399
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 01:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HjsxbPPZPhrPsk8Kv9v/JHWFfPAbNR5NFf7Fw2jHbOc=; b=ZZ9TU/sanszS3V/FWGAD7hiZAo
	QgEcckoLGambvQ4TfM52wlOd//GjxGJCpmxS8gydRkFwAaholwHQ+vDWw5PgYhszQ/90yPPAAUaCn
	np3LQv0nT8tFjHbB3koTwyQKlIxRypHDU1GVxMb2pjk+7v0DvlYclpn2E+TJPSq5nKa9GqM7wXd/t
	k9Ryb/W1HfDu8diAMrs6l6FInkg7TNeflUrAW97u/R85uhV3HvXDT1/F+qt8OkIGc8f4UJdgB4OXt
	Z0845vw3+DC4o36AM8Mr9DBZtjcKaF5ZpJEUBcnlGhF3cFOMLNSoSYx63lLZHBVbOrnHJsVbN+xQf
	7N2VdFvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t48zx-000000029yl-0gnV;
	Fri, 25 Oct 2024 01:20:17 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t48qU-000000028Rk-4B9z;
	Fri, 25 Oct 2024 01:10:32 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-20caccadbeeso14740715ad.2;
        Thu, 24 Oct 2024 18:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729818629; x=1730423429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjsxbPPZPhrPsk8Kv9v/JHWFfPAbNR5NFf7Fw2jHbOc=;
        b=lfevJB3S2bKcDDmVqI/ShoUWpLZj/4rhDndfyby08ZbNg7BVrSryEGW3Zrs6yhoJGy
         K//cikpEOf6o++xEApXERNvso/KZvZQhvyjJ1T08FKG+NLxJ6MOuRVwTRwzQw76sJm/N
         suu9mmo4sltm23lfmmDhXdIrAV/58EzCFp7AnYSFR5u7rO+8uDaKOlTMz7JmTDk2WIdN
         oYO/9Epi43JZ0RkfjqHh4+QOWFSkqT3EBGgJn9K6mo7+VwvXN/QXPva1MDsoEh84QIL3
         Jp3tanmG0ZSq2qQg8Dmb99YXrFGhU2Cf2vm/vF3dJjDhkrIVO2bMefYxeZazE3j7EB9i
         I3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729818629; x=1730423429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HjsxbPPZPhrPsk8Kv9v/JHWFfPAbNR5NFf7Fw2jHbOc=;
        b=lhjvR+yRd171UJiCFPImpxP588oAXu6QwDvcc6IID71qr96dXEXnZ/lp12wOZnFkl1
         BYss3fxFmQsifkFcmCS5r/SI5dt41pZfIQC3YSRn7ru+q4GAdlgpK1aiOG4kslacWDs8
         88G/1rxYlJCASpwwxlQD0uKtoKQlRjXz1aKg6SY+OIDmpjfi34Bgkjwbq0h95BPT7NoX
         TPVyEMbFc1u+RBRheY+GUsGnjjAQPCXca97l/eO+C5EuxRw0mCA47PV4LBJPIrmgUAyL
         Bx5ZPXU75zqBlyXAl1PGxmW1606g7iHbx39WLkz4crrbjcKDzr64wZtvgITrikjC86Jq
         W4Ig==
X-Forwarded-Encrypted: i=1; AJvYcCUu1K5wZerC/+JKdbl6RkRBMVx8YF4ZYLPy0XQR99TNsFQ4n8Gd6ztIFYpOnEC3P9HlaslbFP4fb1DLBRw=@lists.infradead.org, AJvYcCWIMIg0syLTZfn295V3UQiWyQBpVQ/AfseAXJi5bHMtcKAXXmSX42E9V5/Ha06QTrcXPpZYw+j7m/5pb3s11MlL@lists.infradead.org
X-Gm-Message-State: AOJu0YzFUE7lOO0KHaYjNoFDXC481nsutSOpUn/qP/ge7aA6yCAD0jHa
	/vYKeJXo2wFPAAm7BwYqolInUHIq6Py5DzThedEgqKtMD5t4a57S
X-Google-Smtp-Source: AGHT+IEHoc6nWkrNG5/p9qR6jUUXfLELQg+uXNgVWwe925mwCigDiK3oPKX/W5C+XTBSotaJSY3yxw==
X-Received: by 2002:a17:902:cec6:b0:20c:b483:cce2 with SMTP id d9443c01a7336-20fab2e0fe7mr75143555ad.60.1729818629525;
        Thu, 24 Oct 2024 18:10:29 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc02f6f1sm577455ad.226.2024.10.24.18.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 18:10:29 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 2/4] dt-bindings: net: Add support for Sophgo SG2044 dwmac
Date: Fri, 25 Oct 2024 09:09:58 +0800
Message-ID: <20241025011000.244350-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241025011000.244350-1-inochiama@gmail.com>
References: <20241025011000.244350-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_181031_059165_57C58F87 
X-CRM114-Status: GOOD (  14.56  )
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

The GMAC IP on SG2044 is almost a standard Synopsys DesignWare MAC
with some extra clock.

Add necessary compatible string for this device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 124 ++++++++++++++++++
 2 files changed, 125 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 3c4007cb65f8..69f6bb36970b 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -99,6 +99,7 @@ properties:
         - snps,dwmac-5.30a
         - snps,dwxgmac
         - snps,dwxgmac-2.10
+        - sophgo,sg2044-dwmac
         - starfive,jh7100-dwmac
         - starfive,jh7110-dwmac
 
diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
new file mode 100644
index 000000000000..b7e4216ea45a
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/sophgo,sg2044-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2044 DWMAC glue layer
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - sophgo,sg2044-dwmac
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: sophgo,sg2044-dwmac
+      - const: snps,dwmac-5.30a
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: GMAC main clock
+      - description: PTP clock
+      - description: TX clock
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: ptp_ref
+      - const: tx
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: stmmaceth
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - resets
+  - reset-names
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    ethernet@30006000 {
+      compatible = "sophgo,sg2044-dwmac", "snps,dwmac-5.30a";
+      reg = <0x30006000 0x4000>;
+      clocks = <&clk 151>, <&clk 152>, <&clk 154>;
+      clock-names = "stmmaceth", "ptp_ref", "tx";
+      interrupt-parent = <&intc>;
+      interrupts = <296 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-names = "macirq";
+      resets = <&rst 30>;
+      reset-names = "stmmaceth";
+      snps,multicast-filter-bins = <0>;
+      snps,perfect-filter-entries = <1>;
+      snps,aal;
+      snps,tso;
+      snps,txpbl = <32>;
+      snps,rxpbl = <32>;
+      snps,mtl-rx-config = <&gmac0_mtl_rx_setup>;
+      snps,mtl-tx-config = <&gmac0_mtl_tx_setup>;
+      snps,axi-config = <&gmac0_stmmac_axi_setup>;
+      status = "disabled";
+
+      gmac0_mtl_rx_setup: rx-queues-config {
+        snps,rx-queues-to-use = <8>;
+        snps,rx-sched-wsp;
+        queue0 {};
+        queue1 {};
+        queue2 {};
+        queue3 {};
+        queue4 {};
+        queue5 {};
+        queue6 {};
+        queue7 {};
+      };
+
+      gmac0_mtl_tx_setup: tx-queues-config {
+        snps,tx-queues-to-use = <8>;
+        queue0 {};
+        queue1 {};
+        queue2 {};
+        queue3 {};
+        queue4 {};
+        queue5 {};
+        queue6 {};
+        queue7 {};
+      };
+
+      gmac0_stmmac_axi_setup: stmmac-axi-config {
+        snps,blen = <16 8 4 0 0 0 0>;
+        snps,wr_osr_lmt = <1>;
+        snps,rd_osr_lmt = <2>;
+      };
+    };
-- 
2.47.0


