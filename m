Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD45C83F3B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 21:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UKVVkG8oAn2+Yzx4pKYdU5ZNka6O4M58XLvVY0uPoBU=; b=uhRBiIICjRo0BSAuNUMaGJ3fO8
	B+5W2kFvyodao3SZRqHUUHJqERvb9/dvhqtS8DqrtMufn76Fhp2lUvNpXkB5A7xyVCQZ6OxXdss21
	vf8RcADI23OwvcDJWP7N0LJ+K9WMY6XN+RgVt8/SJn4ZrhYTBYT1fLZRbMpmn1fG4iJnM0XHlm1DN
	cdFH5B6xhVa6ts2qM7gLEXB80WsUkYJroOI9/Wl2Q2ehGHWmv37azkoMm6PGTJ62//m+oRb+F3sQ/
	W+QBQXKNIvr48etAP4aN+lxJlxdj8DY2TGlKw/syVm/orXb2anlkDafQ/i5oqn8HVUeWpx/BUSiax
	IZ47wfDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucsH9-0000000DS4l-03xW;
	Fri, 18 Jul 2025 21:05:51 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucsEe-0000000DRvh-32j5;
	Fri, 18 Jul 2025 21:03:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=UKVVkG8oAn2+Yzx4pKYdU5ZNka6O4M58XLvVY0uPoBU=; b=LZbrMmDXvVGufpouCEFHzJFaUe
	TBSDm2S/n6MEwsbZINE5GCPSQNWX14+NGZ7quPcECYcobv9fiFQC/LS6cMyaJGi5Y1IuQZOItQ1QY
	/07KDmbfBm4TRTkZ94H5dvz5wag5oJIUPGXDJtRi8fpIJGpK9fYFkfYtKxSpYkooTaQ1HDhlHQEwj
	5nCTU5mbCGb0sZzZ5UaYXQP9+hEWd+bShGrbY10kcGP4ptPKUPPbiuYLSLB1rkgPhiUNnr7CoX+H7
	eC7F6h3Qxq9EgFRj0fTwPO86E2z7JLPJrTMJBlYVLjs0Fp1EcMADsRlmJeQMwcDn4AT/GDNS9k9bu
	lTxQboMQ==;
Received: from cst-prg-35-241.cust.vodafone.cz ([46.135.35.241] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ucsEd-0007FK-1P; Fri, 18 Jul 2025 23:03:15 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip soc32 changes for 6.17 #1
Date: Fri, 18 Jul 2025 23:03:13 +0200
Message-ID: <12434765.CDJkKcVGEf@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_140316_791688_381AB41C 
X-CRM114-Status: UNSURE (   9.57  )
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

Hi soc maintainers,

After a while a fix for a possible kernel hang that seems to appear
seldomlyv it seems - on my boards I haven't run into that, but the
change makes sure this won't happen.

As this is for old arm32 boards, does not seem to happen very often
and we're late in the cycle I'd consider that material for 6.17.

Please pull.
Thanks
Heiko


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.17-rockchip-arm32-1

for you to fetch changes up to 7cdb433bb44cdc87dc5260cdf15bf03cc1cd1814:

  ARM: rockchip: fix kernel hang during smp initialization (2025-07-14 15:38:40 +0200)

----------------------------------------------------------------
Fix for seldom hangs when bringing up arm32 cpu cores.

----------------------------------------------------------------
Alexander Kochetkov (1):
      ARM: rockchip: fix kernel hang during smp initialization

 arch/arm/mach-rockchip/platsmp.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)




