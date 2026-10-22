Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC63606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 20:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2EkTkzts
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ElpMWQpElxyvYVfod7vt+zc/cJPBYXPVQKctc5VqWXw=; b=2EkTkztsvjudNJ
	MsxcUq7vadTFg0IPDB7mosfscnXMTSs2/r6p/qCAlnxkzqjQPI4uGsN+JALxwJEecxpPpvUJevWde
	wMUnZfkYEuvGtgSOADJKlepGVxmtyJbSr6TTBZAmC8elkEF8Sae4Uulkw4n1gWJ77Xc5hdRrtlrUd
	ulrW/u/7q4SC7020EX6PRZSqNACRwXTkxHDGztZdqprTSo7FqGxhFSBnzzbW7kLOCCnO+1+Fnp08X
	XOlA7M5GGc775Rw5n0KVi1zTT92pDzMCvcN/MIjGRKRuRvlYRlLIBjRwRIBzpu+H9uWz+YejO/T2O
	xDamuGceYICK+wQXzDfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz43-0000000EtK8-0uNu;
	Thu, 22 Oct 2026 20:07:03 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz3u-0000000Et5w-297R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 20:06:55 +0000
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a20c923847so1491895e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 13:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699613; x=1793304413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ElpMWQpElxyvYVfod7vt+zc/cJPBYXPVQKctc5VqWXw=;
        b=SzIKYcyW8qnUbqdV/AZ9uplLl5KrrXVrSuiEOcIeEQWjlHs4Lsxc2BctoAe6iRd2k+
         ql8oL5kbrylY2EvM/L/1diNldKFLREtmy0bczh/RdFFRc/QHzT/iPG47cQUIXhW+dUrm
         I3b8WKkJMbtwScAltU7+cvMeKC1t1MCYEt9y+ZyFxfDQEy1esBhLkzRaLSqQ0ikdYot5
         2XARln42fIVuw68WWV9wW1G/nEdgU3ajWb5G79mDJV78lbYhCiH2HvRVVlyWcATAx9l2
         IEwIsAp4qVrpCAhVCo+9Ad144fIJhliHbYSSkGHHji489qSwayn5z2DFleqesnVlBkO9
         l7IQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJxbrO30bUY4ZBgS7wvyAz1pICooOMf/6owPm/EvFxjum9K+Ypbcq3RXwy1kljyBNzDsFlb12FESM1X80azX1e@lists.infradead.org
X-Gm-Message-State: AFq9FYKHEuYInQvA625WwAy4Hv/T5H429Xuk6YRP+zhPNBbsn87JYRHP
	lZ+7dfRqfzVAT+rkS7u/OIXTxzch2bN1A9HhgsAuHC6MQONfjhwKjXyI
X-Gm-Gg: AYBFou2LnNSrd3JsVF6k7WfRV1d5erfxZRM4z7ND26MbxrImPv5Td82RCntbra8B3pp
	lNT9KXGQlf3ZIbFK6fM6j9DzqOpnxew20awUBX3E8vi5MQRSbkLtxkKpBM7aMMWQ2QiaNDu54iO
	ZRQxM3OPMrXrBbxK1mJJVYb3F1FuRITjDM6zGuBgsc529FsD3GDm7MGaN9323paZK+k+vvrNUzW
	Puhfd+IBOWkg0yDsFUBPvtahrXhO6TRZ5aRRPXN4i/aeZmZeKdzEfBx9m2F44uluGb9kCgqEOMI
	/zqucIxPDRpcBsWat4j6RCftVM24xhL95qeRK0Zs+RqxhJs71u0oComZ3rMeMGGoFSliFBHM7DK
	mw8M6B+46t76d2BpChqFFgQUNLkC3YEVBpxK53Ek4JCSzGYy04T8JYQpYb5TtItnlTv+TML7k7c
	BaWVZtkLk3LAPRH646oRpLMZuGgLtemzuzAupV4m9wk3o2auUTUnxtL9bWuBLyfoV8doqIvD9Wk
	Oy2J5klB5yk757LyLLK2b+gC3meDgwUhHj5AjZvUFvLjqU6B7QVkowMZM/PgihQyR/YnsiTV+OV
	BnBf5XCquVxoTxcy
X-Received: by 2002:a05:600c:4e43:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4a211ed57e1mr2298085e9.13.1792699612466;
        Thu, 22 Oct 2026 13:06:52 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2123a1797sm35965e9.1.2026.10.22.13.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:06:51 -0700 (PDT)
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
Subject: [PATCH v4 6/7] arm64: dts: amlogic: t7: add the ethernet controller
Date: Thu, 22 Oct 2026 21:06:39 +0100
Message-ID: <20261022200640.3101932-7-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022200640.3101932-1-tanure@linux.com>
References: <20261022200640.3101932-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_130654_588647_EAB10233 
X-CRM114-Status: GOOD (  12.15  )
X-Spam-Score: -0.7 (/)
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

The controller reaches memory through a pipeline stage with its own
gate that nothing else claims, so it is switched off as unused.
The glue registers share a clock with the multiplexer, which probes
only after the controller has programmed them: unless the controller
holds that clock itself, the writes are lost and the port keeps the
bootloader's delays.

The on-chip PHY follows the G12A; no board in tree uses it, so it is
untested. It stays disabled for boards to enable.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 58 +++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 7bd53ec16607..94ea22514501 100644
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
@@ -645,6 +672,37 @@ gpio_intc: interrupt-controller@4080 {
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


