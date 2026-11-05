Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FA1606D813
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 10:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LUdr+b0v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=b7yfUIavlqkZvjW0hdKuc7GNLhU6uDD+OhW8RPwrMQg=; b=LUdr+b0vbBFalS
	Ml/sfTuK4OJ5TY1/pXqwyqc3JhAcT9C+LNiL81gata8goCjv6pkMSguYHKytEv8e8dyQ1JAegOK+q
	oYu3IA5n54WtRqFE8Gh84ZqPNF/QvOCd29Y0XU1yYw6zuCSejf0WpJtiqI1p0RSND4ZFM49a4h8Lt
	zuDy9msUNLpFuZjufN/HaKB1GWWG1HjLakH/6nXIVFXMi2UtVfvf2RdMMkSa2Y7AyIn5/w1JduaAM
	SPDQ28FwG1Ngms4R/N6fFZUANOWcM78YAOyRfevZ033cI9H0MJbg/OI20by/3oM0Wn81yXD9dLgr9
	s3ViNHwSOGoutxS1zrtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuJv-00000008OTo-0Gkp;
	Thu, 05 Nov 2026 10:03:47 +0000
Received: from mail-wm1-f45.google.com ([209.85.128.45])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuJg-00000008OCA-1kS9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 10:03:33 +0000
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so12826785e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 02:03:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873010; x=1794477810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b7yfUIavlqkZvjW0hdKuc7GNLhU6uDD+OhW8RPwrMQg=;
        b=WfrawbeRFrd38+raoIr53xZO1xjUF4nlScT+sgxwIhsee9WvsvD/nqhDXccBFCq4fl
         AMYmIBHODNYwYmxohtpGz6d6v1WUipSpUQbWFaekJ2c/NWdgi9Uq1dfOxYmxHfp5/N9l
         OW3xT0RTL+E4qAXlRi0x6fyUjqz8BrPiW8u/nsk+2givtKIvA10om7UkbpDe0kQgFKX0
         vSa3MBhDQe+UBeM0Kn8Fw0HMsbPPsc+k3YvluX99EfU00q/Y6S6gcslbU7iS5iPuWjSa
         +wY8qBhXBiG+r8T6QLB/EdivrNFDlenKISGxX5uZQpFJNAu7PrdT808TkQHMpB/i20Kn
         UL6Q==
X-Forwarded-Encrypted: i=1; AKwUvByLk/7YZcQWjC/VCn7RI5SyxAsDslfYFStyI+vbKMIg8sL20ljuxquXbvRW8oqJj+zWeSIcTEV/+/3D0c3aHOcy@lists.infradead.org
X-Gm-Message-State: APuU4Z8/TjDM7mwcLtOdNYd5tbiql1n0SZNH1DU1l27HUh6ZJqNWVIJt
	560cIiKBDtnz7EM1DD5ndtTq2pCALAmJG0jQJzm8UMZFXgWrD3A3K50Q
X-Gm-Gg: AYBFou0FWFVOpanwuc+pL1t84RtVP+wZ3dxuWYEE4MYKjrbgo+3Gv0Hz2d5zEzLgn3q
	sqfFu3QZNTclWl7V1Ir+D/gsUHnUdnqLaqocNv13LyfjvyYJmWzmI5pKREaa0H4XxbIds2M+hgI
	SbilsD54GHvR5BMle0HRUvx8Oofh8JW3s6xFfYRQAQupYDcl/0EPkirkWhPWWLusQ3MwN4EDFJI
	lylUvp4ghTxzE3h1LgE3OFbPrGm3HXdvuxx8AmgMVmMTZuU9umuu/guxnehaPac7d+L/l/jnJJT
	zKqNvMvfyux+3dqpbyFhfVwr5A/Z/R5XmkALkMvie94Aw9srGg79L2sArTUnizePEiCkHhOImMK
	l2cVMT6iVjlGqpNcbNQ+JxJ6CO7V98C7HIZNrk2FbxLz9LbyYEUOYBjezCBdzUVMGNj4uT4Hh3S
	FT+szp73krFtrULZJo+KJj/h8P+F9+2SNTxxR6mR17hIelkBRm7HTpVxq06N7mWlIJqovJvYItA
	afXrSU/n+7tnqLVJ9WDVcsWYZX0TVTM2G+quEMk0u0UWfYtu5ar5OQASMJeBdTLwznDfGZUtU0w
	aGPeMGxLVdb1qsWQJtDOMJ9nSD0eeYlJW2CNGsOgeA6+98V+al8XU85jcsqMIk3LGzF8sEz74uX
	QoDlsTLyzp7idcScXfjuot3PAxA==
X-Received: by 2002:a05:600c:871a:b0:4a6:44b:2593 with SMTP id 5b1f17b1804b1-4ac18d68babmr382886655e9.29.1793873010557;
        Thu, 05 Nov 2026 02:03:30 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43342773esm53455775e9.4.2026.11.05.02.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:03:30 -0800 (PST)
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
Subject: [PATCH v6 4/7] net: stmmac: dwmac-meson8b: follow the generic RGMII delay rules on the T7
Date: Thu,  5 Nov 2026 10:03:19 +0000
Message-ID: <20261105100322.37816-5-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105100322.37816-1-tanure@linux.com>
References: <20261105100322.37816-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_020332_490383_C324E820 
X-CRM114-Status: GOOD (  18.80  )
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

The delay code reads phy-mode as the list of delays this glue has to
add, falls back to a 2ns transmit delay when no property asks for one,
and takes the vendor delay properties. ethernet-controller.yaml says
the opposite: the PHY adds the 2ns delays, and the MAC properties only
hold small fine tuning added on top. Every board in the tree depends on
the old reading, so it stays as it is.

No T7 board uses this glue yet, so the T7 gets a path of its own that
follows the generic rules: the receive delay line is fine tuning in
200ps steps, and the transmit side, a quarter-period phase step, offers
none, so the transmit property is refused.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 42 ++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 450f7b4b29a6..c8bd15b6780b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -80,6 +80,7 @@ struct meson8b_dwmac;
 
 struct meson8b_dwmac_data {
 	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
+	int (*init_delays)(struct meson8b_dwmac *dwmac);
 	bool has_prg_eth1_rgmii_rx_delay;
 	bool has_pipeline_clk;
 };
@@ -338,6 +339,41 @@ static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
 	return 0;
 }
 
+/*
+ * The T7 follows ethernet-controller.yaml: the PHY adds the 2ns RGMII
+ * delays and this glue only fine tunes the RX clock on top of what
+ * phy-mode describes. Its TX clock has no fine tuning, the only step is
+ * a quarter of the clock period, so the TX property is refused, and so
+ * are the vendor properties of the older SoCs.
+ */
+static int meson_t7_init_delays(struct meson8b_dwmac *dwmac)
+{
+	struct device_node *np = dwmac->dev->of_node;
+	u32 cfg_rxclk_dly = 0;
+
+	if (of_property_present(np, "tx-internal-delay-ps") ||
+	    of_property_present(np, "amlogic,tx-delay-ns") ||
+	    of_property_present(np, "amlogic,rx-delay-ns"))
+		return dev_err_probe(dwmac->dev, -EINVAL,
+				     "only rx-internal-delay-ps is supported, the PHY adds the RGMII delays\n");
+
+	if (phy_interface_mode_is_rgmii(dwmac->phy_mode))
+		cfg_rxclk_dly = FIELD_PREP(PRG_ETH1_CFG_RXCLK_DLY,
+					   dwmac->rx_delay_ps / 200);
+	else if (dwmac->rx_delay_ps)
+		return dev_err_probe(dwmac->dev, -EINVAL,
+				     "rx-internal-delay-ps needs an RGMII phy-mode\n");
+
+	meson8b_dwmac_mask_bits(dwmac, PRG_ETH0, PRG_ETH0_TXDLY_MASK |
+				PRG_ETH0_ADJ_ENABLE | PRG_ETH0_ADJ_SETUP |
+				PRG_ETH0_ADJ_DELAY | PRG_ETH0_ADJ_SKEW, 0);
+
+	meson8b_dwmac_mask_bits(dwmac, PRG_ETH1, PRG_ETH1_CFG_RXCLK_DLY,
+				cfg_rxclk_dly);
+
+	return 0;
+}
+
 static int meson8b_init_prg_eth(struct meson8b_dwmac *dwmac)
 {
 	int ret;
@@ -452,7 +488,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 					     "missing pipeline clock\n");
 	}
 
-	ret = meson8b_init_rgmii_delays(dwmac);
+	ret = dwmac->data->init_delays(dwmac);
 	if (ret)
 		return ret;
 
@@ -475,21 +511,25 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 
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
+	.init_delays = meson_t7_init_delays,
 	.has_prg_eth1_rgmii_rx_delay = true,
 	.has_pipeline_clk = true,
 };
-- 
2.56.0


