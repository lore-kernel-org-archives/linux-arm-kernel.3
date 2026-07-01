Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE39C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDkFPLAITV9fY4p+ZSJhTWybcPuMdm/RGiKbVUOkP3o=; b=tvY3uL+K6Tz9RUccr0+LolZ5RF
	qGXnh21Dh1YwAt0ancteL2PNfX66CB6hnyHgY1cL6cZCPrdXwzgICY3Ixll/b6vG6U1OCaeUnHf2y
	hntCvERlk2NWC6bd1ROTTPJXgnLUaOvnJCKhm1z3y5Uq6LiNZCa4RFL41b3KP/mvAfFTGYd/ZxB0m
	ZJEchTQJmztuvBn8bF+VLRGy/dba/TmeGXC49Z4TttsDfUp1znAHRpm/kCxKfLZOf2lYiumS6sJ7a
	2TFQurV+B318ACXvIJlBHuRWtBbdJsSeUG4OY3czcBAHpoPg+R1eQfOWX0nIaiQEmNUR27kkisVqb
	HU9iUYbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetvF-00000001qig-0dCi;
	Wed, 01 Jul 2026 12:20:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetvD-00000001qaE-0kH0;
	Wed, 01 Jul 2026 12:20:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qDkFPLAITV9fY4p+ZSJhTWybcPuMdm/RGiKbVUOkP3o=; b=AQuWBxRSjxXZboyWknbwPkUReA
	tLVjWBaeWt4RQ7ormYOGWD7Ka3opBRzqdudo3o5ga7GgD5ki86c7NWrxcfyMsXE/qW30D08DkeD2Z
	MUbFWuG1Y4Du2cVKmLFVwqoeHJ86n39R531Dm30ZM9P4E2witmGA6Y5KBsi804fHLP/cr9qSz5obs
	icrjTsKyPxJMj3wH8r6gtPMXN6J7rB5Xl5dYWyeYG49Ec9ePL5J8RjRhTpqbgLaBK7PDOSrQUS7Hi
	n/e42fXbY9W6e2Xal31zMJRxIw9Tbq580jJX6CHenBdRgBzMel+8KelT0z2TRZx2sRpnlfC9C9RhZ
	ND8E9q6A==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wetv9-00000002j4b-42fb;
	Wed, 01 Jul 2026 12:20:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908402;
	bh=lCnTkuoLSs95jOyae1GDu2ZIdMgN7tYB2OyAcBoBEuQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XTFeuDcOQ5PyvS30crabtfSq7Onx49w/CsiJ+4bJXf1bmT4vurdo6zZSzGIr4BcIl
	 K0Z6UVpr5uMiQxfGjxDvfoVLE1h2IU3u8SzyD9wg/gUXuH4HGvqDN2i4SCvfOgVWDt
	 uaDYp35gj99Q8Fxu101yVw53njRScbwqFt3sy5SYzHv8yPyaBNTUPYep6P0qmQcI45
	 5ZN9SdSk+cjYbuYj0ddQ38qrOQ4q7BQwJBUPJlEDiHlFrTK3pKHtziioXdJDYj2VNG
	 gTVdwKvO06/4EiELbpom1frv8qP1q/XQTJB86rJI3Fd2vTep695sFKfudD/S5czdbA
	 tp6L2EqjqBe2g==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ED04517E0CF4;
	Wed,  1 Jul 2026 14:20:01 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH 08/10] drm/mediatek: mtk_dsi: Enable PM Runtime on probe
Date: Wed,  1 Jul 2026 14:19:48 +0200
Message-ID: <20260701121950.19454-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701121950.19454-1-angelogioacchino.delregno@collabora.com>
References: <20260701121950.19454-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_132004_332714_9DEA1C52 
X-CRM114-Status: GOOD (  11.95  )
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

Enable PM Runtime at the end of mtk_dsi_probe() so that the
mediatek-drm mtk_ddp_comp_power_on() function is able to do
pm_runtime_resume_and_get() and, analogously, the function
mtk_ddp_comp_power_off() to pm_runtime_put() for the DSI
device.

This makes sure that the power domains for the DSI IP are
turned on and off when necessary.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index fc6f846208d6..9e4e4152090e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1677,6 +1677,10 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
-- 
2.54.0


