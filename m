Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318C0606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 02:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RY/JA9jy;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ha/AWlV7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=c6o6PLfOQ/7KuRbl8bHOcYkGmLHd5N5tTbX+9m2iR9o=; b=RY/JA9jyyWLMhS
	sF9CBNqOTiteWcqmLxwL+1OLM0uDKVL95VmvPSCLhnTHvbbGZpQhZxcIHFDn6bu0k3K46E1hchJAc
	SGoeZ+g2aa1xTNslYc4pHnuYnl98bvlKnhl6WEK2ou8KgoiO6y9tWDYxa4yAVgHr5uxILVz9sPAfZ
	iHqkvKlBeddysqefpgq322MIzZr+LQ80VlAUWuDPRpPLqnHsC8hCFjncNS+Ka7nrSXSN+nGiimqsO
	i/V0b8QJMFqOlUvb5SR7GTOqZMhQcNqu06V7M4G5eTsHniMfoFI++SXAgLNniBB16fSLFejnxXPgI
	xh7+Yh5JxtqLoPJJKmGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO4AG-00000000rs2-351l;
	Tue, 03 Nov 2026 02:22:20 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO4AE-00000000rr4-2zuZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 02:22:20 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cc4dbda1e5dso1213216a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 18:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793672538; x=1794277338; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c6o6PLfOQ/7KuRbl8bHOcYkGmLHd5N5tTbX+9m2iR9o=;
        b=ha/AWlV7I7cR6Z9z9TQF3aVHKlgrbbQhMAMO+FPeGkD6xj0Q5eUtxqZNzwBRExA2AV
         9n++ZhWmUzUp0eoNCdwjdzB7e0CNjQSUJsgb30t0zL1mFrXeO4o3hctwmLyUpPpVbZVy
         id/sbEjBeAaoMSHPcvHQ2DcE/dFDsTSWTXzmz0zCwGmJXQ7QgCgPQW8tyDL82DMcoeah
         vLDaj+zGmokWbZXnhdBBXB/1BunBAtqymnx6fn3pWBdUBfGczARGulJxGzyfT2nQcncv
         nA2oO9r4Wk1WIL9/vFqK2FnoXbkZLB/NaGfqwk+Pq9NFpuac/7VdaCvKQxEIp8phMF91
         /v9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672538; x=1794277338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c6o6PLfOQ/7KuRbl8bHOcYkGmLHd5N5tTbX+9m2iR9o=;
        b=yQhrGgOIEC44AW6mpgEub5hbsoiu4c8cPz4zkx6aLB9m/z1RfoQhX9b1L9DXBpOMIy
         2yaXgGqm2xS69vNzZuIK7B0K7rSSL6MXbo4aD/wLrZPf3ALsgSGnVFfkU6D/J1ux9K7E
         mAZZgVnBkCF+vlWWfHxrWDpIExiktj2wZmMa3UiXS/GihXPBf7UvgDJqSucgaDaYHxO6
         iB/iMOmnBlboxOA0QfoKrKL1E8gZuU/8ZNdOFmiVHcNqLJwdVwXdpECp8P3Q8cvVlpbC
         kQh9iOeahjwDdNJbVPgbn2hA90VepbFXLjwmQYitOkSzjdqh29e5pQTEm1VjFrFpzarp
         JP6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzSpTjf+R8wHpjaSfgINl/9o6W0A2zKaXWBvzfgnnLH+uk+l0IpjRaooCvj/5EiGV3EhigfD+0gwNc3qKp1y5U8@lists.infradead.org
X-Gm-Message-State: APuU4Z9brlABKZsyIqyFWNwMC5hGST0jo0R06Env3eh9GvP/R9wYbTQL
	RyDx9YsDFnNXJfJxSJccaol+THsoVCuyA93IU226QywjmV+dPEWdWTM/
X-Gm-Gg: AYBFou3OzflKLjLOJvFcJAgMTxvty0lOZCcZOAZ/yjDzTWFb1xs2qpBu1jh10jY6Ue3
	KupXYXNqyNabG+sWGWZje/XqabXqw8t//BNv2jEInPEHNSSoVRClKXIH6Y8OPrXmY+GfJIhpkEI
	1/FYMXA38W8VdGAzS5wgTFOvDc89WsKXQxUsjKKWgdWP4KILj8E8zXNmgRjlRVd2tTUHteOItNF
	n0Ua1oz9DyEhdfKOc8g2nqU5kx00zyRw2cethNw1YNnOk/HRz6iAcNxarlM1OLsBb9LF/mzv3ne
	7hbUuLk9028pRjb90bpO8ftmZUTg3uzPKgVcacUXVMnsPWkCi/+E8AiJgTIrU4znahtOhgTvE/A
	OVgYZTNNeHARZxKGpGVcXdge5gd76x32WvhoBk66zgLt7ZyECu1o82wOaqQfFSU/b05opR9owF5
	8eXiL4nCzPJ4vj1/4oJeDpXZqSzkZCaCeXjLlafbOAz258HQGm+pIfk8sZMruFo0v0UOnVLe2n4
	XKdH+RzqOxiH9Fspvd84gD+MAyfGcFMP7MxNT5EN4ANTD4Y/SHDV6/FQWhSr00m8401YzRv/7xf
	RADr/wSH79MlSqbEDiNEb5c7guLEaUkAXrW136XjVL0cDgNdvVDyO2r+iysEQdd4p7eSqEOTeSB
	ENOwg8PzpcFBdqB4=
X-Received: by 2002:a17:90b:4a46:b0:3aa:f2c4:12e9 with SMTP id 98e67ed59e1d1-3ae8953617fmr10497917a91.3.1793672537642;
        Mon, 02 Nov 2026 18:22:17 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c7dea24sm1570124a91.5.2026.11.02.18.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 18:22:17 -0800 (PST)
From: Shan-Chun Hung <shanchun1218@gmail.com>
To: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Shan-Chun Hung <shanchun1218@gmail.com>
Subject: [PATCH 1/2] dt-bindings: dma: nuvoton,ma35d1-pdma: Document MA35D1 PDMA controller
Date: Tue,  3 Nov 2026 10:22:01 +0800
Message-Id: <20261103022202.2139674-2-shanchun1218@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261103022202.2139674-1-shanchun1218@gmail.com>
References: <20261103022202.2139674-1-shanchun1218@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_182218_764931_4BADF901 
X-CRM114-Status: GOOD (  15.62  )
X-Spam-Score: -1.9 (-)
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

Add binding for Nuvoton MA35D1 PDMA controller.

Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>
---
 .../bindings/dma/nuvoton,ma35d1-pdma.yaml     |  72 +++++++++++
 include/dt-bindings/dma/ma35d1-pdma.h         | 113 ++++++++++++++++++
 2 files changed, 185 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
 create mode 100644 include/dt-bindings/dma/ma35d1-pdma.h

diff --git a/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
new file mode 100644
index 000000000000..cd752571242c
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/nuvoton,ma35d1-pdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 PDMA controller
+
+description:
+  This describes the devicetree bindings for four Peripheral DMA engines to perform
+  memory-to-memory, memory-to-peripheral, or peripheral-to-memory data transfer
+  capable of supporting 10 channels, implemented in Nuvoton MA35D1 SoCs.
+
+maintainers:
+  - Shan-Chun Hung <shanchun1218@gmail.com>
+
+allOf:
+  - $ref: dma-controller.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-pdma
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#dma-cells":
+    const: 2
+    description:
+      The first cell is the channel number. The second cell is the
+      peripheral request source (REQSRC) selection, which defines which
+      peripheral is connected to that PDMA channel.
+
+  dma-channels:
+    const: 10
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - "#dma-cells"
+  - dma-channels
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dma-controller@40080000 {
+            compatible = "nuvoton,ma35d1-pdma";
+            reg = <0x0 0x40080000 0x0 0x2000>;
+            interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk PDMA0_GATE>;
+            #dma-cells = <2>;
+            dma-channels = <10>;
+        };
+    };
+
+...
diff --git a/include/dt-bindings/dma/ma35d1-pdma.h b/include/dt-bindings/dma/ma35d1-pdma.h
new file mode 100644
index 000000000000..0ddc99d29661
--- /dev/null
+++ b/include/dt-bindings/dma/ma35d1-pdma.h
@@ -0,0 +1,113 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2026 Nuvoton Technology Corp.
+ */
+
+#ifndef __DT_BINDINGS_DMA_MA35D1_PDMA_H__
+#define __DT_BINDINGS_DMA_MA35D1_PDMA_H__
+
+#define MA35D1_PDMA_MEM			0
+#define MA35D1_PDMA_UART0_TX		4
+#define MA35D1_PDMA_UART0_RX		5
+#define MA35D1_PDMA_UART1_TX		6
+#define MA35D1_PDMA_UART1_RX		7
+#define MA35D1_PDMA_UART2_TX		8
+#define MA35D1_PDMA_UART2_RX		9
+#define MA35D1_PDMA_UART3_TX		10
+#define MA35D1_PDMA_UART3_RX		11
+#define MA35D1_PDMA_UART4_TX		12
+#define MA35D1_PDMA_UART4_RX		13
+#define MA35D1_PDMA_UART5_TX		14
+#define MA35D1_PDMA_UART5_RX		15
+#define MA35D1_PDMA_UART6_TX		16
+#define MA35D1_PDMA_UART6_RX		17
+#define MA35D1_PDMA_UART7_TX		18
+#define MA35D1_PDMA_UART7_RX		19
+#define MA35D1_PDMA_UART8_TX		20
+#define MA35D1_PDMA_UART8_RX		21
+#define MA35D1_PDMA_UART9_TX		22
+#define MA35D1_PDMA_UART9_RX		23
+#define MA35D1_PDMA_UART10_TX		24
+#define MA35D1_PDMA_UART10_RX		25
+#define MA35D1_PDMA_UART11_TX		26
+#define MA35D1_PDMA_UART11_RX		27
+#define MA35D1_PDMA_UART12_TX		28
+#define MA35D1_PDMA_UART12_RX		29
+#define MA35D1_PDMA_UART13_TX		30
+#define MA35D1_PDMA_UART13_RX		31
+#define MA35D1_PDMA_UART14_TX		32
+#define MA35D1_PDMA_UART14_RX		33
+#define MA35D1_PDMA_UART15_TX		34
+#define MA35D1_PDMA_UART15_RX		35
+#define MA35D1_PDMA_UART16_TX		36
+#define MA35D1_PDMA_UART16_RX		37
+#define MA35D1_PDMA_QSPI0_TX		54
+#define MA35D1_PDMA_QSPI0_RX		55
+#define MA35D1_PDMA_QSPI1_TX		56
+#define MA35D1_PDMA_QSPI1_RX		57
+#define MA35D1_PDMA_SPI0_TX		60
+#define MA35D1_PDMA_SPI0_RX		61
+#define MA35D1_PDMA_SPI1_TX		62
+#define MA35D1_PDMA_SPI1_RX		63
+#define MA35D1_PDMA_SPI2_TX		64
+#define MA35D1_PDMA_SPI2_RX		65
+#define MA35D1_PDMA_SPI3_TX		66
+#define MA35D1_PDMA_SPI3_RX		67
+#define MA35D1_PDMA_I2C0_TX		70
+#define MA35D1_PDMA_I2C0_RX		71
+#define MA35D1_PDMA_I2C1_TX		72
+#define MA35D1_PDMA_I2C1_RX		73
+#define MA35D1_PDMA_I2C2_TX		74
+#define MA35D1_PDMA_I2C2_RX		75
+#define MA35D1_PDMA_I2C3_TX		76
+#define MA35D1_PDMA_I2C3_RX		77
+#define MA35D1_PDMA_I2C4_TX		78
+#define MA35D1_PDMA_I2C4_RX		79
+#define MA35D1_PDMA_I2C5_TX		80
+#define MA35D1_PDMA_I2C5_RX		81
+#define MA35D1_PDMA_I2S0_TX		86
+#define MA35D1_PDMA_I2S0_RX		87
+#define MA35D1_PDMA_I2S1_TX		88
+#define MA35D1_PDMA_I2S1_RX		89
+#define MA35D1_PDMA_TMR0		94
+#define MA35D1_PDMA_TMR1		95
+#define MA35D1_PDMA_TMR2		96
+#define MA35D1_PDMA_TMR3		97
+#define MA35D1_PDMA_TMR4		98
+#define MA35D1_PDMA_TMR5		99
+#define MA35D1_PDMA_TMR6		100
+#define MA35D1_PDMA_TMR7		101
+#define MA35D1_PDMA_TMR8		102
+#define MA35D1_PDMA_TMR9		103
+#define MA35D1_PDMA_TMR10		104
+#define MA35D1_PDMA_TMR11		105
+#define MA35D1_PDMA_EPWM0_P1_RX		110
+#define MA35D1_PDMA_EPWM0_P2_RX		111
+#define MA35D1_PDMA_EPWM0_P3_RX		112
+#define MA35D1_PDMA_EPWM1_P1_RX		113
+#define MA35D1_PDMA_EPWM1_P2_RX		114
+#define MA35D1_PDMA_EPWM1_P3_RX		115
+#define MA35D1_PDMA_EPWM2_P1_RX		116
+#define MA35D1_PDMA_EPWM2_P2_RX		117
+#define MA35D1_PDMA_EPWM2_P3_RX		118
+#define MA35D1_PDMA_EPWM0_CH0_TX	122
+#define MA35D1_PDMA_EPWM0_CH1_TX	123
+#define MA35D1_PDMA_EPWM0_CH2_TX	124
+#define MA35D1_PDMA_EPWM0_CH3_TX	125
+#define MA35D1_PDMA_EPWM0_CH4_TX	126
+#define MA35D1_PDMA_EPWM0_CH5_TX	127
+#define MA35D1_PDMA_EPWM1_CH0_TX	128
+#define MA35D1_PDMA_EPWM1_CH1_TX	129
+#define MA35D1_PDMA_EPWM1_CH2_TX	130
+#define MA35D1_PDMA_EPWM1_CH3_TX	131
+#define MA35D1_PDMA_EPWM1_CH4_TX	132
+#define MA35D1_PDMA_EPWM1_CH5_TX	133
+#define MA35D1_PDMA_EPWM2_CH0_TX	134
+#define MA35D1_PDMA_EPWM2_CH1_TX	135
+#define MA35D1_PDMA_EPWM2_CH2_TX	136
+#define MA35D1_PDMA_EPWM2_CH3_TX	137
+#define MA35D1_PDMA_EPWM2_CH4_TX	138
+#define MA35D1_PDMA_EPWM2_CH5_TX	139
+#define MA35D1_PDMA_EADC0_RX		146
+
+#endif /* __DT_BINDINGS_DMA_MA35D1_PDMA_H__ */
--
2.25.1


