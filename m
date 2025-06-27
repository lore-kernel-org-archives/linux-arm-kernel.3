Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6410BC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 13:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QkNdfN9OdfjH8fC9zhhuXuAXXIqRzpv9y2SEextihvI=; b=SKHaENRGR+JU9USc++V5k5w7P5
	/Dpt0uhPNbenJPHo1zkTPijwCXIHNIivOj1HXSIZCLVr7hLAPUHfp4AHrCJodPYj3BE6gNXeFBASJ
	pB/1hzTuygYT+1EaXkEn8lKhOD8nZ8hOFSgKr9uiVpwe05Blc2PvwwRpp63a5CQlXmnFablkhmO19
	/SVePajbeydpzwiOi5yBCt+FSVKWfrvmABk2S572VM053tcqLWC/EZf/NKc+8f964run/1QCmAiqY
	GWOrs8bikGW/nNsIntaVgrC1GPKws8UkC+cG0+9lFxJEWsDkvxjEoF618p1ud/M5BEJeafa/mZR9M
	zJt/sHtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV8yM-0000000Ekl4-2Bcy;
	Fri, 27 Jun 2025 13:18:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV8NY-0000000EfKf-1hVM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 12:40:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9D6BBA523A0;
	Fri, 27 Jun 2025 12:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19F53C4CEED;
	Fri, 27 Jun 2025 12:40:25 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/4] Renesas driver updates for v6.17
Date: Fri, 27 Jun 2025 14:40:17 +0200
Message-ID: <cover.1751026661.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751026657.git.geert+renesas@glider.be>
References: <cover.1751026657.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_054028_510500_E9D33041 
X-CRM114-Status: UNSURE (   7.97  )
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

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.17-tag1

for you to fetch changes up to 1cf74da68cffc91b00de7a188aca091f1b956a1f:

  soc: renesas: pwc-rzv2m: Use new GPIO line value setter callbacks (2025-06-13 11:21:53 +0200)

----------------------------------------------------------------
Renesas driver updates for v6.17

  - Initial support for the Renesas RZ/T2H (R9A09G077) and RZ/N2H
    (R9A09G087) SoCs,
  - Convert the RZ/V2M External Power Sequence Controller (PWC) driver
    to the new GPIO line value setter callbacks.

----------------------------------------------------------------
Bartosz Golaszewski (1):
      soc: renesas: pwc-rzv2m: Use new GPIO line value setter callbacks

Lad Prabhakar (1):
      soc: renesas: Add RZ/N2H (R9A09G087) config option

Thierry Bultel (1):
      soc: renesas: Add RZ/T2H (R9A09G077) config option

 drivers/soc/renesas/Kconfig     | 12 ++++++++++++
 drivers/soc/renesas/pwc-rzv2m.c |  8 +++++---
 2 files changed, 17 insertions(+), 3 deletions(-)

