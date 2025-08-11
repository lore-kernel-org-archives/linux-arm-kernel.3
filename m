Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CEFCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 17:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FOF+6+snYyQL9TuRcuVmJIjk53mqbAyMUZDW8HnidQw=; b=0G9Kz8MDnHJHVq1Gwl4rgOoBQp
	EO+rjQIQzbubkeR50TqpLJ2bq8o2gfhZH9zgDVt0ANdED3cP2Bh0d5TuwkaYkYpt91L36MLyDmPHt
	lU5dyR7HfBcG2hYn7gCau7RBUfFqwUJLkDNjMYzurpbYggsfonZLQev8GJ2G/K0TTl5Zb423mcKya
	PBOcOwXQZQ6BTKxMQ4CCBczCpvy3C7lfWhLnnq6Ul5E1uAqrdQUpopeypflgf8MZ5ZeyacfOzj4cx
	+TLqR/4z9uy7EJzMXeQQ6dFNHQxH7bWYUTC+85DMHaLapw9/IfA+3M1HtBDdSJsEMPNRMrILgcqNK
	eOvZjI4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulW3T-00000008WN4-2MQd;
	Mon, 11 Aug 2025 17:11:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulTwd-000000086oY-2WAX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 14:56:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C96BF4387F;
	Mon, 11 Aug 2025 14:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C800C4CEED;
	Mon, 11 Aug 2025 14:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754924174;
	bh=wkEAOGCSP4PWIJbYeRH2+mullwzKF3uE+Wbcm87RmJQ=;
	h=From:To:Cc:Subject:Date:From;
	b=qsD1kEXkxMVWg9t19w5x/Lp+MWWWYsqYFGhYKYmgR2CU2kq+Zsj3efka7ieMwcOhs
	 xcdfGJeYCzun7brXrFMXJ10Jo5pX7SMLPZEm15PMacwZcZ+/Ttpb/FO0vtUpsxZ29c
	 QOJlV5OMz4TVYOvhXOgjRC0NdcJexUxlnVrp9VqlUhQdCdXbZpNKtfqHEoH/RzDJwI
	 2vsIobSJRB3AFzNBd0/AZBSvjRmDMfFNZX4S1q7MB6R8clrkB20f4Ntl2GEji+qAGB
	 HbaXnl9eXiS+axvbQg5EW55GGhkxqBPJySHeAIn5YtWvWBFa6SG/9Ajou5C/hHsm6T
	 Diq0SUslu2kPA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm driver fixes for v6.17-rc1
Date: Mon, 11 Aug 2025 09:56:11 -0500
Message-ID: <20250811145613.120917-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_075615_656997_2C41FA95 
X-CRM114-Status: UNSURE (   7.55  )
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


The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-6.17

for you to fetch changes up to 25daf9af0ac1bf12490b723b5efaf8dcc85980bc:

  soc: qcom: mdt_loader: Deal with zero e_shentsize (2025-08-10 21:02:14 -0500)

----------------------------------------------------------------
Qualcomm driver fixes for v6.17-rc1

The recently extended sanity checks for the Qualcomm firmware files
turned out to be too restrictive, preventing a variety of firmware
images from being loaded. Adjust the checks to allow section header
sizes of 0 when sections aren't used.

----------------------------------------------------------------
Bjorn Andersson (1):
      soc: qcom: mdt_loader: Deal with zero e_shentsize

 drivers/soc/qcom/mdt_loader.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

