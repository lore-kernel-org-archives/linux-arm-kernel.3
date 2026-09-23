Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6AAC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 10:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AoaZpaOhxJ3jsXpsRX7MsSfy3c9E4uGe0ETxzBg6RFg=; b=nydIxZIFsbf8+60hWJ5m527QiR
	syA3+XD0buUGaQu+d32/J3Mu+qXaL/qsOmH+k8YyRnnbfK1yGRVa491u171TZ2G47egtd/TPeRLuG
	ROlqq5nZwXD1IWyqCEThVa8njh+PxjFrYIBiSqxknbqNJgU2+900ecbm0PJbrbNfuJlTxbEnOPbiv
	gpxhd6vvmNfY176LBQtLNjaoJT4lxaVf2joTXkdJcwUtiy7We35TzygVpW2z5uq7ZrUHyR+iPAyS6
	aozhXryu2LxGgFR1syCXIDg5NzWmbYmiabymGmMCa79uHbL5YLGS4gKbT1iDvkF3PDsM2oDKsmv1V
	Q4LuVglQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KHM-00000007uJ5-0fW6;
	Wed, 23 Sep 2026 10:32:44 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KH7-00000007uAc-2NQT;
	Wed, 23 Sep 2026 10:32:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790159546;
	bh=988dhDBtd7g+tpgVz0uwEhaGJxjatXUHLGg6/ZegZJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KLTpos7rUO64wlQRUWMGS63EqfFNAxOjxjY+SPUd2fHlX3gSgVmrvD6wpOuHm9e/Z
	 J3O4oOVupFjMyzzXuUPv7dS7mRfEaZpgz3LWZQ1/zWoy+bguQ9QHaljA4As9bl4TtQ
	 NronXdNzZMKfXhfh1laq5VN6SmGBE7JCmQ5F8Mt1tMghwWm57iXba7q6XZVTzHKH9f
	 Qy3nfK8bzoVB1JHXWzUbdw7hFrRmNc6ym/B5jVJjYaYqBTfJPwToOm8LGql720N81v
	 TGqP6bmWqVRBZE8IWyu9pds7gOUkoW0tdBczdOwhzq3fa65zoKisSADme2T5ShAOrZ
	 BV6UkDnRIbotA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 504E317E020C;
	Wed, 23 Sep 2026 12:32:26 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com
Subject: [GIT,PULL,3/3] MediaTek SoC driver updates for v7.4
Date: Wed, 23 Sep 2026 12:32:07 +0200
Message-ID: <20260923103222.25504-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923103222.25504-1-angelogioacchino.delregno@collabora.com>
References: <20260923103222.25504-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_033229_750945_7094038A 
X-CRM114-Status: UNSURE (   7.15  )
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

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-soc-for-v7.4

for you to fetch changes up to 96c2b43b1fb305e91700f64e9f758fc140c66b83:

  soc: mediatek: mt8167-mmsys: add routes for all display paths (2026-09-21 15:10:28 +0200)

----------------------------------------------------------------
MediaTek SoC driver updates

This adds support for GPU<->SRAM regulator coupling for the
MediaTek MT8189 SoC, and introduces more MMSYS routes for
display controller pahs of the MediaTek MT8167 SoC.

----------------------------------------------------------------
Justin Yeh (1):
      soc: mediatek: mtk-regulator-coupler: Add support for MT8189

Luca Leonardo Scorcia (1):
      soc: mediatek: mt8167-mmsys: add routes for all display paths

 drivers/soc/mediatek/mt8167-mmsys.h          | 183 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----
 drivers/soc/mediatek/mtk-regulator-coupler.c |   1 +
 2 files changed, 175 insertions(+), 9 deletions(-)


