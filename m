Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E6BE67492
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 01:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D83zUD3CTgh/1eqyO1pfkLK+N2dWxttwy3sSJgFuC1w=; b=M8BA/+2kGRVnifKP0a8XjCa+d3
	OwnotOpKUupF4Pe9L+xQs1bMoBbqYt/g7sFsGgACYEqlJZhFPgaqmVNkVjVLH7jDk9emzq+kvBvGq
	xb2TFzfv46x6IaRLYQsFJ+/wsozYW9fkPivOR1+K3UdWn9vXESD3pSv+odjS8iDdJfvXjGjKuZ997
	Qie5+1LhikzOJhYs7noOWwpjIHdcHmcrnoSI6HFvvq+LNm1edK+Ativ2yw3msstBd/7n48HUuBJdC
	wLb04z7Hl66jbpyVwU1xAiEsYgxBeoartUfe1ll3Fs7pYguS+C7UAydl/XQBnhawgzSZB7Huj1Ih+
	rTzLczJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6gl4-00000005T8x-2hYF;
	Fri, 01 Nov 2024 01:47:26 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ghl-00000005SLu-1xWn;
	Fri, 01 Nov 2024 01:44:02 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-207115e3056so14907525ad.2;
        Thu, 31 Oct 2024 18:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730425440; x=1731030240; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D83zUD3CTgh/1eqyO1pfkLK+N2dWxttwy3sSJgFuC1w=;
        b=lUasV2K0R0JDropPjOs/guc8T5NaO6vGRJ4EENL0KAV0OfJIds4HUUH8wfMooJPERo
         UksygMOQ2GU/1tOYXT/r70Y1HDiaRAd++YUA7FSVYoay1aGHvQyoPpFZZzS0GlRzY/TL
         my5mBtFzjo2qJdTl4A7pR6DGHzG9jptClmLPzNA6DX+3cV5B3whfSjOd3g8m1orrJjJn
         mpat9QavHlCrtHy2O+s3ewr4qNIXwyfmwM/ysemdI1kLVNij+uMgwGBcUSOpOoB7Hxpp
         r8E7nHdRBbdsxsJ9wgACuvrazBzQ/dFth2zXcpanVWJk+lSqVpWMb5eQM9oMJOwffpMt
         VPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730425440; x=1731030240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D83zUD3CTgh/1eqyO1pfkLK+N2dWxttwy3sSJgFuC1w=;
        b=Js3ywdOvpw8Ad5J4Ho1bPqj0Wm/yIjfe+xWTqZOa61SkVNPszxEmmnT7bq3Ms6uzKY
         osMOwdyTQbxGoSvEf29LrDmzNzcd2/RiyHlJCHhJC8fZeWd8Z87OI+HCaENMYJIaqmTC
         5KUMJMDgoutDaF3mw5R+ChCjfieVf3GA9oJamQntsRXhhmbzCcvOgjPPznL1HBSY60mX
         V6ghEV+vvjtTUJUYq9weOYcHlgSbcA7ifCqethutJHTUNKuHJUik2ES8QzrGc5ivFXhF
         nnp845kR75sb9R6f6hZAnZ5W5F39TVvYGg0z2ACD7CxlltcKvLo0afzayXToFcTJZvmj
         o83Q==
X-Forwarded-Encrypted: i=1; AJvYcCWWuuEmh92R1LHOT3QYmjPNgYbXVUSJdX37wwzA8Pp7b2Q49ybWdvFHV3jAl7aUgZBMnRGIADpMJPJsNpyCHSis@lists.infradead.org, AJvYcCX5nnMlWIRpE7FaZ/nzCbc5OJWPYENPIh14rC0r4ATmvMkSOwMcUtN33hTHD5Cw7QdsIylNtxeHuyliqbY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxNvjwGcS02VlWu36fVBlmetHirIIvD9vPowCYGYn213RjxmnRJ
	Y9njaMB1mwVpJ9+up+OsHwiTh1s0PYO0i1AuX9f29lASZGNFoIO1
X-Google-Smtp-Source: AGHT+IH8ClJCvm8SMQlEP26mhBKhiwtPhGm4vHIJFTxKdWRzsSUKpwtONxc6wRtHFIxmornn8f85jg==
X-Received: by 2002:a17:902:e808:b0:20c:8f98:5dbe with SMTP id d9443c01a7336-210c6ae3d6bmr267036415ad.33.1730425440342;
        Thu, 31 Oct 2024 18:44:00 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211056ee3ccsm14453055ad.46.2024.10.31.18.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 18:44:00 -0700 (PDT)
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
Subject: [PATCH RFC net-next 1/3] dt-bindings: net: Add support for Sophgo SG2044 dwmac
Date: Fri,  1 Nov 2024 09:43:25 +0800
Message-ID: <20241101014327.513732-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241101014327.513732-1-inochiama@gmail.com>
References: <20241101014327.513732-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_184401_531297_538645FC 
X-CRM114-Status: GOOD (  14.38  )
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
---
 .../devicetree/bindings/net/snps,dwmac.yaml   |   4 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 124 ++++++++++++++++++
 2 files changed, 128 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 4e2ba1bf788c..69f6bb36970b 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -31,6 +31,7 @@ select:
           - snps,dwmac-4.20a
           - snps,dwmac-5.10a
           - snps,dwmac-5.20
+          - snps,dwmac-5.30a
           - snps,dwxgmac
           - snps,dwxgmac-2.10
 
@@ -95,8 +96,10 @@ properties:
         - snps,dwmac-4.20a
         - snps,dwmac-5.10a
         - snps,dwmac-5.20
+        - snps,dwmac-5.30a
         - snps,dwxgmac
         - snps,dwxgmac-2.10
+        - sophgo,sg2044-dwmac
         - starfive,jh7100-dwmac
         - starfive,jh7110-dwmac
 
@@ -627,6 +630,7 @@ allOf:
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
2.47.0


