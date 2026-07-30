Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527EEC54FDF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 08:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T0KgRuPwYqTqOkfED0vrX1sYWNPgQ0FBaLi1ye8oN3E=; b=RiXhsxsetUjSHKNyC2mCD7CzXY
	SHSZSxOFU5UDiwkMCexEl/Q1N3ou8V6lGZSQd4k4C2fc8cFznNl00W0vLT5FAK9ozrNdIQajnbaLk
	md2tgvhmUnOhOH5c5z8QuTBKPDjAAfpXxpK4C1SShLJc75L09Fns/nb2yrbU/35oy18qZdLZTdEYw
	A+XkL2XAJBPfXGtUTkeOIorcNA4uG8JBKeNzHGeMbRRbO3Kma6aFAkpxFj0/XOrf/7t51hiQ5/Gt2
	Fdi++lR1dJxQ+cuWizPvXZnY7OU4glrXFMKiAwZaWG17288VRKNv3IUfOS7GgoYAKYQrAIiDAhAtd
	ieDvGHeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpMCS-00000009sZv-3tw3;
	Thu, 30 Jul 2026 08:33:08 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpMCM-00000009sUX-0cPR;
	Thu, 30 Jul 2026 08:33:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785400373;
	bh=ZIo8rE82+wDxPG4WdNoiRqJk8tGJQ7oEYtlWqZp0m8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WPViPcVza8171Of+ouDEGA3nRUcpyo+3f605gwtkY3mNqkKTZoreH9xLvzwkdkZcm
	 GLGwfsgzYonOdzhJY90dRCKa3gK19DdASLryBjIVyj2mT1CM3WZ0kcfzFjlcgrqBxC
	 NN59bcQ9jI1vpgQB6Fskvc7SQjc4zSOh+qrIEL2Xa8KEfC0dxwKgljTNodULqOZtD3
	 YpGjCMo7AP0ti8uHmhbXS4gxF1b8JJrcswrMMNA0wSWNj2iFMqgJnGb093DLz3gBkP
	 POOXA79xd/vJVkHy3r+A9TxhhioPDw7oGqsBUOwOmgxp3SM5cVZH14Ses8BCH6yrI/
	 YfjnraLhheLow==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6285A17E0682;
	Thu, 30 Jul 2026 10:32:53 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com
Subject: [GIT,PULL,3/3] MediaTek SoC driver updates for v7.3
Date: Thu, 30 Jul 2026 10:32:46 +0200
Message-ID: <20260730083249.13867-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730083249.13867-1-angelogioacchino.delregno@collabora.com>
References: <20260730083249.13867-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_013302_393561_24F39190 
X-CRM114-Status: UNSURE (   9.02  )
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-soc-for-v7.3

for you to fetch changes up to ec762057868d70d474a9816e9c293c2ef801c3c9:

  soc: mediatek: add missing MODULE_DEVICE_TABLE() (2026-07-30 09:41:54 +0200)

----------------------------------------------------------------
MediaTek SoC driver updates

This adds a fix for a missing error check in mtk-socinfo, and
also a missing MODULE_DEVICE_TABLE() in the mtk-dvfsrc driver.

Besides from that, this also reworks how the MMSYS tables are
specified with the macro, separating the component's hardware
instance from the actual type, resolving a prerequirement for
the restructuring of mediatek-drm.

----------------------------------------------------------------
AngeloGioacchino Del Regno (2):
      soc: mediatek: mtk-mmsys: Rework routes to specify component ID
      soc: mediatek: mtk-mmsys: Use MMSYS_ROUTE() in default routing table

Griffin Kroah-Hartman (1):
      soc: mediatek: mtk-socinfo Add error handling in devm_kasprintf()

Pengpeng Hou (1):
      soc: mediatek: add missing MODULE_DEVICE_TABLE()

 drivers/soc/mediatek/mt8167-mmsys.h |  10 ++--
 drivers/soc/mediatek/mt8173-mmsys.h |  28 +++++-----
 drivers/soc/mediatek/mt8183-mmsys.h |  14 ++---
 drivers/soc/mediatek/mt8186-mmsys.h |  22 ++++----
 drivers/soc/mediatek/mt8188-mmsys.h |  78 +++++++++++++-------------
 drivers/soc/mediatek/mt8192-mmsys.h |  20 +++----
 drivers/soc/mediatek/mt8195-mmsys.h | 181 +++++++++++++++++++++++++++++------------------------------
 drivers/soc/mediatek/mt8365-mmsys.h |  20 +++----
 drivers/soc/mediatek/mtk-dvfsrc.c   |   1 +
 drivers/soc/mediatek/mtk-mmsys.h    | 300 ++++++++++++++++++++++++++++++++++++++++++--------------------------------------------------------
 drivers/soc/mediatek/mtk-socinfo.c  |   7 ++-
 11 files changed, 321 insertions(+), 360 deletions(-)


