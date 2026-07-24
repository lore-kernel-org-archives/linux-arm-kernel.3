Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63FB3C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 13:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cbysenA+ym7Lo52Js4E8GSW7rIIJ486XykrgB905yDY=; b=LbhAv4njvx/oz1yFfAjfAw+8hS
	LIyO+HovOhM/40fvjU5aWv22UiAA2OJtB8q16/QilgD3ZirLQIhYCmEnvR3HxAVg64H8hF7YsAgLm
	KWx4ExEm+jAHuDCv22Na8Rd+FFy8I0H7XfTgNxXKruCU/72ucexzS2arpFA/jEseMVs/4GrQP/7VZ
	4s6By6JyMiQol990wywRhqC0G8jnXkMMp65aLW37PoCVJKvKpi2BXITXL9YvggsgN/HWtskfTUErf
	srINFKEnZYGJqWUnqksW9w0dyCnvFP/OU1K7bix29j+k6HxTzmpOWF6X/REWkTzYFeGnbp7Padyu7
	x7LMjZFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnGEx-0000000GWGe-0g7R;
	Fri, 24 Jul 2026 13:47:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnGEw-0000000GWGT-25zF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 13:47:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 09C9D412C2;
	Fri, 24 Jul 2026 13:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 457FD1F000E9;
	Fri, 24 Jul 2026 13:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784900820;
	bh=cbysenA+ym7Lo52Js4E8GSW7rIIJ486XykrgB905yDY=;
	h=From:To:Cc:Subject:Date;
	b=er0CHM2ZQRV9xe1kDZW9gQkS3ZsboFu/zHjR5KAMfWCU5q6X8YXDikQiiBRSnxaoA
	 Io1yU8akXky9wBwETLfdXy96As7pcwenpDV3VwPkxkWBoTWlBrO6EkmgQxG2bYdYHb
	 lJxOOnERMOBkWuTdIYWUgVYcIhfQRdu5E8T9Xv7ACTL2/rTZwn6tr8kYxMkMw1RG3r
	 Y4O26SC6BiX1FZI5J/ogP8Qs+p5VY9bMu5O5TU7oDhmCblPKVm23z7Ch058zYLaJD0
	 Z9DWFZH+vq0rWzmVPROj9HCkTNr5u9SOLlj0M6ieSJkK1w5ZtwzVx5h8tFkp0opKgr
	 ir3I9K2vutFmA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	arm-scmi@vger.kernel.org,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v7.3
Date: Fri, 24 Jul 2026 14:46:48 +0100
Message-ID: <20260724134651.2930500-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hi ARM SoC Team,

Please pull !

I am keeping these as updates for v7.3 rather than fixes for v7.2,
allowing them to remain in -next for additional reviewi/testing time.
Aside from Sashiko’s review, there has been limited feedback on these
fixes, which address issues identified by Sashiko.

Regards,
Sudeep

-->8
The following changes since commit 980a8bfe7baec9b9ee0d5443b0b204552e41c407:

  Merge branches 'for-next/scmi/fixes' and 'for-next/ffa/fixes' (2026-07-13 11:38:34 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-7.3

for you to fetch changes up to 9f7cd6a62aa754ed6b48cbd5d50de40add1bcc86:

  firmware: arm_scmi: Unrequest devices if driver registration fails (2026-07-22 20:33:43 +0100)

----------------------------------------------------------------
Arm SCMI updates/fixes for v7.3

A collection of SCMI core and transport fixes addressing resource
lifetimes, teardown races and error handling. Most of these issues
are reported by Sashiko as existing issues while reviewing new feature
additions to SCMI.

The changes:
- publish channel state before mailbox and SMC callbacks can run,
- quiesce notification work before tearing down transport channels,
- fix partial channel setup and mailbox allocation cleanup,
- make IDR iteration and shared-channel teardown safe,
- correct SCMI device, OF node, handle, bus ID and SystemPower lifetimes;,
- harden requested-device registration and removal against races and
  partial failures,
- reject out-of-range DT protocol IDs, and
- simplify notification allocations using flexible arrays.

----------------------------------------------------------------
Rosen Penev (1):
      firmware: arm_scmi: Simplify notification allocations

Sudeep Holla (19):
      firmware: arm_scmi: Publish channel state before callbacks
      firmware: arm_scmi: Unregister device notifier before IDR teardown
      firmware: arm_scmi: Quiesce notifications before teardown
      firmware: arm_scmi: Clean up channels on setup failure
      firmware: arm_scmi: Free transport channel on IDR failure
      firmware: arm_scmi: Avoid IDR updates while cleaning channels
      firmware: arm_scmi: Reject out of range DT protocol IDs
      firmware: arm_scmi: Use channel ID for transport teardown
      firmware: arm_scmi: Protect device request lookup with RCU
      firmware: arm_scmi: Drop handle on protocol bind failures
      firmware: arm_scmi: Clear SystemPower flag on create failure
      firmware: arm_scmi: Fix OF node reference handling
      firmware: arm_scmi: Unwind TX receiver mailbox setup failure
      firmware: arm_scmi: Unwind P2A receiver mailbox setup failure
      firmware: arm_scmi: Fix SCMI device destroy lifetimes
      firmware: arm_scmi: Fix transport device teardown lookup
      firmware: arm_scmi: Fix requested device removal race
      firmware: arm_scmi: Roll back partial protocol table registration
      firmware: arm_scmi: Unrequest devices if driver registration fails

 drivers/firmware/arm_scmi/bus.c                | 182 +++++++++++++++----------
 drivers/firmware/arm_scmi/common.h             |   2 +
 drivers/firmware/arm_scmi/driver.c             |  81 +++++++----
 drivers/firmware/arm_scmi/notify.c             |  64 +++++----
 drivers/firmware/arm_scmi/notify.h             |   1 +
 drivers/firmware/arm_scmi/transports/mailbox.c |  26 +++-
 drivers/firmware/arm_scmi/transports/smc.c     |  15 +-
 7 files changed, 230 insertions(+), 141 deletions(-)

