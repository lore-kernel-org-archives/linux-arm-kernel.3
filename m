Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA0F606A332
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 15:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4m4i3gim;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=EZAUJ5Ps
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JN22oxdaN3zgBX5qNztQ4ZuT8bGPH+vtOiywU9Zm/R0=; b=4m4i3gimdgJq5S
	b79X/shbOxridf1WXK5ojSv/9xfz4HVJ+mmPgwBN5TwzP67z5CDHkKlihZ50FFmKO4finWwX7uq1q
	boxD1vdR/K4aCH5hv8ay0iZcbEv+V0ksq3rMAhnw+j7HwoqsoenLEMEuscFEbHN8pbDJc1+hknszC
	12WpS6DEnxHCBK7jY7ixYmjlJ6jnvuH2hGd2ZlxPPHsq31FbuFCK5ylaMBAX+cur2diarOH62092v
	RJdYAqpX/c0wm8KagBN4je6tP24/x1Q5yDxphrgBpeRJK89Ilqi/F3UkbYLinyv059JGgcuqmS/5h
	nsjQVjeE5+gUn1QWce5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOctc-00000005mQT-3SGH;
	Wed, 04 Nov 2026 15:27:28 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOctY-00000005mNR-0HI1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 15:27:25 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 50915240104
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 16:27:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1793806042;
	bh=JN22oxdaN3zgBX5qNztQ4ZuT8bGPH+vtOiywU9Zm/R0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=EZAUJ5PspiLCVJ+gpdACGaT/RQHwloO815etCseAXsLgHh+6L/aAYYBo2pGtU1Hg2
	 ADHhQckFJsIZicQIo66QTfSjaa0BBR/xJQGQ+teKq9BFIwrjDSvD1jEgebOpuHaYI8
	 S9ohrzi7+nSIELEk8RZa0Xc/WI43M87RHxOpBnc+8rxi9wT4IhR9frb2B3ceG2oG55
	 BbgVkt6eein0A8sYJJwFVU3AfqjsbcD1qA/7oCEl4ehpV4ch8h/G9mayI8eFfHLGMT
	 5Jomv72iIwd2hpz6Ax8i05F7zR+KNB0zoIzQ/4h90NKNAQAUNkl/6qtF/qy/j8Xoh2
	 22glTK3I+yy9w==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jKTp00wwKz9rxV;
	Wed,  4 Nov 2026 16:27:20 +0100 (CET)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org
Cc: Christophe Kerello <christophe.kerello@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linusw@kernel.org>,
	Yann Gautier <yann.gautier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Mateusz Nowicki <mateusz.nowicki@posteo.net>
Subject: [PATCH v2 3/5] mmc: mmci: stm32: use the delay block above 100 MHz on stm32mp25 SoC
Date: Wed, 04 Nov 2026 15:27:21 +0000
Message-ID: <20261104152657.14909-4-mateusz.nowicki@posteo.net>
In-Reply-To: <20261104152657.14909-1-mateusz.nowicki@posteo.net>
References: <20261104152657.14909-1-mateusz.nowicki@posteo.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_072724_413562_0440BACB 
X-CRM114-Status: GOOD (  15.76  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christophe Kerello <christophe.kerello@foss.st.com>

On stm32mp25 SoC, the delay block has to be used only for an external
data frequency above 100 MHz. Skip the tuning up to that frequency, keep
50 MHz for stm32mp15 as before.

Fixes: b5c3eb385797 ("mmc: mmci: stm32: add delay block support for STM32MP25")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
[Mateusz: reworded the commit message, check dlyb before reading
min_freq, added Fixes and Cc stable]
Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---

Notes:
    On the STM32MP257F-DK (SDMMC2 kernel clock 200 MHz, eMMC in HS200 at
    100 MHz) the writes failed with I/O errors in all 9 test runs without
    this change, with sdmmc2 pins_a or pins_b and with or without NEGEDGE.
    With it all 6 runs were correct, on both pin groups.

 drivers/mmc/host/mmci_stm32_sdmmc.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
index bb058e0910ad..a50dc58336de 100644
--- a/drivers/mmc/host/mmci_stm32_sdmmc.c
+++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
@@ -75,6 +75,7 @@ struct sdmmc_dlyb {
 	void __iomem *base;
 	u32 unit;
 	u32 max;
+	unsigned int min_freq;
 	struct sdmmc_tuning_ops *ops;
 };
 
@@ -636,14 +637,16 @@ static int sdmmc_execute_tuning(struct mmc_host *mmc, u32 opcode)
 	u32 clk;
 	int ret;
 
-	if ((host->mmc->ios.timing != MMC_TIMING_UHS_SDR104 &&
-	     host->mmc->ios.timing != MMC_TIMING_MMC_HS200) ||
-	    host->mmc->actual_clock <= 50000000)
+	if (host->mmc->ios.timing != MMC_TIMING_UHS_SDR104 &&
+	    host->mmc->ios.timing != MMC_TIMING_MMC_HS200)
 		return 0;
 
 	if (!dlyb || !dlyb->base)
 		return -EINVAL;
 
+	if (host->mmc->actual_clock <= dlyb->min_freq)
+		return 0;
+
 	ret = dlyb->ops->dlyb_enable(dlyb);
 	if (ret)
 		return ret;
@@ -749,10 +752,13 @@ void sdmmc_variant_init(struct mmci_host *host)
 		return;
 
 	dlyb->base = base_dlyb;
-	if (of_device_is_compatible(np, "st,stm32mp25-sdmmc2"))
+	if (of_device_is_compatible(np, "st,stm32mp25-sdmmc2")) {
 		dlyb->ops = &dlyb_tuning_mp25_ops;
-	else
+		dlyb->min_freq = 100000000;
+	} else {
 		dlyb->ops = &dlyb_tuning_mp15_ops;
+		dlyb->min_freq = 50000000;
+	}
 
 	host->variant_priv = dlyb;
 	host->mmc_ops->execute_tuning = sdmmc_execute_tuning;
-- 
2.56.0


