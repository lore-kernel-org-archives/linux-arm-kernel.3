Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E87AC83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 15:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rdIO/N26N052KCgIetVdhZnS8X9UWn3dAmkRYaihxYI=; b=FQ0UbhSZz0L8I8JNkaVRiss2TQ
	wpG3vZT3ubm50/zAexom+gJ5vJ4Twz+fKyIoHR+7xkteUD4jxgXSSAc4rBaYFVCKhD/LGoImHWTkV
	JGNp2t1diRDJ09+74afJZlGwsPcM++xhTfrYbL3LCxYpYHoHxA5rBQxolP38+Pfbxc/tO0IAQTOg+
	+dYH3w1qIC5DOilKZNoHXmV2CCNb82TvoiiR/H0/PI/5ZGyjH//sHXEkHKxgVRQNy+3oKhtVW5kQg
	5PFbexvjOD0hatdD6yfZ4NjFsWXXz2dKH4DBaMwLy4hVO01cX1Fst9ClQx69F+x5sD6vSNtoQBEWP
	5ntERoxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZWLo-000000095rn-2eOr;
	Wed, 09 Jul 2025 15:04:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZTvE-00000008dVD-0nAU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 12:29:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9506152B;
	Wed,  9 Jul 2025 05:28:59 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 554063F694;
	Wed,  9 Jul 2025 05:29:10 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v6.17
Date: Wed,  9 Jul 2025 13:29:07 +0100
Message-Id: <20250709122907.1171913-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_052912_270970_90906CF4 
X-CRM114-Status: UNSURE (   7.18  )
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

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-6.17

for you to fetch changes up to 62d6b81e8bd207ad44eff39d1a0fe17f0df510a5:

  firmware: arm_scmi: Convert to SYSTEM_SLEEP_PM_OPS (2025-07-09 10:49:58 +0100)

----------------------------------------------------------------
Arm SCMI updates for v6.17

1. A fix is introduced to correct turbo frequency marking for 64-bit
   devices with sustained frequencies over 4GHz, ensuring accurate turbo
   frequency identification.

2. Debug capabilities are being improved by introducing in-flight transfer
   tracking using debug counters, which help diagnose transfer congestion
   and behavior. Additional tracepoints are added to log in-flight counts
   at transfer begin and end, offering better runtime insight. The debug
   counters now support decrement operations using a newly added
   scmi_dec_count helper, making counter tracking symmetric and more robust.

3. A race condition in suspend-resume logic is being resolved by ensuring
   SCMI_SYSPOWER_IDLE state is set early during resume, improving suspend
   reliability under certain conditions. New suspend and resume operations
   are added to the scmi_bus_type to enable finer power management control
   for SCMI-based devices.

4. Finally enhancements are also made to avoid registering notifiers for
   events that a platform does not support, reducing unnecessary overhead
   by checking for unsupported event types during protocolinitialization.

----------------------------------------------------------------
Arnd Bergmann (1):
      firmware: arm_scmi: Convert to SYSTEM_SLEEP_PM_OPS

Cristian Marussi (1):
      firmware: arm_scmi: Avoid notifier registration for unsupported events

Peng Fan (2):
      firmware: arm_scmi: Add power management operations to SCMI bus
      firmware: arm_scmi: power_control: Ensure SCMI_SYSPOWER_IDLE is set early during resume

Philip Radford (3):
      firmware: arm_scmi: Add support for debug counter decrement
      firmware: arm_scmi: Track number of inflight SCMI transfers
      include: trace:  Add tracepoint support for inflight xfer count

Sibi Sankar (1):
      firmware: arm_scmi: Fix up turbo frequencies selection

 drivers/firmware/arm_scmi/bus.c                | 26 +++++++++++++++++
 drivers/firmware/arm_scmi/common.h             |  8 ++++++
 drivers/firmware/arm_scmi/driver.c             | 28 ++++++++++++++++--
 drivers/firmware/arm_scmi/notify.c             | 39 ++++++++++++++++++++------
 drivers/firmware/arm_scmi/perf.c               |  2 +-
 drivers/firmware/arm_scmi/raw_mode.c           |  6 ++--
 drivers/firmware/arm_scmi/scmi_power_control.c | 22 +++++++++++----
 include/trace/events/scmi.h                    | 24 +++++++++-------
 8 files changed, 126 insertions(+), 29 deletions(-)

