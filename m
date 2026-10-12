Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA921CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 10:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7jSQXccZz67SfoSByW/IHKR9+e899bc+4lCA+6LQGXY=; b=H+pVr/YArSGq698o74ypRY1s2Z
	5UFkHx5j++pxghT5cM3/XX82n+Ti/I+DCk+f648/zfUuQIsqIGuQMn2fE0O3VghthZcQWNurCyW0B
	byixRDguwaP6/yemxuZTH+8BrZ+6BcqWeJptsOzKdVQGal1g2ST+QYJF5171B61r27XDVutdmuCFc
	OEY8kOtauerPxjqU3hWyZYGT7gXy8KXb8RdXPNUDuerHyLAa2D+c55jiutkli6JsH5yTwNYiHK0O1
	DFCy5MYmIISAhYuQNFZGbNcfmQPYlXk/BFwYhQiiS4sTc67Fhrl1gnmEf4JLue2UbA3zPOwajVH9e
	kGsgx/hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGD7E-0000000AC2l-2II3;
	Mon, 12 Oct 2026 10:18:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGD7A-0000000AC1x-3qDM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 10:18:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 718E81655;
	Mon, 12 Oct 2026 03:18:35 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BB2323F66F;
	Mon, 12 Oct 2026 03:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791800318; bh=s8sTa6DGl8lbju5M1WWIpjwAP4AT8Oh1lKCFikOOzbk=;
	h=From:To:Cc:Subject:Date:From;
	b=AWaw4lj8pj0UngXRPbPPXi4TfvlchY0iorjQVmtaIJd7PqkAV7Hl+77Eq/H/NQeXe
	 sEg5jqorYgSHu6I4ynNyxXGFqYUVBmzY8LuzXX5LxZKm1wtC2wsIH+V1rFLXPGB6Kz
	 B42B7/1/S9+UuxHOWsEGquTqTytC1b7q6BWBGTzs=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: gregkh@linuxfoundation.org
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	james.clark@linaro.org,
	leo.yan@linux.dev,
	mike.leach@arm.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [GIT PULL] coresight: Update for linux v7.4
Date: Mon, 12 Oct 2026 11:18:31 +0100
Message-ID: <20261012101831.2624135-1-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_031841_050560_C23AFFCE 
X-CRM114-Status: UNSURE (   8.64  )
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

Please find the updates for coresight self hosted tracing subsystem targeting
Linux v7.4. Apologies for the delay!

Kindly pull.

Suzuki


The following changes since commit df2908090cda368b01ff43709f51890076c56157:

  Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git tags/coresight-next-v7.4

for you to fetch changes up to 343cfcbb3ecfdb80aa576a428cfa3b65ad783842:

  coresight: tnoc: Constify amba_id table (2026-10-09 11:32:08 +0100)

----------------------------------------------------------------
coresight: updates for Linux v7.4

CoreSight selfhosted tracing subsystem updates for Linux v7.4, includes:
 - Separating the ETM configurations for sysfs and perf to avoid corrupting
   each other while in use
 - Hide sysfs control for TRBE as it is not supported
 - Constify Amba device table for tnoc

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

----------------------------------------------------------------
James Clark (1):
      coresight: trbe: Hide enable_sink sysfs file

Krzysztof Kozlowski (1):
      coresight: tnoc: Constify amba_id table

Yeoreum Yun (14):
      coresight: etm4x: Prohibit TRCSEQSTR modifications while tracing enabled
      coresight: etm4x: prohibit modifying cntr_val while session is enabled
      coresight: etm3x: Prohibit modifying cntr_val while session is enabled
      coresight: etm4x: fix inconsistencies with sysfs configuration
      coresight: etm3x: fix inconsistencies with sysfs configuration
      coresight: etm3x: remove redundant cpu online check on etm_enable_sysfs()
      coresight: etm4x: introduce struct etm4_caps
      coresight: etm4x: exclude ss_status from drvdata->config
      coresight: etm4x: remove s_ex_level from config
      coresight: etm4x: rename local config as curr_config referring drvdata->curr_config
      coresight: etm4x: rename drvdata->config to sysfs_config
      coresight: etm3x: introduce struct etm_caps
      coresight: etm3x: rename local config as curr_config referring drvdata->curr_config
      coresight: etm3x: rename drvdata->config to sysfs_config

 drivers/hwtracing/coresight/coresight-config.c     |  18 +-
 drivers/hwtracing/coresight/coresight-config.h     |  22 +
 drivers/hwtracing/coresight/coresight-core.c       |   1 +
 drivers/hwtracing/coresight/coresight-etm.h        |  48 +-
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 196 +++--
 .../hwtracing/coresight/coresight-etm3x-sysfs.c    | 461 +++++-----
 drivers/hwtracing/coresight/coresight-etm4x-cfg.c  |  14 +-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 561 ++++++------
 .../hwtracing/coresight/coresight-etm4x-sysfs.c    | 961 +++++++++++----------
 drivers/hwtracing/coresight/coresight-etm4x.h      | 199 +++--
 drivers/hwtracing/coresight/coresight-sysfs.c      |  15 +-
 drivers/hwtracing/coresight/coresight-tnoc.c       |   2 +-
 drivers/hwtracing/coresight/coresight-trbe.c       |   7 +
 include/linux/coresight.h                          |   4 +
 14 files changed, 1359 insertions(+), 1150 deletions(-)

