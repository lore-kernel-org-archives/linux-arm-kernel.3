Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816C8D3409B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 16:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EeJQd2Zwsu6rTUzVeCo/Aa9tstJpB33YcC45CUcNTmQ=; b=AunY0yEa2nMKB+uMPpFqg672AU
	qrDySVbDlCnNP885qu22bmH9T4YWU6ymT1R7Ugjmaj2OSNL9BWnc5JgQ2B8JqDwoJA5IoXxzlVxn6
	flMHEPcGGzIhqMIJdcgFCj3gX+8+Q0cAAnN8v9r1GB9JD13lC+C3tWZD1KGQkqkBUpzBquF1f/4P8
	FkNUctnJOZNrypnOSRUWCOCQ2dhPfGuys/jXIrto8ouSCFXs18gN1TxSeHb2anPenP3wqdLcmdiLW
	dSV0mIBTVPDZyzMcJhBBdwJNX3F4RugMCmbLpiiejL5WhEWJj4BJst/IY8ketA1uFRgO3u/arzIeM
	pt1f6B8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklct-0000000EcI1-1m2X;
	Tue, 27 Jan 2026 16:09:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklck-0000000Ec60-2gLM;
	Tue, 27 Jan 2026 16:09:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=EeJQd2Zwsu6rTUzVeCo/Aa9tstJpB33YcC45CUcNTmQ=; b=XXFvdfgfR2lQQy7QwUPpGrgx4t
	kdnYfgm7ybnuUsgQwBp8EGVIjLIS8LapfuTPgAZdn1RZp1VaCyCr9qsC1/BF3u5c5RZps+2Vrho6b
	FyRB5JUQCimeQ8/SMdYLS320va7BGqdcHj8Q7FQrq2RcNG8L/80TyrVrLK5vFLrfB1GgOdJrflBfm
	dMv0X7I0bxg9r9MMMr629HXhQ0mL8alnljaXqGMybGO7TyYT8JUBgXrl0xjZiPOIqQ1vaKtQBA6/5
	WRJEfxejI9RzWKzk0y4Hw9MicAHZVZDDKDJ3BSRLpBhqQp8sIO1J+Fr9UQwR/V76VEy62VkV+k+ed
	u30w8oZQ==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklcg-00000007C6o-3I5v;
	Tue, 27 Jan 2026 16:09:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769530129;
	bh=rwMMsbUCdGGDTM0SilCBE6mODEWndNITn0aSniMBH7Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=h3al06UtLjaUn79ImAhJtV0zYUAoMwzayJfWsmPJgSagFWxCHXLdLz3efdH4/XWLk
	 7uZuw991fFkXex1f0RisZD1TRHQa+dV0qHeYcclB+kChVIGGJlDerhks4SJI6nHDeS
	 85wBRnqVnCh1vibpLdLfhwGvEotGCuoT6uv0BQw1CurjDgM6j78F+c1e2XX0HTFMjH
	 wiDoTsnE26vPBn77fsgEdYcW1g4TUwKp4vS5wwsS6qCeyCBYpXinpQ6uLxyJH+uZTt
	 bytwbU9ByB9GRMvhGmww16UFd0dRKkE328meuPswTWlKuUsX35GAjNMIzURB/ZkjDY
	 RtGlUFP2o+2Zg==
Received: from jupiter.universe (dyndsl-091-248-210-071.ewe-ip-backbone.de [91.248.210.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7A07C17E1352;
	Tue, 27 Jan 2026 17:08:49 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 3606048004E; Tue, 27 Jan 2026 17:08:49 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 27 Jan 2026 17:08:23 +0100
Subject: [PATCH 03/10] ASoC: rockchip: spdif: Fully convert to device
 managed resources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-3-a7c547072bbb@collabora.com>
References: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-0-a7c547072bbb@collabora.com>
In-Reply-To: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-0-a7c547072bbb@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2785;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=rwMMsbUCdGGDTM0SilCBE6mODEWndNITn0aSniMBH7Q=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGl44xCDP4Q1D/C1Aex7BXRN+YdP808viyEEO
 8NwXFzj/wBiJ4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpeOMQAAoJENju1/PI
 O/qaRAgQAKj7uIAtpap/z7biJwIV0Ge4fdSYeGpOdj/U2CEHt0cVvGZN4/EMj/DKAOdJdAoJoBn
 FQ/OKZ2IBmXHwpRaXbNqMCtATg1N2zvPYCLeLdQGK8gxXujQEdA8O0NvQUyG0EGtPwSeD4WrtvR
 wwJfD2LU0B2ZPTpT2BVhw17Wsti5nP4NZS3J6M6wJLyi4qRJMNwnvoHbgHFA2Z6gZbInTze49mt
 hfdq7YuHdsfGSi/W1qo8CCGdqPXbWqRp4V44NeQdGyP5rzXV9duvMSjTcxCutES/rzYttyPePyb
 GK0LDvRMOsLt3VMhM844e81JqZA+OJHLk8AuG+xueq4uFNyaTwHlC1N3A9ieP3lVcd11xWrc+kR
 psACCEFPhFfw/AewcSCkhVvHMdjngfsk4IXkAEfcD2CxPhXSShIhvjWICRq6DHLkPSbmhUjML8Q
 db9hTo1tDMeAiGj8GYhw2+IZLNF/ShGjLaMWuWXXMOCx0gGxlf1MnfqWtp4oOy7ceimSW18/S5K
 ASyOrRenNcTaPUcWZnD5Q3FyKv+i3Tx7IP+wUA9nYWUndghwGmkhbF3NPYjueY+6FQmOmXovCMU
 kYwoPAS7NeiGKH69NOa/bLvmyY4FDOvM9zDh0gB6qY2SBbEclJvUaNdmyr3Y0aYIdEYm/myGu/j
 D9FRN58h/H3hnHWbq7TYsWA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_160859_014290_C6399E08 
X-CRM114-Status: GOOD (  16.94  )
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

This driver mixes device managed resources with unmanaged ones
and (as a lot of them do) gets the order wrong resulting in
potential race condition problems at module removal time. Let's
go to full device managed resources to cleanup the code and get
rid of the potential race condition.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 sound/soc/rockchip/rockchip_spdif.c | 37 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 331a23d5173f..841ef499ed7f 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -257,6 +257,14 @@ static const struct regmap_config rk_spdif_regmap_config = {
 	.cache_type = REGCACHE_FLAT,
 };
 
+static void rk_spdif_suspend(void *data)
+{
+	struct device *dev = data;
+
+	if (!pm_runtime_status_suspended(dev))
+		rk_spdif_runtime_suspend(dev);
+}
+
 static int rk_spdif_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -311,11 +319,16 @@ static int rk_spdif_probe(struct platform_device *pdev)
 	spdif->dev = &pdev->dev;
 	dev_set_drvdata(&pdev->dev, spdif);
 
-	pm_runtime_enable(&pdev->dev);
+	ret = devm_add_action_or_reset(&pdev->dev, rk_spdif_suspend, &pdev->dev);
+	if (ret)
+		return ret;
+
+	devm_pm_runtime_enable(&pdev->dev);
+
 	if (!pm_runtime_enabled(&pdev->dev)) {
 		ret = rk_spdif_runtime_resume(&pdev->dev);
 		if (ret)
-			goto err_pm_runtime;
+			return ret;
 	}
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
@@ -323,31 +336,16 @@ static int rk_spdif_probe(struct platform_device *pdev)
 					      &rk_spdif_dai, 1);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register DAI\n");
-		goto err_pm_suspend;
+		return ret;
 	}
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register PCM\n");
-		goto err_pm_suspend;
+		return ret;
 	}
 
 	return 0;
-
-err_pm_suspend:
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		rk_spdif_runtime_suspend(&pdev->dev);
-err_pm_runtime:
-	pm_runtime_disable(&pdev->dev);
-
-	return ret;
-}
-
-static void rk_spdif_remove(struct platform_device *pdev)
-{
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		rk_spdif_runtime_suspend(&pdev->dev);
 }
 
 static const struct dev_pm_ops rk_spdif_pm_ops = {
@@ -379,7 +377,6 @@ MODULE_DEVICE_TABLE(of, rk_spdif_match);
 
 static struct platform_driver rk_spdif_driver = {
 	.probe = rk_spdif_probe,
-	.remove = rk_spdif_remove,
 	.driver = {
 		.name = "rockchip-spdif",
 		.of_match_table = rk_spdif_match,

-- 
2.51.0


