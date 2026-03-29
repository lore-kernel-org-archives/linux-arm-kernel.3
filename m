Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64368F3D613
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 15:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fQXhZSAk7VD3L86H0ZvFKEEDgOqNqiXabjrsBnHmfo8=; b=15CrCPFkbg0ZCRur9fcc7tkHAr
	zpOkCFqhuUqOor2BRbVJCWOTW2O2oNnNGU042ta0t6fN9M/je0geqzQcz5YuZe+xA0fkURKH1hV+Y
	6aS5b5XyrRUcHOwXFSq4C7oINL2Q56tYwvPAsQ/2IAxKOtxQtaC7HYp0dE1Md1HSu9fnkYGpNtiW4
	LODJdbiRsP1rLpaKMmy4FE7POu725z/Arc7EW1VB8JuPexczBf8uSLqQeK00i1Z483vP9w8BEfaWg
	3dLD5tioCf0mwEdgGK29diFkk1ppci8/n1o4sPNHYwA1Rm+sbLJu16WB8Eo2YOwUR0I4kle0yOfyO
	703DdITA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6rnG-0000000A35Q-3FMW;
	Sun, 29 Mar 2026 15:11:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6rnC-0000000A32w-1Fss
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 15:11:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B9FDA600AC;
	Sun, 29 Mar 2026 15:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A32C116C6;
	Sun, 29 Mar 2026 15:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774797069;
	bh=48O06jw41mdFWfzz7EZIRuUwiyu34of3gLO+Z+5DX9U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DAAt5zP9x1B1zJc01c09CLZyU02+98UDTZrLobQfzigELVdHNbs/kS3BMZCLBU9Rw
	 5JVqbjlZJ5XCENTd8T0cgZUu5Qlf6x49StTWQq4gDgTMtjIFnM1uYJag6gTxnNNmdV
	 QXD35rZf9DOL0pMU0ZlwXDXGCiH8YfeNGaTEtubvxlsY89PMnTvYmjQDUJAZGgR5An
	 yBYBzNoUd3TCGTuXPTJ+sp8upKPoTzxY4jh6faRuKN5SWJDFqsyqgWYXzi5+8NAaLU
	 yAUq63ZdNNXZu9Jg4O1Uip8GkZUxOoMWSWXCVPsh83qCP6FtnEp/0+Zl9mgizOIaG4
	 25KmnYrBjRpfQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 7/7] arm64: tegra: Default configuration changes for v7.1-rc1
Date: Sun, 29 Mar 2026 17:10:44 +0200
Message-ID: <20260329151045.1443133-7-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260329151045.1443133-1-thierry.reding@kernel.org>
References: <20260329151045.1443133-1-thierry.reding@kernel.org>
Content-Type: text/plain; charset="utf-8"
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

From: Thierry Reding <thierry.reding@gmail.com>

Hi ARM SoC maintainers,

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.1-arm64-defconfig

for you to fetch changes up to c655a14958363aea8a1d0bbf3358fcee7f89a210:

  arm64: tegra: defconfig: Drop redundant ARCH_TEGRA_foo_SOC (2026-03-25 10:49:46 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration changes for v7.1-rc1

Drop the various ARCH_TEGRA_*_SOC options from the default configurations
since they are now enabled by default for ARCH_TEGRA.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      soc/tegra: Make ARCH_TEGRA_SOC_FOO defaults for NVIDIA Tegra
      arm64: tegra: defconfig: Drop redundant ARCH_TEGRA_foo_SOC

Thierry Reding (1):
      Merge branch 'for-7.1/soc' into for-7.1/arm64/defconfig

 arch/arm64/configs/defconfig |  7 -------
 drivers/soc/tegra/Kconfig    | 11 +++++++++++
 2 files changed, 11 insertions(+), 7 deletions(-)

