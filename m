Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0079DCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 13:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1icTRSvMo+/G5L4oa5fkXlIfeoYz/jmcE6mdYdeMR8I=; b=RceSXCzrAflvO7dAqCOJoMFiNR
	TwPPfGzOEOwHEXp0RfYUDRibKjyV+QsQS8Od/kj39D2tznU7rjiE1LKwwZ45vc6DiQuOfUAXaRbpc
	64pIzVkAB0NZF3Amx1KTdmQ/26jE9HtFf96DnYD0hrMKjcmTi8oy6AM6yT3Z818XQ43J8Q2VXLoIr
	F4yCuQZbklk0E/v3SzkFAtBoQI3MKOgdZ8PAJlbf+biuFSdVZJl/K/twUW5+ys/JIutg4n/ovRHcZ
	Lalg33pMZNwnAw7rPYZak7VQp0Q4t/F6VBQPNSEmST1zqe5icUiGNCBxdlEcQfy27OxT8s8oqBO0D
	pMb3Q7cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2XE-0000000BCGn-0C5t;
	Mon, 01 Jun 2026 13:18:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2XB-0000000BCFq-2nVr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 13:18:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 33CDB40280;
	Mon,  1 Jun 2026 13:18:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF37F1F00899;
	Mon,  1 Jun 2026 13:18:23 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/2] Renesas driver updates for v7.2 (take two)
Date: Mon,  1 Jun 2026 15:18:18 +0200
Message-ID: <cover.1780319120.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.178031911driver8.git.geert+renesas@glider.be>
References: <cover.178031911driver8.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_061825_721452_ECDA1563 
X-CRM114-Status: UNSURE (   8.06  )
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

The following changes since commit 17e48e7e5f18b45fd4a9411090148aae3b74f7f3:

  soc: renesas: Convert to of_machine_get_match() (2026-05-11 09:56:17 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v7.2-tag2

for you to fetch changes up to b4d41ffa750fc3403a4076d17090589d000f13ff:

  soc: renesas: rcar-mfis: Add R-Car V4H/V4M support (2026-05-29 14:42:29 +0200)

----------------------------------------------------------------
Renesas driver updates for v7.2 (take two)

  - Identify the R-Car M3Le SoC,
  - Add Multifunctional Interface (MFIS) support for R-Car V4H and V4M.

Thanks for pulling!

----------------------------------------------------------------
Marek Vasut (1):
      soc: renesas: Identify R-Car R8A779MD M3Le SoC

Wolfram Sang (2):
      dt-bindings: soc: renesas: mfis: Add R-Car V4H/V4M support
      soc: renesas: rcar-mfis: Add R-Car V4H/V4M support

 .../soc/renesas/renesas,r8a78000-mfis.yaml         | 38 ++++++++++++++++++-
 drivers/soc/renesas/rcar-mfis.c                    | 44 +++++++++++++++++++++-
 drivers/soc/renesas/renesas-soc.c                  |  1 +
 3 files changed, 79 insertions(+), 4 deletions(-)

