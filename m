Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9AAC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 01:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4e7ZzwqztMziHLUhoVfnoipumOCTxC0BX+2clstSkaw=; b=Cj+tMwOhDXQSxS+geqIJUgQRvp
	zJ8t1YIA6e/XghzwzxjNte1o1SHhBOeN/ohz+Hs2ZJMCY0r7/W+kJTxjEWWqwMzDfLoeK4hEQ9o6/
	R2VmlWtEyAKPGOpa1ScRaQkpx6/BoaKf4SyH7sgucy+t95d8bnspIt4SlXXLaR2PaQXtbapY60KVQ
	16mln3Ii8bDAFooYFPt55e/ot3INo+aoqjMzhhRNrcUDPjzLA2ylej8eFiKzSpPk9OymFSuhMpRXA
	3LWg4LqZpGv5iyhcIPqr2pFcVEc6u/O/VATpWjvEXUfXOJTRkadJ53Wcik7IUFF+wNZUjve4xInf0
	qFK8ra+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgwCq-0000000DrAw-2PgG;
	Sun, 09 Feb 2025 01:33:56 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgwA7-0000000Dqji-26NA;
	Sun, 09 Feb 2025 01:31:08 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7be8f28172dso178374485a.3;
        Sat, 08 Feb 2025 17:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739064666; x=1739669466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4e7ZzwqztMziHLUhoVfnoipumOCTxC0BX+2clstSkaw=;
        b=WjYRj6fgqIeydqabBKjoMVTtFwBOiZU5IJSNAGap9DHvfWdzfhfvm8fkMBRDMidUpb
         U834kSBvkDYhZf3EThbfcC+PiYTCcjr9idhvd1scbeG4LEphvBV3QoDaM68TUS6xOPTU
         xplM58lLZRoGuaDYMiStsNX30xRUYZTvRQcrztA3NRIViiWRCWMpTuyjrEy8qlM8iRov
         +gSTFfgpkCdJxUtdGKRrw9cVE2UhkNlxCciE4JT1vwoU5AFIJE7qF80xhnHC1EaGw5SA
         GKc316Qsi6if2gPPk2KUekCsVQS7RlBztm5l7+lFxNdhJx2Pn/YXIe8O1PngfuEW29k4
         elLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739064666; x=1739669466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4e7ZzwqztMziHLUhoVfnoipumOCTxC0BX+2clstSkaw=;
        b=uzzqRNnn0XJS2FJtj4lDJMPOzKegaCH+TuSotHckiivYFLOp7CPirgSOW2iRw29GRZ
         FXmVm9s4p06+HBDA52GEK2RC5zj99sXx6/Uk++tlX4DV7Aev1LJwSifIIF2R0CyruPGQ
         vseBew/uWu81LEnbFYnU87to9Girdov5DS8aZ1AoFcvQqfwqFBirXFbjS0R6gUrG851O
         itZTES4uHVHdu2CllcDq4WaSupyyi1MFW1xaijjHMmmKAI1iO3C7o38RHtDMRXLwj1Ow
         RosgMijBQj70ZmYhM/lV97UcgLM1TnvCWnodzNaTzJIX8t4iEQUlbqIKYC+xDJcOmMdu
         zuow==
X-Forwarded-Encrypted: i=1; AJvYcCUO14M37cYguP3/qt37XJRPl0E3X5+P0H6S9nyma0hb4zQWiLIn2kCbrUfbJuCRoFyN9Lfrr4/2HbQd9uU=@lists.infradead.org, AJvYcCXzQ3uvB665XHZ5htEk3zN9RK9ioj1TkDiToVuQYxoqloMAY2i49EtOIkySpN6QP3JRjkB6DQkCVyhZkSjprmNJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwUL+5Dzu81fxh2ZMq5CajYwRfoY9tSiVVdFm9nrS+rhp0hCKUc
	IA6OYoBdfWRZNicV0z8pe5qsmbU5eG1ukQydvKO16Yk1Phc7BsVm
X-Gm-Gg: ASbGnct55LvJIm5TWBGUkZLL23NXRNHbVmAwXRczw69O5rZFW9hunbSe7rF53dQ1QfU
	Jf5osxg4Rggum3Iq0AcTycjHHa1soPBH9mlHnBmC4maeBbr2dTQnsnax/WSPOZDjIrrqNjEPlwy
	7VIxm46vHUa0Wy6qvptN3P2dGC4faviTlkJlOBFjo/XJvmtVEC10v7fIu8m5Zd1x0eEh2NwlfNE
	WEKpjTerFI3hHMzFuTJaRWYqWh1vmcRDpx0hqrCRFmPOxVUicKviLy1Td4ekyc1DYM=
X-Google-Smtp-Source: AGHT+IEH039HXExAei+7K/JmIEv7mGaHuYCB4awQfxRtlfWTrGL3Y1l9ujrADjSQi+g127ZTesIcZQ==
X-Received: by 2002:a05:620a:bc9:b0:7b6:cedf:1b4e with SMTP id af79cd13be357-7c047c29ademr1345409585a.41.1739064665917;
        Sat, 08 Feb 2025 17:31:05 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c041dfb0d2sm356691185a.34.2025.02.08.17.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 17:31:05 -0800 (PST)
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
	Inochi Amaoto <inochiama@outlook.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Simon Horman <horms@kernel.org>,
	Furong Xu <0x1207@gmail.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Suraj Jaiswal <quic_jsuraj@quicinc.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH net-next v4 1/3] dt-bindings: net: Add support for Sophgo SG2044 dwmac
Date: Sun,  9 Feb 2025 09:30:50 +0800
Message-ID: <20250209013054.816580-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250209013054.816580-1-inochiama@gmail.com>
References: <20250209013054.816580-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_173107_542671_CC727837 
X-CRM114-Status: GOOD (  14.44  )
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


