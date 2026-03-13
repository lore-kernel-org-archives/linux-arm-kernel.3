Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79704105F79B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 11:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1cI1mVl74ol/N/6IYYcH7L58NjTfbEtE15R+vWZ4vc=; b=ov5q/YCibfKJYppfGAlXmVo9Zg
	tMstnS1NIlYvYzCdNob2B4cKJu/KwQNLY9rp+o80upE8Uk6Lw3voreDgRSIrZUlONNOgUv2TAKbwH
	74ixutekkJqTDpj3iQA6TQbaz/JS0aTCoII8VBEuJWrd4cHAFL4F0kQzBGE/aZ0ekyH+S9qIfI9dc
	gn5zDGta5rIxkUBWE+SppgnHVfAikqU7EgWLVax8mNd5Bt7bL2Ity72M7uwIorIqcHI1zrYOVtfpy
	zwaP2G2GAgP6HK9QMScfI79IP6+/UqB9vf32smWv5iVgdSF0MVCGxBLoUaBzbfSAL+ZdMg1uvqS98
	aH6lUXmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10S7-0000000Hamh-0JWv;
	Fri, 13 Mar 2026 11:13:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10S4-0000000Hal4-2IMW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 11:13:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0192F60138;
	Fri, 13 Mar 2026 11:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86B46C19421;
	Fri, 13 Mar 2026 11:13:06 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/4] Renesas driver updates for v7.1
Date: Fri, 13 Mar 2026 12:12:58 +0100
Message-ID: <cover.1773399671.git.geert+renesas@glider.be>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v7.1-tag1

for you to fetch changes up to b1de9823fdc67a8e9cd0dcf1f6f0e9780d425d4e:

  soc: renesas: rz-sysc: Add SoC identification for RZ/G3L SoC (2026-03-06 13:40:12 +0100)

----------------------------------------------------------------
Renesas driver updates for v7.1

  - Initial support for the Renesas RZ/G3L (R9A08G046) SoC.

----------------------------------------------------------------
Biju Das (1):
      soc: renesas: rz-sysc: Add SoC identification for RZ/G3L SoC

 drivers/soc/renesas/Kconfig          | 12 +++++
 drivers/soc/renesas/Makefile         |  1 +
 drivers/soc/renesas/r9a08g046-sysc.c | 91 ++++++++++++++++++++++++++++++++++++
 drivers/soc/renesas/rz-sysc.c        |  3 ++
 drivers/soc/renesas/rz-sysc.h        |  1 +
 5 files changed, 108 insertions(+)
 create mode 100644 drivers/soc/renesas/r9a08g046-sysc.c

