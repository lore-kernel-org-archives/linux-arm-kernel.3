Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FA1D64076
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 06:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W7qCkDiJi277CRsbGMDpiTs3LY7mUx0Vc/wlc2oMoAk=; b=rbJccRAST6ndk0BGjHtZzVSUW+
	k855KpVEK5p/oJkRPf3KM9PIElWVLRyWGAgFU5S+MPUVVtyAfbgaeJl0OOqaUid0hbuUzGrV+iqQs
	K2ixKVdBwLReyqRrDOiDVWh6rSnyehOtmjgqP5/fTcPP6x67MxsXFt5MNhP1rFYAarE6gCimllvkm
	e623Fkb0HSzn+3QGiR2s/DOz1hnKpqllimYVvOSpmoFta+qM01PfMJYw5Gb0T1NUrP6u3H+gncbDK
	RPG1BvKs5jLmOyPEI0AmUA15zjeRlLFQG564mPjPUflxrAASUmRkndlOICbsErMeRs9NQiRGSqhkJ
	dmnKrWhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVl7c-00000006F9j-0RfZ;
	Wed, 17 Dec 2025 06:34:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVl7U-00000006F4Z-3hvl;
	Wed, 17 Dec 2025 06:34:45 +0000
X-UUID: 77c4a9e4db1211f0a52f393f94899d25-20251216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=W7qCkDiJi277CRsbGMDpiTs3LY7mUx0Vc/wlc2oMoAk=;
	b=YPyJXAW/C96FKJcyHedPPFGMHNqlxq4tbrOgzTwO2JUJnNk5s63x0DleU0zO+myeoMJwn75FKl/jeQo8IPaSKhbsqtBqPyZYj0pVYnhcvv6gffuLTdls0Zvc02MFECW9rwaJoM6LgG2/Lzf3nbiVtuEHmYqMKVbOsIJznkyccg4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:5e26f6d5-189e-4104-b718-7d65b1da73b2,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:1db348aa-6421-45b1-b8b8-e73e3dc9a90f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|888|898,TC:-5,Content:0|15
	|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 77c4a9e4db1211f0a52f393f94899d25-20251216
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <xiaoshun.xu@mediatek.corp-partner.google.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 64648187; Tue, 16 Dec 2025 23:34:41 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 14:34:38 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 14:34:38 +0800
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
Subject: [PATCH v2 3/4] soc: mediatek: mtk-devapc: refine devapc clock control
Date: Wed, 17 Dec 2025 14:34:12 +0800
Message-ID: <20251217063429.1157084-4-xiaoshun.xu@mediatek.corp-partner.google.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251217063429.1157084-1-xiaoshun.xu@mediatek.corp-partner.google.com>
References: <20251217063429.1157084-1-xiaoshun.xu@mediatek.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_223444_935930_60E1E214 
X-CRM114-Status: GOOD (  12.31  )
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


From: Xiaoshun Xu <xiaoshun.xu@mediatek.com>

Because the new devapc design, devapc clock is controlled by
HW power domains, the control flow of devapc clock is not
necessary, but to maintain compatibility with legacy ICs,
keep this part of code.

Signed-off-by: Xiaoshun Xu <xiaoshun.xu@mediatek.com>
---
 drivers/soc/mediatek/mtk-devapc.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-d=
evapc.c
index b91df4cf7a61..61628b941d92 100644
--- a/drivers/soc/mediatek/mtk-devapc.c
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -373,16 +373,27 @@ static int mtk_devapc_probe(struct platform_device *p=
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
+               dev_err(ctx->dev, "Cannot get devapc clock from CCF\n");
+               ctx->infra_clk =3D NULL;
+       } else {
+               if (clk_prepare_enable(ctx->infra_clk)) {
+                       ret =3D -EINVAL;
+                       goto err;
+               }
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

@@ -401,6 +412,8 @@ static void mtk_devapc_remove(struct platform_device *p=
dev)

        stop_devapc(ctx);

+       clk_disable_unprepare(ctx->infra_clk);
+
        iounmap(ctx->base);
 }

--
2.45.2


