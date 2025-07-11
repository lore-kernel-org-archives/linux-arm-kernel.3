Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57D1C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 09:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bVvKTOoQsrseHy1n3YgWZcSb2M5PKM+oMnF1ohUH0CY=; b=ZL/l+eGwI/LBYzW6sS4jdB14Hm
	WDNEq0e42RDvGfVsjqGaxFtwaS2QzCxgQhF0A52HfQHmRD8lOZE5E2rCKbkdDrZPSd2XgksByHk7N
	naojE/wmv0NZ7Hwk4lXhn1d5sRaWO++mGbdUgeyKZNY0QU8MVYH1ijZCpEfnvJNXryaqUsi0GGVdG
	MkhPn9iR6AJrnJaVCXSqsNWIl+CPwgRlcR7e9y1owzZBmnpaHa8ykV5zU9zO0JM7MOwu5l7nnFzCZ
	Poq6hZ4uBbONBQmucFyHgAzpYocW2cTnkU4xhbrqPYJUTsOy7w+Y0VjEesqT2bOv43xG7B9GfBxgW
	06R6lbnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAHp-0000000EM5f-1uQV;
	Fri, 11 Jul 2025 09:43:21 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9Fe-0000000EAmI-141R;
	Fri, 11 Jul 2025 08:37:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752223020;
	bh=32oAzLL23cgtBdy6KHUFdoKoZ4dyr8I9KxFCxhpq180=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fmQjl9kH+goG8h/Rt4mVrlBbkMhkxNX9wCXtGxKGb5gmM/EnaBCggw41WolqtF82X
	 dPWbMGBRWShMlG6DOSbEevvy2NS9nTTMVblVAVX9w2LiN3J/w6xwUre+YuFREb2b2b
	 LE7HaFQL6R/sWf43KfRVBIdPefOD/LnXFFASdV2AKFmOqrRN7JeTiKeUZsBp3ieSaR
	 NAVcJy7QtxhZZ+0vZ0Xula5VCe9IFb8FECJq+aPUkXxPtgVCivt0dg7H5A5ubdvNzL
	 uffg6l+YTl7fEktXnqQj/w8izH9XCCsKa+ORF+r7HWAhh7ZsFxs7cZ/8IC0B8Iavdr
	 Iy0PA+H+aeU3Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 34DC717E1090;
	Fri, 11 Jul 2025 10:37:00 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,4/4] MediaTek driver updates for v6.17
Date: Fri, 11 Jul 2025 10:36:48 +0200
Message-ID: <20250711083656.33538-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250711083656.33538-1-angelogioacchino.delregno@collabora.com>
References: <20250711083656.33538-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_013702_431100_78B38721 
X-CRM114-Status: UNSURE (   6.64  )
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-soc-for-v6.17

for you to fetch changes up to 331db44e70dacfb6bf1e17d92fae7b1c9517ca6c:

  soc: mediatek: mtk-mutex: Fix confusing usage of MUTEX_MOD2 (2025-06-25 15:59:00 +0200)

----------------------------------------------------------------
MediaTek soc driver updates for v6.17

This adds a single cleanup commit for the mtk-mutex driver,
clarifying the usage of the MUTEX_MOD1, MUTEX_MOD2 registers
for applying display controller sub-component mute settings
on all MediaTek SoCs.

----------------------------------------------------------------
Jason-JH Lin (1):
      soc: mediatek: mtk-mutex: Fix confusing usage of MUTEX_MOD2

 drivers/soc/mediatek/mtk-mutex.c | 109 ++++++++++++++++++++++++++++++++++++++++++++++++++------------------------------------------------
 1 file changed, 56 insertions(+), 53 deletions(-)


