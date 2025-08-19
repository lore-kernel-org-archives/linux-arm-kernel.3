Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74D4CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 11:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Mime-Version:Message-ID:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bwiBUpL7y2Xr50HF92OTycT4FvAaYF9GSXkFq4BZNg8=; b=FGa0jnkGrppy5ZP9KZWSCfj+1V
	Yrw8f8L78VJrB+zbc3f+Gimg5d0YLMY8a5FBhxDabQL/QgOrYcs7xtBO+yStEW11WDF1lSh5PmKJR
	oFwXQqZ0+TGc2QKN6Ce0GpjP7YnxEhcqOPWKMIvDgQoQfGSZfJ4v1mn8aFo7U+3FRCSJPtxJ4uQy3
	NlvWYzF2duabEWWLCTffwMZbxiw44/ZZ724c1glRGCb4PIxXGkI4ey7zBCiASKi0yROL1vHI4ilyu
	pq1NkxNqK60c2H/V367xEWZKwQnJTdo+tcW45hmjh9mHjjqFW+6eOMPD4XOWZG5zVa8E81OZLipo9
	yV7t3+4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKKw-0000000AFPE-3ZHW;
	Tue, 19 Aug 2025 11:17:06 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIbI-00000009x0R-136J;
	Tue, 19 Aug 2025 09:25:54 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4c5khn5n3Mz6G42S;
	Tue, 19 Aug 2025 17:25:45 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl2.zte.com.cn with SMTP id 57J9POZx082163;
	Tue, 19 Aug 2025 17:25:24 +0800 (+08)
	(envelope-from zhang.enpei@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 19 Aug 2025 17:25:26 +0800 (CST)
Date: Tue, 19 Aug 2025 17:25:26 +0800 (CST)
X-Zmail-TransId: 2afc68a44306ffffffffbba-845b4
X-Mailer: Zmail v1.0
Message-ID: <20250819172526465q0DlaK4mMznBXD0SIjXKm@zte.com.cn>
Mime-Version: 1.0
From: <zhang.enpei@zte.com.cn>
To: <chunkuang.hu@kernel.org>
Cc: <p.zabel@pengutronix.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
        <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
        <dri-devel@lists.freedesktop.org>,
        <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: =?UTF-8?B?W1BBVENIXSBkcm0vbWVkaWF0ZWs6IG10a19kcm1fZHJ2OiBzd2l0Y2ggdG8gdXNlIGRldm1fa21lbWR1cF9hcnJheSgp?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 57J9POZx082163
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: zhang.enpei@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.133 unknown Tue, 19 Aug 2025 17:25:45 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 68A44319.002/4c5khn5n3Mz6G42S
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_022552_444125_52BF4513 
X-CRM114-Status: UNSURE (   7.76  )
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

From: Zhang Enpei <zhang.enpei@zte.com.cn>

Use devm_kmemdup_array() to avoid multiplication or possible overflows.

Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index d5e6bab36414..e700c0f0a3a2 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -1003,7 +1003,8 @@ static int mtk_drm_of_ddp_path_build_one(struct device *dev, enum mtk_crtc_path
                return -EINVAL;
        }

-       final_ddp_path = devm_kmemdup(dev, temp_path, idx * sizeof(temp_path[0]), GFP_KERNEL);
+       final_ddp_path = devm_kmemdup_array(dev, temp_path, idx,
+                                           sizeof(*temp_path), GFP_KERNEL);
        if (!final_ddp_path)
                return -ENOMEM;

-- 
2.25.1

