Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D35DC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 13:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lrGswZ8+U7uatQi2DJz9Nqdk6UyhlOV3Oz2+j5PPrTU=; b=R4CQHopcK2aRRVQFeR/aYDTg4c
	GR6N6rnYObWkbxNxK99SM6OpkyAynfQGUPXSaC3PYiHdCr1GXy7+d2AEKKtddlzNpvsxvz+rhFq5L
	U8ickKX7S2Co7UfaYgp4A+gjitd2uILcNKIPycDAO2hraeEyrLXAbV1nQz1TGwoC9W2tBQiRaIJLj
	SLKECXd8r8NbqM2xuUgt2BlSsWLgXGZJbi4L6IyB+Kr4Fce6S1NxuPnCE2pf8/n4jh7aTOH/IBJ8K
	Nzw+aVhZu7O+qvE/zhUy6He+pk8V9+ulHm6utano6ZsRamdEniRbFhfHpyre8NsFdGbnQ/meXXTDN
	7azRdKMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8J1z-0000000HGbW-0XNZ;
	Fri, 25 Apr 2025 13:23:51 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IGs-0000000H8g4-0YSD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 12:35:11 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:3329:b4bc:d565:c72])
	by laurent.telenet-ops.be with cmsmtp
	id hQb42E00816PE0201Qb4lN; Fri, 25 Apr 2025 14:35:07 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u8IGc-00000001gJc-31jS;
	Fri, 25 Apr 2025 14:35:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u8IGl-0000000CKj0-3zoX;
	Fri, 25 Apr 2025 14:35:03 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/4] Renesas ARM defconfig updates for v6.16
Date: Fri, 25 Apr 2025 14:34:56 +0200
Message-ID: <cover.1745582589.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745582587.git.geert+renesas@glider.be>
References: <cover.1745582587.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_053510_321292_AEC67FFC 
X-CRM114-Status: UNSURE (   6.14  )
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

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.16-tag1

for you to fetch changes up to 33d5bf70fff43fbc612450164bd0bab6b9ada261:

  arm: multi_v7_defconfig: Drop individual Renesas SoC entries (2025-04-09 14:56:03 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.16

  - Enable all Renesas SoCs by default when ARCH_RENESAS is set, and
    remove individual SoC entries from the various defconfigs.

----------------------------------------------------------------
Lad Prabhakar (4):
      soc: renesas: Kconfig: Enable SoCs by default when ARCH_RENESAS is set
      arm64: defconfig: Remove individual Renesas SoC entries
      arm: shmobile_defconfig: Drop individual Renesas SoC entries
      arm: multi_v7_defconfig: Drop individual Renesas SoC entries

 arch/arm/configs/multi_v7_defconfig | 19 -----------------
 arch/arm/configs/shmobile_defconfig | 19 -----------------
 arch/arm64/configs/defconfig        | 23 --------------------
 drivers/soc/renesas/Kconfig         | 42 +++++++++++++++++++++++++++++++++++++
 4 files changed, 42 insertions(+), 61 deletions(-)

