Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73027606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HtCNwsAO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=puIm5drKvsAtTzpQuwSkW9RuuhHt2CPtr5r817ZaEWU=; b=HtCNwsAOsIawwZ
	ODwJhZzrSDuY/HmGojC+W8ekmRbibvW/jM1/AAkxkS8OrZxEpUlS2BuIJO7hxywMQ4VTazK3lxpze
	KJGW1mHnglbRW8RCjEn15EIJyIQQBD4jO82e3p3UhKA+V2KmaQD3bLFA67znNUt7h5hMOOt06+3/s
	IV53Vl6zxpP3aB0Wu/+jPYsVNo4wBTCJTQkoj+b/JgrYuK4XXug2+/GISEsDAM4sa3ItxS9OCxf/P
	Mrk4YHju4ZPJ8Ba9lgCm29+5o35Hur2cNakGmlwe1QCogqsdJQqicqA4Mt4iZI1DeS/LuZ5XpS21s
	FezfYniOl341VVg/aNNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHVl-000000039Zj-3fae;
	Tue, 03 Nov 2026 16:37:25 +0000
Received: from mail-wr1-f42.google.com ([209.85.221.42])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHVi-000000039T3-1Jfq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:37:23 +0000
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b001cd92bso2361484f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:37:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723840; x=1794328640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=puIm5drKvsAtTzpQuwSkW9RuuhHt2CPtr5r817ZaEWU=;
        b=EpKcDVceb371iqL8h7ixsGBfz3oYO0DDKa1iFE47Zk3siLCN3a5iiS5lKm/wybWcYD
         FdLROn6yckja5Qdr/av6NVTpJAsbWa8Et65dGRYick6n2BlNO8YN4hSxK9G8HeOPb3Tk
         TR25bC28ncGgNvjB4R2yg2G7VqIzu7LoxEzjVu5OGHEmXX7Xv0TNTypFpQp5nD49W8hd
         anBUKo+wIS2dNOlmDrcDvZD1lsDo1CDGjmd/4jUH3tt6E/FBaCQB6g0lkyyClS5pE0Ki
         PoPfMs+QPrE338evAogFFpLGbraYfTXjtim0NIdPU8Qr3dnnxptbMgovDi00LtBou3J1
         +ZOg==
X-Forwarded-Encrypted: i=1; AKwUvBwbzqhnXxg+V80A92FCOfOTw5K4H+8/VN14YWk//1rlqUAgpkkDklmDFtU8rXMHMfh7Z3TO8VpvQ2S++RttHeFr@lists.infradead.org
X-Gm-Message-State: APuU4Z/MH95UYlGHCDZibfgKWrW7t1tL7fZv/PiQfUUG0cwiv2RdtQTS
	RTFQzmx1yToMP1RuO6LHq41IU1x+l9a3VESpdf+qlmVBnlsXjWjT00FxtYnE6bpheMf4zw==
X-Gm-Gg: AYBFou2muc+fqkBYGnp/LgkMzu9ww35V05fea+i8VWTmyT25Twa7Uo7C6EICauUuVfp
	a4SSr26zL+bANU6JCm0O3l4djKIE5bo7kCYrQB3cpPt2bEAKVR3scnbQM0IGYR+r0S2Rd0WpnCu
	OoaaSpJxRQvaB/E+bUIqrNLiYOOrc2cSn+fQjZO+slNsDmjM33M5oBFLB+sv5KS1yTBEzntoNxq
	vRTjLZaAhvR/HTJd/2a9Nj1GcH67cO1YvHgRIRxT2ZAUc1EsNCaskXChfHEMwA9on4CglFI+emo
	3bb9prfqeKdj1vKioEVtPzmAySH9IpniXq8rb+DAQfs/THVrO+d80U18zSzxsL5Ss0qdFTKrGdb
	KC7hln9DMv6ehf6O5y8+wUKu6DjptQLCGggpa2obthb6wWmkRGhg/8EzqXmHDho4LwuL/XOJ+LR
	A8FFQDVXnRzUm9Tx7msfp9b5TwFS8E2bHMm+RNtr2Nv5pN4Vdp2Xoyzo+B+wO6+Brp03Ky8o4tV
	T2Y8REJOqmMWRikoeyKlujs0L+PBBoFB8a+hB7a4dhb3LYb0fwEb8s+u2LdBx4lNXN6gyFSc4h5
	t9vXF86QRf5ekk6miI8EN23a0q0iKIooSk8AM/wssLFtUOizUBlZReE68mLRGbqO92oXB5lzEf6
	14Pxylq0vtu7CZxJQ2TxewYyMTg==
X-Received: by 2002:a05:6000:2213:b0:48c:7f18:c85e with SMTP id ffacd0b85a97d-48e6e3042d5mr30563697f8f.45.1793723840170;
        Tue, 03 Nov 2026 08:37:20 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm29044772f8f.6.2026.11.03.08.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:37:19 -0800 (PST)
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
Subject: [PATCH v5 3/7] net: stmmac: dwmac-meson8b: add support for the Amlogic T7
Date: Tue,  3 Nov 2026 16:37:11 +0000
Message-ID: <20261103163715.385394-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103163715.385394-1-tanure@linux.com>
References: <20261103163715.385394-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_083722_402383_69B7113F 
X-CRM114-Status: GOOD (  16.25  )
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


