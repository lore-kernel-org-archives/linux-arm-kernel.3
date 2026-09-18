Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22097C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QbKvvHN+QZGubttgcBfq1QC7HqsWlBfKw4ZVQ5fNYzw=; b=vBHWJEQEG2oVIjrNSdAzqLL+b8
	468grkVzGhH2uxoaWMAeCA5JFd20oxIHhDX95HKuNxQkgiHBJad4SAmr5QjglvunS9+HCfttxCka0
	oIWqNjobUJ4/1jjbmWl0HLo69uYnjDT7GZLGjAoGFfL5oiBlDpxg5WKagB/rZ5pXe3TM3XHp+KnaQ
	V3iHM0DLZTuoX+MNfGS6pCQciKNejWUQXFcE2kOMSwucuPL7KslzZ6QbwrpNlbC3aC2gpI/81XIy2
	zh01QY9Re9LxP92makiwFqovCIJwpO5b8Zdjb4OrPaIGOvZ/x5fbkYcDKPV+sRJhfOHC3W9xy2CAc
	rROdEucA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7V22-0000000Dy2G-3y7C;
	Fri, 18 Sep 2026 09:37:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7V1y-0000000Dy12-0e7t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:37:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9862160A64;
	Fri, 18 Sep 2026 09:37:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E87F81F00898;
	Fri, 18 Sep 2026 09:37:15 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas ARM defconfig updates for v7.4
Date: Fri, 18 Sep 2026 11:37:03 +0200
Message-ID: <cover.1789722870.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789722868.git.geert+renesas@glider.be>
References: <cover.1789722868.git.geert+renesas@glider.be>
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

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v7.4-tag1

for you to fetch changes up to 74463c1be2ad066b436209d01dcdf8e717896504:

  ARM: shmobile: defconfig: Refresh for v7.3-rc1 (2026-09-09 10:47:00 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v7.4

  - Refresh the ARM SH-Mobile defconfig for v7.3-rc1.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Refresh for v7.3-rc1

 arch/arm/configs/shmobile_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

