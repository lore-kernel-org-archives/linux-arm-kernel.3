Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA17C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 11:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YVFEdSumyPyLjFPj1o6Mjxa9Ytzsro9GKpkffHBxyNA=; b=t6PfptGscOwhyI
	tDXoFnE5crWWJ0NV+6I3eHB4BieQ2GOxmXJ+HGn0/DeqCqIdKxpS4z7aQYvaqmEru7502PeHn+lVC
	ozg8UuIBoI4CmGbEFUs5yr4obUDO3x8EQuz6vUJrSDM7v/op28uNNmojMpgtDb1DEb9cDFFaPVkJy
	EqcHq3HwX9xSDPuh2nb6misfWXaY4rg7kXykliDtz7NmO0VTeehd04TEAeRSR2C27i/YZWTy4RHLs
	Ecp2lFM53Q40gukaRLOQ7jeR7tN2tP6PTjh51S+PAF1uGxnnmacNTmppvAC0/74ElrzIx9svWxhmK
	JtwcOTb8EGbJ4+7fFTtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thS23-0000000HEP6-3WMk;
	Mon, 10 Feb 2025 11:32:55 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thRg9-0000000HA2L-1EDK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 11:10:19 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id EB351A008F;
	Mon, 10 Feb 2025 12:10:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=YVFEdSumyPyLjFPj1o6M
	jxa9Ytzsro9GKpkffHBxyNA=; b=p0IEjtR8x70Vyp1pMMdSwYo9g8vzTByLY7Pz
	RV77Je9WlvprxH3V7VQV+llOqWdoS4AFcAxhgp/hFUJygRYwZA/3lUntm7HpKlEz
	2yLq/hBzWi5k0qhHg399/25a9wvN/bIOVH58USuWyLfo12ZVPUViWSGaYd4N9ZUA
	Fw+J4Mm1tUVRnXgVIli4Yi0S53wj2bmWvyy24wYwcrt1w8IzN5uX9y8nCOk7g6Ax
	rKWMt92owupNtqGqlKBNROY7aEwaBlQiZJjQWhczIYRJGKzt5GwQP0XHzazxBNkN
	+O7f9yKkB3R7HgzrB17SASKr/+n49Ho8q33ljRuIHFiuZOmfhHiNdWKdj1/G2GvE
	99eRBr6O9GZmBfgEbgJzfvn+snZMtzsPvbO0pwjnvlQ7GVQ25uRWZFvtXqICFV9Q
	bETdvQIAwWVL7J9/rxvKRwa+Egm54PCZtfZ0kynEaUn6Sg5E/2MucI2xtrKvTmfx
	07tsv5CM5DlZAxiui+twjyq4ZfELfFQE3wFOupDn7g/xg/NRx03yZK8DWvOENYxm
	vwgcGTx7KaUKTcO6KeRAmdW3+w5ktao+Av9DqBsPXu6L1cmH+CngiAlT8v1wacSI
	OCSJk98likYCrJEf4SvvsFGs6yb0HVYQai8zDz2d+S/FOgKKoMLTLjTHMXUlH4wk
	s7x/1Y0=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: Varshini Rajendran <varshini.rajendran@microchip.com>, Mark Brown
	<broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH for-6.14 v4 2/2] spi: atmel-quadspi: Fix unbalanced pm_runtime by using devm_ API
Date: Mon, 10 Feb 2025 12:10:07 +0100
Message-ID: <20250210111008.248929-3-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210111008.248929-1-csokas.bence@prolan.hu>
References: <20250210111008.248929-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1739185815;VERSION=7985;MC=1862294975;ID=637657;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD9485261776A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_031017_596857_EC65CDD3 
X-CRM114-Status: GOOD (  10.39  )
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
Cc: Alexander Dahl <ada@thorsis.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Fix unbalanced PM in error path of `atmel_qspi_probe()`
by using `devm_pm_runtime_*()` functions.

Reported-by: Alexander Dahl <ada@thorsis.com>
Closes: https://lore.kernel.org/linux-spi/20250110-paycheck-irregular-bcddab1276c7@thorsis.com/
Fixes: 5af42209a4d2 ("spi: atmel-quadspi: Add support for sama7g5 QSPI")
Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
 drivers/spi/atmel-quadspi.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index abdc49d9d940..17dd4dd4384c 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -1439,22 +1439,18 @@ static int atmel_qspi_probe(struct platform_device *pdev)
 
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
 	pm_runtime_use_autosuspend(&pdev->dev);
-	pm_runtime_set_active(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
-	pm_runtime_get_noresume(&pdev->dev);
+	devm_pm_runtime_set_active(&pdev->dev);
+	devm_pm_runtime_enable(&pdev->dev);
+	devm_pm_runtime_get_noresume(&pdev->dev);
 
 	err = atmel_qspi_init(aq);
 	if (err)
 		goto dma_release;
 
 	err = spi_register_controller(ctrl);
-	if (err) {
-		pm_runtime_put_noidle(&pdev->dev);
-		pm_runtime_disable(&pdev->dev);
-		pm_runtime_set_suspended(&pdev->dev);
-		pm_runtime_dont_use_autosuspend(&pdev->dev);
+	if (err)
 		goto dma_release;
-	}
+
 	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 
@@ -1533,10 +1529,6 @@ static void atmel_qspi_remove(struct platform_device *pdev)
 		 */
 		dev_warn(&pdev->dev, "Failed to resume device on remove\n");
 	}
-
-	pm_runtime_disable(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
-	pm_runtime_put_noidle(&pdev->dev);
 }
 
 static int __maybe_unused atmel_qspi_suspend(struct device *dev)
-- 
2.48.1



