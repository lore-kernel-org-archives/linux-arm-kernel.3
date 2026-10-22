Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E403606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 20:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zA8lWcpa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=puIm5drKvsAtTzpQuwSkW9RuuhHt2CPtr5r817ZaEWU=; b=zA8lWcpaX6b9GT
	E/bhljjXELrxobdO6mMA+LAze5QYtVxbkPCrLGGKX8jzOob95I+9Zvlj9rf9Pq7wVGnBJAzpOIYCq
	DFeW3Vtr/keBs4rmm825ENEf7ZINLmlyMMiqFc8uCSTa8WKdvxgfwD2Gk9zBSp4mtboCmlO/gQlXs
	09CDUxFH6ReMyxoVA5vEkFfIE98QWaEPbElbYQU+4jkGfOUipy17ilQwgxIoWTU9AkhXRc3odQ5B9
	fJXrq0jMjYuzmIqm4/DJN7zW6yHbupeWO7aVC2ibrn/gZEzAloazqZwTl9SCR7PVGEovizPgiCEJG
	FPdnuYHsEB5Its9Twx8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz3z-0000000EtBx-0C0c;
	Thu, 22 Oct 2026 20:06:59 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz3r-0000000Et34-0dvt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 20:06:52 +0000
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so1323725e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 13:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699609; x=1793304409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=puIm5drKvsAtTzpQuwSkW9RuuhHt2CPtr5r817ZaEWU=;
        b=KCMA2FnkMka1Y0OILP1vBA/2vEW5MvsgqlsOiQ8flYGHErMtJmwONOrP6+UCo7nlSb
         PrWQHVuCO+P+EWB20oGeLDNEy89LGj5Mcz6scA3iKm3IVyjmszvVditjNXRtTyJmKLCC
         WMjj9xBUAD5VhPIgfnn/2WZWpSI+qKznKczRlykcrNOqBkwdq4waE0iU6jvtU9BLO/Q7
         9Gu0H4IYWtiYRaTmDA8qlRCeqhNl//Vk1ST+3pGa+b2XLiGEYs294wr9FSHtwwJ2OBk2
         v7NhCFpJeuJmcGz0r69rR8hUaQhOMRpT4yTZLkvU+BsXqcyioZZpyPW/cXiHmIwnlxis
         X8rg==
X-Forwarded-Encrypted: i=1; AKwUvBxaoO8U8zI34/lx9LdOO9aVw0ar2ktbMnLqANasT5PMB/rFks2tIIBXiLQfd9vQ8JJu8LcnQKnUntozcGOkLqL0@lists.infradead.org
X-Gm-Message-State: AFq9FYJz+sSFDZfrjRkHPBPHyouCExV+05VVOaC4zxJJQlzWSwGKYJrv
	Hxe8XrgcfcTLqTwDbeupjZTFF96T24/IwH3Why7b+sysrJi+7Xo407qm
X-Gm-Gg: AYBFou3+azYNBAAGtJ61N8gvOxyO3YoXbo+Pfrz+b+tmbeJB3KJdCymfQFhpy675xWs
	Rgp/LwfR+Qd9c2Xl35pMcL2KdkUekGXcFq9MhL3ALUfEKHN5Z1nbrpu/QXqdA8bFw6U8eE6ETE4
	xud2hpzF/SdONyHum07IgAL/4yfZCq/Qe/18eC4yX9k8YaVPhiyPy+sXSlvJyh/ghuvN9BvbQse
	EQ6mksFpmNc8n6k1Bxqe9iqaE92hAcJFDVKGY+raZTfe8crtjwrL1t+o0W+546CmuRysIKXUbAQ
	Sn8HzDkWrtk81ktVZ60GWM6ZJroOf6nBsSj892mcvHGIzxPhJow1VL5Ah3aNdS641jh8SvXdav4
	kZC3G8RO89Ot/PztI1gUXGXbBipE9k0Q88tvJH4OTlqIi50W7CM6WjoDxB3k2AagNzQcgwKOoBo
	d4ujIQURcFvxP29y6JPy/af0k1/rvI9hGatZg0Rmdf18ECTGc0FctF6FyfviZUpTgbtx6MvmeY9
	afW9P7H4d8zDOH0f//chcmLSPgzYDFCxUCLSFNfeEaOYKSUhZl8GCLalKPjInpfNKkT6x/JUYz/
	olEfUpPvJY69Iv0=
X-Received: by 2002:a05:600c:1389:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4a211cac456mr2469675e9.17.1792699609209;
        Thu, 22 Oct 2026 13:06:49 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2123a1797sm35965e9.1.2026.10.22.13.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:06:48 -0700 (PDT)
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
Subject: [PATCH v4 3/7] net: stmmac: dwmac-meson8b: add support for the Amlogic T7
Date: Thu, 22 Oct 2026 21:06:36 +0100
Message-ID: <20261022200640.3101932-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022200640.3101932-1-tanure@linux.com>
References: <20261022200640.3101932-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_130651_341562_AF17C01E 
X-CRM114-Status: GOOD (  16.46  )
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


