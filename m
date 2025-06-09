Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59789C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 11:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ubk0Z81OU2DzHb5H2PFShZlq3N9AATotYx3lNMfUWyc=; b=04qo29zhRnqx4CSgW4O9JtyM+R
	CjJ2nrY7tSRNzGWGcTlgfc7TNEekCXnjzRyBSNkTq/kSR0p4nngdyit8XjpidZPqwo5G2k3qJWv/C
	S/J8jL0FlhTj0SBEjUG2F1RQrPZTf7SlevjAZMayYHi00XnOzUPLm36XrsVO+1ZOvmEMnAVKmpvWn
	NOPtHrA1sYI4vTWiGtOGkq/FMpsItp5m8mb+Aqb+KqOG7ydgszMOTz7K54J3BurYtx/JZpbEVc/kY
	yNxe+fsc+lKLUBpxDzhkXeUZEo11jzucWNTg4VpMomRfjrcfcbkewKlcOvgdrntFZELz8MCH7PFzZ
	Gkcd5FuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOaV0-000000040Wb-1Wnn;
	Mon, 09 Jun 2025 11:17:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOa75-00000003x5K-1AvE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 10:52:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1100150C;
	Mon,  9 Jun 2025 03:52:03 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 92BB93F59E;
	Mon,  9 Jun 2025 03:52:21 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>
Subject: [GIT PULL] firmware: arm_ffa: Fixes for v6.16
Date: Mon,  9 Jun 2025 11:52:07 +0100
Message-Id: <20250609105207.1185570-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_035223_360739_B9711ACA 
X-CRM114-Status: UNSURE (   8.13  )
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-fixes-6.16

for you to fetch changes up to 4c46a471be12216347ba707f8eadadbf5d68e698:

  firmware: arm_ffa: Fix the missing entry in struct ffa_indirect_msg_hdr (2025-06-09 11:24:43 +0100)

----------------------------------------------------------------
Arm FF-A fixes for v6.16

Couple of fixes to address:

1. The safety and memory issues in the FF-A notification callback handler:

   The fixes replaces a mutex with an rwlock to prevent sleeping in atomic
   context, resolving kernel warnings. Memory allocation is moved outside
   the lock to support this transition safely. Additionally, a memory leak
   in the notifier unregistration path is fixed by properly freeing the
   callback node.

2. The missing entry in struct ffa_indirect_msg_hdr:

   The fix adds the missing 32 bit reserved entry in the structure as
   required by the FF-A specification.

----------------------------------------------------------------
Sudeep Holla (3):
      firmware: arm_ffa: Fix memory leak by freeing notifier callback node
      firmware: arm_ffa: Move memory allocation outside the mutex locking
      firmware: arm_ffa: Replace mutex with rwlock to avoid sleep in atomic context

Viresh Kumar (1):
      firmware: arm_ffa: Fix the missing entry in struct ffa_indirect_msg_hdr

 drivers/firmware/arm_ffa/driver.c | 71 ++++++++++++++++++++-------------------
 include/linux/arm_ffa.h           |  1 +
 2 files changed, 37 insertions(+), 35 deletions(-)

