Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F56F433D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 03:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g28kMD5efYgCFJ9Q0gAXGXxFV/Ye3vRJmUQmK6/TYiA=; b=j90rL/fTgF+TmPMXhYu6oQzNDD
	UI8opjbHO36ihZiiYDB6+uhjdxfShOxxfjxSsj5UnbkXq8mh2LkS3Gho96QcsxIT6H7+WPnFFLxJR
	JPo6HJt5VqEZ9mqcl8EUnyxrgmQM+iMeQ2geJYDv7OVIjNQqs/YIERyGP1tH8QfKW7sV095XClXRD
	WhDfapvUlSW6S1Ln5DTVOrkrZz+Y9HZSC3+JHRL6mB5kbvluLZiz0vnF9AKmLMSndtke4hWZd8NrY
	M4A+4UBzc63rYYum4XcrT0ab5W3c8zhR2FR1j1b4fE27IwMBXJEJxFwmt77XmdMkpAXKL2o/B3MuB
	kLIKDJPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDDAE-00000001uJi-3orl;
	Thu, 16 Apr 2026 03:13:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDDA9-00000001uGU-3IwQ;
	Thu, 16 Apr 2026 03:13:09 +0000
X-UUID: 2c7c47ba394211f19e7563141e833ce8-20260415
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=g28kMD5efYgCFJ9Q0gAXGXxFV/Ye3vRJmUQmK6/TYiA=;
	b=ZcFbJkxs4+60gZiFA5ZQO1DSP7HNlzEMWJsqrXlLj9L0K12P386DG7pU/ZXMpBR6LR9vwqY1fnweyjwT+E4axmsxy9XLowXKDEe2fK0U6Nw7lvN2hX/RE4zqmfiEZs0496k/kGdvZOb40guiR9dFrEol9NfAWy2jZF3dmj+G8Sg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:2ea1e5d4-b2a7-404d-b221-1950a59fd5fd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:ecb07a8f-6df4-4a3d-a7a4-fbdc42d669ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2c7c47ba394211f19e7563141e833ce8-20260415
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xiaoshun.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1622385757; Wed, 15 Apr 2026 20:13:00 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 16 Apr 2026 11:12:57 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 16 Apr 2026 11:12:57 +0800
From: Xiaoshun Xu <xiaoshun.xu@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Xiaoshun Xu
	<xiaoshun.xu@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Sirius Wang <sirius.wang@mediatek.com>, Vince-wl Liu
	<vince-wl.liu@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 2/6] soc: mediatek: mtk-devapc: refine DEVAPC clock control
Date: Thu, 16 Apr 2026 11:12:05 +0800
Message-ID: <20260416031231.2932493-3-xiaoshun.xu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260416031231.2932493-1-xiaoshun.xu@mediatek.com>
References: <20260416031231.2932493-1-xiaoshun.xu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_201305_834586_4DAE4773 
X-CRM114-Status: GOOD (  13.24  )
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

Because the new DEVAPC design, DEVAPC clock is controlled by
HW power domains, the control flow of DEVAPC clock is not
necessary, but to maintain compatibility with legacy ICs,
keep this part of code.

Signed-off-by: Xiaoshun Xu <xiaoshun.xu@mediatek.com>
---
 drivers/soc/mediatek/mtk-devapc.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
index c9e1401315ad..f54e310791e5 100644
--- a/drivers/soc/mediatek/mtk-devapc.c
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -284,16 +284,28 @@ static int mtk_devapc_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	ctx->infra_clk = devm_clk_get_enabled(&pdev->dev, "devapc-infra-clock");
+	/*
+	 * The new design of DAPC clock is controlled by HW power domains,
+	 * making it unnecessary to provide the clock control driver.
+	 */
+	ctx->infra_clk = devm_clk_get_optional(&pdev->dev, "devapc-infra-clock");
 	if (IS_ERR(ctx->infra_clk)) {
-		ret = -EINVAL;
-		goto err;
+		dev_err(ctx->dev, "Cannot get devapc clock from CCF\n");
+		ctx->infra_clk = NULL;
+	} else {
+		if (clk_prepare_enable(ctx->infra_clk)) {
+			ret = -EINVAL;
+			goto err;
+		}
 	}
 
 	ret = devm_request_irq(&pdev->dev, devapc_irq, devapc_violation_irq,
-			       IRQF_TRIGGER_NONE, "devapc", ctx);
-	if (ret)
+			       IRQF_TRIGGER_NONE | IRQF_SHARED, "devapc", ctx);
+	if (ret) {
+		if (ctx->infra_clk)
+			clk_disable_unprepare(ctx->infra_clk);
 		goto err;
+	}
 
 	platform_set_drvdata(pdev, ctx);
 
@@ -311,6 +323,9 @@ static void mtk_devapc_remove(struct platform_device *pdev)
 	struct mtk_devapc_context *ctx = platform_get_drvdata(pdev);
 
 	stop_devapc(ctx);
+
+	clk_disable_unprepare(ctx->infra_clk);
+
 	iounmap(ctx->infra_base);
 }
 
-- 
2.45.2


