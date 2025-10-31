Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB9DCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2vJq2wiU/CcSGIGafp1401O+TOfkuWU+obcfTtS/kA=; b=ltRfQMB6yWDe77i1KLbvxnv/Jg
	Ojm1tfcGaIinh01WAFqv8FJs66tDCW38z3FwpZ91oaX5n6lIvu16Kf9dIhzPg430UnSVjAhX7tVwY
	cHw9hnnj9yhWFpjpsxWUQM/4ejE+RLFTDrrnfVPJvmPd75JEDOFeqy3FdkzhOp5bPhNtObtAydm7c
	+l1ShglZagfp9BkvNgIY5tA5wC+mYR0VBPhgHD3dMDXuTPjEyBJP8VWGa0hopiuT857A3fxqhWLR0
	m4Mdb+ZqeuRadZI/WQL7Lw6TIF6Q5N0zbm/3eizNEAD1NZnwdGOgyHrJ1unFH6srTI48z1AvMlbVa
	/FOHwJkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmbj-00000005x10-1C1l;
	Fri, 31 Oct 2025 10:43:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmbd-00000005wzk-2Xfm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:43:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 53CAF45783;
	Fri, 31 Oct 2025 10:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2553C116C6;
	Fri, 31 Oct 2025 10:43:39 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas ARM defconfig updates for v6.19
Date: Fri, 31 Oct 2025 11:43:30 +0100
Message-ID: <cover.1761905412.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761905410.git.geert+renesas@glider.be>
References: <cover.1761905410.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_034341_701435_FC4584AB 
X-CRM114-Status: UNSURE (   9.38  )
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

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.19-tag1

for you to fetch changes up to e7d34657744a3e48e7ff3f61342eccd9852445bc:

  arm64: defconfig: Enable RZ/T2H / RZ/N2H ADC driver (2025-10-23 16:22:41 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.19

  - Enable support for the Renesas RZ/G3S and RZ/G3E thermal drivers,
    and the RZ/T2H and RZ/N2H ADC drivers in the ARM64 defconfig,
  - Refresh the ARM SH-Mobile defconfig for v6.18-rc1.

----------------------------------------------------------------
Claudiu Beznea (1):
      arm64: defconfig: Enable Renesas RZ/G3S thermal driver

Cosmin Tanislav (1):
      arm64: defconfig: Enable RZ/T2H / RZ/N2H ADC driver

Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Refresh for v6.18-rc1

John Madieu (1):
      arm64: defconfig: Enable the Renesas RZ/G3E thermal driver

 arch/arm/configs/shmobile_defconfig | 4 +++-
 arch/arm64/configs/defconfig        | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

