Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15646E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 22:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n+UpZRitkq1wJyiMqH2WXOFToiA2mvPTkbWiBtyfrI4=; b=t0nJQby1qQbKFIApM0ebAMXNdZ
	Jwb65vOfeYBwWcSpYKwn0IvtrDHTg5mfLLY+MtZszEm7Onl/03vpJECHIR/C/9uAvs+/jcwdr+ESk
	tUYYTmPmzPAi0B8eZUUBcKGX5YSLcKbZalBKmog9v07oQpfVQdeur4e3JdFGB5IpP5uQSfeIjNIYJ
	SBMgYu6yPjnPMrQboP5CQAi8LAqoAZnNCZF0qKcVyTvY4HUe9ygdbQTh/zVPq18LhDA3J72oxmtK3
	aYGoVi37Z9gb0dxV62dCpEwKgQ93gK8mfb7+5qvVmK2okqjtaoUv8IbzNor7fMdmcJltu9836NiQq
	PYR+6Qbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW0ib-0000000DQzp-0lly;
	Thu, 09 Jan 2025 22:09:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW0hM-0000000DQtn-3D2g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 22:08:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E35381655;
	Thu,  9 Jan 2025 14:08:42 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D6F9F3F59E;
	Thu,  9 Jan 2025 14:08:13 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: gregkh@linuxfoundation.org
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	suzuki.poulose@arm.com
Subject: [GIT PULL] coresight: Updates for Linux v6.14
Date: Thu,  9 Jan 2025 22:07:32 +0000
Message-Id: <20250109220732.2032306-1-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_140816_847777_D3BC98F1 
X-CRM114-Status: UNSURE (   8.93  )
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

Greg,

Please find the changes targeting v6.14 for the CoreSight self hosted tracing
subsystem.

Kindly pull

Suzuki



The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:

  Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git tags/coresight-next-v6.14

for you to fetch changes up to 56e14a21cee4ea6074b956a9ff2e406de5ad6548:

  coresight-tpda: Optimize the function of reading element size (2024-12-13 10:25:15 +0000)

----------------------------------------------------------------
coresight: Updates for Linux v6.14

Coresight self-hosted tracing subsystem updates for v6.14 includes:

  - Support for static traceid allocation for devices
  - Support for impdef, static trace filtering in Qualcomm replicators
  - Miscellaneous fixes

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

----------------------------------------------------------------
James Clark (1):
      coresight: Drop atomics in connection refcounts

Mao Jinlong (3):
      dt-bindings: arm: Add arm,static-trace-id for coresight dummy source
      coresight: Add support to get static id for system trace sources
      coresight: dummy: Add static trace id support for dummy source

Pei Xiao (1):
      coresight: Fix dsb_mode_store() unsigned val is never less than zero

Songwei Chai (1):
      Coresight: Narrow down the matching range of tpdm

Tao Zhang (4):
      dt-bindings: arm: qcom,coresight-static-replicator: Add property for source filtering
      coresight: Add a helper to check if a device is source
      coresight: Add support for trace filtering by source
      coresight-tpda: Optimize the function of reading element size

 .../sysfs-bus-coresight-devices-dummy-source       |  15 +++
 .../bindings/arm/arm,coresight-dummy-source.yaml   |   6 ++
 .../arm/arm,coresight-static-replicator.yaml       |  19 +++-
 drivers/hwtracing/coresight/coresight-core.c       | 113 +++++++++++++++++----
 drivers/hwtracing/coresight/coresight-dummy.c      |  81 +++++++++++++--
 drivers/hwtracing/coresight/coresight-funnel.c     |   6 +-
 drivers/hwtracing/coresight/coresight-platform.c   |  27 +++++
 drivers/hwtracing/coresight/coresight-replicator.c |   6 +-
 drivers/hwtracing/coresight/coresight-tpda.c       |  19 +++-
 drivers/hwtracing/coresight/coresight-tpdm.c       |   7 +-
 drivers/hwtracing/coresight/coresight-trace-id.c   |  43 +++++---
 drivers/hwtracing/coresight/coresight-trace-id.h   |   9 ++
 include/linux/coresight.h                          |  17 +++-
 13 files changed, 309 insertions(+), 59 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source

