Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43CEC79F9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 15:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ky5PJpXIwVlReW7wAPQUIG1OoYABem5E+FqMMIXjq7U=; b=wJMTOFPiAHVZS2rI/GJNejA1Op
	SAox58etn0YPvcZR0uih71C084sTfG4ZshPcH41CpoPIKBI/KMkzMi+w83L+qW2c3rMICUdhD0cbI
	sJLFvp5m0XY/qdDvKYZSQEex/CCzd/N6hk2RmX284qiguFWC6N5SkPzsBBP38O9z4x7WJ6kAQUwZs
	Fo/1OSKTxn+Zs0KNE8JuNiS7ueEnM0fl4wPIeZDyw32x87/aXsJT+b3Ew+VabCgnSF1b1mWaB6XAr
	ytoUgQFySLDhvdNQmSPgpF16iLJYE8eAUtq2jMVxr9rfzq5RrYNygyzVUNf8pUAo4iN3QDklIp8dV
	3H0TRC2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmxu-0000000BgSj-2cLy;
	Mon, 05 Jan 2026 15:57:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmxr-0000000BgRV-1Wtk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 15:57:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6128942B7D;
	Mon,  5 Jan 2026 15:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCC36C19422;
	Mon,  5 Jan 2026 15:57:48 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas ARM defconfig updates for v6.20
Date: Mon,  5 Jan 2026 16:57:38 +0100
Message-ID: <cover.1767628165.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767628163.git.geert+renesas@glider.be>
References: <cover.1767628163.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_075751_426430_4CDD3E37 
X-CRM114-Status: UNSURE (   8.90  )
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.20-tag1

for you to fetch changes up to 898a23193bd860234342eef6ebcc00e9199e3513:

  ARM: shmobile: defconfig: Refresh for v6.19-rc1 (2026-01-05 14:39:18 +0100)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.20

  - Enable support for the Renesas RZ/G3E USB3 PHY and RZ/G3S PCIe
    drivers in the ARM64 defconfig,
  - Refresh the ARM SH-Mobile defconfig for v6.19-rc1.

----------------------------------------------------------------
Biju Das (1):
      arm64: defconfig: Enable RZ/G3E USB3 PHY driver

Claudiu Beznea (1):
      arm64: defconfig: Enable PCIe for the Renesas RZ/G3S SoC

Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Refresh for v6.19-rc1

 arch/arm/configs/shmobile_defconfig | 2 +-
 arch/arm64/configs/defconfig        | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

