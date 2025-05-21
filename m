Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A39AC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 09:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8XesKO2Wc0opsXM9N8Ve/awwAPJvtZ6DBgyfXBz1KWM=; b=wmMNbtSatebd37SBCCHGxYjMBi
	6NDmTf8rAzm/A3aDYSAD8ClPXpPu7pDPMwN5hLp54BtV85OGjg4USyb8GG9X+GShq0icOIURc7wKT
	MboBw2V9JR9RjyD2qge/5s7DfX+dDdvq+3cQN5dNI1mGh3JUlo4BYkJ44XSAM+SRMA1tEEOTdrisi
	CtBjJs1TGQXZzVZ5qzxGkLn8OBJxxp0k0flqy0PxHK+8C1XvzK27eNe56orw1QdkttTm4/2Tdwnlr
	WSscPF00cbs5mIdjw3aLccFqOzgaWtZqSHaKKnwm3mtjYDBvYQA5QQsHJqviFRsxiJI+5qiDckYwu
	+g8diaHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfS9-0000000FGCr-0y42;
	Wed, 21 May 2025 09:09:33 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfJF-0000000FEXE-3E74
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 09:00:23 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:2bba:d77b:9240:3c4e])
	by michel.telenet-ops.be with cmsmtp
	id rl0G2E0024GqtyW06l0GUC; Wed, 21 May 2025 11:00:16 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uHfIw-00000002i7H-3gyx;
	Wed, 21 May 2025 11:00:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uHfJA-00000002ch9-02Wf;
	Wed, 21 May 2025 11:00:16 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas DTS updates for v6.16 (take four)
Date: Wed, 21 May 2025 11:00:13 +0200
Message-ID: <cover.1747817851.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_020021_944226_FF6C6445 
X-CRM114-Status: GOOD (  16.10  )
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

	Hi SoC folks,

This is my fourth pull request for the inclusion of Renesas SoC updates
for v6.16, containing just a fix.

The following changes since commit 1064013303c6dd59f1586656f853765c6e870f8b:

  riscv: dts: renesas: Add specific RZ/Five cache compatible (2025-05-14 13:30:06 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.16-tag4

for you to fetch changes up to 652eea251dd852f02cef6223f367220acb3d1867:

  arm64: dts: renesas: white-hawk-ard-audio: Fix TPU0 groups (2025-05-20 09:31:11 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.16 (take four)

  - Fix White Hawk ARD Audio breakage.

Thanks for pulling!

----------------------------------------------------------------
Thuan Nguyen (1):
      arm64: dts: renesas: white-hawk-ard-audio: Fix TPU0 groups

 arch/arm64/boot/dts/renesas/white-hawk-ard-audio-da7212.dtso | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

