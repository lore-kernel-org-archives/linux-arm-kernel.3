Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269D3C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 12:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pefFKTdVb5bco4qK5SLeHfu/r/cmO59HS8qKT1Mt//E=; b=1b8WDkZd8nY3DaycGhotchPBDb
	zmhaUQ1AWJefkbj04Omp08AIOhnU6Sn7SUri9jHh4Jd62UkCo+/kf7AdoaPA/9n6/pbQA/D7BrqBe
	cAVOGs3AD/QYK5/AqFRyFEfcuUw7jU6JfNgnJp939zau9ny1DS1SB9rZkBxHkHnkI1KZCIGGoDDYf
	d6QCcAW46tGDtkMU4k5LP+QpfNg/Eu3nsYmz9MJapgcbQ2WwgLhiPd6AMRjl+f5Xz0FkgEm5RJaST
	l5pBDviRcNDR16xZgbUn0Q/3L71xtdoXE99fE88mKpHXzLhuN1d7titU2v3guWjOXBE+3WvcYsVqw
	DZ4Lq3+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFucv-00000003Rvx-2Len;
	Fri, 16 May 2025 12:57:25 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFuat-00000003RmK-0KIQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 12:55:21 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b0d6:ccd4:58dc:70fd])
	by baptiste.telenet-ops.be with cmsmtp
	id pov82E00M3S8nz401ov8UX; Fri, 16 May 2025 14:55:09 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uFuaX-000000020ZE-1lBj;
	Fri, 16 May 2025 14:55:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uFuai-000000013QW-3I6B;
	Fri, 16 May 2025 14:55:08 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas DTS updates for v6.16 (take three)
Date: Fri, 16 May 2025 14:55:07 +0200
Message-ID: <cover.1747399860.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_055519_254465_9D1F44B1 
X-CRM114-Status: GOOD (  16.37  )
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

This is my third pull request for the inclusion of Renesas SoC updates
for v6.16, containing only fixes.

The following changes since commit b280613d480aa170e51029d5582bb4b666982b7c:

  ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable USB host port (2025-05-08 20:23:33 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.16-tag3

for you to fetch changes up to 1064013303c6dd59f1586656f853765c6e870f8b:

  riscv: dts: renesas: Add specific RZ/Five cache compatible (2025-05-14 13:30:06 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.16 (take three)

  - Silence a DTC warning,
  - Add an extra compatible value to avoid future issues.

Thanks for pulling!

----------------------------------------------------------------
Conor Dooley (1):
      riscv: dts: renesas: Add specific RZ/Five cache compatible

Geert Uytterhoeven (1):
      arm64: dts: renesas: sparrow-hawk: Disable dtc spi_bus_bridge check

 arch/arm64/boot/dts/renesas/Makefile        | 1 +
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

