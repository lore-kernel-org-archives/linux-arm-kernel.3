Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91031105F78C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 11:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISruuGaH9bd1cZ7Pt0UKp6roao55Y0Fo4qDS4TWlKc0=; b=B62LBaDrwgLeWmB66PR/EiKCGD
	OLUOyruZbs9KAYtA7s/gu8jTtbI0Hn3ly5ivFXORtjrVbUsykBc/Lf4IUW+SEK2j7DEAoHg+cU2Z8
	0is1tsjgQJa/I+HPf2KaK1TUJ2eehsn4x5KXxoFI/Tv5JaAz6bs8y3xk51Z+0bTiVtPpHDIHi+C2t
	5EP4LJXFpCeXdlfCOxdaGtxwu0xcm8A/dQ72mdS/b3eLBAKhYRmdSNR8KmDGma4pBpB27Y/c7kSGB
	aB9lZVJgRX+4iAfiNirx+7AySk7ixQIKiLtw6mJiZUoNyEYM68cjIpd0W6hhm90A3o/nMqWNtJt2y
	ARUzduFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10S6-0000000HamL-30Ri;
	Fri, 13 Mar 2026 11:13:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10S2-0000000Hak6-438n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 11:13:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 67FE260138;
	Fri, 13 Mar 2026 11:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EADBAC19424;
	Fri, 13 Mar 2026 11:13:04 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/4] Renesas ARM defconfig updates for v7.1
Date: Fri, 13 Mar 2026 12:12:57 +0100
Message-ID: <cover.1773399670.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1773399669.git.geert+renesas@glider.be>
References: <cover.1773399669.git.geert+renesas@glider.be>
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v7.1-tag1

for you to fetch changes up to 8c6cccefb33e20224ef35497e3f55ee360942f14:

  ARM: shmobile: defconfig: Refresh for v7.0-rc1 (2026-03-06 13:42:09 +0100)

----------------------------------------------------------------
Renesas ARM defconfig updates for v7.1

  - Refresh the ARM SH-Mobile defconfig for v7.0-rc1.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Refresh for v7.0-rc1

 arch/arm/configs/shmobile_defconfig | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

