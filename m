Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6B310F3DCE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 12:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IAqbRlPo9F7Fc0Sri2joKxDPJopoqkLLSzs0adzDASo=; b=OdJ2t8Dav/gmy/+pGNWXUrSTMX
	hEB1xyh0N6V2sHz9fbrlTNrCUx7hajWBvtFiVvuhkUkEFPmiyfE75VODk8UZcA2hAocr2B8fiJaDj
	T5knKT0KMdMV1DpEdKqfFT5Ks9jSEE1WeYkZpbsgOIYGT58/2rUngr1L9Vih4CDXjK5Bmj1bOVZZf
	PiXRCUjXxyWeJS1XXO2xoDQmHFeaccPhiC+xm6X8p3IcJ5RmdvzI6zZ4kTsQ4qQDLzgJbXjfHZD1D
	Tch9eDhzVNkGbhn6wcaZh8YywbFrMoYBu21a0+7wBQKabUjEnHHAP1do32W8zULcS6851hLNLxbCj
	wModQ2uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6SVH-00000008uUB-0Veu;
	Sat, 28 Mar 2026 12:10:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6SVF-00000008uTt-3mwt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 12:10:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 584DE60008;
	Sat, 28 Mar 2026 12:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C07FEC4CEF7;
	Sat, 28 Mar 2026 12:10:55 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas SoC fixes for v7.0 (take two)
Date: Sat, 28 Mar 2026 13:10:48 +0100
Message-ID: <cover.1774606482.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
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

	Hi SoC folks,

The following changes since commit 85c2601e2c2feb60980c7ca23de28c49472f61f1:

  arm64: dts: renesas: r8a78000: Fix out-of-range SPI interrupt numbers (2026-03-06 13:15:21 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-fixes-for-v7.0-tag2

for you to fetch changes up to ed8444006df9863ffa682e315352c44a49d9f4cb:

  arm64: dts: renesas: sparrow-hawk: Reserve first 128 MiB of DRAM (2026-03-25 18:26:10 +0100)

----------------------------------------------------------------
Renesas fixes for v7.0 (take two)

  - Fix TFA BL31 memory corruption on Sparrow Hawk.

Thanks for pulling!

----------------------------------------------------------------
Marek Vasut (1):
      arm64: dts: renesas: sparrow-hawk: Reserve first 128 MiB of DRAM

 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

