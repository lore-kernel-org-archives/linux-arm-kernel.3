Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CEBC3601B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 08:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Mime-Version:Message-ID:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xjW28enweLo3dol+dSTYQ8kI7s0TOQB0jGOAzry0oMQ=; b=gsbkL2jn7aXD7kBG3J79ABkY6h
	M3ARUWXMK2umznHxVXKI7qtDCUNxHlySZDd1p6IW8UrKFp9aIgmxwH9YIbB3bznziw1uhIpfKWwiI
	fdouDsUD9q+hEaAHg0DmYKR5dURAA+wKaUbGuqtsbpMAEVFx6VSkOIOtEZiGLFhHraL35ovD4Hjti
	UKJrPesd9f5M5K5HfVec010SwcKC+sel76XHUWenaensiIp17Kff+j17gFuYZYTPuohjd9RBcggNn
	VfKH8LmsmoohLPGtRDM03bVykU/78dkxkCsaFk1732haFgh/+6MfsmOq8lD62sippE3JOEW/QBx1+
	/Su8IqwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0FWn-00000008CkH-3yCu;
	Thu, 03 Apr 2025 08:02:21 +0000
Received: from mxhk.zte.com.cn ([63.216.63.40])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0FPG-00000008BVJ-2GnO;
	Thu, 03 Apr 2025 07:54:35 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZSvC91R8Lz8R046;
	Thu,  3 Apr 2025 15:54:29 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 5337sHdV081334;
	Thu, 3 Apr 2025 15:54:17 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Thu, 3 Apr 2025 15:54:19 +0800 (CST)
Date: Thu, 3 Apr 2025 15:54:19 +0800 (CST)
X-Zmail-TransId: 2afc67ee3eabffffffffbda-4dfa7
X-Mailer: Zmail v1.0
Message-ID: <20250403155419406T5YhIJKId1FWor70EWWHG@zte.com.cn>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <chunkuang.hu@kernel.org>
Cc: <p.zabel@pengutronix.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
        <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
        <dri-devel@lists.freedesktop.org>,
        <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>,
        <tang.dongxing@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBkcm0vbWVkaWF0ZWs6IFJlcGxhY2UgY3VzdG9tIGNvbXBhcmVfZGV2IHdpdGggY29tcG9uZW50X2NvbXBhcmVfb2Y=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 5337sHdV081334
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67EE3EB4.002/4ZSvC91R8Lz8R046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_005434_733539_83831C54 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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

From: Tang Dongxing <tang.dongxing@zte.com.cn>

Remove the custom device comparison function compare_dev and replace it
with the existing kernel helper component_compare_of

Signed-off-by: Tang Dongxing <tang.dongxing@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index fa0e95dd29a0..fe97bb97e004 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -492,11 +492,6 @@ static const struct of_device_id mtk_ovl_adaptor_comp_dt_ids[] = {
 	{ /* sentinel */ }
 };

-static int compare_of(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
 static int ovl_adaptor_of_get_ddp_comp_type(struct device_node *node,
 					    enum mtk_ovl_adaptor_comp_type *ctype)
 {
@@ -567,7 +562,7 @@ static int ovl_adaptor_comp_init(struct device *dev, struct component_match **ma

 		priv->ovl_adaptor_comp[id] = &comp_pdev->dev;

-		drm_of_component_match_add(dev, match, compare_of, node);
+		drm_of_component_match_add(dev, match, component_compare_of, node);
 		dev_dbg(dev, "Adding component match for %pOF\n", node);
 	}

-- 
2.25.1

