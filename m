Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E75ECA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 11:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UqTH9zotbwFpLjFMvqTb+yDGgaAjxPoflc67gC6gH18=; b=jlB90+q45FJ05t17yrA/FtVXE+
	eOrUPcFtGi41wUlLyeFQlsbLaZFyVGNcVn3K+UgX6POPwP5QSfwXgIv+FIg/E2WKk0mgcPfLUxOEB
	xdiVy9CqDVak8K1AFVDsaaVyvBgxioIXFv4wrHCW3jQIF4MDcO7D4unnICUNl/coyvD0twwfZB7gw
	io8N8LfJS+6JWBkSsMB5tS5Uaa0PwOkV2gEUUfrH9wG3nKTGA0xslj2EXNLGoI+pjs3XaG4g1rNrL
	6IQs8j6WcDh5TEtvD2EnT/B0vS68PnGDdD7dJMTVCpO0UAciB8/bEMnxLozB308cma3CaMfSnDi/e
	IRpflduA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbRi-0000000BTgA-1cLn;
	Fri, 02 Oct 2026 11:28:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbRh-0000000BTfu-1qaX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 11:28:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E246409B8;
	Fri,  2 Oct 2026 11:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9221F000FF;
	Fri,  2 Oct 2026 11:28:55 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/2] Renesas driver updates for v7.4 (take two)
Date: Fri,  2 Oct 2026 13:28:39 +0200
Message-ID: <cover.1790939713.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1790939711.git.geert+renesas@glider.be>
References: <cover.1790939711.git.geert+renesas@glider.be>
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

The following changes since commit 10eeafc3e90ebbe6627a7d471b86af889d7b07e5:

  soc: renesas: rcar-rst: Add support for RZ/G2M v3.0 (2026-09-07 10:53:31 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v7.4-tag2

for you to fetch changes up to a251a759b52082627f2e78068560e29765de1ae7:

  soc: renesas: Kconfig: Enable ICU support for RZ/G3E and RZ/V2N (2026-09-29 10:01:33 +0200)

----------------------------------------------------------------
Renesas driver updates for v7.4 (take two)

  - Select core functionality that will be required for proper operation
    on RZ/G2M v3.0, RZ/G3E, and RZ/V2N.

Thanks for pulling!

----------------------------------------------------------------
Ayman Chaudhry (1):
      soc: renesas: Enable SYSC driver for r8a774a3

Lad Prabhakar (1):
      soc: renesas: Kconfig: Enable ICU support for RZ/G3E and RZ/V2N

 drivers/soc/renesas/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

