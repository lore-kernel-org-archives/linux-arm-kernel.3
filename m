Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87DEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 17:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hSsCm9oC5WGuQqg4Ekp2Yk8zcDXeJLTMOS//uxL8NLU=; b=gLTIGTwWj39xu69qqsviCC2gaa
	P+R7N6H3HN1EgJyhTOsP/xg35dwpa6aNjhHZl/iC5XwpFsmcF3FBIPesWqaHi2oAKVHcbgl2Dymvu
	uKCyRifixT6guu5/+0+Uw2eASJtZEtaZjdOWg2p2NwxZsyoOhI0XaNuFbr0K3u/ycrnd4iiGtdGtR
	MwiR5PNTWGgJsxw/rX7LHi62vIvfo6ysKbmfjvo6+PFt+mKBZ225mwWq6nVhAYgi5179hUXT6GXPU
	K+37Fyc+H4KsYBNgyObsBNyOUGP23gIocKn9pWQ8eSgfGXwXNuZUU3Uvxjc6cRcY5U0xPKhiwl5Lr
	nRk8ycGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetvo-00000001sLQ-01yB;
	Wed, 01 Jul 2026 12:20:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetvg-00000001rsO-07YP;
	Wed, 01 Jul 2026 12:20:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hSsCm9oC5WGuQqg4Ekp2Yk8zcDXeJLTMOS//uxL8NLU=; b=HwLwG66grSVh9S5msJW7Jz4tyX
	y96WcwzMQz8eIrZIt5ZRvDYlAgeMENopNtQdZ7zEfvatdMd1z6aEqLAlB9pUirtiHqxMvXEyc1t7c
	lKfN4MxP6b22UMAv6kMl65+MQyz+VhK3Bt6w+DFJT48tbMrWCSXDDdTD6kvORKOcMPByI/vMdafmx
	zhzF49ulL5Ffg/xkJRHc2WuQgnyaDmI1+GU/WpoLrlvMliyff1nfbm35VFYqbBl4T32GplWbNBhON
	/b+zX5tRZNtUab8NTxtN5JOkGSAVFmj7KfhqZR7CnvW9BaaiqHRsXrdw+WdcmSR4baUpcP7tgxWXV
	8F4Ar7Cg==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetvc-00000006ae8-3Yfg;
	Wed, 01 Jul 2026 12:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908431;
	bh=EOZmf0bYgCSlqzHe+EFqmI+WhvQMCCQ8OXvvWzbVQeQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IkhCODZ84HN6Iom/0BtQCukA8GGIDkvu0Zb9ql/SQKi/3JqBj/v5JLoh9vShpqJYV
	 F/njEKMNP5fwo+yLN+GhOzcWnZYsBX2uQulR/VQMYwdZz26mkOCC83RoxqsYaaQ4Xw
	 CN0OCWhewkt4MTl5e7xnOZL1tl8Ad5GVjOPCQqnSkYVhcqVlTCtzr0dPv3p0Cnm1ko
	 QRGHrK5eq3MnOQy+L2gveEKZORXHpq994GmHctZprHi8z+Zmsof4nK7kf7c0NKDHYq
	 O7mJlL+wz1oj1C8pIKQUYwPadUDbIsb+2JPeRvUc/dooqRF0+//g08S/MtuNj2lsIj
	 9mJmEQ4FkuDjA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C6EF817E1411;
	Wed,  1 Jul 2026 14:20:30 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	granquet@baylibre.com,
	rex-bc.chen@mediatek.com,
	dmitry.osipenko@collabora.com,
	ck.hu@mediatek.com,
	amergnat@baylibre.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 04/11] drm/mediatek: mtk_dp: Clarify SMC eDP/DP video unmute commands
Date: Wed,  1 Jul 2026 14:20:17 +0200
Message-ID: <20260701122024.19557-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122024.19557-1-angelogioacchino.delregno@collabora.com>
References: <20260701122024.19557-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_132033_080529_61D43EA6 
X-CRM114-Status: UNSURE (   9.74  )
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

The eDP/DP video unmute commands are not expressed as bits:
instead, in the firmware, those are defined as incremental
unsigned integer numbers: use the correct representation of
those to improve readability.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 2c738c16dafa..f551c4543f4e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -36,8 +36,8 @@
 #include "mtk_dp_reg.h"
 
 #define MTK_DP_SIP_CONTROL_AARCH32	MTK_SIP_SMC_CMD(0x523)
-#define MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE	(BIT(0) | BIT(5))
-#define MTK_DP_SIP_ATF_VIDEO_UNMUTE	BIT(5)
+#define MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE	33
+#define MTK_DP_SIP_ATF_VIDEO_UNMUTE	32
 
 #define MTK_DP_THREAD_CABLE_STATE_CHG	BIT(0)
 #define MTK_DP_THREAD_HPD_EVENT		BIT(1)
-- 
2.54.0


