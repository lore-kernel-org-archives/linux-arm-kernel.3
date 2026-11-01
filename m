Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3646A606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 06:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5FrIes1n;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BCbkyiOc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=jk+Iv7E50Op3JEPwALwZ9u6FV2ftF6XFRcZ7NgdVWFo=; b=5FrIes1nlcUPmsURvixrH8/SUK
	j9GYR8C18UhoStJr789Nl2H9FJqeLrqr7oAeuffpa5kOK1KmrbpqfpIQoaBsGtUVDxJmB6Oc+IQvR
	Ev7AWsCsSxxtYcahTSVamMZO2SXjGbD/fNMOdj7xSp8yTnO1IkhuRMTSbUUcMpRgKC7aeAAYP/VOy
	I8C8P0ek1bC+RO/UiiSpWzTUmUu5PC+oGCu7bPjP6HvU7XcuO1I1YFyaSu05qrD85Ub+2WVh5+y5P
	9ceR/APkdWQ8mfSACdc4f81kJ5Xi8S4ov95CnKKSilEytntk/U2RszciCtx3GoJvNVW4wRW62OMdy
	dCwrOo/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNPCR-0000000Dvfg-04z9;
	Sun, 01 Nov 2026 06:37:51 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNPCO-0000000DvfI-0cRM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 06:37:49 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2e9eb579c0eso10363455ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 23:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793515067; x=1794119867; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jk+Iv7E50Op3JEPwALwZ9u6FV2ftF6XFRcZ7NgdVWFo=;
        b=BCbkyiOcqrn5vCicBnbG/fhmBPbFFkf/WN5E7oOGx+O7H7ZfuvtYDVAkBG5p1oHg/U
         UizrMSHtcyDiloR0kE8GIJ1N4KMd/Z6fBn3bjX/Yhb/iI4OEhlzUZ+lLMZo33Sab780J
         BxYU54TH3WjiVD7gPC73HAQ8kEuNkI2yZkOp5xeCBgggo7qD8MdPB+DnNKmHuVw8F1aC
         Cy8DrZDmcuCypURDGRqbjdyQA5ZrHP0I/u0DqhG8Yr3EakDRvnS3e8cLDlKYHzp5aVLU
         y+D5YQLjjVJOE4Sp0rJpdULbWiSbN95840mdIcyTY88LOfJfDli+ypNwOYWlXTeeA1di
         PXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793515067; x=1794119867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jk+Iv7E50Op3JEPwALwZ9u6FV2ftF6XFRcZ7NgdVWFo=;
        b=eyMnla1L58vQHrbYHlwnJ7+sW8Tn1n1gtGtN7XcLL7WzUW1FyNS4gHktQuEVQjTcaS
         6FNAFt3G/s5sBMDRELtmbL5ztkL9BR6lBZkjO+eYVK/VixDf2AnHmJw/csrR7yixL6pj
         p3iLb4VQpmXGbAdf2SA6k+dWe6A2FONZJkD1SmK+zdOxwBPZBhzDK8BRctCDx36N9rKH
         TsdzIp+BhoJqmycehDzmPs2DKGo1AG29WgaCdidWZKMHyEobA3cUcPZZnpjuRcLnVuPY
         fgXKj3cTvJeRlv7ypwiO3JJbG9dEPl4n1yQVqD4BcGw/Zdww45tTe11KHFNBausHgQOx
         SPXA==
X-Forwarded-Encrypted: i=1; AKwUvBzpHc5f1WLD3rkLiBloSLlHjqq8AWUV814kZM+SPOd670z7Y64/ZOdtETPVydxRts1i8C0meXSDxZYR0EFu63KI@lists.infradead.org
X-Gm-Message-State: APuU4Z9hfwX8nHqLsnP0i/rTlW3Gyzt2UGAR+tNtiPbAvT5khaHXx3Sa
	mLMV7gJNgfBFdalOm6MAMHVLvVlt460vt7T5DzMdR3jVlCwabmhiuten
X-Gm-Gg: AYBFou1mT1NnXztRCaKWJT8htUVIc1PNlIEtxiE5ENplTmMIfp04z6NpWahLlT+//M8
	0FwLw/PM9rA7Ucata7gH4o5iTjyXqpdPW+xpEYWIC129iIAkpJAGCk5EQAVULMbOCqsVulXu49L
	Ndj7n1aygMY1UqbNxxR9OnJeb3hwicktNeGyLyfcX7To7cZYpFM1ls5wAaImbySRig/hANehc1k
	CqbbPU4sXnbUsdzinn4l5wVZT61gyXwo65CZVI/uL96jgmoxcV2jhWg9jb4BjLUjfDZVHMQwPBE
	2kvfyXhOIFe5IiVRgklWN++Ef/9xjXQym73YSRjcN9HBCknwHQ4+rba22/tBh8/GG7C0f1HnClS
	rZv00azvevj5/HdA1eZ3UbbWBs+DRV8dPOF2ifUEfFH3zx26WnIDb936gJefHtpGYTTXFY5Xyg8
	gB2QOHKg5k7nn+2z4F8iyx7ZrZ/BQ66JefmQ5Uz5EAcdHNOzS5MgGFAneg2DnbdtNptrcpdgN8o
	UOq+m9zaXo0mye7VT8eSQJP2uAdQ2enDDWrYpSCZC1EzucDvYhadE/LJScjr+triqNBMzNCv862
	d/zqWvGbpIc5/q/83XjxCf0ZU20JhzB5S4/E6gXwIiNs6ZXB1En6S7PQcuY+jAZ2LF8S
X-Received: by 2002:a17:90b:5807:b0:3ab:be66:ddbf with SMTP id 98e67ed59e1d1-3ae8981dd4dmr5417304a91.54.1793515066743;
        Sat, 31 Oct 2026 23:37:46 -0700 (PDT)
Received: from ubuntu24.vpn.host.chaitin.net ([124.77.157.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e2a703esm14120742a91.0.2026.10.31.23.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 23:37:46 -0700 (PDT)
From: BeaCox <0xbeac@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [RFC PATCH] mmc: tmio: disable dma_issue work before releasing DMA
Date: Sun,  1 Nov 2026 14:37:39 +0800
Message-ID: <20261101063739.89331-1-0xbeac@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_233748_195899_175C7363 
X-CRM114-Status: GOOD (  15.75  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

tmio_mmc_host_remove() drains done and delayed_reset_work, but leaves
dma_issue pending or running when it releases the DMA resources. Its
backend callback accesses the host, controller registers and DMA state.

Disable dma_issue synchronously before releasing DMA. This also rejects
late queue attempts from an interrupt handler that is still running;
cancel_work_sync() alone does not provide that guarantee.

Some DMA backends fall back to PIO before initializing dma_issue. Move
their work initialization ahead of the fallible setup so the work is
always initialized when a DMA backend is present. Skip the disable call
when no DMA backend is configured.

The analysis, patch and validation were assisted by OpenAI Codex.

Fixes: 85683fb39d9b ("mmc: sdhi: Convert from tasklet to BH workqueue")
Cc: stable@vger.kernel.org
Signed-off-by: BeaCox <0xbeac@gmail.com>
---
Testing: x86_64 COMPILE_TEST object builds with gcc 13.3 and W=1 for
tmio_mmc_core, renesas_sdhi_core, both Renesas DMA backends and
uniphier-sd. A userspace model of the extracted remove function checks
the no-DMA case and modeled late queue attempts before DMA release.
It does not simulate real IRQ/DMA concurrency or backend hardware.

No matching hardware, kernel crash trace or demonstrated unprivileged
trigger is available. Please review DMA-to-PIO fallback, probe failure
and teardown on Renesas and UniPhier. The initialization changes cover
backends that can return before setting up DMA. Other work items and
the wider IRQ teardown remain outside this patch.

 drivers/mmc/host/renesas_sdhi_sys_dmac.c | 4 ++--
 drivers/mmc/host/tmio_mmc_core.c         | 2 ++
 drivers/mmc/host/uniphier-sd.c           | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index 426308b73b..45e34d57ab 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -340,6 +340,8 @@ static void renesas_sdhi_sys_dmac_request_dma(struct tmio_mmc_host *host,
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
 
+	INIT_WORK(&host->dma_issue, renesas_sdhi_sys_dmac_issue_work_fn);
+
 	/* We can only either use DMA for both Tx and Rx or not use it at all */
 	if (!host->pdev->dev.of_node &&
 	    (!pdata->chan_priv_tx || !pdata->chan_priv_rx))
@@ -402,8 +404,6 @@ static void renesas_sdhi_sys_dmac_request_dma(struct tmio_mmc_host *host,
 			goto ebouncebuf;
 
 		init_completion(&priv->dma_priv.dma_dataend);
-		INIT_WORK(&host->dma_issue,
-			  renesas_sdhi_sys_dmac_issue_work_fn);
 	}
 
 	renesas_sdhi_sys_dmac_enable_dma(host, true);
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 775e0d9353..d0d3dd05a0 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -1272,6 +1272,8 @@ void tmio_mmc_host_remove(struct tmio_mmc_host *host)
 	dev_pm_qos_hide_latency_limit(&pdev->dev);
 
 	mmc_remove_host(mmc);
+	if (host->dma_ops)
+		disable_work_sync(&host->dma_issue);
 	cancel_work_sync(&host->done);
 	cancel_delayed_work_sync(&host->delayed_reset_work);
 	tmio_mmc_release_dma(host);
diff --git a/drivers/mmc/host/uniphier-sd.c b/drivers/mmc/host/uniphier-sd.c
index 1eae2f4b6c..cd0fdffa30 100644
--- a/drivers/mmc/host/uniphier-sd.c
+++ b/drivers/mmc/host/uniphier-sd.c
@@ -187,6 +187,8 @@ static void uniphier_sd_external_dma_request(struct tmio_mmc_host *host,
 	struct uniphier_sd_priv *priv = uniphier_sd_priv(host);
 	struct dma_chan *chan;
 
+	INIT_WORK(&host->dma_issue, uniphier_sd_external_dma_issue);
+
 	chan = dma_request_chan(mmc_dev(host->mmc), "rx-tx");
 	if (IS_ERR(chan)) {
 		dev_warn(mmc_dev(host->mmc),
@@ -198,8 +200,6 @@ static void uniphier_sd_external_dma_request(struct tmio_mmc_host *host,
 	priv->chan = chan;
 	host->chan_rx = chan;
 	host->chan_tx = chan;
-
-	INIT_WORK(&host->dma_issue, uniphier_sd_external_dma_issue);
 }
 
 static void uniphier_sd_external_dma_release(struct tmio_mmc_host *host)

base-commit: cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
-- 
2.43.0


