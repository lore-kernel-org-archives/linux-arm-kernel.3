Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0253C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 08:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V+wahtu37rYLmO62gWR5OUXFxcmD57HBeeo6IGXhnmY=; b=5E4DYPWO3Rlj7ycUJXwS2HCLsU
	mdMjM6EPnUHNkOSejmeWDvDEGoXMj/OHpkDucd/bce5cRAadYtE6bbcDO5FwfD+OzwaUfTAgmQ/Ey
	kb8/TdoIe0Q5tW9CHbpzDfb8IFQHL7k7/5Fpv527eJo9cqB0rMNjHP0Niuto/ArhrZceY00DYZJvv
	gdiRixb7CGDKXlc6zboyMvYIrovkdzd990oj2zDJQ7ap0MQ2OV+JVt1V0qyP/fQzG3kXwn5BUMZCz
	ikPF/nkw50sP7LN0+PCURQIm2qGgB4DjcOec/kTh6vmR7VwcRMShpxGiRicT3M/9HiFRTDKtshZrk
	iCR3k9ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IBQ-00000007VLN-2DvS;
	Wed, 23 Sep 2026 08:18:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IBP-00000007VKs-2g9X;
	Wed, 23 Sep 2026 08:18:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=V+wahtu37rYLmO62gWR5OUXFxcmD57HBeeo6IGXhnmY=; b=ARNyx5LJmQ3oC7PuAfLw4FNtN4
	XtPiPPxobFTA13o7doDgM4FGRrcF1Y+U3dJ4Fd8+S93CEPSUa27yMamVmUm/EnWCR3WGAefcmtwL5
	t3+fLAijxQaU0ShwQUQhcx2XiOuJfvrMVEV3ai0fkV6xWp8yJtewKAcfJbl9LX4Xhfu5jZ59I81/8
	ZX2RZcSPr08CKHgiA9ixREhQ9Eu+wKosLaXbFatq6kvwTgi7sHcJ7q4hg5BVcD5TBe/DuTQzU5yeP
	7wh9n9T/l4Dp/ExJmNWTtV1KKgsLx4wwoeoY3jeIPA/5uv0si+TETQdRuT0Agdiv1+kpWVjzO/Zyy
	i5kcgrLA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9IBL-0000000EWBH-2NSQ;
	Wed, 23 Sep 2026 08:18:26 +0000
X-UUID: 530cbfaab72711f1acbe4559397dec65-20260923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=V+wahtu37rYLmO62gWR5OUXFxcmD57HBeeo6IGXhnmY=;
	b=X9O+WVQoHDSYACORjXVYMwtV0y1710uwwa5W9Fn9FiPrp/XT1I3amY+HOlm2PJQUQtgQ53HCycnwaXRam8+vF6EjHuXWscOZ9sRnzgvpjCvi2J0FCAMoOalistbYQNXw8Gl6kD1WoW29GAcuZarWwK2cJzl/6RlCva+r/gdm5Qw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:d0fa4123-c529-4ce4-87bf-756a1ec3a001,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:a60f3003-5a2a-4553-bb50-070593e932a7,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 530cbfaab72711f1acbe4559397dec65-20260923
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 750137550; Wed, 23 Sep 2026 01:18:15 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 23 Sep 2026 16:18:12 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 23 Sep 2026 16:18:11 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Arnd
 Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>, Yilong Zhou <yilong.zhou@mediatek.com>
Subject: [PATCH v10 08/10] media: mediatek: vcodec: Fix media device node number
Date: Wed, 23 Sep 2026 16:18:10 +0800
Message-ID: <20260923081810.268319-1-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_091824_293142_AFFB9B5E 
X-CRM114-Status: GOOD (  11.86  )
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

change media register device node number to a correct value.
The vfd minor is used to record the number of registered
video device nodes. The mdev_dec.devnode minor counter is
used to record the number of registered media device nodes.

Fixes: 41f03c673cb7b ("media: mediatek: vcodec: replace pr_* with dev_* for v4l2 debug message")
Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index c8d9dbdfee20..d529cc76696e 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -480,7 +480,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 			goto err_media_reg;
 		}
 
-		dev_dbg(&pdev->dev, "media registered as /dev/media%d", vfd_dec->minor);
+		dev_dbg(&pdev->dev, "media registered as /dev/media%d",
+			dev->mdev_dec.devnode->minor);
 	}
 
 	mtk_vcodec_dbgfs_init(dev, false);
-- 
2.51.0.windows.2


