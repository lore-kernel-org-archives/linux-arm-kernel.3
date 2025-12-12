Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCDFD4336B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 03:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kcV6NEcq51kyXUtDsmy9sHqc1AYH7sK3cB59XxnrfG8=; b=cmOZK39Shx2sSLLuVCdP09b8Tc
	yitFmV/uQDOfuV9M2x+5+fWNHkoGWbGCEBoxT7C9wJhf1xM/hbDthpOkhVRE8jc7FCaWbXqw8Fch1
	ibFZiOmXMs3jfNtvKEiAi3VAT74lXL0M7a9SWvLLeqa82RLu3Ow3Ind1Z3fesx8ffF+DOMr3Evki3
	LTiyHvg0hz1AUausuDD9cLHGdx4GFRr2fyd19tI3QepQ93u3vQco285DOkbbTAO5cdGkIkULspymU
	NtrmW6Dg5aPUqCmSji2xs4RrDF1oYeDEmHjoFX58FGWT7MXuxXd1Ua/kGtGXenNjresvzU+cRrlX4
	MoSjciYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTtcf-0000000HaXM-0Hvr;
	Fri, 12 Dec 2025 03:15:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTtcZ-0000000HaTk-4BLp;
	Fri, 12 Dec 2025 03:15:09 +0000
X-UUID: c10ea3e2d70811f09f706fa2197c6ceb-20251211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=kcV6NEcq51kyXUtDsmy9sHqc1AYH7sK3cB59XxnrfG8=;
	b=spV+eO7efJ5HgDQNL/U/3IDbqbzSl38x5Acm8czmuoPIGYGMCPov3UnnWUnM/cxw8cwlp/EqXC8Y1OXkzVv4f51Z1uQCHqyjQsAsYTKw97kRy3DSevKrCJth1IYu8nkgYxm4iur64T5zk/vkjBxtNL/pX439bgLoH0Nh5D6HCv4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:673c5efe-936a-4fa0-8fdc-d6544f358841,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:c6136f28-e3a2-4f78-a442-8c73c4eb9e9d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|888|898,TC:-5,Content:0|15
	|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c10ea3e2d70811f09f706fa2197c6ceb-20251211
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <xiaoshun.xu@mediatek.corp-partner.google.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 126731295; Thu, 11 Dec 2025 20:15:04 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 12 Dec 2025 11:15:03 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Fri, 12 Dec 2025 11:15:03 +0800
From: Xiaoshun Xu <xiaoshun.xu@mediatek.corp-partner.google.com>
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
Subject: [PATCH 3/4] soc: mediatek: mtk-devapc: refine DEVAPC clock control
Date: Fri, 12 Dec 2025 11:13:44 +0800
Message-ID: <20251212031450.489128-4-xiaoshun.xu@mediatek.corp-partner.google.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251212031450.489128-1-xiaoshun.xu@mediatek.corp-partner.google.com>
References: <20251212031450.489128-1-xiaoshun.xu@mediatek.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_191508_078308_E8D32FBB 
X-CRM114-Status: GOOD (  11.55  )
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


External email : Please do not click links or open attachments until you ha=
ve verified the sender or the content.


From: "xiaoshun.xu" <xiaoshun.xu@mediatek.com>

Because the new DEVAPC design, DEVAPC clock is controlled by
HW power domains, the control flow of DEVAPC clock is not
necessary, but to maintain compatibility with legacy ICs,
keep this part of code.

Signed-off-by: xiaoshun.xu <xiaoshun.xu@mediatek.com>
---
 drivers/soc/mediatek/mtk-devapc.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-d=
evapc.c
index 6dbec4016a24..18964d82ff08 100644
--- a/drivers/soc/mediatek/mtk-devapc.c
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -359,16 +359,25 @@ static int mtk_devapc_probe(struct platform_device *p=
dev)
                goto err;
        }

-       ctx->infra_clk =3D devm_clk_get_enabled(&pdev->dev, "devapc-infra-c=
lock");
+       /*
+        * The new design of DAPC clock is controlled by HW power domains,
+        * making it unnecessary to provide the clock control driver.
+        */
+       ctx->infra_clk =3D devm_clk_get_optional(&pdev->dev, "devapc-infra-=
clock");
        if (IS_ERR(ctx->infra_clk)) {
-               ret =3D -EINVAL;
-               goto err;
+               dev_dbg(ctx->dev, "Cannot get devapc clock from CCF\n");
+               ctx->infra_clk =3D NULL;
+       } else {
+               if (clk_prepare_enable(ctx->infra_clk))
+                       return -EINVAL;
        }

        ret =3D devm_request_irq(&pdev->dev, devapc_irq, devapc_violation_i=
rq,
-                              IRQF_TRIGGER_NONE, "devapc", ctx);
-       if (ret)
+                              IRQF_TRIGGER_NONE | IRQF_SHARED, "devapc", c=
tx);
+       if (ret) {
+               clk_disable_unprepare(ctx->infra_clk);
                goto err;
+       }

        platform_set_drvdata(pdev, ctx);

@@ -387,6 +396,8 @@ static void mtk_devapc_remove(struct platform_device *p=
dev)

        stop_devapc(ctx);

+       clk_disable_unprepare(ctx->infra_clk);
+
        iounmap(ctx->base);
 }

--
2.45.2


