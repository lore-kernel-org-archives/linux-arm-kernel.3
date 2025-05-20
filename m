Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CBFC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 11:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yVMruBjkbknzy2tiOwCMvlk3r4q1i7D7yhVNVuwmUI4=; b=Z58Fq5diDHUTuiqCr9c/TGD4rz
	wjpKCLdsycvsGwaGJiRVBhTG1XhKFWg+D22kd258Y5s1z9AucnqwK1AfhmeZQT82ycv9gtfDcdmv5
	YM1CwBg9AcR4c3ApB9EHTmQMLTG7y1SJ7AKQpqKrkkwDOq8KV5XDg6/rU8vTI1ylcz2tQSWvgPCKT
	peGjbdIjnqL9SsPIuP+BN/MXhwDM3w4bzpznwnLx/I7R6VpiLZt/KtCKw6owbiRkXZ4amgFhWNFsL
	5dWGJmItvn5vyl+ytVoB6+4vf52eb3vTSRFns8TiHj8SlwA7kAHpIdS9XR8tGmQOr5o29shodzTrX
	YtyE48Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHLUT-0000000Cihb-0Vum;
	Tue, 20 May 2025 11:50:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHLO6-0000000Ch5h-3CiP;
	Tue, 20 May 2025 11:44:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747741441;
	bh=0reCPQbdTGw1NjQ0NvjfPr/9W8uADPNGHMLSJN9cyeo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CcinnoKGIXH6RWXq0MfdR/4J1GoUl5wR6fLOhJa7D1vaee3Ulrt/mWq9niBpts65K
	 T//eWPLtHAroDs+mOm6OW8yNRfrkTT0gd4zCkshOilF40yzuRxqcIc8TGxJzXvMbPC
	 Ggs/7ezLg37ZH7RF6DNvNWHUHUk3jEJrHuixEWvRHSQJ+6iF2zP4tllIsslukHD+T3
	 HYoQ6Eo4639ISKGYk2/1OA87ISOCBLm+NZBKnqi8aq76L5Am34ep3RS/o/NKmG3gXu
	 zG2SXxZr36+bXvRLIXynwFolPF8lIIXNty01VTFVlsS0tn/jlB7IfmlZVpgxopHyKO
	 e64heN/6ynZeA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B90E917E0E2D;
	Tue, 20 May 2025 13:44:00 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,2/2] MediaTek defconfig updates for v6.16
Date: Tue, 20 May 2025 13:43:52 +0200
Message-ID: <20250520114356.1194450-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250520114356.1194450-1-angelogioacchino.delregno@collabora.com>
References: <20250520114356.1194450-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_044402_973720_208C38AE 
X-CRM114-Status: UNSURE (   8.03  )
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

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-defconfig-for-v6.16

for you to fetch changes up to 543e0ecee19ec6fe7bca894057f7f9ae063dd5a4:

  arm64: defconfig: Enable configs for MediaTek Genio EVK boards (2025-05-14 15:47:58 +0200)

----------------------------------------------------------------
MediaTek ARM64 defconfig updates for v6.16

This enables some drivers as modules to enable fully booting
some of the supported MediaTek boards;

In particular, this enables the following drivers as module:
 - PHYs for PCIe, HDMI, DSI and DisplayPort for all boards
 - MediaTek UART DMA Controller, also for all boards
 - MDP3 driver for MT8186/88/95 (Chromebooks and Genio variants)
 - Auxiliary ADC for the MT6357/58/59 PMICs found on both Genio EVK
   and Chromebooks based on designs with MT8183/86/88/92/95 SoCs
 - iTE IT5205 Type-C USB Alternate Mode Passive MUX, found
   on both Chromebooks and Genio EVKs with MT8188/95
 - Richtek RT1715 Type-C PD Controller, found on all Genio boards
 - Himax HX8279 DSI panel DriverIC and KD070FHFID015 panel, found
   on various revisions of the Genio Evaluation Kit boards.

----------------------------------------------------------------
Nícolas F. R. A. Prado (1):
      arm64: defconfig: Enable configs for MediaTek Genio EVK boards

Vignesh Raman (1):
      arm64: defconfig: mediatek: enable PHY drivers

 arch/arm64/configs/defconfig | 12 ++++++++++++
 1 file changed, 12 insertions(+)


