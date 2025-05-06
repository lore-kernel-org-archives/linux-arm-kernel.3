Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28324C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 11:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ARuxxOia9DnD5eLftL3vB+MO/nalka1+uklU/qzR4xY=; b=R3BFW6tjCA3HXwjK1pMbjn0giM
	M/NazoxE6FfPjoaUaGGWRXq/sbBTWjydMC4Hiiurq8idHpmDe2GOs/85N7m8JGWgcIZVpOkaQRwJx
	8LthjRuueF7xn0ZYP1PfrRIrpd/JoF0bk1UkBMDcGRRcHoFAJUDPBtbOOe6Rl6bMeP6FUOaIA12Kk
	02tfOWOBq9/3ZGSk608PWrrN1otnYuMnNlv7AgkfjsZ29zEsdK2SOPrUa0Dow2xqSDmQYqDATYhxJ
	nkys6mcedexPWZyrJ0VynzeHlSFaN5H66tR6tR7GyQkCLqlgkICvFUwdGzXu7vNJE8z/PlbdI+c33
	XVFZdskA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGus-0000000Bovg-02QU;
	Tue, 06 May 2025 11:56:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCER1-0000000BKPI-1JET;
	Tue, 06 May 2025 09:17:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746523073;
	bh=ILA+Es+srywhqN6T/FxqHIcvCX3dCdoWJHezmXu6Ewo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CiHIKccNtfYIsFD9mnybHbn0/VRiEV8Kz1yRVovgMHjVkvse3uzWlXWKXwOs1Vozz
	 QoTJGdYz89zq9Bz7ArrLsgzjjt2Q0/PnGRg8x3UAlqzeNQcYSRe7xx68L9pUoZC9eM
	 Rz6Qfij7/0rEp2gG6E0KZwgKMnnkbvDcS5jhpr8TyV5RXWIidT5K9gnELEM2wtWMVo
	 wR/BIlHtzMz668hENUZkwRe8+dheSbNve+AvLXKflubmfR/TtXHifvODaGu93votM2
	 OsYLrfm2KtnFdzszMPjRLbJVoM7Dns9sZ6QzFnI9C0dbGJIpVt5UwHNfTkOtrdyuYb
	 ReMxXcW9enV1g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7EB4017E088B;
	Tue,  6 May 2025 11:17:53 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,2/2] MediaTek driver updates for v6.16
Date: Tue,  6 May 2025 11:17:33 +0200
Message-ID: <20250506091736.125733-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506091736.125733-1-angelogioacchino.delregno@collabora.com>
References: <20250506091736.125733-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_021755_494536_541DB904 
X-CRM114-Status: UNSURE (   7.69  )
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

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-soc-for-v6.16

for you to fetch changes up to 69d63d19eda7792052f5f694f154898fc00d60ae:

  soc: mediatek: mtk-dvfsrc: remove an unused variable (2025-04-24 09:15:01 +0200)

----------------------------------------------------------------
MediaTek driver updates for v6.16

This brings some cleanups to the MediaTek DVFSRC driver, commonizing
the bandwidth constraints platform data, and also adds support for
the DVFSRC hardware found in the MediaTek Dimensity 1200 MT6893 SoC.

----------------------------------------------------------------
AngeloGioacchino Del Regno (3):
      dt-bindings: soc: mediatek: dvfsrc: Add support for MT6893
      soc: mediatek: mtk-dvfsrc: Rename and move bw constraints data
      soc: mediatek: mtk-dvfsrc: Add support for Dimensity 1200 MT6893

Arnd Bergmann (1):
      soc: mediatek: mtk-dvfsrc: remove an unused variable

 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml |  1 +
 drivers/soc/mediatek/mtk-dvfsrc.c                                          | 53 +++++++++++++++++++++++++++++++++++++++++++----------
 2 files changed, 44 insertions(+), 10 deletions(-)


