Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812D2E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 11:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NmDzOCKVfs2DMFtom/0kjhYiM9hYlkCG1xV6v8EIu5k=; b=TOtjt7tARWW1ZW6S4wBJ2LzX3P
	8w1auXJwdiJTOP/tVblLxd68cagSA3W9v2TvvSoob8lHIRCOI4yHA5+iYZk/6WJDLmiTjT/7oFwFt
	5eaLjQZWt9M4+bXjqmhbdCGB4+LtFhGmdZ/LBPwrSlMQquVvAKoJ1ObHeIuZiejDYFy3bxnRSEpqD
	+kgNU3p0ud/h2LIM8F3bXuXlviEI+OLxgpkQVGOfzTIaeu7zQjOWIjfUKVTh/Mbu1zkGxBNpFo89c
	xBKOxL2F3GkIiInD/iw1G40wYpZ3P9pUx1buUtm/HCywbjGCB9xe8pOyROi1kz31pLfmvtmjLlSA8
	gDoGQHkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOavg-00000004gAq-1Hj4;
	Fri, 20 Dec 2024 11:12:24 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOaHc-00000004bJl-04aO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 10:31:02 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:7a4e:e361:29f2:181c])
	by laurent.telenet-ops.be with cmsmtp
	id qyWq2D00U5V3mYk01yWq5l; Fri, 20 Dec 2024 11:30:52 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tOaHN-001s3n-Gy;
	Fri, 20 Dec 2024 11:30:50 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tOaFY-000gNB-Ev;
	Fri, 20 Dec 2024 11:28:52 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas ARM defconfig updates for v6.14
Date: Fri, 20 Dec 2024 11:28:45 +0100
Message-Id: <cover.1734689799.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734689797.git.geert+renesas@glider.be>
References: <cover.1734689797.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_023100_197995_9377BA2E 
X-CRM114-Status: UNSURE (   8.09  )
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

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.14-tag1

for you to fetch changes up to a40f02b2923b6d58e76cfef760b8ed61a00f1d53:

  arm64: defconfig: Enable R9A09G047 SoC (2024-12-13 11:09:59 +0100)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.14

  - Enable Watchdog support for the RZ/V2H(P) SoC and the RZ/V2H EVK
    board in the ARM64 defconfig,
  - Refresh shmobile_defconfig for v6.13-rc1,
  - Enable support for the Renesas RZ/G3E (R9A09G047) SoC in the ARM64
    defconfig.

----------------------------------------------------------------
Biju Das (1):
      arm64: defconfig: Enable R9A09G047 SoC

Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Refresh for v6.13-rc1

Lad Prabhakar (1):
      arm64: defconfig: Enable Renesas RZ/V2H(P) Watchdog driver

 arch/arm/configs/shmobile_defconfig | 1 +
 arch/arm64/configs/defconfig        | 2 ++
 2 files changed, 3 insertions(+)

