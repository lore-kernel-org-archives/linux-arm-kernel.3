Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28383CCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FEVqi5Nllg5ZJBjCJ/BWh6zaV6Dl1dPjOzZboHdnN9s=; b=U86kJeAMio3xYteP3OpcsgLOMz
	kK1JCCpyiH/FWpVYC7kpt+zO4pguOOjUOaqtGma9faVnaIvgeo6nQnHOQjo2biXxlInIEBEfidf5T
	HipGPW+s2wT0KRFqpsPWXdYeQpkt7wGFa8u/5/oOQsyE7hhBckV/HTtbB19gy8Boq436f8Npq/xGR
	BkksvVcmhUL6qNZPpriJK52pySb7r2URg0TK5zCGaJcQbDHA8RGPHNOVfm3FvfJu8tor+ADbO56uB
	axT7vkSKVDk7eejjbza+51Tv/H5qnjLd9e8NDt21lPj9REqDhiJrxUtWtnE/V3V3WkUbszyag6afc
	Y1ARWNow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtQF-0000000EQxA-0aMZ;
	Mon, 20 Oct 2025 17:11:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtQ6-0000000EQqJ-2WUV
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 17:11:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FEVqi5Nllg5ZJBjCJ/BWh6zaV6Dl1dPjOzZboHdnN9s=; b=rSKV9XctCnTJnaFAqJnMLiRmlS
	h6GHDKkGKbIhgwCrn3KDKhcYZ/B14byzaIPiD/7iQm/qHE1+Zp0OE/mKeFXQRGzCjEWZPZHrsAx12
	fTysKUAgQ12AhhAWQhFTLv9xLhqbZqWcxS/RU3057E9Dot5psHOQDAEoDmAiMrR9Wzd+CUghWJn4I
	IdhuDN4ShXwFrFnu/ubhxPFDu2kthW76YgDWgfq7+VKAAum21GRuhNBye+Y1lrQBmGdEkBny0JcZ0
	M4Z9PJWQzGsGz+wWpkCLvcX/QZyoT+PWOMdXKMHh5Sx0dOqqexs5MhdmYHCmX92+KsgG7Qdn/S7yy
	B2kBbEDg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAsYL-0000000025L-3aBs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 16:16:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BF9D348DDB;
	Mon, 20 Oct 2025 17:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B601C4AF0B;
	Mon, 20 Oct 2025 17:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760980280;
	bh=y56EJjskppbR+/rkKdNbFUjyY8BC1025ZtXtMgp99fA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AWdrNuSx2oo2kKoNLDRwFOI+ta0fWeipsRkJtycyKAs8R6VgZTE+U+gAuq4mRQGVb
	 4MuZPrA8qZQOL+YkkaM/nMEbjhnAJh+kTEOProDZY5Eb8rTuy2NM80bBzhzKPYOwwi
	 bnsXxRTbX7UFNdOgN80sf0ZPoGvkILMO2TYcXRhcFFWR28+KOd8iyOabAd/10iiGrt
	 6r/DLmIlcFvSSzf0j/3sBUcQobSAzwhDlIkY/kuoTR6WLEh1rXl7PSAeADFChD/CgR
	 +NWmHgob6V3MPJfv8cuJl8uhKYwxS02j+CbjAR83SlmUYnTTi+mKfxPymhnIq0laGP
	 OWS1xwwnN2wXQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 431FD5FE78; Tue, 21 Oct 2025 01:11:18 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/11] ASoC: sun4i-spdif: Support SPDIF output on A523 family
Date: Tue, 21 Oct 2025 01:10:50 +0800
Message-ID: <20251020171059.2786070-5-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020171059.2786070-1-wens@kernel.org>
References: <20251020171059.2786070-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_171610_240505_9A89C7D6 
X-CRM114-Status: GOOD (  20.42  )
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

The TX side of the SPDIF block on the A523 is almost the same the
previous generations, the only difference being that it has separate
module clock inputs for the TX and RX side.

Since this driver currently only supports TX, add support for a
different clock name so that TX and RX clocks can be separated
if RX support is ever added. Then add support for the A523.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 sound/soc/sunxi/sun4i-spdif.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index 34e5bd94e9af..6a58dc4311de 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -177,6 +177,7 @@ struct sun4i_spdif_quirks {
 	bool has_reset;
 	unsigned int val_fctl_ftx;
 	unsigned int mclk_multiplier;
+	const char *tx_clk_name;
 };
 
 struct sun4i_spdif_dev {
@@ -323,6 +324,7 @@ static int sun4i_spdif_hw_params(struct snd_pcm_substream *substream,
 	}
 	mclk *= host->quirks->mclk_multiplier;
 
+	dev_info(&pdev->dev, "Setting SPDIF clock rate to %u\n", mclk);
 	ret = clk_set_rate(host->spdif_clk, mclk);
 	if (ret < 0) {
 		dev_err(&pdev->dev,
@@ -542,7 +544,6 @@ static struct snd_soc_dai_driver sun4i_spdif_dai = {
 		.formats = SUN4I_FORMATS,
 	},
 	.ops = &sun4i_spdif_dai_ops,
-	.name = "spdif",
 };
 
 static const struct sun4i_spdif_quirks sun4i_a10_spdif_quirks = {
@@ -572,6 +573,14 @@ static const struct sun4i_spdif_quirks sun50i_h6_spdif_quirks = {
 	.mclk_multiplier = 1,
 };
 
+static const struct sun4i_spdif_quirks sun55i_a523_spdif_quirks = {
+	.reg_dac_txdata = SUN8I_SPDIF_TXFIFO,
+	.val_fctl_ftx   = SUN50I_H6_SPDIF_FCTL_FTX,
+	.has_reset      = true,
+	.mclk_multiplier = 1,
+	.tx_clk_name	= "tx",
+};
+
 static const struct of_device_id sun4i_spdif_of_match[] = {
 	{
 		.compatible = "allwinner,sun4i-a10-spdif",
@@ -594,6 +603,15 @@ static const struct of_device_id sun4i_spdif_of_match[] = {
 		/* Essentially the same as the H6, but without RX */
 		.data = &sun50i_h6_spdif_quirks,
 	},
+	{
+		.compatible = "allwinner,sun55i-a523-spdif",
+		/*
+		 * Almost the same as H6, but has split the TX and RX clocks,
+		 * has a separate reset bit for the RX side, and has some
+		 * expanded features for the RX side.
+		 */
+		.data = &sun55i_a523_spdif_quirks,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sun4i_spdif_of_match);
@@ -635,6 +653,7 @@ static int sun4i_spdif_probe(struct platform_device *pdev)
 	const struct sun4i_spdif_quirks *quirks;
 	int ret;
 	void __iomem *base;
+	const char *tx_clk_name = "spdif";
 
 	dev_dbg(&pdev->dev, "Entered %s\n", __func__);
 
@@ -671,9 +690,12 @@ static int sun4i_spdif_probe(struct platform_device *pdev)
 		return PTR_ERR(host->apb_clk);
 	}
 
-	host->spdif_clk = devm_clk_get(&pdev->dev, "spdif");
+	if (quirks->tx_clk_name)
+		tx_clk_name = quirks->tx_clk_name;
+	host->spdif_clk = devm_clk_get(&pdev->dev, tx_clk_name);
 	if (IS_ERR(host->spdif_clk)) {
-		dev_err(&pdev->dev, "failed to get a spdif clock.\n");
+		dev_err(&pdev->dev, "failed to get the \"%s\" clock.\n",
+			tx_clk_name);
 		return PTR_ERR(host->spdif_clk);
 	}
 
-- 
2.47.3


