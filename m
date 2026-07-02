Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2733EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 15:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VCq0DKIZEnNBwgc/tR5jI4L3XN7R6WjMaQbpaJTi/KQ=; b=AXG+WzfenXbCeAkhamX3JVL5mJ
	ktTRtqiwGzwuh3AFgZnz4GfMHNbd8XihnX4mTvaLgDuBXpUzJrfp2163WJhwIzQrWVveLlhgoMKcg
	rphBrB+hFo+pFL9vEPo6kwgXs5dhWF/nJT2+iafe5KmL5sZ/nvuEjNSXnuUTjGtcqOheKIztHoOIa
	qS9t1v3BiYs7DFvauju7kY6kyhXxjYjUjHxVYuLR6oW0q8+ghS9ZBKuJjQ6E+hsd6R9M2NKf2ww8k
	s3fF1g3E0YapZe578AgPKNZ0hqQyF1HsLf3z0xL8Y5CvqwL3ySwYYBAixo+BR7X05RjXqj0c2f6+f
	cnaY9pGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJd5-00000004r4k-3fJf;
	Thu, 02 Jul 2026 15:47:07 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJd3-00000004r4M-0JgB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 15:47:06 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wfJd1-0004tz-C8; Thu, 02 Jul 2026 17:47:03 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller fixes for v7.2
Date: Thu,  2 Jul 2026 17:46:59 +0200
Message-ID: <20260702154659.1993315-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_084705_134060_8CC4937D 
X-CRM114-Status: UNSURE (   8.54  )
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

Dear arm-soc maintainers,

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git tags/reset-fixes-for-v7.2

for you to fetch changes up to 71827776667f4e4677a4fa806bcfb24d4b8dd9d7:

  reset: imx7: Correct polarity of MIPI CSI resets on i.MX8MQ (2026-07-01 15:08:14 +0200)

----------------------------------------------------------------
Reset controller fixes for v7.2

* Fix the SpacemiT K3 USB2 AHB reset bit location.
* Add missing COMBOPHY_RESET definition for Altera Agilex5.
* Fix the reset-sunxi initialization error path to release the
  requested memory region.
* Correct polarity of MIPI CSI resets on NXP i.MX8MQ. The corresponding
  fix in the CSI2 driver, 6d79bb8fd2aa, is already contained in v7.2-rc1.

----------------------------------------------------------------
Robby Cai (1):
      reset: imx7: Correct polarity of MIPI CSI resets on i.MX8MQ

Tanmay Kathpalia (1):
      dt-bindings: reset: altr: add COMBOPHY_RESET for Agilex5

Yixun Lan (1):
      reset: spacemit: k3: fix USB2 ahb reset

Zhao Dongdong (1):
      reset: sunxi: fix memory region leak on ioremap failure

 drivers/reset/reset-imx7.c                   | 6 ++++++
 drivers/reset/reset-sunxi.c                  | 4 +++-
 drivers/reset/spacemit/reset-spacemit-k3.c   | 2 +-
 include/dt-bindings/reset/altr,rst-mgr-s10.h | 2 +-
 4 files changed, 11 insertions(+), 3 deletions(-)

