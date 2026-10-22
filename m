Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A54E606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 20:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jgcwJUZG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=96350WqdsGhyHxXINfUlMmZbjGGRzw92jsjc9LeGtoU=; b=jgcwJUZGrDsjG6
	3BP2Ck2NnF/gUJJ3onoF7d5XQpX2vLAepa13MYx8jsmgPanBbiDc3uABWF5CzE5UV79QcNHI3HVXi
	f0Pc5zFijaCp4JP/f2+42FvK8kKGXuIvkRYRZPE4txMN6RAyTxSZNn7lAhcg565mZ5QxXcdeXJz71
	VLmj9CYEJ9rtHCXKLOsIryDvhaE+SDQQnD7hcsu6Q0rixvftxw7P+PDdS94se4gxUdA4UjVIbch5a
	RDyF4eySP3t4SWh1OYRx2cN8Ij7i5YSB7ExLnub9Ufw+YZAbfzssi3B/KnuOw5QXe4hsghVpiJJWu
	p79jLia66iArZOssMVFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz3z-0000000EtD9-2bcg;
	Thu, 22 Oct 2026 20:06:59 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz3s-0000000Et4P-1EO2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 20:06:53 +0000
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso2049545e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 13:06:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699611; x=1793304411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=96350WqdsGhyHxXINfUlMmZbjGGRzw92jsjc9LeGtoU=;
        b=O2j3YSK0lqY5IC7bcKCJG45LQgrkUVLEHGZfFHgENHYAX0Pd+fZvfa7dq41ag8oFDm
         5j+wBqEaCzqt9niZkV1ptwL5FLDzckNsm88O06Q/R/unvzdSjPuZa6z3mpSiVPzSQoFA
         smvYFtXus+xCyeCgfw8WiXpQWo4j60uXPV/PILttpjVa5eohE3PWPGxqdpMYEIYecLkI
         VTPDL1TUwpNXRV9ED9jBZNTSWplQL7R7CubSDJX3CeteRVdqK5LzI+mASGOjHhBppr/K
         SF2uEz1J6/xwqMgYwdqHMKwA5Hw55x2vhqwSDlPEnVetFcgAhcaPxMtguBiDSI+nyZ/g
         SDCw==
X-Forwarded-Encrypted: i=1; AKwUvBxjMcMZBw4x1E0Cfnf6pYGGnUS3zDCwgfX3w7mqtMpPXsB/SnT0gFgUxzLYJ9X+T0BrnkQHvwNnhhzFsz8AZKid@lists.infradead.org
X-Gm-Message-State: AFq9FYLD6JAtfbui+deApcvoW4Ohl9WJZjPWmhdrshBxBdpD0rcG7IZ9
	pfSQ56gAVpBVYSDYRJQ5XSWPywfsRkBdhRCYLQLNH+MilkhmfxPzyRlE
X-Gm-Gg: AYBFou3JWszhYfrO59vFRkDraMJO7psYqqoEgGbiTQNO1ajN9PWhCrJelo8XGX0Bz3O
	DiMlFUI8BZ8Q8KsPiXs2N2tWXyhxEjURXjxIjEd1CfG/rRRco8RYFpKEpiAmGlGPqXyrYB8WtnI
	vj7MoeR+zqbuS8CUlW7e1hVTT8BMZYtrXu+KTSpU2jMbq10C+A4uiCHj1Ko2lyqIHoEtE8GshJA
	Ie49fHn6RsWn1Jt/hkJyzG6xxnqB+9zja3+Qh+EEOmeF3XU/OtRoHB7V3Usof955BDSF+6dQ2Es
	vlkzOYZss4xv83JcPuvfhPb+ISI3ZtJfzpZeYO/chk9N+F2oGLoPayMRC9XZCrM+TCuWmZrPpB4
	xhb7XGka1NFIZBTNON+/Go9tIVxn+MnahTJwxKhyOiCUQkSSSOXCi11GwO2/MLrnUKx0Pt6hP0c
	ieJde81d3H1a3OBxNn6I3WqIW5UDsJ0rtHG2Hla20W4h3LL/jP1cTube/Z5u1b8572zUBQGFe4z
	XZU6//ceRjDWgnHIbK7PJD+0c2fsNt081sd0l7Mhqezsflviyl0PDlyN0k+HfqG6FOyF/pGq298
	vtf9VBuxwzn8EOQ=
X-Received: by 2002:a05:600c:83c9:b0:4a1:7ba9:da2c with SMTP id 5b1f17b1804b1-4a211ef7beamr1761675e9.25.1792699610441;
        Thu, 22 Oct 2026 13:06:50 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2123a1797sm35965e9.1.2026.10.22.13.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:06:49 -0700 (PDT)
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
Subject: [PATCH v4 4/7] net: stmmac: dwmac-meson8b: follow the generic RGMII delay rules on the T7
Date: Thu, 22 Oct 2026 21:06:37 +0100
Message-ID: <20261022200640.3101932-5-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022200640.3101932-1-tanure@linux.com>
References: <20261022200640.3101932-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_130652_447147_C5F1ACE7 
X-CRM114-Status: GOOD (  25.62  )
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

The delay code reads phy-mode as the list of delays this glue has to
add, falls back to a 2ns transmit delay when no property asks for one,
and takes the vendor delay properties. ethernet-controller.yaml says
the opposite: the PHY adds the 2ns delays, and the MAC properties only
hold small fine tuning added on top. Every board in the tree depends on
the old reading, so it stays.

The T7 has no boards yet, so it follows the generic rules. Its receive
delay line is fine tuning, 200ps steps up to 3000ps. Its transmit side
only has a quarter-period phase step, the full 2ns at 1Gbit/s, so there
is nothing to fine tune and the transmit property is refused.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 122 ++++++++++++------
 1 file changed, 85 insertions(+), 37 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 450f7b4b29a6..95a185691503 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -80,6 +80,7 @@ struct meson8b_dwmac;
 
 struct meson8b_dwmac_data {
 	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
+	int (*init_delays)(struct meson8b_dwmac *dwmac);
 	bool has_prg_eth1_rgmii_rx_delay;
 	bool has_pipeline_clk;
 };
@@ -91,8 +92,6 @@ struct meson8b_dwmac {
 	const struct meson8b_dwmac_data	*data;
 	phy_interface_t			phy_mode;
 	struct clk			*rgmii_tx_clk;
-	u32				tx_delay_ns;
-	u32				rx_delay_ps;
 	struct clk			*timing_adj_clk;
 };
 
@@ -272,20 +271,91 @@ static int meson8b_devm_clk_prepare_enable(struct meson8b_dwmac *dwmac,
 					meson8b_clk_disable_unprepare, clk);
 }
 
+/*
+ * The T7 follows ethernet-controller.yaml: the PHY adds the 2ns RGMII
+ * delays and this glue only fine tunes the RX clock, on top of what
+ * phy-mode describes. The TX clock has no fine tuning, its only step is
+ * a quarter of the clock period, so the TX property is refused.
+ */
+static int meson_t7_init_delays(struct meson8b_dwmac *dwmac)
+{
+	struct device_node *np = dwmac->dev->of_node;
+	u32 rx_delay_ps = 0;
+
+	if (of_property_present(np, "tx-internal-delay-ps"))
+		return dev_err_probe(dwmac->dev, -EINVAL,
+				     "tx-internal-delay-ps is not supported, the PHY adds the TX delay\n");
+
+	if (!of_property_read_u32(np, "rx-internal-delay-ps", &rx_delay_ps)) {
+		if (!phy_interface_mode_is_rgmii(dwmac->phy_mode))
+			return dev_err_probe(dwmac->dev, -EINVAL,
+					     "rx-internal-delay-ps needs an RGMII phy-mode\n");
+
+		/* the RX delay line moves in 200ps steps and reaches 3000ps */
+		if (!rx_delay_ps || rx_delay_ps > 3000 || rx_delay_ps % 200)
+			return dev_err_probe(dwmac->dev, -EINVAL,
+					     "The RGMII RX delay range is 200..3000ps in 200ps steps\n");
+	}
+
+	meson8b_dwmac_mask_bits(dwmac, PRG_ETH0, PRG_ETH0_TXDLY_MASK |
+				PRG_ETH0_ADJ_ENABLE | PRG_ETH0_ADJ_SETUP |
+				PRG_ETH0_ADJ_DELAY | PRG_ETH0_ADJ_SKEW, 0);
+
+	meson8b_dwmac_mask_bits(dwmac, PRG_ETH1, PRG_ETH1_CFG_RXCLK_DLY,
+				FIELD_PREP(PRG_ETH1_CFG_RXCLK_DLY,
+					   rx_delay_ps / 200));
+
+	return 0;
+}
+
+/*
+ * Delay handling of the SoCs up to the G12A. It reads phy-mode as the
+ * list of delays this glue has to add, falls back to a 2ns TX delay and
+ * takes the vendor delay properties, all of which ethernet-controller.yaml
+ * rules out. The boards in the tree depend on it, so it stays, but a new
+ * SoC must not use it.
+ */
 static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
 {
 	u32 tx_dly_config, rx_adj_config, cfg_rxclk_dly, delay_config;
+	struct device_node *np = dwmac->dev->of_node;
+	u32 tx_delay_ns, rx_delay_ps = 0;
 	int ret;
 
+	/* use 2ns as fallback since this value was previously hardcoded */
+	if (of_property_read_u32(np, "amlogic,tx-delay-ns", &tx_delay_ns))
+		tx_delay_ns = 2;
+
+	/* RX delay defaults to 0ps since this is what many boards use */
+	if (of_property_read_u32(np, "rx-internal-delay-ps", &rx_delay_ps)) {
+		if (!of_property_read_u32(np, "amlogic,rx-delay-ns",
+					  &rx_delay_ps))
+			/* convert ns to ps */
+			rx_delay_ps *= 1000;
+	}
+
+	if (dwmac->data->has_prg_eth1_rgmii_rx_delay) {
+		if (rx_delay_ps > 3000 || rx_delay_ps % 200) {
+			dev_err(dwmac->dev,
+				"The RGMII RX delay range is 0..3000ps in 200ps steps");
+			return -EINVAL;
+		}
+	} else {
+		if (rx_delay_ps != 0 && rx_delay_ps != 2000) {
+			dev_err(dwmac->dev,
+				"The only allowed RGMII RX delays values are: 0ps, 2000ps");
+			return -EINVAL;
+		}
+	}
+
 	rx_adj_config = 0;
 	cfg_rxclk_dly = 0;
-	tx_dly_config = FIELD_PREP(PRG_ETH0_TXDLY_MASK,
-				   dwmac->tx_delay_ns >> 1);
+	tx_dly_config = FIELD_PREP(PRG_ETH0_TXDLY_MASK, tx_delay_ns >> 1);
 
 	if (dwmac->data->has_prg_eth1_rgmii_rx_delay)
 		cfg_rxclk_dly = FIELD_PREP(PRG_ETH1_CFG_RXCLK_DLY,
-					   dwmac->rx_delay_ps / 200);
-	else if (dwmac->rx_delay_ps == 2000)
+					   rx_delay_ps / 200);
+	else if (rx_delay_ps == 2000)
 		rx_adj_config = PRG_ETH0_ADJ_ENABLE | PRG_ETH0_ADJ_SETUP;
 
 	switch (dwmac->phy_mode) {
@@ -411,35 +481,6 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	dwmac->dev = &pdev->dev;
 	dwmac->phy_mode = plat_dat->phy_interface;
 
-	/* use 2ns as fallback since this value was previously hardcoded */
-	if (of_property_read_u32(pdev->dev.of_node, "amlogic,tx-delay-ns",
-				 &dwmac->tx_delay_ns))
-		dwmac->tx_delay_ns = 2;
-
-	/* RX delay defaults to 0ps since this is what many boards use */
-	if (of_property_read_u32(pdev->dev.of_node, "rx-internal-delay-ps",
-				 &dwmac->rx_delay_ps)) {
-		if (!of_property_read_u32(pdev->dev.of_node,
-					  "amlogic,rx-delay-ns",
-					  &dwmac->rx_delay_ps))
-			/* convert ns to ps */
-			dwmac->rx_delay_ps *= 1000;
-	}
-
-	if (dwmac->data->has_prg_eth1_rgmii_rx_delay) {
-		if (dwmac->rx_delay_ps > 3000 || dwmac->rx_delay_ps % 200) {
-			dev_err(dwmac->dev,
-				"The RGMII RX delay range is 0..3000ps in 200ps steps");
-			return -EINVAL;
-		}
-	} else {
-		if (dwmac->rx_delay_ps != 0 && dwmac->rx_delay_ps != 2000) {
-			dev_err(dwmac->dev,
-				"The only allowed RGMII RX delays values are: 0ps, 2000ps");
-			return -EINVAL;
-		}
-	}
-
 	dwmac->timing_adj_clk = devm_clk_get_optional(dwmac->dev,
 						      "timing-adjustment");
 	if (IS_ERR(dwmac->timing_adj_clk))
@@ -452,7 +493,11 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 					     "missing pipeline clock\n");
 	}
 
-	ret = meson8b_init_rgmii_delays(dwmac);
+	if (!dwmac->data->init_delays)
+		return dev_err_probe(dwmac->dev, -EINVAL,
+				     "missing init_delays callback\n");
+
+	ret = dwmac->data->init_delays(dwmac);
 	if (ret)
 		return ret;
 
@@ -475,22 +520,25 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 
 static const struct meson8b_dwmac_data meson8b_dwmac_data = {
 	.set_phy_mode = meson8b_set_phy_mode,
+	.init_delays = meson8b_init_rgmii_delays,
 	.has_prg_eth1_rgmii_rx_delay = false,
 };
 
 static const struct meson8b_dwmac_data meson_axg_dwmac_data = {
 	.set_phy_mode = meson_axg_set_phy_mode,
+	.init_delays = meson8b_init_rgmii_delays,
 	.has_prg_eth1_rgmii_rx_delay = false,
 };
 
 static const struct meson8b_dwmac_data meson_g12a_dwmac_data = {
 	.set_phy_mode = meson_axg_set_phy_mode,
+	.init_delays = meson8b_init_rgmii_delays,
 	.has_prg_eth1_rgmii_rx_delay = true,
 };
 
 static const struct meson8b_dwmac_data meson_t7_dwmac_data = {
 	.set_phy_mode = meson_axg_set_phy_mode,
-	.has_prg_eth1_rgmii_rx_delay = true,
+	.init_delays = meson_t7_init_delays,
 	.has_pipeline_clk = true,
 };
 
-- 
2.56.0


