Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9B0C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 06:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pm0v1oLCij0h6SDkpOwWiVAdzDZKq77pVrdFNubwArE=; b=AWM50yVv8itJnMH4d0JeqLi7z9
	gFfYM9mwDMHRjT7mO4Z+hhNRaZfVuJc8kTPYHtvapPAr5aemiScX6nr0rKQ36j8dInNefM4YgdBfg
	LciBiDPKN5x8+cwm8t1YAIBIizT/Y92s+Sz4iCVBAZRsujuvTe25VcMtBp7/SCifBpBpmP6jtDK4C
	umIGqdE6hnCNaAetUOPirNs5oK44D1Dqe4bS8gcmyEQAZNuTnK3wW7gSXOv4nHIZXQWHntlxGkXbr
	XRQVFWY77Zz29stEqFltRuSNYW8ioxPx5+dCgkgt6tdTzZEzdc+J1BuGnBk7wNdOAxmX3pb/yXhkz
	FltzMJRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpiTw-000000079R7-3Gfn;
	Wed, 05 Mar 2025 06:43:52 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpiQ7-000000078fH-1rYt;
	Wed, 05 Mar 2025 06:39:56 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7c3cf3afc2bso145489185a.0;
        Tue, 04 Mar 2025 22:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741156794; x=1741761594; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pm0v1oLCij0h6SDkpOwWiVAdzDZKq77pVrdFNubwArE=;
        b=dT0o47C9C62fv3/T5GJbNkoXiLYKWKhtxZpw+Y+WYosMl4Y+f4Brwhilrz59kcoHCf
         bWWV/mHzY0oCMIkAfZTHPZPV/FcbmqaugFTcObboseE0mgD+hdcYyMED6Aha4btPxw8x
         mRbQwwpnhnE1NTMbTBbWtXzQe3XNwdn1h8BWM6rYhkbTJzioSNMpMsUehGWBs89eyp+V
         zWsvNYoFM592ckwYuV9EoZ4mvtz2h4Tf4/qD3kppokE9H+IB0KjA9rQ1rf/zuGbUQTzo
         UTwW4P9P+XJBo7zUWCssEGMuCjGGO1yqjUnE08nJZg9Ub/AIuCvQVgB1K6I3scpJt7nz
         e/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741156794; x=1741761594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pm0v1oLCij0h6SDkpOwWiVAdzDZKq77pVrdFNubwArE=;
        b=ROXbxfGxPQchTjvLa3oddBOA8m9JDFPw7Y3bXQ71nFwCZ3Dyin74J+BNR8snn2MXpx
         PnNRKZHgCnGHkMD32Z5H8c8odnXTHUkCWY0bz7yKgumxEGrU8p3UV3bg3At8MVkMKBS4
         vptjK3NVtGE9bxLaH7MlFkS0udXf9L1+gBx9ZIWFqHu3+dkH1xui26kAb+j0HwiOANU1
         ZTepYQuheWr3pru+TP49yu00u3dGCaUMvHQm8KPIDs9XUiK/pr+ZNFIa8pnrc4wbw3UJ
         6FimYW+SjXif/oZj+0F2sBydj8epk9AnJsvAXr2oqBS/AGJVOQJvtfsYHqL305gLCpSm
         8c2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUC/pMYklv9Dvqus7/D0OWBXqZmEqOJVL4DDr2SZxyKSQwmw2LCLwyVJoUQgQRrqL6xR2A/fK0u663dDDk=@lists.infradead.org, AJvYcCWHgqUKNkS/7Xci20enjA8EctCz0vDm9eseDPq5CDtkEa8YK4DV02zD+7zvM5cGycwvYTbaczhtiKLTbsrp5i0j@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd0FvEu9N5zhpUvAd/hJ5WID5LB+x+0eiNOdLuiOocmiZYHH99
	9XK+iXKHHvZqafgam0CzIJg8FfeWwj3K7pbF0sySauhLut0rBkZ7
X-Gm-Gg: ASbGncs7PDDpFTPdjMowGDr59CF/zRmRZMRV6jlojnktCax7n2oi2Z7jpleYtVisY0+
	fBi8G46QsQiDxoNO1P8Ic+NUZB4JbzsCu9lZcgKEg/ns2SE9ZPFZUjp/+XGjeWqxvz7Zo7Z1j5b
	fYa4d/q1wgc4rKmTvuptFbXWGZvowFi4DbSKZ4ULQt/0KRmZOf7Hm8vRcCTNOUyaGJxsbwAZh7A
	m+Az/SBRMS2W0y5JtpRszxOQp2sIRBjVlzRW2A/bUbb67UjI1dKJvN/XwvQ2WnDYzmW7NojE/oM
	/C2xVgJ1IfjCHwObDUCL
X-Google-Smtp-Source: AGHT+IE2PxHyAWGJwBqsd4XqiNnUfpUNBM6sb+RyGuOLvmBafepSZRle0SjnzsdkzlpqNK/+2dp1ng==
X-Received: by 2002:a05:6214:e6a:b0:6d8:9b20:64e8 with SMTP id 6a1803df08f44-6e8e6d11d4amr25735466d6.10.1741156794196;
        Tue, 04 Mar 2025 22:39:54 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e8a2170bcasm62382096d6.34.2025.03.04.22.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 22:39:53 -0800 (PST)
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
	Romain Gantois <romain.gantois@bootlin.com>,
	Hariprasad Kelam <hkelam@marvell.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Simon Horman <horms@kernel.org>,
	Furong Xu <0x1207@gmail.com>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
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
Subject: [PATCH net-next v6 1/4] dt-bindings: net: Add support for Sophgo SG2044 dwmac
Date: Wed,  5 Mar 2025 14:39:13 +0800
Message-ID: <20250305063920.803601-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305063920.803601-1-inochiama@gmail.com>
References: <20250305063920.803601-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_223955_481688_1D71E996 
X-CRM114-Status: GOOD (  14.53  )
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
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 126 ++++++++++++++++++
 2 files changed, 130 insertions(+)
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
index 000000000000..4dd2dc9c678b
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
@@ -0,0 +1,126 @@
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
+  dma-noncoherent: true
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


