Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23EFCD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 12:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ax9etUuCAX8HrI/3FWFKmMvTI5O0tcCo1Lp+JGa4TKg=; b=J21lblo51j3oAE2d7BIHD6B2VS
	DHXNmFnqUwryTlXB5OE+nrDS+U2xoeJBf+3GqobvnKjc4vAyVM/6egzLtT6LHKE9LjFZ/mfOm90t2
	nDQv7oJ59HJS1yzCGIADNT8nnK0asG6Jckb/75Gvee03wv4b9tKC0cix5cHusl1eOHE9JqbL9IfNK
	s1ojRxVlJtlxe4+Tlv4JQzopgbyVal37D7vMgDwc4kEZf6AgtWMIHwUUGd4NuKe8Ce3ayfLvMIkxv
	6Mc3wX1VSIrd9oDUQqZfky7YHhHqR1cW1nABQ/6zVvvjM6BgVIZhxaOcbHMxOclIGe66CpNH0EgxJ
	HalYKIbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZV5-00000003YSb-2YCI;
	Mon, 08 Jun 2026 12:54:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZV3-00000003YRT-1KWP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 12:54:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D87C42437;
	Mon,  8 Jun 2026 05:54:32 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5E77F3F632;
	Mon,  8 Jun 2026 05:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780923277; bh=ItgFrqD4IAbzx+96NiJu6bZLdk9dQtwEm2A9ZWut61o=;
	h=From:To:Cc:Subject:Date:From;
	b=b7kYu+xb1uxkEDrrx4l7Gpt5MoJRrgn0Z2zx/JFDz9IHnTTz2RnUU07HgfGGeOGgF
	 vVEiM11xsQz8g/7svphBN7azup6nSwDmGv+fzcCtOIn+0tYFespXdNvvFdIISyDFS9
	 QPxqwdfwv62cW+O37AD7llghZ9+2jV+ZFgrULvoE=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: gregkh@linuxfoundation.org
Cc: linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org,
	james.clark@linaro.org,
	leo.yan@linux.dev,
	mike.leach@arm.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [GIT PULL] coresight: Updates for Linux v7.2
Date: Mon,  8 Jun 2026 13:54:24 +0100
Message-ID: <20260608125424.283998-1-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_055441_444069_5912CE95 
X-CRM114-Status: GOOD (  12.40  )
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

Hi Greg

Please find the updates for CoreSight self hosted tracing subsystem targeting
Linux v7.2

Kindly pull,

Suzuki

---


The following changes since commit 7fd2df204f342fc17d1a0bfcd474b24232fb0f32:

  Linux 7.1-rc2 (2026-05-03 14:21:25 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git tags/coresight-next-v7.2

for you to fetch changes up to 98495b5a4d77dd22e106f462b76e1093a55b29a7:

  coresight: ultrasoc-smb: Fix OOB write in smb_sync_perf_buffer() (2026-06-04 09:56:13 +0100)

----------------------------------------------------------------
coresight: Self-hosted tracing updates for Linux v7.2

Updates for the CoreSight self hosted tracing subsystem includes:
 - Better power management for components based on the CPU PM, including
   support for components on the trace path for CPUs. Add support for
   save/restore for TRBE
 - Miscellaneous fixes to the drivers
   * Fix overflow when the buffer size is > 2GB for tmc-etr
   * Ultrasoc SMB Perf buffer OOB access

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

----------------------------------------------------------------
James Clark (1):
      coresight: ete: Always save state on power down

Jie Gan (3):
      coresight: fix missing error code when trace ID is invalid
      coresight: Fix source not disabled on idr_alloc_u32 failure
      coresight: platform: defer connection counter increment until alloc succeeds

Junrui Luo (1):
      coresight: ultrasoc-smb: Fix OOB write in smb_sync_perf_buffer()

Leo Yan (28):
      coresight: tmc: Fix overflow when calculating is bigger than 2GiB
      coresight: etm4x: Correct TRCVMIDCCTLR1 save and restore
      coresight: Handle helper enable failure properly
      coresight: Extract device init into coresight_init_device()
      coresight: Populate CPU ID into coresight_device
      coresight: Remove .cpu_id() callback from source ops
      coresight: Take hotplug lock in enable_source_store() for Sysfs mode
      coresight: perf: Retrieve path and source from event data
      coresight: Take a reference on csdev
      coresight: Move per-CPU source pointer to core layer
      coresight: Take per-CPU source reference during AUX setup
      coresight: Register CPU PM notifier in core layer
      coresight: etm4x: Hook CPU PM callbacks
      coresight: etm4x: Remove redundant checks in PM save and restore
      coresight: syscfg: Use IRQ-safe spinlock to protect active variables
      coresight: Disable source helpers in coresight_disable_path()
      coresight: Control path with range
      coresight: Use helpers to fetch first and last nodes
      coresight: Introduce coresight_enable_source() helper
      coresight: Save active path for system tracers
      coresight: etm4x: Set active path on target CPU
      coresight: etm3x: Set active path on target CPU
      coresight: sysfs: Use source's path pointer for path control
      coresight: Control path during CPU idle
      coresight: Add PM callbacks for sink device
      coresight: sysfs: Increment refcount only for software source
      coresight: Move CPU hotplug callbacks to core layer
      coresight: sysfs: Validate CPU online status for per-CPU sources

Runyu Xiao (1):
      coresight: etb10: restore atomic_t for shared reading state

Yabin Cui (1):
      coresight: trbe: Save and restore state across CPU low power state

Yingchao Deng (1):
      coresight: cti: Fix DT filter signals silently ignored

 drivers/hwtracing/coresight/coresight-catu.c       |   2 +-
 drivers/hwtracing/coresight/coresight-core.c       | 574 ++++++++++++++++++---
 drivers/hwtracing/coresight/coresight-cti-core.c   |   9 +-
 .../hwtracing/coresight/coresight-cti-platform.c   |   1 +
 drivers/hwtracing/coresight/coresight-etb10.c      |   6 +-
 drivers/hwtracing/coresight/coresight-etm-perf.c   | 289 ++++++-----
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  73 +--
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 216 +++-----
 drivers/hwtracing/coresight/coresight-platform.c   |  12 +-
 drivers/hwtracing/coresight/coresight-priv.h       |   8 +-
 drivers/hwtracing/coresight/coresight-syscfg.c     |  38 +-
 drivers/hwtracing/coresight/coresight-syscfg.h     |   2 +
 drivers/hwtracing/coresight/coresight-sysfs.c      | 135 ++---
 drivers/hwtracing/coresight/coresight-tmc-etr.c    |   4 +-
 drivers/hwtracing/coresight/coresight-trbe.c       |  61 ++-
 drivers/hwtracing/coresight/ultrasoc-smb.c         |   1 +
 include/linux/coresight.h                          |  27 +-
 include/linux/cpuhotplug.h                         |   2 +-
 18 files changed, 939 insertions(+), 521 deletions(-)

