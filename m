Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA59C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HRdhXoRausMErXD1uUyEUNMLboo3vUAZBmq3W7oFtnU=; b=BAI4Tz44Sc0QGO2P5rj8JN8p5r
	Ud2pZHRhZCJUhdV/XZs7mWUsLbPbxhd4uTa1qzedPmPPM/mJ5aug+YsYgwrCZlTN9j7b+xHbzDWlY
	yqopSR/e0OgCh7S0YXI1ccFEeyjIg2AWazQBcQhBCTm6b9yms2ncQfk3qR/QNKTN3vhg+uYHfBiwA
	mMd1SiIB97W/uGeaUvHtMymMDP9NSN+IsnxsLsicF3F3ZS/jIelf7+vbsi6/5UcVqGK9MY7wFrmeG
	PZc5S7Gnk4Koo92J/RNvsEfRpxZsJnlm3GId9uzIKOeflfoCuYFM5grEANxYqeMN3yicc6Rwx1rdN
	gK2oOYLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetur-00000001pcX-0Gp5;
	Wed, 01 Jul 2026 12:19:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetup-00000001pUL-0TxW;
	Wed, 01 Jul 2026 12:19:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=HRdhXoRausMErXD1uUyEUNMLboo3vUAZBmq3W7oFtnU=; b=AO8hFZ18nSboML86DqMiWiZkWM
	a5VNkDKyzfdsdKsNON7Nrn1PzkMwhmnTDf1D0TkaKMtOCvXbRZuD/WwPvhpSc1O+qJJjIk+01D6Ll
	5EX7arEV3G4MTEeNcoh0Ndn/44wToyJ8um8vADIxq2CqPykOutu4tEyTsyWRWQGKxfZrBNgQLuWVo
	zvcjBTNAVBu9M/jQk/TtbAzDh94fuyGrrtInPxWtRmDe/rqpvx4Q8L2wNNH3sfdqPfqF6kpNiT6vN
	ZL1lE8KMKhkt5llJOA9XYZllxFT1MQLsPvzDv+Ww/8ErKTZM7qyVntHNWUr8L6aSreH7wRTM8DF3/
	X/msvuTw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wetum-00000002ivd-1RTv;
	Wed, 01 Jul 2026 12:19:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908379;
	bh=7w5HNsCWhabDWKMBxO8hdeRtxDEiv7lhKo0ruQE4xqI=;
	h=From:To:Cc:Subject:Date:From;
	b=U+CcAylehC/wE3/SWoO/3Kt+ptI+ce0aPFXmkACIMn7YAbNJyBHO5uVysHxf8A8r9
	 Dt047uh4gXiTDx5ctVDm3zVY67ZPl93XkN4nN2Yuo+Dpkb/uayHtgBtXS1Snjd9ODP
	 0Zcligy0f1c1gZCtg3th26E50Cri7OG5EpB6H7iZByog8HysCS4D9F5RbzTsBumqtO
	 +6XOp8UgdMX+wu4U9Bk1i/OWftLE4zJP8KHn4RXOWoAj/0G0PRYGUhAQQI97kYHnTY
	 EI6HiBjAgBaNyavLdc7MbIipp1UeThQ0c8op2tbxgTY/qFR3vfSDj/vdFiKj6Iv/zE
	 YM+OglZHCgeuA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5A8E517E0909;
	Wed,  1 Jul 2026 14:19:38 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: p.zabel@pengutronix.de,
	chunkuang.hu@kernel.org,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	granquet@baylibre.com,
	justin.yeh@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 0/2] MediaTek MT8195 HDMI PHY Fixes
Date: Wed,  1 Jul 2026 14:19:34 +0200
Message-ID: <20260701121936.19407-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_131940_489807_FDECDF20 
X-CRM114-Status: UNSURE (   8.34  )
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

This series adds two fixes for the MT8195-class HDMI PHY, found in
MT8195, MT8188 and Genio variants.

This is fixing PLL calculation, and TMDS clock dividers, to achieve
all of the modes requiring data rates higher than 3.4Gbps, with the
successfully tested target being 3840x2160@60Hz.

This was tested on MT8395 MediaTek Genio 1200, Radxa NIO-12L and on
MT8390 MediaTek Genio 700, with 3 different HDMI displays (two TVs
and a 4k LG workstation display).

AngeloGioacchino Del Regno (2):
  phy: mediatek: phy-mtk-hdmi-mt8195: Fix PLL calc divisor overflow
  phy: mediatek: phy-mtk-hdmi-mt8195: Fix TMDS clk bit ratio setting

 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 4 ++--
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.54.0


