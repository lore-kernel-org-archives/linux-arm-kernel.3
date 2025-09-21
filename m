Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67166CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 02:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LaF5fk5VJYRPFQ3wsOgWwA/KlWd22eBC2o++iLWqsaQ=; b=XDyFpoeizaXcY3uI+iMbp57QLL
	hbMWND1B9EGfdrieS6S0mxOOy+y/lJm/yC8fDnxYL0SBst8S8+g5Y5+vDzKcsEIeEVvmQBJMf0E8V
	W++G8Yu0IRa6gMJX6G6FBYA7mCjjUtdUnhh4l7xw4F2QSYEPZq6h9l3Clte9RgobJ+okm8xJEGKPq
	P6QegT+t91CK8JvWfqZEa7KSXR7XvnPnESsBkiu29nPUi4bpBNqrhYBmIL1gP3NrmbKotujg3vcCE
	B3vASp6yLKZ3LZ3d+37Url/xYXiKgBCt+tMHn3ECWzz1KjLKmGnj7Z/Y2KWiA8aly/8c7bjoxhzlp
	fmgh6R+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v09UT-00000006HwQ-2Guh;
	Sun, 21 Sep 2025 02:07:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v09US-00000006HwC-3z8d
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 02:07:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2766E6014D;
	Sun, 21 Sep 2025 02:07:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C2DC4CEEB;
	Sun, 21 Sep 2025 02:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758420467;
	bh=4yHCd5x3C4wI9aEANtmzNfFgw8YiWpvJqMysyL00Du4=;
	h=From:To:Cc:Subject:Date:From;
	b=ALsnAczYl3NlOs92MwF8YkydVva71cmgVowbfCaA5sfYkvyUCyXaFJYD/QGt5APZT
	 dAAlvxE86qGoBwjCc6JxNd9b6VMzLgma/CrIzREGlva3sotYRh5blRqwAcQvE4bLDs
	 pf5FmnysbJRbpL9zhOMlrk3GvyIMFnv/A37uuHBw4+tVBd5eZ2Y4bSvpqvxlIuQh90
	 1vheECRDkmz6tSaoGab1xWvX+dDkpgPeIjPVn5cqbClHJjgpjowbst3z+bJC/ZQyil
	 dyAkjaQLwqANdEnB+/MWX14J/ULwXy3XMZ/WHQamF9Ko8nOYKqZ4G01huijCaJWArz
	 HPBN855WGRe5A==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Petr Vorel <petr.vorel@gmail.com>,
	Trevor Woerner <twoerner@gmail.com>
Subject: [GIT PULL] Qualcomm Arm32 defconfig updates for v6.18
Date: Sat, 20 Sep 2025 21:07:45 -0500
Message-ID: <20250921020746.596400-1-andersson@kernel.org>
X-Mailer: git-send-email 2.51.0
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


The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-defconfig-for-6.18

for you to fetch changes up to 3e23fc50890d3f04ec8e3670c6927eb239930136:

  ARM: defconfig: Remove obsolete CONFIG_USB_EHCI_MSM (2025-09-11 16:51:08 -0500)

----------------------------------------------------------------
Qualcomm Arm32 defconfig updates for v6.18

Remove a bunch of orphaned options from the defconfigs.

----------------------------------------------------------------
Petr Vorel (1):
      ARM: defconfig: Remove obsolete CONFIG_USB_EHCI_MSM

Trevor Woerner (1):
      ARM: defconfig: cleanup orphaned CONFIGs

 arch/arm/configs/multi_v7_defconfig | 4 ----
 arch/arm/configs/qcom_defconfig     | 4 ----
 2 files changed, 8 deletions(-)

