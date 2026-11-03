Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C76606EE98
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TW7fmAzl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=paduv/zXRliBqDWBFf1W5OOKpbqC02TK32FfMcPBmKs=; b=TW7fmAzlKtS5nB
	8UKbEF1vMZR/HN9ZEPH6nsZVZGdZwdqLpLNpl/E/HEnzwp41JtYsjVtMr8vPsmoxoJ6zimHVkBfqQ
	f8Tz+vzTNW6+qr4e6sPitAG1UIT8zsp+/oel+Xng9Dp/SV0/NktotCWaqBiTiMY91mmTMI/71+IeF
	rt6KqOT+LpAPTjxmnPxiyAS+XrTLQjbX4assuYRF3A8cP4pKNUHYuS6TBFLzs9R8rdpRZRZJ1cGtE
	hbu8eNDjj++nh5jL7NboynjdzYFFbhPjToh6AxeC9Ogd6rxoZanLiFRiVlbb40FyI/q3Xwj61nqZp
	mn6wcE2GNQ5rUiUfMnYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHVu-000000039oL-3X1G;
	Tue, 03 Nov 2026 16:37:34 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHVl-000000039Wf-3Tcl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:37:27 +0000
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so28463575e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:37:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723844; x=1794328644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=paduv/zXRliBqDWBFf1W5OOKpbqC02TK32FfMcPBmKs=;
        b=eD3IzJaOQgRwJWi+WwE3J9UDadBvNedWkN+xHKZpa2NAUwXJBOiwusUk/RNQ8yWq/0
         Ed+hK9AWfz8HkPMuna9PWnASGUAUYXb7EP1j2emyjZxd7Am67cPzQhSjGHFxQjv/VAG2
         nnpihtuBeoEp2OhrvU/LbDiTSUhlYx2RywtdSFPq3o4seM9A/hDV2SQdtFCMnu12Iiqj
         u8Z+uPzqe3aDosGm5Jpcb62A49xMjsSKPfN7SJQoBAHYjy4kPe+U90XvwNhbnBNBEZiw
         pFpcWwhqtBwZ6GwB7bKjIKG8gqL9zts2OoOD83xXg8P2XHTcszCRoqRaRaY8KGvz70uO
         XPhA==
X-Forwarded-Encrypted: i=1; AKwUvBxDg9v7841SUmHvt3y2vAEKeu63gu5H4n+AhK07lmj5jSL9HGIQzFEnCzR/FDwPXqTLcKfT0SdiH6jBbZ5MoLaW@lists.infradead.org
X-Gm-Message-State: APuU4Z+wCDBiBgxKgAF9bYP8mRkPyIMpzlVuQx5vXSA11WdvjWWEque6
	GnD1Wlf4h+tAKSG1MEYjHzyT/HAcS5zC+L+FjbiQyfS86nknGlWSzj+3
X-Gm-Gg: AYBFou2CyneQDmcHqKhVoQsLQhv+WG4z/IX9FW3qnodufE46uhmJZ39ksQcR1N8O0ws
	s5L1KPCUNRvNF1vWQiTloJNsF3bDs4Y3JXinXneHrGheq0V/cGNlzsdTRPD7eCKs5l1Sc7ZRRqV
	AsP1k6Gh7LPUr0BtON7mcQrIh+v7aBk7g8VnPT479GJeZx2zQxOPAqVxJpQYfsh5m9GJlrn2XUD
	sVpRsajgdq4lJbSyEef6uFIr5buown6gep7dVxhppmPbB8gWcpKjcNwv2CUreZJyG3emkA9FnMA
	ROjRfniQFEINUP/IVOVCgnA8fQ/LY9OckyB3O9DSfkgDm9PDqqMeTxTxn1THR5oFXJGyg5rQGZv
	+5HNBryNcnaXNgndM7O5Y94v16vb5zMsL+Qq3BffqxiD8rzyyrFd90cQdxKfpl61EVdaYjRYA4o
	vD2odcc5zrjYw4b41b10xIpy2em+nzNJQxixXv55gWWYM5Lu4pFPUUy8smzfs4/7DCCVBtVksTS
	76OlolhBPl8xeCC4/QAq2WgrF0jJu2P/w7WzgpZOITnveO1WaoaIPJb3E6uAH4/stpAxKLsh0t5
	jOQ+hQXqzYkyKPTgs/i61V+x/yMZOj9JhCIQQFu7lH5t4SKdpts7etnXp2cSrGMgoH7q8+cfoL7
	K2T/cnRKYfE0FdFgmZwq03Pop+w==
X-Received: by 2002:a05:600c:608d:b0:4a2:1197:1de0 with SMTP id 5b1f17b1804b1-4ac18b7dcdbmr311763505e9.19.1793723843721;
        Tue, 03 Nov 2026 08:37:23 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm29044772f8f.6.2026.11.03.08.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:37:23 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/7] arm64: dts: amlogic: t7: add the ethernet controller
Date: Tue,  3 Nov 2026 16:37:14 +0000
Message-ID: <20261103163715.385394-7-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103163715.385394-1-tanure@linux.com>
References: <20261103163715.385394-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_083725_927193_FDB5BA2B 
X-CRM114-Status: GOOD (  12.02  )
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The SoC has a Synopsys gigabit MAC, glue registers for the interface
type and clock timing, and a multiplexer that points the management bus
at the on-chip 100M PHY or the external pins. None of it was described.

The controller reaches memory through a pipeline stage with a gate
nothing else claims, so it is switched off as unused. The
glue registers share a clock with the multiplexer, which probes after
the controller has programmed them: unless the controller holds that
clock, the writes are lost and the port keeps the
bootloader's delays.

The multiplexer and the on-chip PHY bus start disabled: a board enables
the multiplexer with the controller, and the on-chip bus only when it
uses that PHY.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 60 +++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 7bd53ec16607..f15fd8f6cdd2 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -250,6 +250,33 @@ gic: interrupt-controller@fff01000 {
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		ethmac: ethernet@fdc00000 {
+			compatible = "amlogic,t7-dwmac",
+				     "snps,dwmac-5.10a",
+				     "snps,dwmac";
+			reg = <0x0 0xfdc00000 0x0 0x10000>,
+			      <0x0 0xfe024000 0x0 0x8>;
+			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clkc_periphs CLKID_SYS_ETH>,
+				 <&scmi_clk CLKID_FCLK_DIV2>,
+				 <&mpll CLKID_MPLL2>,
+				 <&clkc_periphs CLKID_SYS_AMPIPE_ETH>,
+				 <&clkc_periphs CLKID_SYS_ETHPHY>;
+			clock-names = "stmmaceth", "clkin0", "clkin1", "pipeline",
+				      "pclk";
+			power-domains = <&pwrc PWRC_T7_ETH_ID>;
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <2048>;
+			status = "disabled";
+
+			mdio0: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		apb4: bus@fe000000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xfe000000 0x0 0x480000>;
@@ -645,6 +672,39 @@ gpio_intc: interrupt-controller@4080 {
 					<10 11 12 13 14 15 16 17 18 19 20 21>;
 			};
 
+			eth_phy: mdio-multiplexer@28000 {
+				compatible = "amlogic,g12a-mdio-mux";
+				reg = <0x0 0x28000 0x0 0xa4>;
+				clocks = <&clkc_periphs CLKID_SYS_ETHPHY>,
+					 <&xtal>,
+					 <&scmi_clk CLKID_FCLK_50M>;
+				clock-names = "pclk", "clkin0", "clkin1";
+				mdio-parent-bus = <&mdio0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+
+				ext_mdio: mdio@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				int_mdio: mdio@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					status = "disabled";
+
+					internal_ephy: ethernet-phy@8 {
+						compatible = "ethernet-phy-id0180.3301",
+							     "ethernet-phy-ieee802.3-c22";
+						interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
+						reg = <8>;
+					};
+				};
+			};
+
 			uart_a: serial@78000 {
 				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
 				reg = <0x0 0x78000 0x0 0x18>;
-- 
2.56.0


