Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9AF8CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 09:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CNCluDpOanFg1v+YVv1UW9l5c1iZx+9+vsAQtqKL0SI=; b=2pjcVdfOzKGZXybFRZCmXCkfSM
	PFLr40ZwXEzOt/ZZwb6EVf4OWKfoAHMZ4JCpDWxp8rwJG/NxOhwB80uSbgeVqrilmEiFodKz1pTGp
	xMYr2rme1h++PCaZJiIAU895StPV81tutyXz0qmuP6xmN6ZeyS8OqYk7H0wD6fE/pKXxz8o/KTQ0J
	qiXQcBdRGLMe/ZDcl8yvKAiks8BNP4Qpi+t3pPjqURUUmOCKE5A+jJCkgb7fgfFHw3K49Sf7o70W7
	HVnygayNn/Wq9pTic/NF3wMbJxNmUuBiwUVQfQ8sRbot/I3fFg5zaTU+2i0NY10/F+ahEis65bIhD
	4hiDgcaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyhI-0000000ASf4-1t8P;
	Mon, 01 Jun 2026 09:12:36 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyhG-0000000ASdu-0fFd;
	Mon, 01 Jun 2026 09:12:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780305151;
	bh=3EBzF0o7UMrIWjYtGu04a8kA/zPPANrCK9tLqcFMPCY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c5kJ4FU1M6cLL7Ci/otmQbIOa2DZbdSPZWqYr+DSCGm7pSsw+xSUBCcMKemg9UzDC
	 G/mDvM4qmKD4Ppg1mXcC656y59QFIrsouXGv9wAF0yHdafaAYnhYseCfffYa9Eutk1
	 9maZJmu1Z6H5185nWk5aRx8zmQ25MUkDGRw5WGN08kptD9dN49S5WUbrtbL00l5J+6
	 04mYEbqHLQjU2hJpKtQYfWSFXtdEQmp9aUoP1XXIuIbi0s75Zw2hC2KJMuChAg9rU4
	 G/qrAcXL+hbv7PVPFbeNUBdIfoBENcgy7XprjZW/w8k+Uyu0DauM5Ev2Hg+29IVRJP
	 kKUc7ZyjYKR9Q==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BB0C717E0566;
	Mon,  1 Jun 2026 11:12:30 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com
Subject: [GIT,PULL,2/3] MediaTek ARM32 Device Tree updates for v7.2
Date: Mon,  1 Jun 2026 11:12:21 +0200
Message-ID: <20260601091225.5223-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601091225.5223-1-angelogioacchino.delregno@collabora.com>
References: <20260601091225.5223-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_021234_343620_4258E43B 
X-CRM114-Status: UNSURE (   7.13  )
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

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-dts32-for-v7.2

for you to fetch changes up to ba6afff1d9b70028a5fc3df2d3acbee501c20a53:

  arm: dts: mediatek: mt8135: fix pinctrl node name (2026-05-11 11:39:02 +0200)

----------------------------------------------------------------
MediaTek ARM32 DeviceTree updates

This adds support for the ARMv7 Timer node in the MT6589 SoC
and performs a couple of dtbs_check fixes in MT7623 and in
MT8135 devicetrees.

----------------------------------------------------------------
Akari Tsuyukusa (1):
      arm: dts: mediatek: mt6589: Add Arm Generic Timer node

David Lechner (3):
      arm: dts: mediatek: mt7623: fix pinctrl child node names
      arm: dts: mediatek: mt7623: fix pinctrl controller node name
      arm: dts: mediatek: mt8135: fix pinctrl node name

 arch/arm/boot/dts/mediatek/mt6589.dtsi | 11 +++++++++++
 arch/arm/boot/dts/mediatek/mt7623.dtsi | 64 ++++++++++++++++++++++++++++++++--------------------------------
 arch/arm/boot/dts/mediatek/mt8135.dtsi |  2 +-
 3 files changed, 44 insertions(+), 33 deletions(-)


