Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732D5D132B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 11:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dwoXow54u06CVIvSsGRRqSvWrbRYrQCG24cFC8sy2Xw=; b=giwmSfLXdj6jL+W9/33hVezFyU
	HpI7anUCfjmdF4Hk2vWqzg3/D5WNPY2MuU2Eca7dpggeHbpmHB0/OoxU/T/nfPpzC4eBkpwfC1niP
	cCVxdXJQ3Fl9rcYpq8h65ixVm0i7nlX7E0fpQfzggGVkfvRpgDW6hdUKkVfoRzc2SwltRWen2Q/sQ
	X8OYnZ6rfKwTLTVQ+mTG8cwerLZiuzvVdN7LjkNj6afd0r9bHEcfMYf3nMXMZo7ODar+vRrRXlJlJ
	+J316wx/i2Ax1aE5mg3Ua1TwPZ7hIxfc/va/3NO74LAT3hadsM3XI3eBLHPKbwiWHLZQhF6a5vAtZ
	QUtwcV2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vQK-0000000DZ6X-2FAs;
	Mon, 04 Nov 2024 11:39:08 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vEF-0000000DVoy-3hvz;
	Mon, 04 Nov 2024 11:26:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730719598;
	bh=bF7hHsF3nFkMIP/dp3aAmjmr+zxCA1jW5rykrtwikWY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WA0LE1LvkSo8o5z422v06LGKzz6D6c08A0MdbOyw99zKPEXCeOPFGTeQ3FbkNe1n2
	 wQos9MoF71wgcquR4rknI8mX5OOw2GJ3DCWhp/fS/u5jq1eJFNYQ7PvkQrXDTQTF6/
	 9yjF0L7JcEL+DwZal6250r//yABrQ7DF8qZVlkrAbChISGWyLsnL1rsZQe0rD1QtcD
	 nV/xR1J6nSk48u1f0mSokRYhM2wSf+l6pZnPmmBhas8EredjYRpI0v13WWAqKQqlfT
	 E84JXYPDXJJ+nCIuPrMdKp2xIpi20unIia+Fx05zbs8/e40WklBjItOxBkwUoHJaH1
	 /A2dqfwrkvpAg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D8CBA17E3600;
	Mon,  4 Nov 2024 12:26:37 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,2/2] MediaTek driver updates for v6.13
Date: Mon,  4 Nov 2024 12:26:21 +0100
Message-ID: <20241104112625.161365-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241104112625.161365-1-angelogioacchino.delregno@collabora.com>
References: <20241104112625.161365-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_032640_112893_925AC4A6 
X-CRM114-Status: GOOD (  11.27  )
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

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-soc-for-v6.13

for you to fetch changes up to a1643ae9b3e3364edbb6cf285c5f2cf5d60336e6:

  soc: mediatek: mtk-svs: Call of_node_put(np) only once in svs_get_subsys_device() (2024-10-21 16:00:52 +0200)

----------------------------------------------------------------
MediaTek soc driver updates for v6.13

This adds support for the MT8188 SoC in the MediaTek Regulator
Coupler driver, allowing stable GPU DVFS on this chip;

Moreover, this adds a new MediaTek DVFS Resource Collector (DVFSRC)
driver, allowing to enable other drivers (interconnect, regulator)
which can now communicate with the DVFSRC hardware.

Last but not least, this includes some cleanups for the CMDQ Helper
and MediaTek SVS drivers

----------------------------------------------------------------
AngeloGioacchino Del Regno (4):
      dt-bindings: soc: mediatek: Add DVFSRC bindings for MT8183 and MT8195
      soc: mediatek: Add MediaTek DVFS Resource Collector (DVFSRC) driver
      soc: mediatek: mtk-cmdq: Move mask build and append to function
      soc: mediatek: mtk-cmdq: Move cmdq_instruction init to declaration

Markus Elfring (1):
      soc: mediatek: mtk-svs: Call of_node_put(np) only once in svs_get_subsys_device()

Pablo Sun (1):
      soc: mediatek: mediatek-regulator-coupler: Support mt8188

 .../soc/mediatek/mediatek,mt8183-dvfsrc.yaml       |  83 ++++
 drivers/soc/mediatek/Kconfig                       |  11 +
 drivers/soc/mediatek/Makefile                      |   1 +
 drivers/soc/mediatek/mtk-cmdq-helper.c             | 230 ++++-----
 drivers/soc/mediatek/mtk-dvfsrc.c                  | 545 +++++++++++++++++++++
 drivers/soc/mediatek/mtk-regulator-coupler.c       |   1 +
 drivers/soc/mediatek/mtk-svs.c                     |   4 +-
 include/linux/soc/mediatek/dvfsrc.h                |  36 ++
 include/linux/soc/mediatek/mtk_sip_svc.h           |   3 +
 9 files changed, 787 insertions(+), 127 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml
 create mode 100644 drivers/soc/mediatek/mtk-dvfsrc.c
 create mode 100644 include/linux/soc/mediatek/dvfsrc.h


