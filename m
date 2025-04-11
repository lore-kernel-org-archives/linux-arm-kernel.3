Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5EAC369A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 10:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y4NFHcz6/icfilFQPF/X0+AmPSvyXrgoLTnp631W+9M=; b=U6xH84beNsH2+ApbiGaCd4cr4i
	Dk1Uf17ppsaXMt+yfsG8bBBxGtv50aFcArnHgXaqQzclHmokgKKdpeXz9b52vKVMezO1eHopNpitq
	I1eSaj1F4KN3luU8nOe803T3YliQYKctMYU3XaL9Pvgd/1/5bAYJUZ6n9jCP8TO6PHEgVRuV1t8C5
	oZYjRRyDWSN8L0inQUmYw9BcFZLbM+lkMOCXsnyQ4EjRxxkF+R24TfhxhCp3L7noPDyZ6ofMYwLf+
	5ZgOvIlwMYiSvkefF0jebwaldUuCbphJZEOrZkEqhRgExL0OZN5Bq+jrIWUYd6zU4VGN0UIcsm/Za
	cq9fL+aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3BU8-0000000DMFw-21ta;
	Fri, 11 Apr 2025 10:19:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3AEl-0000000D7EX-18lW
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Apr 2025 08:59:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=y4NFHcz6/icfilFQPF/X0+AmPSvyXrgoLTnp631W+9M=; b=c+4F+Oa0Sbi3MzPWU6nltp2+3W
	QtIWH20wE3Nz1lpln7fElaIZMV/atu1E14Ngc7zvaw4mLozai0sIc4E1lOdjwZnQef37dke73R+8c
	Uq9lLnBvuA6uwwRKKaEkXqxkElBa79QyjmbHDWNSY116V7sOoqki9TBTH6ZHeAejagxkrGRv4kqmR
	8wvY+Yqgz16xPofzmW0ZE+Y1I93vuICDXgUJTh0o0GeSE/6dEJYFsYSthXccxaCbiBaPeRI06XrLH
	2ttAq+KTB7DQtGoZLHeGVUkQnjmuEhojnwDt54Y8DmvjigVssNm5gP9JcOuuiqApyqubpLNIggM4F
	zWzf7Z2Q==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u3AEi-00000008zKy-0bIG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 08:59:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B72634A3CC;
	Fri, 11 Apr 2025 08:59:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B51E7C4CEE2;
	Fri, 11 Apr 2025 08:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744361977;
	bh=cd0NVpO1gJZi41yHFbMFBbhS+knn/ExfpHkC+hrSSiU=;
	h=From:To:Cc:Subject:Date:From;
	b=gG/2GKGyLnlMkAHUOSNiVc922ou4J+xfkBsa1vjwXh22TNaw4Y+Oi2dDEC4SGJwpO
	 5hzUWcMpyXqoRdFGTcqIQ/fCCrrNgBvf0YgWeTSEorxsOXLBuWu8lyqXIPLH2i+QNh
	 DEctEZs06tCvb4bQdSQryLDDRSKRb3gvwIHOIcRDMiuyc3u9WQ8pH5pulppxro5O69
	 HBhfbKHYQOwrJOfYXo2Pvkib5bdQgfRaGwB4KtENOShTdXifJ78dbddIqeRwinVapV
	 zdGEOphgI1Lt835bnO/nWdkVLbG4JEG2U8Xlt1/zBnJ7XL/hFVIjx8DCS6TgIRu9HB
	 C6DKD9vtdVrRg==
From: Arnd Bergmann <arnd@kernel.org>
To: Haibo Chen <haibo.chen@nxp.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Luke Wang <ziniu.wang_1@nxp.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Josua Mayer <josua@solid-run.com>,
	imx@lists.linux.dev,
	linux-mmc@vger.kernel.org,
	s32@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] mmc: esdhc-imx: convert to modern PM_OPS
Date: Fri, 11 Apr 2025 10:59:04 +0200
Message-Id: <20250411085932.1902662-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_095944_629803_75C276F8 
X-CRM114-Status: GOOD (  13.92  )
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

From: Arnd Bergmann <arnd@arndb.de>

Two newly added functions are unused in configurations without
power management support:

drivers/mmc/host/sdhci-esdhc-imx.c:1586:13: error: unused function 'sdhc_esdhc_tuning_save' [-Werror,-Wunused-function]
 1586 | static void sdhc_esdhc_tuning_save(struct sdhci_host *host)
      |             ^~~~~~~~~~~~~~~~~~~~~~
drivers/mmc/host/sdhci-esdhc-imx.c:1608:13: error: unused function 'sdhc_esdhc_tuning_restore' [-Werror,-Wunused-function]
 1608 | static void sdhc_esdhc_tuning_restore(struct sdhci_host *host)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~

Remove the #ifdef checks and instead use the better macros that
silently drop the unused functions when PM is disabled. This also
requires using pm_ptr() to eliminate both the runtime and pm_sleep
operations.

Fixes: 3d1eea493894 ("mmc: sdhci-esdhc-imx: Save tuning value when card stays powered in suspend")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: add pm_ptr()
---
 drivers/mmc/host/sdhci-esdhc-imx.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index 7e8addaed697..3c2e50d0260d 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -1942,7 +1942,6 @@ static void sdhci_esdhc_imx_remove(struct platform_device *pdev)
 	sdhci_pltfm_free(pdev);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int sdhci_esdhc_suspend(struct device *dev)
 {
 	struct sdhci_host *host = dev_get_drvdata(dev);
@@ -2021,9 +2020,7 @@ static int sdhci_esdhc_resume(struct device *dev)
 
 	return ret;
 }
-#endif
 
-#ifdef CONFIG_PM
 static int sdhci_esdhc_runtime_suspend(struct device *dev)
 {
 	struct sdhci_host *host = dev_get_drvdata(dev);
@@ -2103,11 +2100,10 @@ static int sdhci_esdhc_runtime_resume(struct device *dev)
 		cpu_latency_qos_remove_request(&imx_data->pm_qos_req);
 	return err;
 }
-#endif
 
 static const struct dev_pm_ops sdhci_esdhc_pmops = {
-	SET_SYSTEM_SLEEP_PM_OPS(sdhci_esdhc_suspend, sdhci_esdhc_resume)
-	SET_RUNTIME_PM_OPS(sdhci_esdhc_runtime_suspend,
+	SYSTEM_SLEEP_PM_OPS(sdhci_esdhc_suspend, sdhci_esdhc_resume)
+	RUNTIME_PM_OPS(sdhci_esdhc_runtime_suspend,
 				sdhci_esdhc_runtime_resume, NULL)
 };
 
@@ -2116,7 +2112,7 @@ static struct platform_driver sdhci_esdhc_imx_driver = {
 		.name	= "sdhci-esdhc-imx",
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = imx_esdhc_dt_ids,
-		.pm	= &sdhci_esdhc_pmops,
+		.pm	= pm_ptr(&sdhci_esdhc_pmops),
 	},
 	.probe		= sdhci_esdhc_imx_probe,
 	.remove		= sdhci_esdhc_imx_remove,
-- 
2.39.5


