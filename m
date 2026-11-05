Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E11606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 10:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Cviwdgsd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=paduv/zXRliBqDWBFf1W5OOKpbqC02TK32FfMcPBmKs=; b=CviwdgsdiQXOc6
	9GAqZmiAcq7b7LIzYNR4PKVbB3ZzmiCXe/qJdB+lrpjUTm5mJ9+hBkARli7xVyNeYb3WRL4O0Zys6
	3BN1K8qjQr4h5uqhouOoYpLAafISaeydHT11lMRzTUCEIGlMtY+s2HI8/NMmccdOiBOyAAhK2F7jg
	rqVScqFk/U1smtZd8utCB1e7+WhG8lG6+0Sz9BWhO0nrHfU0nwx4/KRki6USS4taXH3nqUxgL2NdW
	rxvE4PnZ/qu+SCMNPN+6EnNL25F31+Mrs9KZHaVbBptFQk3jiNmFJXIxxgeMKjeE0AKZdwzD7eF0j
	y3I4McbQczZT3X0TSYoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuKF-00000008OpH-2FlC;
	Thu, 05 Nov 2026 10:04:07 +0000
Received: from mail-wm1-f45.google.com ([209.85.128.45])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuJi-00000008OEv-1pSA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 10:03:40 +0000
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so11787795e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 02:03:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873013; x=1794477813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=paduv/zXRliBqDWBFf1W5OOKpbqC02TK32FfMcPBmKs=;
        b=pAd13d5LTDy7ByCy1GkATIAypcYyurmO30iSs2pZmfyzQ1/aSujX+yd026B768Z+3/
         TjjKOZgqNbkcSLRNSt86444txtjZBGSnZo844fGBVARWO3HPUY9UExlf3bXN13EhL9GN
         8t7zcTs3TOFseAXWE95WYlB3NayQbqqHbv/ri4LRsHwRuMuYLxFcF6+w3l87DUQl7xVe
         mr9y44huCW46DNAUaqHZhQM+Jf9KkMjg81+FPf+jTTxZ6SzmJ22XihNJpzgKHjr7pH9x
         DLImiPSz9NbD2w59Q7dQ6R3gwuPDlOY8+ug20P2XSWJ4w1h5KGhq0/64sR0gdER/G/nx
         A+jw==
X-Forwarded-Encrypted: i=1; AKwUvBzDFJIEkcYM1G2UjDZBy1nuhbMM7EIaj3jlx0rowTu5yd2qI2AbLWKGKr/siEcYvWqd4m/ADLpCZMSViC6TdcZT@lists.infradead.org
X-Gm-Message-State: APuU4Z/rIe7MjZ0nq7+DEwt4EggeUr9O9ty/OPXdo+rsqfGoB0ng220h
	gprN2Z6ZXd6EU2QTRtLr/f1ttcizKr+tyhHKr2TO78WYOlmP4cWd5Ab/
X-Gm-Gg: AYBFou09h9e3WY1u5zug8rtsr7NkNM8ZjYjL91G4ZMFLUD6FxyWgZBqGCbjbEY9JomL
	c0D3nXtY8VnDbfviX99fVRmuNTAvTEHWIYHB1xHRsy1C9+q7y+QtEr6q46IFdRSpcs0xybhRDkc
	RzFiMFOnqXbex1Q7Q08/JCo+aIsMswNLh17iA1BJuXG/y1+7Ox18ROz4bRfjvLJxFNsw2i4z9y2
	e+98kzNy9D9htHY+X0yZz+sanatDz4R7jKKgfClOiPO0aA06kv18pW73adQrZLPql6jrJubzn3Y
	yHpzLGioLdRH8JDzWw05GJKJgqWdUbPysH6ItFb4oefLFau+QY/Jc+VqM6/crs9d6lv3XqEjyxu
	0mnq5QFthORoBmBtxqUZ5aMGOnGl3fZ8iCMeM9RMyoNUNYo4JmHdj1E1N0MxI0fyCvCySDdxSfu
	KT7xXqR7nB7evoOYz7fBv7mXeMVaF05tls6MO2H2Dd4WT0nt+q+H4UBEAfnCxU5+06Owxoi1e9V
	JnBOL03n2xaYztdVEg5iXtppTLZINn7TYVwVgHdAJxA2AOPxNBAhEUcZMtKHpuUSjPdrqHq7Ijt
	T9X5xGR6IjgX5GGKYt2yB/mRa8C/8DmZBUbdhUD20GsF0nPEhV8q4dncM5eUDahYYt94VzvKDDG
	C4muu+zJosZJeVf8AGKz/+6CwrT4=
X-Received: by 2002:a05:600c:6095:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4ac182dc30fmr364050625e9.22.1793873012541;
        Thu, 05 Nov 2026 02:03:32 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43342773esm53455775e9.4.2026.11.05.02.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:03:32 -0800 (PST)
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
Subject: [PATCH v6 6/7] arm64: dts: amlogic: t7: add the ethernet controller
Date: Thu,  5 Nov 2026 10:03:21 +0000
Message-ID: <20261105100322.37816-7-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105100322.37816-1-tanure@linux.com>
References: <20261105100322.37816-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_020337_389989_481D2232 
X-CRM114-Status: GOOD (  12.03  )
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


