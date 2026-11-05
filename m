Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1079B606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 17:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KxCDMcJR;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=E1FcOr8Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eavNaDX6RIZNrQjZVF94tYLxdb7VwfBrEfcmK23egqg=; b=KxCDMcJR/w+MLX
	f/qEEYPKFdnj0MPIP47ac+wRjdv9nCTopcjAO5Dgji979wduywGh7+sGJ6mKpyAW0yjawC3jV4WEw
	mB5UC74HZn4FH/o+xVfbZJuT6qYu/v2+D+ICCEN6xodCkpBRdeTDO9H9Urnaya8PMHg3+iZ/DECGt
	0jgHElb4msH3xycVXjI+d+MgcUPbYJfo/4hYpbN68T7S5SQfx75DT9lzJqXRF44WmvkvTPKi2qKOL
	poIsq7b1PVCDZ+ZdVo1oVi4oK56/M/pN2llykytnow3Tmy11PtlpDJPsJxNIQ/FhrDxz/rnortz53
	bfxivioUyv1fy4TfSTGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP12b-00000009pGU-2KeU;
	Thu, 05 Nov 2026 17:14:21 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP11H-00000009oc8-1MS6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 17:13:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D702A1A0C8F
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 17:12:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A64505FF43;
	Thu,  5 Nov 2026 17:12:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7DEDD10329289;
	Thu,  5 Nov 2026 18:12:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793898776; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=eavNaDX6RIZNrQjZVF94tYLxdb7VwfBrEfcmK23egqg=;
	b=E1FcOr8Q7cyVmUeRX5Hkju6/kQttDjE4GnpiEwm3/3VzWvc6Z5FwJE3EhMbshf50fohqON
	44XGD3I3dwXL3YrSAZqQzFRaJsct9BtxnCgzIPcmt9qzEWoEwRnhwllRbKD0MqTtzSwU9/
	np9EFGi7XJHbto19Flk1SCpr1ISedQ+H+eQQ1aUmtKbhqA3GD/iWt6HPLnYHSNXtKB8Tir
	feEqsIIC1WUNIaKs/B7j6je9cXiyMIUvM7IKVPpsK5P2xzV3XsqjmJwRLS0zH44C/VmWyO
	AIwtas7rthTuzlZFoEqarTHxvdjuTu0FkueYvAlcVfNmccS/cZDld5sgbfFJEg==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 06/12] mtd: nand: mtk: Remove #ifdef guards for PM related functions
Date: Thu,  5 Nov 2026 18:11:52 +0100
Message-ID: <20261105171158.399247-7-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105171158.399247-1-paul.cercueil@bootlin.com>
References: <20261105171158.399247-1-paul.cercueil@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_091301_646419_6D9D4EF5 
X-CRM114-Status: GOOD (  15.40  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use the new PM macros for the suspend and resume functions to be
automatically dropped by the compiler when CONFIG_PM or
CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
---
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org

 drivers/mtd/nand/ecc-mtk.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/ecc-mtk.c b/drivers/mtd/nand/ecc-mtk.c
index 66f0985ef7cd..6f210ba935ad 100644
--- a/drivers/mtd/nand/ecc-mtk.c
+++ b/drivers/mtd/nand/ecc-mtk.c
@@ -588,7 +588,6 @@ static int mtk_ecc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int mtk_ecc_suspend(struct device *dev)
 {
 	struct mtk_ecc *ecc = dev_get_drvdata(dev);
@@ -612,8 +611,7 @@ static int mtk_ecc_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(mtk_ecc_pm_ops, mtk_ecc_suspend, mtk_ecc_resume);
-#endif
+static DEFINE_SIMPLE_DEV_PM_OPS(mtk_ecc_pm_ops, mtk_ecc_suspend, mtk_ecc_resume);
 
 MODULE_DEVICE_TABLE(of, mtk_ecc_dt_match);
 
@@ -622,9 +620,7 @@ static struct platform_driver mtk_ecc_driver = {
 	.driver = {
 		.name  = "mtk-ecc",
 		.of_match_table = mtk_ecc_dt_match,
-#ifdef CONFIG_PM_SLEEP
-		.pm = &mtk_ecc_pm_ops,
-#endif
+		.pm = pm_sleep_ptr(&mtk_ecc_pm_ops),
 	},
 };
 
-- 
2.47.3


