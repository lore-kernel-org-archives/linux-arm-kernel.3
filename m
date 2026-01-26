Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E5DCF65D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 10:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+B8TENBcNG3z2Buog+0NwqcimSo2yypl91L27EWEb+Q=; b=ZxLvpJ4W35e5wmY5Ey+cW4t6P+
	9erB0Bbzl79NUQZ18NNF5cu+PpERicoZ6+cViq8uaSyQTaYnFfIdoMYMuhUCmCRO//u8lJGuPqk3L
	vrFDM9IE58AW8kvRSwEyHue3f2qa0vifz0gKH5b2dQ7tijekA1hiuxefx/a9gndiDIA1cCjVBdcFk
	ZFSnLivWxM9XDrirZOFlCy3tpYgPFIkObzKMaYX9xoAb98tS51v2MRUtyxI/20rKdsY31c7xBOUba
	rW/c2srkzznvcIO/DxUjumKgWI6DSzFYUHiGyRGVq/AZ5kbvDzJyqeaae2IB/ncDu8x67dtrKnoCh
	YIF7VRZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKAk-0000000CMLy-3T2Z;
	Mon, 26 Jan 2026 10:50:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKAh-0000000CMLO-3R1v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 10:50:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04B31339;
	Mon, 26 Jan 2026 02:50:06 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6588C3F632;
	Mon, 26 Jan 2026 02:50:11 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: gregkh@linuxfoundation.org
Cc: coresight@lists.linaro.org,
	james.clark@linaro.org,
	leo.yan@linux.dev,
	mike.leach@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [GIT PULL] coresight: Updates for Linux v7.0
Date: Mon, 26 Jan 2026 10:50:01 +0000
Message-ID: <20260126105001.2012310-1-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_025015_945303_9DC3082A 
X-CRM114-Status: GOOD (  12.42  )
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

Please find the coresight hwtracing subsystem changes for the next release.

Kindly pull

Suzuki




The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git tags/coresight-next-v7.0

for you to fetch changes up to eebe8dbd8630f51cf70b1f68a440cd3d7f7a914d:

  coresight: tmc: Decouple the perf buffer allocation from sysfs mode (2026-01-21 10:32:27 +0000)

----------------------------------------------------------------
coresight: Updates for Linux v6.20/v7.0

This batch of CoreSight hwtracing updates contains :
 - Fine grained control of Timestamp generation in ETM4 trace, retaining backward
   compatibility
 - Feature updates for Qualcomm TPDA driver
 - Support Qualcomm Interconnect TNOC
 - Miscellaneous fixes to TMC-ETR driver

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

----------------------------------------------------------------
Antonio Borneo (1):
      coresight: etm3x: Fix cpulocked warning on cpuhp

James Clark (13):
      coresight: Change syncfreq to be a u8
      coresight: Repack struct etmv4_drvdata
      coresight: Refactor etm4_config_timestamp_event()
      coresight: Hide unused ETMv3 format attributes
      coresight: Define format attributes with GEN_PMU_FORMAT_ATTR()
      coresight: Interpret ETMv3 config with ATTR_CFG_GET_FLD()
      coresight: Don't reject unrecognized ETMv3 format attributes
      coresight: Interpret perf config with ATTR_CFG_GET_FLD()
      coresight: Interpret ETMv4 config with ATTR_CFG_GET_FLD()
      coresight: Remove misleading definitions
      coresight: Prepare to allow setting the timestamp interval
      coresight: Extend width of timestamp format attribute
      coresight: docs: Document etm4x timestamp interval option

Jie Gan (3):
      dt-binding: Update oss email address for Coresight documents
      dt-bindings: arm: add CTCU device for monaco
      coresight: tpda: add global_flush_req sysfs node

Suzuki K Poulose (1):
      coresight: tpda: Fix intendation for sysfs interface documentation

Tao Zhang (3):
      coresight: tpda: add sysfs nodes for tpda cross-trigger configuration
      coresight: tpda: add logic to configure TPDA_SYNCR register
      coresight: tpda: add sysfs node to flush specific port

Yicong Yang (3):
      coresight: tmc: Add missing doc including reading and etr_mode of struct tmc_drvdata
      coresight: tmc-etr: Fix race condition between sysfs and perf mode
      coresight: tmc: Decouple the perf buffer allocation from sysfs mode

Yuanfang Zhang (3):
      dt-bindings: arm: qcom: Add Coresight Interconnect TNOC
      coresight-tnoc: add platform driver to support Interconnect TNOC
      coresight-tnoc: Add runtime PM support for Interconnect TNOC

 .../sysfs-bus-coresight-devices-dummy-source       |   4 +-
 .../ABI/testing/sysfs-bus-coresight-devices-tpda   |  69 +++++
 .../ABI/testing/sysfs-bus-coresight-devices-tpdm   |  56 ++--
 .../bindings/arm/arm,coresight-dummy-sink.yaml     |   2 +-
 .../bindings/arm/arm,coresight-dummy-source.yaml   |   2 +-
 .../bindings/arm/qcom,coresight-ctcu.yaml          |  15 +-
 .../bindings/arm/qcom,coresight-itnoc.yaml         |  90 +++++++
 .../bindings/arm/qcom,coresight-remote-etm.yaml    |   4 +-
 .../bindings/arm/qcom,coresight-tnoc.yaml          |   2 +-
 .../bindings/arm/qcom,coresight-tpda.yaml          |   4 +-
 .../bindings/arm/qcom,coresight-tpdm.yaml          |   4 +-
 Documentation/trace/coresight/coresight.rst        |  16 +-
 drivers/hwtracing/coresight/coresight-etm-perf.c   |  68 ++---
 drivers/hwtracing/coresight/coresight-etm-perf.h   |  38 +++
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  51 ++--
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 175 +++++++------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  92 +++++--
 drivers/hwtracing/coresight/coresight-tmc-etr.c    |  43 ++--
 drivers/hwtracing/coresight/coresight-tmc.h        |   2 +
 drivers/hwtracing/coresight/coresight-tnoc.c       | 136 +++++++++-
 drivers/hwtracing/coresight/coresight-tpda.c       | 284 ++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tpda.h       |  76 +++++-
 include/linux/coresight-pmu.h                      |  24 --
 23 files changed, 995 insertions(+), 262 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml

