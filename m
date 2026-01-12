Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFE3C9EC77
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 11:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3tTaW0yGCKoEwcR9rcTxNAJmmRCLHrwpF8yGXrWFGM=; b=2we9zxTMBHld2L47vjqN0sI4ID
	HHOOhGKETuwa4UQkwhEpftK4pkheAszn0GGJ2rIlQlwSzjp14DtcKGUfxTN6Les26SV51H8qnUsVV
	3jEWTt0i6pisL56+k9drUY2P1BmlabtTM0gTJlOFJt02zyMui2gq2N769SxUlE1neADs0D/heMH1f
	RddrqpeGL5NMSHslB2TpdH/FBazlj4JEgx5aY5Ocg1IGwFOVwsBH3s7occzDZY4RrzcgMMHfRjPcT
	iyK8qJPUhPt4Nauib+QRv7QWRyTfD3u4Rn8Sq1cNXdR6JvqZ7dlswFU+5FfkhYB2eRx6+vFbV5Fno
	YsK3gg2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGRZ-00000005HOw-0oqR;
	Mon, 12 Jan 2026 11:50:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGRW-00000005HNB-3g8X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 11:50:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A578B497;
	Mon, 12 Jan 2026 03:50:35 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7A8AA3F694;
	Mon, 12 Jan 2026 03:50:41 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>,
	arm-scmi@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v6.20/v7.0
Date: Mon, 12 Jan 2026 11:50:18 +0000
Message-ID: <20260112115021.2551442-3-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112115021.2551442-2-sudeep.holla@arm.com>
References: <20260112115021.2551442-1-sudeep.holla@arm.com>
 <20260112115021.2551442-2-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_035043_032095_7E6E667B 
X-CRM114-Status: UNSURE (   7.00  )
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-7.0

for you to fetch changes up to 24a0ffefe3f097aa8fe6997a731a71487dd0721f:

  firmware: arm_scmi: Remove legacy protocol versioning logic (2025-12-27 20:09:30 +0000)

----------------------------------------------------------------
Arm SCMI updates for v7.0

A set of cleanups, refactoring, and fixes to the Arm SCMI stack:

1. Rework protocol version negotiation by moving version discovery and
   downgrade handling into the SCMI core and performing negotiation early,
   before protocol initialization. Remove legacy per-protocol versioning
   logic now made redundant by centralized SCMI handling.

2. Increase the internal MAX_OPPS limit in the SCMI performance protocol
   to 64, allowing platforms with larger OPP tables to be fully supported.

3. Reduce duplicated boilerplate in pinctrl and related protocols by
   consolidating validation and lookup logic in protocol get info helpers.

4. Refactor reset protocol domain handling by introducing a shared lookup
   helper, ensuring consistent validation and error reporting.

5. Fix potential undefined behaviour by properly initializing pointers
   annotated with the __free attribute.

----------------------------------------------------------------
Ally Heev (1):
      firmware: arm_scmi: Fix uninitialized pointers with __free attr

Artem Shimko (1):
      firmware: arm_scmi: Refactor reset domain handling

Cristian Marussi (2):
      firmware: arm_scmi: Rework protocol version negotiation logic
      firmware: arm_scmi: Remove legacy protocol versioning logic

Dan Carpenter (1):
      firmware: arm_scmi: Move boiler plate code into the get info functions

Vivek Aknurwar (1):
      firmware: arm_scmi: Increase performance MAX_OPPS limit to 64

 drivers/firmware/arm_scmi/base.c                   |  11 +-
 drivers/firmware/arm_scmi/clock.c                  |  24 ++---
 drivers/firmware/arm_scmi/driver.c                 |  98 +++++++++++++----
 drivers/firmware/arm_scmi/perf.c                   |  59 ++++------
 drivers/firmware/arm_scmi/pinctrl.c                | 120 +++++++++------------
 drivers/firmware/arm_scmi/power.c                  |  18 +---
 drivers/firmware/arm_scmi/powercap.c               |  21 ++--
 drivers/firmware/arm_scmi/protocols.h              |   9 +-
 drivers/firmware/arm_scmi/reset.c                  |  68 ++++++------
 drivers/firmware/arm_scmi/sensors.c                |  22 ++--
 drivers/firmware/arm_scmi/shmem.c                  |   5 +-
 drivers/firmware/arm_scmi/system.c                 |  14 +--
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c |  10 +-
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c |   9 +-
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c |   9 +-
 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    |  10 +-
 drivers/firmware/arm_scmi/voltage.c                |  13 +--
 17 files changed, 238 insertions(+), 282 deletions(-)

