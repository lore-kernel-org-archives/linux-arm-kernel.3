Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8FA10FC440
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 21:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0ZlSPMRj3+srXyOEPtV421yYfIPQI8//9hbBm9dm4MY=; b=s9bWTG3n7S7AnvK5SA9QSH226u
	0X7/48oh/3qlDUdavPBPvx7LosmaavJXSNP58WJ55GV3hfdGcwnmLkhSayxH0JZX/4nXtU+UiUZEG
	XfASijpbnOXCVSmdX0XmT9XWv40rBcUBkK+LnQbPeOQewEf0bavpaclTgq+yVKc+diW0PmtsINlfB
	rNMedWywkQRH/c97+OjDgdks4myV6CypyVWQW95XoZekiRviJLTWP9Dn6MTXExHS8c9/ujiNofhwI
	XMigzhw/v6zP1gzsfPMG35U2QmoPh37TJjkG6RQerejh09lN3T2qBFy4wlfB336Ekju6Jmw1LbASp
	9JHQQf5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAaWI-00000009RIA-1XWL;
	Wed, 08 Apr 2026 21:33:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAaWE-00000009RHR-2w63
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 21:33:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D77335D8;
	Wed,  8 Apr 2026 14:32:52 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1FBD23F7D8;
	Wed,  8 Apr 2026 14:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775683978; bh=g3A6qMSW6cDns9VV5VEWAQeyFTIBH0u7yOFw0zPoou8=;
	h=From:To:Cc:Subject:Date:From;
	b=AlCPDd9hHx8MV2WLagIsv6t8rGQrB/OzkE0mJ10qcUvM6CfdDFbTIwbtGwXtSofbF
	 43cs5rliKNBokb1ulqs3aKS0+AgUNCNZ3LnZ1mCV0kWghGOI57DzKIP99a7MiVmf1Y
	 N32CdqKZmM8tX+w0mbMLIk5zTVDOHEe+70/lHHGU=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: gregkh@linuxfoundation.org
Cc: leo.yan@linux.dev,
	mike.leach@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	james.clark@linaro.org,
	suzuki.poulose@arm.com
Subject: [GIT PULL] coresight: Updates for Linux v7.1
Date: Wed,  8 Apr 2026 22:32:48 +0100
Message-ID: <20260408213248.3825788-1-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_143302_899015_529673EF 
X-CRM114-Status: UNSURE (   9.22  )
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

Hi Greg

Please find the updates for CoreSight self-hosted tracing subsystem targeting
v7.1

Kindly pull,

Suzuki


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git tags/coresight-next-v7.1

for you to fetch changes up to 971f3474f8898ae8bbab19a9b547819a5e6fbcf1:

  coresight: tpdm: fix invalid MMIO access issue (2026-04-07 12:29:42 +0100)

----------------------------------------------------------------
coresight: Updates for Linux v7.1

CoreSight self hosted tracing subsystem updates for Linux v7.1, includes:

 - Fix unregistration related issues
 - Clean up CTI power management and sysfs code
 - Miscellaneous fixes
 - MAINTAINERS: Add Leo Yan as Reviewer
 - MAINTAINERS: Update Mike's email address

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

----------------------------------------------------------------
Elsanti (1):
      drivers/hwtracing/coresight: remove unneeded variable in tmc_crashdata_release()

Jie Gan (5):
      coresight: ctcu: fix the spin_bug
      coresight: cti: fix the check condition in inout_sel_store
      coresight: platform: check the availability of the endpoint before parse
      coresight: tpdm: add traceid_show for checking traceid
      coresight: tpdm: fix invalid MMIO access issue

Leo Yan (17):
      coresight: cti: Move resource release to cti_remove()
      coresight: Fix memory leak in coresight_alloc_device_name()
      coresight: Get parent device reference after sink ID map allocation
      coresight: Protect unregistration with mutex
      coresight: Refactor output connection sysfs link cleanup
      coresight: Refactor sysfs connection group cleanup
      coresight: Move sink validation into etm_perf_add_symlink_sink()
      coresight: Do not mix success path with failure handling
      coresight: Unify bus unregistration via coresight_unregister()
      coresight: cti: Make spinlock usage consistent
      coresight: cti: Fix register reads
      coresight: cti: Access ASICCTL only when implemented
      coresight: cti: Remove CPU power management code
      coresight: cti: Rename cti_active() to cti_is_active()
      coresight: cti: Remove hw_powered flag
      coresight: cti: Remove hw_enabled flag
      coresight: cti: Properly handle negative offsets in cti_reg32_{show|store}()

Mike Leach (1):
      MAINTAINERS: Change e-mail address for reviewer

Suzuki K Poulose (1):
      MAINTAINERS: coresight: Add Leo Yan as Reviewer

 .mailmap                                           |   1 +
 .../ABI/testing/sysfs-bus-coresight-devices-tpdm   |  10 +
 MAINTAINERS                                        |   5 +-
 drivers/hwtracing/coresight/coresight-catu.c       |   4 +-
 drivers/hwtracing/coresight/coresight-core.c       | 214 ++++++++------
 drivers/hwtracing/coresight/coresight-ctcu-core.c  |   5 +-
 drivers/hwtracing/coresight/coresight-cti-core.c   | 321 ++++-----------------
 drivers/hwtracing/coresight/coresight-cti-sysfs.c  | 174 +++++------
 drivers/hwtracing/coresight/coresight-cti.h        |  15 +-
 drivers/hwtracing/coresight/coresight-dummy.c      |   7 +-
 drivers/hwtracing/coresight/coresight-etb10.c      |   4 +-
 drivers/hwtracing/coresight/coresight-etm-perf.c   |   5 +-
 drivers/hwtracing/coresight/coresight-funnel.c     |   4 +-
 drivers/hwtracing/coresight/coresight-platform.c   |   4 +-
 drivers/hwtracing/coresight/coresight-priv.h       |   3 +-
 drivers/hwtracing/coresight/coresight-replicator.c |   4 +-
 drivers/hwtracing/coresight/coresight-stm.c        |   4 +-
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  15 +-
 drivers/hwtracing/coresight/coresight-tnoc.c       |   4 +-
 drivers/hwtracing/coresight/coresight-tpda.c       |   4 +-
 drivers/hwtracing/coresight/coresight-tpdm.c       |  40 ++-
 drivers/hwtracing/coresight/coresight-tpdm.h       |   2 +
 drivers/hwtracing/coresight/coresight-tpiu.c       |   4 +-
 drivers/hwtracing/coresight/ultrasoc-smb.c         |   4 +-
 include/linux/coresight.h                          |  14 +-
 25 files changed, 363 insertions(+), 508 deletions(-)

