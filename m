Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD09210F3DCE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 12:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2BiDtrGH/T3EG5g0d6r/VXTdIRhNBZX9g3jLyFe8vQ=; b=pe4G+tiRWAI742qh0zuJr+SxsT
	LvlgcBcgFKSyAC2oErC/CkaGrELtYcgWIEYc/DfFbq57VV0mjb2axO7+u3TG72DC9SmTABAJowyYx
	5xpxbvEilQesMwFyLBQ5MYZpat1qjbdL+EIgZa5K6/ET50g/sq+K92arUkoOqlrKbxkvVWNcwYxLX
	jOXD3mw1bsktc+kZDTsOmg3falGZUNZZ0BmoIYbjvoWR777dZP+lSUrglmE60xh0OG7SLCKp8OskU
	tD3mIA3pIWf/5FEdTyj9d0ktCneMksx4Dxpfv7qemOg7Cgi/VmnOm6mQzd3FIMkGtNmg+M2Y3FwRg
	fY/17wmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6SVl-00000008ueF-02vL;
	Sat, 28 Mar 2026 12:11:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6SVY-00000008uYy-16rp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 12:11:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5762160008;
	Sat, 28 Mar 2026 12:11:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C749BC19424;
	Sat, 28 Mar 2026 12:11:13 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas driver updates for v7.1 (take two)
Date: Sat, 28 Mar 2026 13:11:05 +0100
Message-ID: <cover.1774606540.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1774606536.git.geert+renesas@glider.be>
References: <cover.1774606536.git.geert+renesas@glider.be>
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

The following changes since commit b1de9823fdc67a8e9cd0dcf1f6f0e9780d425d4e:

  soc: renesas: rz-sysc: Add SoC identification for RZ/G3L SoC (2026-03-06 13:40:12 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v7.1-tag2

for you to fetch changes up to abf3502033cfc2797126f054eb081857f8e7e939:

  soc: renesas: r9a09g056-sys: Mark rzv2n_sys_init_data as __initconst (2026-03-16 11:04:18 +0100)

----------------------------------------------------------------
Renesas driver updates for v7.1 (take two)

  - Mark remaining rz_sysc_init_data structures __initconst.

----------------------------------------------------------------
Lad Prabhakar (3):
      soc: renesas: r9a09g057-sys: Mark rzv2h_sys_init_data as __initconst
      soc: renesas: r9a09g047-sys: Mark rzg3e_sys_init_data as __initconst
      soc: renesas: r9a09g056-sys: Mark rzv2n_sys_init_data as __initconst

 drivers/soc/renesas/r9a09g047-sys.c | 2 +-
 drivers/soc/renesas/r9a09g056-sys.c | 2 +-
 drivers/soc/renesas/r9a09g057-sys.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

