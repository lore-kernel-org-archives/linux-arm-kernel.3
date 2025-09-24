Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49556CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 08:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k0l1QJGoFegY63YDH+E8NnlnBrbPmW0Zeh/7waplptY=; b=HyeW99+Mh+sZiErtiW/b/K79fp
	QnPH0ok7gDTts9Cc2izuv1tJGosLUJJye+HJyAMHVk1ZYt/mUPbzC6Xrey37N2Cdk5LWkVWgcNPPv
	uRTDA3UJAb2H5dbgttLC6BJ8gwNAgr3RuwkKBNiKF4HLJj4X+ubwZkqLtuxVOsIEGZ3+vji8dvLB5
	N3eE7meWbubRZ2f/2cm7lo4iBJwxtQCLthYORmSQaqByFNAkrvW+U1U5qI3utyPCJUvDT/Mj7SRb3
	bYH6+mF56hEHdHWPypJcYBsyVbCThIWwxJcbIpGrJrVLQSFiizZ+EN8zkl1ZTYrfQX0lUvO43hUvr
	Dr5u5WcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Km9-0000000FqxF-1NIR;
	Wed, 24 Sep 2025 08:22:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Km6-0000000FqwA-0mNm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 08:22:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D321106F;
	Wed, 24 Sep 2025 01:22:43 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 397AA3F66E;
	Wed, 24 Sep 2025 01:22:50 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: gregkh@linuxfoundation.org
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	james.clark@linaro.org,
	leo.yan@linux.dev,
	mike.leach@linaro.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [UPDATED] [GIT PULL] coresight: Updates for Linux v6.18
Date: Wed, 24 Sep 2025 09:22:42 +0100
Message-ID: <20250924082242.2306143-1-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2025092306-foster-outsource-fb07@gregkh>
References: <2025092306-foster-outsource-fb07@gregkh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_012254_314161_5A4C5616 
X-CRM114-Status: GOOD (  14.98  )
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

Please find the updated pull request to fix the invalid commit reference in
the fixes tag, in the original pull request [0]

Apologies for the inconvenience.

[0] https://lkml.kernel.org/r/20250922125907.2268152-1-suzuki.poulose@arm.com

Kindly pull,

Suzuki

---

The following changes since commit 1b237f190eb3d36f52dffe07a40b5eb210280e00:

  Linux 6.17-rc3 (2025-08-24 12:04:12 -0400)

are available in the Git repository at:

  git//git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git tags/coresight-next-v6.18-v2

for you to fetch changes up to 01f96b812526a2c8dcd5c0e510dda37e09ec8bcd:

  coresight: Add label sysfs node support (2025-09-23 14:14:13 +0100)

----------------------------------------------------------------
coresight: Updates for Linux v6.18, take 2

This is an updated drop for v6.18, fixing the invalid commit
reference in the original tag.

CoreSight selfhosted tracing subsystem updates targeting Linux v6.18, includes:

 - Clean up and consolidate clocks handling
 - Support for exposing labels via sysfs for better device identification
 - Add Qualcomm Trace Network On Chip driver support
 - Miscellaneous fixes

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

----------------------------------------------------------------
Dan Carpenter (1):
      coresight: tnoc: Fix a NULL vs IS_ERR() bug in probe

James Clark (2):
      coresight: trbe: Add ISB after TRBLIMITR write
      coresight: Fix missing include for FIELD_GET

Jie Gan (1):
      coresight: tpda: fix the logic to setup the element size

Leo Yan (13):
      coresight: stm: Remove redundant NULL checks
      coresight: perf: Use %px for printing pointers
      coresight: tmc: Support atclk
      coresight: catu: Support atclk
      coresight: etm4x: Support atclk
      coresight: Appropriately disable programming clocks
      coresight: Appropriately disable trace bus clocks
      coresight: Avoid enable programming clock duplicately
      coresight: Consolidate clock enabling
      coresight: Refactor driver data allocation
      coresight: Make clock sequence consistent
      coresight: Refactor runtime PM
      coresight: trbe: Return NULL pointer for allocation failures

Lin Yujun (1):
      coresight: Fix incorrect handling for return value of devm_kzalloc

Mao Jinlong (2):
      dt-bindings: arm: Add label in the coresight components
      coresight: Add label sysfs node support

Rob Herring (Arm) (1):
      hwtracing: coresight: Use of_reserved_mem_region_to_resource() for "memory-region"

Yeoreum Yun (1):
      coresight: fix indentation error in cscfg_remove_owned_csdev_configs()

Yuanfang Zhang (5):
      coresight: Only register perf symlink for sinks with alloc_buffer
      dt-bindings: arm: Add device Trace Network On Chip definition
      coresight: add coresight Trace Network On Chip driver
      coresight-etm4x: Conditionally access register TRCEXTINSELR
      coresight: tnoc: add new AMBA ID to support Trace Noc V2

 .../ABI/testing/sysfs-bus-coresight-devices-cti    |   6 +
 .../sysfs-bus-coresight-devices-dummy-source       |   6 +
 .../ABI/testing/sysfs-bus-coresight-devices-etb10  |   6 +
 .../ABI/testing/sysfs-bus-coresight-devices-etm3x  |   6 +
 .../ABI/testing/sysfs-bus-coresight-devices-etm4x  |   6 +
 .../ABI/testing/sysfs-bus-coresight-devices-funnel |   6 +
 .../ABI/testing/sysfs-bus-coresight-devices-stm    |   6 +
 .../ABI/testing/sysfs-bus-coresight-devices-tmc    |   6 +
 .../ABI/testing/sysfs-bus-coresight-devices-tpdm   |   6 +
 .../ABI/testing/sysfs-bus-coresight-devices-trbe   |   6 +
 .../devicetree/bindings/arm/arm,coresight-cti.yaml |   4 +
 .../bindings/arm/arm,coresight-dummy-sink.yaml     |   4 +
 .../bindings/arm/arm,coresight-dummy-source.yaml   |   4 +
 .../bindings/arm/arm,coresight-dynamic-funnel.yaml |   4 +
 .../arm/arm,coresight-dynamic-replicator.yaml      |   4 +
 .../bindings/arm/arm,coresight-etb10.yaml          |   4 +
 .../devicetree/bindings/arm/arm,coresight-etm.yaml |   4 +
 .../bindings/arm/arm,coresight-static-funnel.yaml  |   4 +
 .../arm/arm,coresight-static-replicator.yaml       |   4 +
 .../devicetree/bindings/arm/arm,coresight-tmc.yaml |   4 +
 .../bindings/arm/arm,coresight-tpiu.yaml           |   4 +
 .../bindings/arm/qcom,coresight-ctcu.yaml          |   4 +
 .../bindings/arm/qcom,coresight-remote-etm.yaml    |   4 +
 .../bindings/arm/qcom,coresight-tnoc.yaml          | 113 ++++++++++
 .../bindings/arm/qcom,coresight-tpda.yaml          |   4 +
 .../bindings/arm/qcom,coresight-tpdm.yaml          |   4 +
 drivers/hwtracing/coresight/Kconfig                |  12 +
 drivers/hwtracing/coresight/Makefile               |   1 +
 drivers/hwtracing/coresight/coresight-catu.c       |  53 +++--
 drivers/hwtracing/coresight/coresight-catu.h       |   1 +
 drivers/hwtracing/coresight/coresight-core.c       |  54 ++++-
 drivers/hwtracing/coresight/coresight-cpu-debug.c  |  41 ++--
 drivers/hwtracing/coresight/coresight-ctcu-core.c  |  24 +-
 drivers/hwtracing/coresight/coresight-etb10.c      |  18 +-
 drivers/hwtracing/coresight/coresight-etm-perf.c   |   4 +-
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  17 +-
 drivers/hwtracing/coresight/coresight-etm4x-core.c |  44 ++--
 .../hwtracing/coresight/coresight-etm4x-sysfs.c    |   1 +
 drivers/hwtracing/coresight/coresight-etm4x.h      |   6 +-
 drivers/hwtracing/coresight/coresight-funnel.c     |  66 ++----
 drivers/hwtracing/coresight/coresight-replicator.c |  63 ++----
 drivers/hwtracing/coresight/coresight-stm.c        |  42 ++--
 drivers/hwtracing/coresight/coresight-syscfg.c     |   2 +-
 drivers/hwtracing/coresight/coresight-sysfs.c      |  71 +++++-
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  70 +++---
 drivers/hwtracing/coresight/coresight-tmc.h        |   2 +
 drivers/hwtracing/coresight/coresight-tnoc.c       | 246 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.c       |   3 +
 drivers/hwtracing/coresight/coresight-tpiu.c       |  36 ++-
 drivers/hwtracing/coresight/coresight-trbe.c       |   9 +-
 drivers/hwtracing/coresight/ultrasoc-smb.h         |   1 +
 include/linux/coresight.h                          |  31 +--
 52 files changed, 827 insertions(+), 324 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
 create mode 100644 drivers/hwtracing/coresight/coresight-tnoc.c

