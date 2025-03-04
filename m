Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA10BC282D9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RcBgALpYcjs5SHxpWjuglwuE//cJzLocMs9ZwiLx8FE=; b=GSfIKuKs/gH3tTNPL0Zk9jkw/j
	DXlvZZ0iOdplZa1XkpUDBhr8M7bzKYIh5hcGVJ4mg5rSG0eplrLyYsQu+sCAhi9RQli8DofE+Yz+6
	NhEoVhgkPe5FxaPKXdXckzTlQVp5kmWhXf5bvxcRXwwhHHi78ebuefwo+s4CQM1IbjBM6CmeL3gA3
	vvUUvlEiMSTfBML6J3owEOQ7DCG9ILMoLr3u19hsxgjY2RKFCS9g8jM3ITAQPdLtrkBDBIddkF5wd
	kNxx3nxzzJYCLAc/zp1O0sViIoev5lnSK3JZDgTCx1mEbpiKu4pjRNVTQngZicQY11V9ywF0mojcA
	3Y8ECI0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR51-00000004Wtq-0YEC;
	Tue, 04 Mar 2025 12:08:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPzo-00000004J4S-2DgU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 10:59:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D654BFEC;
	Tue,  4 Mar 2025 02:59:45 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 22E313F5A1;
	Tue,  4 Mar 2025 02:59:30 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>
Subject: [GIT PULL] firmware: arm_ffa: Updates for v6.15
Date: Tue,  4 Mar 2025 10:59:28 +0000
Message-Id: <20250304105928.432997-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_025932_650833_D5CB119D 
X-CRM114-Status: GOOD (  10.85  )
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

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-updates-6.15

for you to fetch changes up to cc0aac7ca17e0ea3ca84b552fc79f3e86fd07f53:

  firmware: arm_ffa: Set dma_mask for ffa devices (2025-02-28 11:20:06 +0000)

----------------------------------------------------------------
Arm FF-A updates for v6.15

This update primarily focuses on FF-A framework notification support
along with other improvements, including UUID handling enhancements
and various fixes.

1. FF-A framework notification upport

    - Adds support for multiple UUIDs per partition to register individual
      SRI callbacks.
    - Handles Rx buffer full framework notifications and provides a general
      interface for future extensions.

2. Improved multiple UUID/services per-partition handling

    - Adds support for UUID passing in FFA_MSG_SEND2, improving multiple
      UUID/service support in the driver.
    - Introduces a helper function to check whether a partition can
      receive REQUEST2 messages.

3. Partition handling generic improvements

    - Implements device unregistration for better partition cleanup.
    - Improves handling of the host partition presence in partition info.

4. FF-A version updates

    - Upgrades the driver version to FF-A v1.2.
    - Rejects major versions higher than the driver version as incompatible.

5. Big-Endian support fixes

    - Fixes big-endian issues in:
        __ffa_partition_info_regs_get()
        __ffa_partition_info_get()
    - Big-endian support is still incomplete, and only these changes can
      be verified without additional application/testing updates at the
      moment. We can discover all the partitions correctly with big-endian
      kernel now.

6. Miscellaneous fixes

    - Fixes function prototype misalignments in: sync_send_receive{,2}
    - Adds explicit type casting for return values from: FFA_VERSION
      and NOTIFICATION_INFO_GET
    - Corrects vCPU list parsing in ffa_notification_info_get().

7. UUID management in the driver and DMA mask updates

    - Replaces UUID buffer with the standard UUID format in ffa_partition_info
      structure.
    - Fixes a typo in some FF-A bus macros.
    - Sets dma_mask for FF-A devices.

In short, this update enhances notification handling, UUID support, and
overall robustness of the FF-A driver while addressing multiple fixes
and cleanups.

----------------------------------------------------------------
Sudeep Holla (21):
      firmware: arm_ffa: Replace SCMI by FF-A in the macro
      firmware: arm_ffa: Replace UUID buffer to standard UUID format
      firmware: arm_ffa: Align sync_send_receive{,2} function prototypes
      firmware: arm_ffa: Fix big-endian support in __ffa_partition_info_get()
      firmware: arm_ffa: Fix big-endian support in __ffa_partition_info_regs_get()
      firmware: arm_ffa: Handle the presence of host partition in the partition info
      firmware: arm_ffa: Unregister the FF-A devices when cleaning up the partitions
      firmware: arm_ffa: Helper to check if a partition can receive REQUEST2 messages
      firmware: arm_ffa: Add support for passing UUID in FFA_MSG_SEND2
      firmware: arm_ffa: Upgrade FF-A version to v1.2 in the driver
      firmware: arm_ffa: Reject higher major version as incompatible
      firmware: arm_ffa: Remove unnecessary declaration of ffa_partitions_cleanup()
      firmware: arm_ffa: Refactoring to prepare for framework notification support
      firmware: arm_ffa: Stash ffa_device instead of notify_type in notifier_cb_info
      firmware: arm_ffa: Add support for {un,}registration of framework notifications
      firmware: arm_ffa: Add support for handling framework notifications
      firmware: arm_ffa: Allow multiple UUIDs per partition to register SRI callback
      firmware: arm_ffa: Handle ffa_notification_get correctly at virtual FF-A instance
      firmware: arm_ffa: Explicitly cast return value from FFA_VERSION before comparison
      firmware: arm_ffa: Explicitly cast return value from NOTIFICATION_INFO_GET
      firmware: arm_ffa: Skip the first/partition ID when parsing vCPU list

Viresh Kumar (2):
      firmware: arm_ffa: Refactor addition of partition information into XArray
      firmware: arm_ffa: Set dma_mask for ffa devices

 drivers/firmware/arm_ffa/bus.c    |  14 +-
 drivers/firmware/arm_ffa/driver.c | 532 ++++++++++++++++++++++++++++----------
 include/linux/arm_ffa.h           |  22 +-
 3 files changed, 422 insertions(+), 146 deletions(-)

