Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4146110F3DCE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 12:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NjhXBEcsMPkuzeBAu4i75ZvHcaSrqyxcStjRHfp07aQ=; b=tvA/WIoKWpsi/9ngrlXkJFlf7x
	8hdc6FcBlXvFsUAXg2m+yrqv10c20clcRSyHik98OnMW9iCH9JStQureE+h1HKV0XWvvXzkxZ1PlN
	fM8oOoj2d1uXwnznZl66DUkYfQMB/lPTYWPtFPuyPgnadXfb14aq0B7OiH9Fl4gYfPYG//SVXq8jz
	rpYjEjDsNq0DZrEIXsfpd0kB+bjyV3MxpuYRrGjrt/GNjRQjQ3SnKx8Czmut55bDFfnhJRqVqRwVs
	jPeuoNmwxG96dtv2LKiV0RMosKN7wtdOakwFwpMUEMs0Rh84jP8UE3mE8aK9lu4MFbcDqGYSq5W3G
	p0+8UTLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6SVX-00000008uYi-1l9O;
	Sat, 28 Mar 2026 12:11:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6SVW-00000008uYH-10nT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 12:11:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AA3C960008;
	Sat, 28 Mar 2026 12:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BDE4C4CEF7;
	Sat, 28 Mar 2026 12:11:11 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas ARM SoC updates for v7.1
Date: Sat, 28 Mar 2026 13:11:04 +0100
Message-ID: <cover.1774606538.git.geert+renesas@glider.be>
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-soc-for-v7.1-tag1

for you to fetch changes up to d784bbad7fcbfad42e0d12c8dae2eb9c17b327b4:

  ARM: shmobile: rcar-gen2: Use of_phandle_args_equal() helper (2026-03-16 10:59:59 +0100)

----------------------------------------------------------------
Renesas ARM SoC updates for v7.1

  - Use the of_phandle_args_equal() helper.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: shmobile: rcar-gen2: Use of_phandle_args_equal() helper

 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

