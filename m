Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15105C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 12:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4e7ZzwqztMziHLUhoVfnoipumOCTxC0BX+2clstSkaw=; b=zlByFQIgs4RtKF/qRIBmRULVCK
	6Zfk3DI3Nckb7kPBS+9XD6uWGq6GgBoZw4+byv1SNSjRYHJwCG+O8qKRl4OKNh/wvTy5paSb4Q3uU
	nnyIYV23FQHix/gaHQPKZgzxf+oMSlzzEJDmJ8S9sNZ96vIVa4UMduXlZSSSEDkmFrPtT5qR5sIex
	pb3AqabToGPBMZ+RA16W1KPdtP+cf+8HnKKCzP9AP2bPoBgwExD0FWnEiVWF+oXXqS88d8sVBgUNz
	Uco7GrbwtjPo17YXuezeUtr7gN8SGDWEL0gevmXb5nHHQ9QzBnA1D6u32N/+IF7CJjO8SF0RVAjBl
	9w6T6ZAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjdzX-00000001nPQ-1YDh;
	Sun, 16 Feb 2025 12:43:23 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjdwi-00000001mr1-3Ztb;
	Sun, 16 Feb 2025 12:40:30 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7be8f281714so377251385a.1;
        Sun, 16 Feb 2025 04:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739709627; x=1740314427; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4e7ZzwqztMziHLUhoVfnoipumOCTxC0BX+2clstSkaw=;
        b=N6Og8MAp1kJQpLkr1ZpCRG75z/2Tej2udF8HX9kWMBtZ7yGryj+oWv6UKsiyzvCM0x
         iMnuZfbZ74YmLrjq9mFbH0vU/4jTN6izp1uypIgMpKPAuzmcxUkip3zmOUGO1llh42z5
         0AA93Vm+grkpqSC785oyAhgaLyp14JtEfbEOqjuOtDsN3/em/BN1HU7Ka5ITPiqL4VNL
         Ufpl8JtjFj7uBDMQJPgmI2Ui6lpwPEjuHXluhoNuXqw1bAiHS7MQ23TxZT/zVhxNegmv
         2Ro8SCSPFwlYfQuUVoCBvt5qiQ2s7/KoGKAWg3IcgQQWmWR8omJ344Cqz9E2dkK2AeWd
         bnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739709627; x=1740314427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4e7ZzwqztMziHLUhoVfnoipumOCTxC0BX+2clstSkaw=;
        b=guG4jaSdiwXT7xT7nlDz7ITsnKqCIdTXDpcrxb67VereU5oSsAzXwy1FUgiCraacpE
         fsRWJXwnpEIieAHyurg3RSDQcxHT94LfQU+OfMKrxFJca6WiKcoJVrqmb9+xnI5O0yHj
         Nr2GTLNX6kjDikdCQCGiFO5MLUMN+8Y+cpY/CgCsZdzin3dyoU92MNHozACTpUpGwxwU
         R2CHS4HWQecAr59rwq41k2rJKAPcWH4aq0R8XTDLfW42iP0+kHS7jAK4UdKqV5Lcjluf
         oVaqnXSGwJx9oCxjr7Dl7YD7eGmtqlw/rdzk/2KiCx1I1k/ZCSdoyg5jqpeyEdBAiRph
         aibA==
X-Forwarded-Encrypted: i=1; AJvYcCUFvJA3ecUbD2fSEx99OWhsQD4hFcWbsEJ73YotxLERP2UmFCEt36NdF9xaH4Elp8yCZDYSya6iI7It3+0=@lists.infradead.org, AJvYcCWyfN4L8MteSu8ePcIdsFswQ50GNFYZTVE6eX6T9iaeoVgZQNkwVb7DAg2cTjvReppTht35ojy+ZIejcdosz33k@lists.infradead.org
X-Gm-Message-State: AOJu0YyUISOXjKPpL7+sTKBD1elLMDElJ/RTgIrhe0Tk+KpKLM59Nbu6
	utozz4pLq1Nl56Av2fDp2T8DxmLUkV4O0VdJFHaKk6vxN+EgrmTX
X-Gm-Gg: ASbGncvBA89IHu7wTRaRE877Ur3Jfve+zfr9py4bndfDt5Hra2oRUMt4cjMRZcVra4L
	itw9dURuxDm2opV9gaD9HFZSnrBmtpzDLOI7Y8cqb/P5khlQm0yPgMa3Iccs3ShRU3fDdYTtwQs
	xhOsMMeqllT13kVTBedB1BjLYGGmRwdPNt2n4ZD6ZK0PCmPHqA/frzTWRzHQGVbcIGg1RtrsoGD
	hGBy9ToZT5MphmjsB02FUbyRiQKQAb1r+q4vj8P7/EqYpZ+i+ZgUzKHLmDq3Tmg0/A=
X-Google-Smtp-Source: AGHT+IFwCG0WhNlXVH9+JU8Q7jE4SQEUikrNIBKk/Yjtq4P8r19QHTmuFn8zXjmDXQs/E0vnx9tHuQ==
X-Received: by 2002:a05:620a:880a:b0:7c0:7818:8559 with SMTP id af79cd13be357-7c08a9807fbmr795514985a.3.1739709627506;
        Sun, 16 Feb 2025 04:40:27 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c07c87006bsm416867385a.108.2025.02.16.04.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 04:40:26 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Hariprasad Kelam <hkelam@marvell.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Furong Xu <0x1207@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Serge Semin <fancer.lancer@gmail.com>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH net-next v5 1/3] dt-bindings: net: Add support for Sophgo SG2044 dwmac
Date: Sun, 16 Feb 2025 20:39:49 +0800
Message-ID: <20250216123953.1252523-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216123953.1252523-1-inochiama@gmail.com>
References: <20250216123953.1252523-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_044028_893009_27AB6F8E 
X-CRM114-Status: GOOD (  14.12  )
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

The GMAC IP on SG2044 is almost a standard Synopsys DesignWare
MAC (version 5.30a) with some extra clock.

Add necessary compatible string for this device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   |   4 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 124 ++++++++++++++++++
 2 files changed, 128 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 91e75eb3f329..02ab6a9aded2 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -32,6 +32,7 @@ select:
           - snps,dwmac-4.20a
           - snps,dwmac-5.10a
           - snps,dwmac-5.20
+          - snps,dwmac-5.30a
           - snps,dwxgmac
           - snps,dwxgmac-2.10
 
@@ -98,8 +99,10 @@ properties:
         - snps,dwmac-4.20a
         - snps,dwmac-5.10a
         - snps,dwmac-5.20
+        - snps,dwmac-5.30a
         - snps,dwxgmac
         - snps,dwxgmac-2.10
+        - sophgo,sg2044-dwmac
         - starfive,jh7100-dwmac
         - starfive,jh7110-dwmac
         - thead,th1520-gmac
@@ -631,6 +634,7 @@ allOf:
                 - snps,dwmac-4.20a
                 - snps,dwmac-5.10a
                 - snps,dwmac-5.20
+                - snps,dwmac-5.30a
                 - snps,dwxgmac
                 - snps,dwxgmac-2.10
                 - st,spear600-gmac
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
2.48.1


