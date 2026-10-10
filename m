Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCB7CA9EC0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 10:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAObO9x1QF4WrfdAIN5+rU7Yr3xIr5PVFD+T0h41GXs=; b=zWJoFtDr91FsmELdGpK9GptH4m
	rGDFubckxVHsSLkZ81gf6++bOX6kKpGIFU7u+xU3gRx55EfN6H5gSwiJihAZm6I2mCnqFZPK56D4G
	s4g5SVnhuaOqiEFOUHbV4F7r6aNU7A8wWzhftfASQG49k7ScZXRPtT6+HTU1/BfxD7FOYBfTH8OuF
	F77nVBpfvp3LuA7t3L5OIQ0jkDPBLtoAp13tMyAnzUuBUh75a3Zz608nd/pgY5s7spmwj0eI27Dnw
	xNxu66gr5Zs3vsTWWZANyJ2USeFxxekWqkVvOJ2Cac7aPLyi9Mt19V6xuRLcmgUT481f+Cd1uinZi
	DBG2Ti/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFUnM-00000007sBd-0rBr;
	Sat, 10 Oct 2026 10:59:16 +0000
Received: from mail-wr1-f43.google.com ([209.85.221.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFUnE-00000007s0f-1fD7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 10:59:10 +0000
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso298344f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 03:59:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629946; x=1792234746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OAObO9x1QF4WrfdAIN5+rU7Yr3xIr5PVFD+T0h41GXs=;
        b=p9qXmI/sPfr0XgadkiPz2yuZQupKA/9X2KPz6M6XLiZOcVlHD3yHKtQns1YmlrOELR
         qPcD2/81hdl4+19AJJKs1aFi1c5SHHZMp7IBfDwTnKjbs3/JAVTp9dZFd/pNJGjwcgEq
         P+CUWqfi1xRl4FzIBQrinW39eEHY3j4iAfdRhHyWWdBpTnKvBykeGQQ/bgvuyPC2JKRa
         NzYvR4bK43N02Ynh5uOBbFp24yzloCgvSHJmg2unCiyao5MTKwA7Km2kMgbn6D2qpsjl
         RUmje/kI9q7eOGgZZOEoRQ0ct5p/qnhzEb+BUbNBt6Ursff6LjsTpsHlYSsJhJPGmqxj
         kHJg==
X-Forwarded-Encrypted: i=1; AKwUvBxrF4lGDSsaxoOsu1eTO+tANnMgYQ3LK1n3GLL7NkU9OFZlHllA6veU8p4S/WDR8mBc5Um+P/hIkL5aqDo9VBux@lists.infradead.org
X-Gm-Message-State: AFq9FYImAxd+l7rHmgOKY9L7ORxLxdb4TkSBU5sxcDFzKBIs4FQcaWCL
	sKEdnEA7izOElDHoydFz+UdXsaE2K7ASTEAMD9IVGOdlpuz39ZQKIz1A
X-Gm-Gg: AYBFou3ijtpCN2KEktvfLd7i95gF1hbCpEBYiAxkYE61PnYmqjJklYB3NnHqgKCMkKY
	ELu/gJKb+kwVTdlG4eGPGyr489FGk9rOLzNMNdJiEG7KD4asf6Z7s6nsHGVec/4BX6Ely12Hw7V
	bCgyikpgUyT618coRm1JiwZkkyA5LgTuMgC73DeOOVq4GVi5bcnc0A1qFcmNBLWjSTe//Dsr7DL
	UrV7R0Ao5Qz6Tjk/Agq9PovmI5ZxDiLtfQov7zuHZTPk4gvRHiSJYcdAflYxWQ7drQjNTdZxo7e
	pt3j9vCZWZWvW+iuPItvT/swqOnOmMHg70kQLTulf6dbta2ITmyRce2nllrVN3kfyOw+ZGl5iKt
	0rif3/NMWg92xAqDk9M4yQ0dntmkDt5zj+RL794I4+Eajks2h5QgAZ6XgmGgRBYyaB/mGHarx3D
	AEedP2GRfHpBwggxDmHWdprVoAZD8mfm3sSQH76qumrwS7N7iPSRcX4QwH8r67G6oQKfzkj2Z8M
	e02bDcDKRPS+YEtzWnHUyimwmSVaXZI02E=
X-Received: by 2002:a05:6000:491c:b0:48c:4272:86b2 with SMTP id ffacd0b85a97d-48dba9bdcfemr8482673f8f.11.1791629946574;
        Sat, 10 Oct 2026 03:59:06 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae17e9sm8709526f8f.57.2026.10.10.03.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:59:06 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
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
Subject: [PATCH v3 3/8] net: stmmac: dwmac-meson8b: add support for the Amlogic T7
Date: Sat, 10 Oct 2026 11:58:55 +0100
Message-ID: <20261010105900.247342-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010105900.247342-1-tanure@linux.com>
References: <20261010105900.247342-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_035908_509387_E52C6E07 
X-CRM114-Status: GOOD (  16.86  )
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


