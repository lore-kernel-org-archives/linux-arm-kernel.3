Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD42C9830C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 19:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hxyAvMTcHHto031sNzZ/j0WEQMy0xJsZ90oPvWIz30s=; b=MlsTePnKk6bFdTCk8T5y6mTSg5
	m5GPRygc2cGEyXSBhq2m24m/bPYJsFxxbdLPVwzdH7SjB1LacqKSeYPFpOu6nTT4KPVw5CjJpRRSA
	euHNgVnkf4i2fTE8MUSOvUCldF73lqssDgBugwqfg8tw6tiv+qYbAnSIIkPl99MeOiijBMHwWswkL
	ERJj0lrM/Iw1PlVaq2J7AstRP9BnzUgRMWIpj//ef8F6lPg1Fsw1q+Eit+rcJTeSnB7OUfKNzXNR5
	eJkI5B91+MnGF/ARsw+Lk4bzacHwpYXc7eR2Cm9+c3SZKgis6AtLZkjDP3dkmr48y2RrYkCJlYzey
	3rq/yWTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhYV9-00000000oho-3Ymd;
	Sun, 18 Jan 2026 19:31:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhYV9-00000000ohF-0qkW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 19:31:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0F3D060010
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 19:31:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF80C116D0;
	Sun, 18 Jan 2026 19:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768764713;
	bh=ZJedKhor0hFbcWQnMqk/6K7m0yqpBrQQok7RTBYTaoU=;
	h=From:To:Cc:Subject:Date:From;
	b=axsolNavCdqf9ppVhMPvMGnZmspNCyHIZhWXJCUp1/mcE8rOyxfjTIVPwX+gxRPoK
	 bPq8tiYdHv8Ud631oNMTkQZ6e/T4nZyC5a578GyfenG5iyajIRF8UhS6na898wSMIO
	 mDPC5fJbD3Spbv4Gq9tuFmmemmEVbHkO3G37//ZhYFhAe3GuJwINtcTOnsHTs8LrNe
	 GZOQhixHE93qlvurUiEces+qMqq5wl2G3cY8n3Q0EAfYAYWNtJWaEasvQECjq63Qfz
	 jwPTAwnFO82OrRqIBmwKHu+Ei2Y/NbePvyts1Is4MwtyzJfChBNlHMwjDt/3534tld
	 5ZJ07YL9DbPDg==
From: Sven Peter <sven@kernel.org>
To: soc@lists.linux.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Apple SoC defconfig changes for v6.20
Date: Sun, 18 Jan 2026 20:31:26 +0100
Message-ID: <20260118193134.64343-1-sven@kernel.org>
X-Mailer: git-send-email 2.52.0
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git tags/apple-soc-defconfig-6.20

for you to fetch changes up to 8c7a1d258d88b5d8e5b78f86d59cfac8eb361a61:

  arm64: defconfig: Enable Apple Silicon drivers (2026-01-08 21:19:14 +0100)

----------------------------------------------------------------
Apple SoC defconfig update for 6.20

- Enable most drivers required for Apple Silicon as module inside
  defconfig
- Enable the power-domain driver when ARCH_APPLE and PM is selected
  since it's critical for booting these systems

----------------------------------------------------------------
Janne Grunau (1):
      arm64: select APPLE_PMGR_PWRSTATE for ARCH_APPLE

Sven Peter (1):
      arm64: defconfig: Enable Apple Silicon drivers

 arch/arm64/Kconfig.platforms |  1 +
 arch/arm64/configs/defconfig | 27 +++++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

