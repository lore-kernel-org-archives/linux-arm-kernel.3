Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF486C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 10:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZlC+k/J4QP4enoCMaEjPRRxxHi/9GzVJmKWa9+Teunk=; b=IRvfSwlZ0svdmYP6ezbHuvOtef
	dH8RSXn4vSBU5dIQsHZJy5PKjg03eC2eYl7/0UwKzShfkMA07UmPsiKxMEOW1NcC45aN1rPe8qfQv
	3RmUm6lDkMDhZRFBtcl996tPIdfH5/su9M7TuM0MDcCh/tAryVSTyIKcX3tAUm2sblmGb3cVDIFUJ
	VC2ApxktZcDXS3AkC0nxtL84UDrZO1Xtod7b+Us7v+7Gp7eq6eqgyyXKhYNetRQDJe5mlrgADVA1q
	EOkHYDoDVCJmyPGKGokX/l9pim1nhkLVR7lWYJeZZ3laZs62LQtukG0LXD0a/jhgwH4FteBNPgN+6
	BNYzKv1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3BHa-0000000DJU2-0OEy;
	Fri, 11 Apr 2025 10:06:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Akg-0000000DDbG-1iax
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 09:32:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6CE5106F;
	Fri, 11 Apr 2025 02:32:45 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C9BF13F6A8;
	Fri, 11 Apr 2025 02:32:44 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm_scmi: Fixes for v6.15
Date: Fri, 11 Apr 2025 10:32:39 +0100
Message-Id: <20250411093239.1060395-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_023246_493673_6553552D 
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

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fixes-6.15

for you to fetch changes up to c23c03bf1faa1e76be1eba35bad6da6a2a7c95ee:

  firmware: arm_scmi: Fix timeout checks on polling path (2025-04-08 10:31:59 +0100)

----------------------------------------------------------------
Arm SCMI fixes for v6.15

Couple of fixes addressing issues with timeout in the polling path
and device reference count imbalance detected by kmemleak.

1. The change fixes a timeout issue in the polling path of SCMI transactions
   where false positives could occur if the polling thread was pre-empted,
   causing it to appear as though a timeout occurred when it hadn't. The fix
   ensures that the polling result is verified before reporting a timeout,
   accounting for potential pre-emption or out-of-order replies.

2. It also corrects a device reference count imbalance caused by
   device_find_child() during device destruction, which prevented proper
   cleanup and triggered memory leaks detected by KMemleak.

----------------------------------------------------------------
Cristian Marussi (2):
      firmware: arm_scmi: Balance device refcount when destroying devices
      firmware: arm_scmi: Fix timeout checks on polling path

 drivers/firmware/arm_scmi/bus.c    |  3 +++
 drivers/firmware/arm_scmi/driver.c | 13 ++++++++-----
 2 files changed, 11 insertions(+), 5 deletions(-)

