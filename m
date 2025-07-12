Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B44C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 12:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=boV8SydIjVtJlk9b/NYAIqbz4hUe64y+yBdvhWGrlKQ=; b=dx8MYNI0ZpmkiRP6lXrTR3ECi1
	2tuKtOIFF0XSLAF7VvzCbjzpeN1gM+KqTQ8mX6XRmu7zvP3xjZHmzJcWCzVvs+ZTH19sM7596Swh+
	JLoSugkotdMlli3nkgcG3YFHTntE8KAq6Y97W0pXA/6OCU+3RdcQfyEuDpwb4EjLANW0G5AuYvoQw
	j4B6xdb2behRQJHqjEkV3K59fUj9LvK3d4cApnBD2tzG1qFvcv+B1mIMdgo4gcZCMblUawLGeu47Q
	Ke8kwJLH5xxAOqHGMABt3KgKZZg0RH8ITyfZaPzhmTCN98ECw+I9GLkP9TqVKrtSRf9uQg1DZOGMT
	VUVdUKng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaZRq-0000000Gdy4-201s;
	Sat, 12 Jul 2025 12:35:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaZPS-0000000GdtP-0XY2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 12:32:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 85EBA5C4D33
	for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Jul 2025 12:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E97A6C4CEEF;
	Sat, 12 Jul 2025 12:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752323571;
	bh=Fa3zONeW8o1dNAGBSO84wwt6uQEhk+3PUi5qbt8JCwE=;
	h=From:To:Cc:Subject:Date:From;
	b=PcJm3HUOdBk9gGa8QRk72Ifb2v4AeC8y1mrK9a9KoAjhWDwSH8ZZuddNwKSO6cJD4
	 aFmSZ1ipdnGB9OC4TsT3djcB5sCuIwKNKjRKUVIyKtwbLaUetKoKP070vIa0YlnIi3
	 E0MuadoPJ+8r/kOKO1ZXa4qVryKz+kqziEX9cTo2yYeKv7HlsGCZPaz+Lv0gC8APzj
	 AuzJVt4lQuVp3FDkLZPe1NKmKWgt5y1iX3EbdUf3R3EmqNmGZ3O8tUYn8mteQozgyg
	 IKaCKr7a8rmF24/+Qs8qFishYtaC1cUJ8fbzUIXev3ZhaVVsXkPZjQFplq/eFLMq7t
	 Yf1ZY5XaDbRuQ==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: dinguyen@kernel.org
Subject: [GIT PULL] arm: dts: socfpga: updates for v6.17
Date: Sat, 12 Jul 2025 07:32:48 -0500
Message-ID: <20250712123248.16981-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_053254_205615_23F16070 
X-CRM114-Status: UNSURE (   7.81  )
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


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.17

for you to fetch changes up to 203b862057d08fbabcd4e475707751c0f2a9258b:

  arm64: dts: altera: socfpga_stratix10: update internal oscillators (2025-07-12 07:24:48 -0500)

----------------------------------------------------------------
SoCFPGA DTS updates for v6.17
- Fix dt_binding_check warnings
	- agilex - f2s-free-clk
	- stratix10 - rstmgr
	- swvp - remove phy-addr, cpu1-start-addr and altr,modrst-offset

----------------------------------------------------------------
Dinh Nguyen (5):
      arm64: dts: socfpga: agilex: fix dtbs_check warning for f2s-free-clk
      arm64: dts: socfpga: stratix10: fix dtbs_check for rstmgr
      arm64: dts: socfpga: swvp: remove altr,modrst-offset
      arm64: dts: socfpga: swvp: remove cpu1-start-addr
      arm64: dts: socfpga: swvp: remove phy-addr in the GMAC node

Matthew Gerlach (1):
      arm64: dts: altera: socfpga_stratix10: update internal oscillators

 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi     | 5 ++++-
 arch/arm64/boot/dts/altera/socfpga_stratix10_swvp.dts | 6 ------
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi         | 1 +
 3 files changed, 5 insertions(+), 7 deletions(-)

