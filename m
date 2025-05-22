Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8FAC54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 16:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M7MTt6fK6/d1e2CdoayOfTn+HPe4zIyCKy9RS/xvkVQ=; b=4uORfaEyH+eilgxXTxNAl22pGn
	Gv5FAvDIhFumXc2p+UowX1xtiVksCeVxU8WGbPdOctdITRLZjSNUlLZzU/oe9HLjdziNnjF/iyGNx
	iRcvjWYgjJJOeullwW9XiBVkbyHHgJzhZChpv+6/NwUzTVHkhJpC+rqghrZInyk4lfOs3jaJK9kXB
	STaqNwFpshjsNebV+P9/gtiL44Om2zHz8EJOQSt42BGSsi8P6tt0KnYmDGr/jWkaKVt2wHp+MTvgQ
	F7LfIU1vyVhUYCVQ/x0Ok8QDn9Vr5GzsdtsMnCpGlM06Emsg7rAqGWLCJ4qEa1DS/09DZ9egDa1A4
	eSz0JsXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI8lz-00000001Z5p-1SNF;
	Thu, 22 May 2025 16:27:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI8KI-00000001WR7-46PN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 15:59:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D9F11A2D;
	Thu, 22 May 2025 08:59:07 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DEBA13F5A1;
	Thu, 22 May 2025 08:59:20 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: gregkh@linuxfoundation.org
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	james.clark@linaro.org,
	leo.yan@linux.dev,
	mike.leach@linaro.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [GIT PULL] coresight: updates for Linux v6.16
Date: Thu, 22 May 2025 16:59:13 +0100
Message-ID: <20250522155913.353620-1-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_085923_101730_58D0354D 
X-CRM114-Status: GOOD (  10.84  )
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

Hi Greg,

Please find the CoreSight self-hosted tracing subsystem updates for Linux v6.16.


Kindly pull,

Suzuki

---

The following changes since commit 9c32cda43eb78f78c73aee4aa344b777714e259b:

  Linux 6.15-rc3 (2025-04-20 13:43:47 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git tags/coresight-next-v6.16

for you to fetch changes up to 408c97c4a5e0b634dcd15bf8b8808b382e888164:

  coresight: prevent deactivate active config while enabling the config (2025-05-20 16:38:54 +0100)

----------------------------------------------------------------
coresight: updates for Linux v6.16

CoreSight self-hosted trace driver subsystem updates for Linux v6.16 includes:
 - Clear CLAIM tags on device probe if self-hosted tags are set.
 - Support for perf AUX pause/resume for CoreSight ETM PMU driver, with trace
   collection at pause.
 - Miscellaneous fixes for the subsystem

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

----------------------------------------------------------------
Andy Shevchenko (1):
      coresight: cti: Replace inclusion by struct fwnode_handle forward declaration

Dmitry Baryshkov (1):
      dt-bindings: arm: arm,coresight-static-replicator: add optional clocks

James Clark (8):
      coresight: Convert tag clear function to take a struct csdev_access
      coresight: Only check bottom two claim bits
      coresight: Add claim tag warnings and debug messages
      coresight: etm3x: Convert raw base pointer to struct coresight access
      coresight: Clear self hosted claim tag on probe
      coresight: Remove inlines from static function definitions
      coresight: Remove extern from function declarations
      coresight: Add a KUnit test for coresight_find_default_sink()

Junhao He (1):
      coresight: Fixes device's owner field for registered using coresight_init_driver()

Leo Yan (9):
      coresight: replicator: Fix panic for clearing claim tag
      coresight: etm4x: Extract the trace unit controlling
      coresight: Introduce pause and resume APIs for source
      coresight: etm4x: Hook pause and resume callbacks
      coresight: perf: Support AUX trace pause and resume
      coresight: tmc: Re-enable sink after buffer update
      coresight: perf: Update buffer on AUX pause
      Documentation: coresight: Document AUX pause and resume
      coresight: etm4x: Fix timestamp bit field handling

Mao Jinlong (2):
      coresight: Disable MMIO logging for coresight stm driver
      coresight: tmc: fix failure to disable/enable ETF after reading

Yabin Cui (2):
      coresight: catu: Introduce refcount and spinlock for enabling/disabling
      coresight: core: Disable helpers for devices that fail to enable

Yeoreum Yun (3):
      coresight/etm4: fix missing disable active config
      coresight: holding cscfg_csdev_lock while removing cscfg from csdev
      coresight: prevent deactivate active config while enabling the config

 .../arm/arm,coresight-static-replicator.yaml       |  13 ++
 Documentation/trace/coresight/coresight-perf.rst   |  31 ++++
 drivers/hwtracing/coresight/Kconfig                |   9 ++
 drivers/hwtracing/coresight/Makefile               |   3 +
 drivers/hwtracing/coresight/coresight-catu.c       |  39 +++--
 drivers/hwtracing/coresight/coresight-catu.h       |   1 +
 drivers/hwtracing/coresight/coresight-config.h     |   2 +-
 drivers/hwtracing/coresight/coresight-core.c       | 131 ++++++++++++-----
 drivers/hwtracing/coresight/coresight-cpu-debug.c  |   3 +-
 drivers/hwtracing/coresight/coresight-cti-core.c   |   2 +
 drivers/hwtracing/coresight/coresight-cti.h        |   3 +-
 drivers/hwtracing/coresight/coresight-etb10.c      |   4 +-
 drivers/hwtracing/coresight/coresight-etm-perf.c   |  84 ++++++++++-
 drivers/hwtracing/coresight/coresight-etm.h        |   6 +-
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  28 ++--
 .../hwtracing/coresight/coresight-etm3x-sysfs.c    |   8 +-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 158 +++++++++++++++------
 .../hwtracing/coresight/coresight-etm4x-sysfs.c    |   8 +-
 drivers/hwtracing/coresight/coresight-etm4x.h      |   2 +
 drivers/hwtracing/coresight/coresight-funnel.c     |   4 +-
 .../hwtracing/coresight/coresight-kunit-tests.c    |  74 ++++++++++
 drivers/hwtracing/coresight/coresight-platform.c   |  26 ++--
 drivers/hwtracing/coresight/coresight-priv.h       |  22 +--
 drivers/hwtracing/coresight/coresight-replicator.c |   6 +-
 drivers/hwtracing/coresight/coresight-stm.c        |   8 +-
 .../coresight/coresight-syscfg-configfs.c          |   2 +-
 drivers/hwtracing/coresight/coresight-syscfg.c     |  51 +++++--
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  11 +-
 drivers/hwtracing/coresight/coresight-tmc-etf.c    |  20 ++-
 drivers/hwtracing/coresight/coresight-tmc-etr.c    |  26 ++--
 drivers/hwtracing/coresight/coresight-tpiu.c       |   2 +-
 drivers/hwtracing/coresight/coresight-trbe.c       |  18 +--
 include/linux/coresight.h                          |  44 +++---
 33 files changed, 624 insertions(+), 225 deletions(-)
 create mode 100644 drivers/hwtracing/coresight/coresight-kunit-tests.c

