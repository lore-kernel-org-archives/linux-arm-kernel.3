Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7C5CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 11:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=paWnI1cJAzH8iuBjU12nKkZ6uZxEVLd3qRPiyI/Zuug=; b=TxfGPUAQ99zqY0H9SRP7/o61/j
	OYnxw1cCAt2KhLisO0Qgdtb+DG+04zGkybmSFfg8PYcbujay6JSA/SXVAbwfYek8+U3SdCJR8X7iU
	/OP4fjYWkbvFwDPJEcnkIZ1upqEsZ3oKjMQ7bd8ZiTJ5z4gLRvESyYsxMUZW8IqSpM697CE3R1rWd
	mV+s2mO6RKrtFgvLckeBToOm70rqsciaTyijHp1IxAHjit0H3AmgI2KsvC0ka6zcvik1FHjIScWfZ
	1obD0K9TClNGDlo52b93xXWuUsau8x6igF4nMOVGqnvCAsaowOLmB2L8udBM6RaKa/tYu2COuxj2c
	lYKl/GYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1jE-00000008oN9-1VJM;
	Fri, 12 Sep 2025 11:14:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1jA-00000008oLW-0kSb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 11:14:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8DD366021D;
	Fri, 12 Sep 2025 11:14:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFCCAC4CEF9;
	Fri, 12 Sep 2025 11:14:01 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas driver updates for v6.18 (take two)
Date: Fri, 12 Sep 2025 13:13:51 +0200
Message-ID: <cover.1757669914.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1757669912.git.geert+renesas@glider.be>
References: <cover.1757669912.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The following changes since commit 2da2740fb9c8e26b6b5e20d74f2ed1d49824236d:

  soc: renesas: rz-sysc: Add syscon/regmap support (2025-08-20 08:35:55 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.18-tag2

for you to fetch changes up to 5284d0b09d1bdc695256d7240915881d71997899:

  soc: renesas: Identify R-Car X5H (2025-09-11 20:21:42 +0200)

----------------------------------------------------------------
Renesas driver updates for v6.18 (take two)

  - Identify the Renesas R-Car X5H (R8A78000) SoC.

----------------------------------------------------------------
Duy Nguyen (1):
      soc: renesas: Identify R-Car X5H

 drivers/soc/renesas/Kconfig       | 12 ++++++++++++
 drivers/soc/renesas/renesas-soc.c | 12 ++++++++++++
 2 files changed, 24 insertions(+)

