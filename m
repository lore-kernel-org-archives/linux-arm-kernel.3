Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B127EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 01:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jRWA/tM4Nlwg4+7MH+fMHivDiS7vd/AnzDx119oQ4ZA=; b=YCKM/iz2sJMznZXPpFd2ftYqwo
	odp9AgAnqIjSHB9zoeLahPsAlb4zjfUdoYuicPGBcq/NTztkxYp/lGAZF9+7FLcKmqmANuRI719IE
	4h1ADSnz6rHBW4dSoX9SJdfxWp8MlDiPbhflLcMocRCxUIoyzzeqt5qOPTnRUKEzSH7eO9iWHstNW
	PSyRPoP8IOCjxD2lK0/ri37hIfxQNW69Kr5lTY0EUOJX/LRfcfjQoqXV1rmt887v3NtDewqpfwG7c
	f1tvhY6KV6ruE8ytPwiJOStGRMndF0dcq2B8aqiYEViBWvu9ipAtE7o1Yg9gaxy81Ereyqy9OJCIY
	VRangsIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPWpQ-0000000933d-3pC1;
	Mon, 23 Dec 2024 01:01:48 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPWn6-000000092ab-3urd;
	Mon, 23 Dec 2024 00:59:26 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6dcd4f1aaccso56806756d6.2;
        Sun, 22 Dec 2024 16:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734915564; x=1735520364; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRWA/tM4Nlwg4+7MH+fMHivDiS7vd/AnzDx119oQ4ZA=;
        b=Q1cdNzOaZNjrzPWmK+y5Fz89ka8vvDITzYHlfRz3ztRjDGHTexV01g8ziHrXix/qwK
         4dmNNjROfaI9ayHfBktf924FSV7jaPOPJv/+wLvETjGfl75gEWtcE44N+VroVKSJ2sNO
         ifK8Y4BQTEMS1qzA17yfQXE5XMauWAApWY6EohopqCgKbaDFMMeHvaAxaUuh2FKvHX5H
         FegbH9L3khwuD/oG4279ST6H3xKgpf2xL03edk6jDJFzYrOhaUE3u+H4OPT1bLwRs4on
         aLkaSUj1qiuJaElNv4Rxor6QUmkbk3Clf+On9jeCnPLBtepjzhdylQDfLz8SbSB+2oW1
         T1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734915564; x=1735520364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRWA/tM4Nlwg4+7MH+fMHivDiS7vd/AnzDx119oQ4ZA=;
        b=qMun2WbFSQnSaUzhuI2VeYaAgX7iVKysqSbV2DAsjAr5spR0kIf8sSCfnCPLt1u4kR
         1aCFrNFGEpNwZSeqN00TCdpE4PyXsBKn3BV4M+zdQXrVdJWi3HvqiTqavQqFVJV7C6Vw
         qER/KnoWQO7eeo7k0vu+JIsjxU9F0FdJ/HLeLI5tge58bGKE1m+d/eHryAyFyzo1TwZR
         MXbJzX7gTvf1u0slIVtl9B5WpleaP/YPRLt5XUfq81XaS4u8c7NL9h5EPTb4pRAdD+WF
         mt4sw5bMLBgqzz14KVMBhnnVeS+wUISXX0l6bQuhyJE/maoBcjwG7cLHJkus1PJEmKt2
         rYZw==
X-Forwarded-Encrypted: i=1; AJvYcCXBsldgLxvPQQbvX20f8jVuBjNGFgcqGON+wkHRvDn4Jli976LZESh8jfrHYHAikmurVkrooa0DtmLqRhlW7AEx@lists.infradead.org, AJvYcCXE+Himjto55lWuR8P0sm01M3ZbVlC7a9rIaunsl9W292sd3cUUIb6ajajY64yjpDcUPcM1gQWrLJhztRA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyOR3/jESTAw+9kguQwa7CEsPu7ig7IMXTc6+2R2OsZ2cvXOq3q
	g5x62V72En5bLF7pO5Dc9qmHzl+wSmImtPELEIKeeCbDUaO5Baac
X-Gm-Gg: ASbGncv51ANc8TEIS+3KX1Cf9QLgVc7gywwkgaifg7E1y6dX+TS/Jy7Qkh23O4/RqeS
	l2x7Hm1djfvPP4qEjPRy/5eDizEUl5worH/Y48Ogp/+DWjtA/Ufo3QhIyXUSgltI5HqimIpPfDY
	yq31DNWjEhnfPy5OesmuPTRVuQDuCuTaZ/hHMOKdswKCGdhHqHKNQwwmqeHVHXOf2ADw0XAcSWO
	KZgcHf86ZjY3fnJe3LduI3K7VqdP9cr
X-Google-Smtp-Source: AGHT+IHN9d1bnlxRzzqRiDcadAYUGSNIOJpqNW2TaHPm8W5wc6dU1Ev4iY1D0s3G2OYKNDwOXlA05w==
X-Received: by 2002:a05:6214:d89:b0:6d4:1ea3:981d with SMTP id 6a1803df08f44-6dd233a2bccmr164013606d6.43.1734915563662;
        Sun, 22 Dec 2024 16:59:23 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd180ea9d0sm39145406d6.7.2024.12.22.16.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 16:59:22 -0800 (PST)
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
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH net-next v3 1/3] dt-bindings: net: Add support for Sophgo SG2044 dwmac
Date: Mon, 23 Dec 2024 08:58:37 +0800
Message-ID: <20241223005843.483805-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241223005843.483805-1-inochiama@gmail.com>
References: <20241223005843.483805-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_165924_979512_7436509B 
X-CRM114-Status: GOOD (  13.52  )
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
index eb1f3ae41ab9..cd112ef6b3bf 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -32,6 +32,7 @@ select:
           - snps,dwmac-4.20a
           - snps,dwmac-5.10a
           - snps,dwmac-5.20
+          - snps,dwmac-5.30a
           - snps,dwxgmac
           - snps,dwxgmac-2.10
 
@@ -97,8 +98,10 @@ properties:
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
@@ -630,6 +633,7 @@ allOf:
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
2.47.1


