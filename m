Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BDC606A332
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 10:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zvWGH1nx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=puIm5drKvsAtTzpQuwSkW9RuuhHt2CPtr5r817ZaEWU=; b=zvWGH1nxnB/yho
	FAow+0k56dSJR73AW9RpcJ30yyPtcx+zK/b7Arhe/SYsVxPLS3rXIgIKrhYbmqYQlRFwL3I/34qlO
	6d7LJzT7pFWJorOSBuGZxG+xVRtMruEoB36s7wBg4fnPFBSzx/R9AT6IFDBmuKiisk2jdvweNb4gf
	O+5SYdfz8sJ5QykI5VEy4oC1BhIOzlQYEQTLWN5KoNxynvpCc21mR5crTvKLcuSqEHVlviSimC4id
	/QoF0BfDEHXjwHaUIsPNi0Z+d0g+pD2XO3c8j20dxSAl3xKVUGEdjcDXYzLqDWAqk/QtXrm+okloT
	KbYKq8oK9/g2cFrnTCrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuJo-00000008OOC-2cr1;
	Thu, 05 Nov 2026 10:03:40 +0000
Received: from mail-wm1-f46.google.com ([209.85.128.46])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuJf-00000008OBP-1yDe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 10:03:32 +0000
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so14886985e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 02:03:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873010; x=1794477810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=puIm5drKvsAtTzpQuwSkW9RuuhHt2CPtr5r817ZaEWU=;
        b=fbEep9UhRsn3hLlvKEv7zY+/K5nZKy4VHuTJ22Q8BZ4MQqBK3bs46WC78W0p3PtSNk
         OkkXr21PyRTEFCPJBPRR4Y/BcwutKyMta3x/SqQ73rpgS86lRwb1IvfvI7g74zZGi+0L
         HeWH5XLGfPm5m2SSpxWPBVb59DYqAkYMPSbwOd5UZtLl5z7ZR5WmVoOTpxy17mmTCrD+
         ZxK3UOiNksldfq3fqLSo35CbHWiPjGsADHUW687ZEHLQF+tZdwwQCoJ3f/JjLrlhmdNe
         5WkZLOnf8X7v0BDvQBfxsjFXuQ3wmof3UDy4TxVjU1ELNvFIttngFTZ7/CMH2ybovwav
         OuzQ==
X-Forwarded-Encrypted: i=1; AKwUvByik1c9P93d4Ad01QekyoPDLAhx9ZFBlzS5SehbDjqYggnSPrXe4q6O84eYdu2ZKRAZLveTXtpquKVQDxHReIye@lists.infradead.org
X-Gm-Message-State: APuU4Z8F1amHwlCxs/Ht/4Qi/C8bjAHXgpO7wg/E0KOedltYDg6QL+6e
	te9DD2l17lTvYCJyJIOdEmVgkshXZVkQ7IjC6ZbM+nYO2/4Fmk99GcWp
X-Gm-Gg: AYBFou0zQ4tG1795gf2kNQT6bGT5SWMFEI/E7C9WdtXtxj1jjPmSDpavlQ2pt13ifSQ
	y0G669d2KiI2HuZx9ItcgP6UX8PQiGPcB8X/Odzj6XxyLIQsEorFeOwNuKMwiNZZhHZk1+2/JyC
	ex9CUEX/foUFeTvO3RopP/8rGKmJGbjAkoL4pWwdX5YS4bINk5xk2wPVGfTejzOF8dR8dkdcas4
	zNLL8R6ePGYlN9yUqaQxeMpznoORcU/zAoVSWJ7mVnZQRYgc6PvOoNhevXib8qcPcS1O2HASTRU
	A3d3S6BzlY0iqOComiZ6f974mctYb4aIzjl+DvHuJsm5nLx5sWLQC+xs63yJpcWV9PpLaHdCB+w
	dDhmAoPudMx/vQKj9t4+0vb2sNF2SpHtBjWBxVluag3et0Z18CIRJpTCGwrFzB0XMHMsSsdnk59
	TzrSDCvKEFs9qjV1JG6FkS35SUMbL31kuWN5qPhy2Nzy/yVYjvqLgDbvyDHKtt/oLe0TscZWzDZ
	tJM0Y3dlJOJVOkGkSqI3bcD9vJh8oNgpNMBZW2TtGFdYvP6WsZMhk969U9+hk+txInka1BbgbQh
	FBmNAfj5R6qNFSKCyzlakHE2dlrTWSyjy/JPcdBo4Vfk8NE4Af+yNxLwaqKzsgy1A5RIEITH8dn
	p1lqt+YGofjD5t0t3r+N4cET0/g==
X-Received: by 2002:a05:600c:34d4:b0:4a2:d7e:5ccb with SMTP id 5b1f17b1804b1-4ac182dca99mr455243555e9.15.1793873009584;
        Thu, 05 Nov 2026 02:03:29 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43342773esm53455775e9.4.2026.11.05.02.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:03:28 -0800 (PST)
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
Subject: [PATCH v6 3/7] net: stmmac: dwmac-meson8b: add support for the Amlogic T7
Date: Thu,  5 Nov 2026 10:03:18 +0000
Message-ID: <20261105100322.37816-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105100322.37816-1-tanure@linux.com>
References: <20261105100322.37816-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_020331_535230_76B2A40B 
X-CRM114-Status: GOOD (  16.23  )
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

The glue registers on the T7 are laid out exactly as the G12A ones, RX
delay field included, so the T7 can reuse the G12A settings.

What it does not share is how the controller reaches memory. That path
runs through a pipeline stage with a gate of its own, and no other
device has any use for that gate. Nothing claims it, so it is switched
off as unused and a transfer that has started can never finish.

Without that gate the controller cannot do DMA at all, so it is
required rather than optional: a clear probe failure beats an
undiagnosable hang later.

Assisted-by: LLM
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index e4d5c41294f4..450f7b4b29a6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -81,6 +81,7 @@ struct meson8b_dwmac;
 struct meson8b_dwmac_data {
 	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
 	bool has_prg_eth1_rgmii_rx_delay;
+	bool has_pipeline_clk;
 };
 
 struct meson8b_dwmac {
@@ -384,6 +385,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct meson8b_dwmac *dwmac;
+	struct clk *pipeline_clk;
 	int ret;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -443,6 +445,13 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	if (IS_ERR(dwmac->timing_adj_clk))
 		return PTR_ERR(dwmac->timing_adj_clk);
 
+	if (dwmac->data->has_pipeline_clk) {
+		pipeline_clk = devm_clk_get_enabled(dwmac->dev, "pipeline");
+		if (IS_ERR(pipeline_clk))
+			return dev_err_probe(dwmac->dev, PTR_ERR(pipeline_clk),
+					     "missing pipeline clock\n");
+	}
+
 	ret = meson8b_init_rgmii_delays(dwmac);
 	if (ret)
 		return ret;
@@ -479,6 +488,12 @@ static const struct meson8b_dwmac_data meson_g12a_dwmac_data = {
 	.has_prg_eth1_rgmii_rx_delay = true,
 };
 
+static const struct meson8b_dwmac_data meson_t7_dwmac_data = {
+	.set_phy_mode = meson_axg_set_phy_mode,
+	.has_prg_eth1_rgmii_rx_delay = true,
+	.has_pipeline_clk = true,
+};
+
 static const struct of_device_id meson8b_dwmac_match[] = {
 	{
 		.compatible = "amlogic,meson8b-dwmac",
@@ -500,6 +515,10 @@ static const struct of_device_id meson8b_dwmac_match[] = {
 		.compatible = "amlogic,meson-g12a-dwmac",
 		.data = &meson_g12a_dwmac_data,
 	},
+	{
+		.compatible = "amlogic,t7-dwmac",
+		.data = &meson_t7_dwmac_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, meson8b_dwmac_match);
-- 
2.56.0


