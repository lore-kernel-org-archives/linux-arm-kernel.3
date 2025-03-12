Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81F4C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 14:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dco+aUB0dAbx05s0IFRnkfUSKY5uqoG159jfIUUoVo0=; b=KI9GKFDpwTB0k6KM6Tk9QgSNcE
	qvAGjk96nJKIkQI4aA1CtdSLJB8CedmJ9nSqpXSN2PyMN7iDmlZbLBmtE1kgo111z10MxHbr2W/sM
	6nCgo9Vt8Wo6V8op6bB0OS1vJup384GNKYFs4HeUO60V1gakItu3ZRfr514X1vU5VqQxbAiqUjDOn
	LYO5b4ROm0Ors7/DDirSae+Y19a8gXoC9GB0w244cYA46JpdV2XSCFYpG/BW9mAUz6C99rKL9a52K
	PF+Agx2ZqkwhPDpZ2pbGriJtkv1ZEa4OZp40h1fhHarAVLyKWSYs0yWKjgUY0cwXAYRH3Rsoxq2zx
	wEmz56yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsNQ0-00000008kbi-0k50;
	Wed, 12 Mar 2025 14:50:48 +0000
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsM09-00000008YJB-24Tw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 13:20:02 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:bb30:6286:99f4:5b9d])
	by andre.telenet-ops.be with cmsmtp
	id PpKu2E00D4xs17S01pKui4; Wed, 12 Mar 2025 14:19:54 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tsLze-0000000DhMT-1wJ6;
	Wed, 12 Mar 2025 14:19:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tsM01-00000000bbj-3dAr;
	Wed, 12 Mar 2025 14:19:53 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PULL] Renesas fixes for v6.14
Date: Wed, 12 Mar 2025 14:19:51 +0100
Message-ID: <cover.1741785482.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_062001_670833_6FF4DD35 
X-CRM114-Status: GOOD (  13.79  )
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

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-fixes-for-v6.14-tag1

for you to fetch changes up to 379c590113ce46f605439d4887996c60ab8820cc:

  ARM: shmobile: smp: Enforce shmobile_smp_* alignment (2025-03-12 09:15:37 +0100)

----------------------------------------------------------------
Renesas fixes for v6.14

  - Fix possible misalignment breaking SMP bring-up.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: shmobile: smp: Enforce shmobile_smp_* alignment

 arch/arm/mach-shmobile/headsmp.S | 1 +
 1 file changed, 1 insertion(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

