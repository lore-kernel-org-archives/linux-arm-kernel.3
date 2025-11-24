Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB28CFD318
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 05:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0I0b6VG1KkL4mO2cbwIjVKteVxduDzsMaowe4bk0Tj4=; b=hDL1Ul1TusB2x4p//2Gxjp/CFL
	D8fZItylbm5lBv6PsiEbxwnR2ZfLGgOByfLERuXm7KdH1O0HnkAnLKuFGYXKwDyWqMgL/1/ZEutNi
	EW0w5JDVcG760WoUWe2lP7eNFQ7HOJVeCP+6aWKMVNuWk4zjA3PqxTWz9C3kZpUTx18D5JJgCZa+3
	t49hAfJ3EA96iv8aksQZIlI3qjolsVaHamvDDXK8G5hcqtevJ9c5Q4Fzv9LvXicpt3rQbTn0Bpgl0
	3wgzLv60SL3Nj7jtzwXQLp4m5TI35Mnc/2647DB3B+j/1/4/GeNpqQKtd/3PfL2rCb/H4g1u3zFzF
	8hQdp2yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNPD6-0000000B7D2-3r0s;
	Mon, 24 Nov 2025 05:34:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNPD4-0000000B7Ci-4C3c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 05:34:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46064339;
	Sun, 23 Nov 2025 21:33:47 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 260B13F66E;
	Sun, 23 Nov 2025 21:33:54 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: gregkh@linuxfoundation.org
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [GIT PULL] coresight: Updates for Linux v6.19
Date: Mon, 24 Nov 2025 05:33:42 +0000
Message-ID: <20251124053342.1082606-1-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_213359_161090_6D5CA5D2 
X-CRM114-Status: UNSURE (   8.94  )
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

Hi Greg,

Please find the coresight self hosted tracing subsystem updates targeting v6.19.

Kindly pull,

Suzuki



The following changes since commit dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa:

  Linux 6.18-rc3 (2025-10-26 15:59:49 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git tags/coresight-next-v6.19

for you to fetch changes up to 9e9182cab5ebc3ee7544e60ef08ba19fdf216920:

  coresight: etm4x: Remove the state_needs_restore flag (2025-11-12 16:53:19 +0000)

----------------------------------------------------------------
coresight: Updates for Linux v6.19

The changes for Linux v6.19 include :
 - Support for static TPDM
 - Fixes to TMC-ETR with CATU where buffer wasn't available to CATU in perf mode
 - Clean ups to the component operations to accept coresight_path
 - Fixes to the ETM4x/ETM3x driver

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

----------------------------------------------------------------
Carl Worth (1):
      coresight: tmc: add the handle of the event to the path

Jie Gan (5):
      dt-bindings: arm: document the static TPDM compatible
      coresight: tpdm: add static tpdm support
      coresight: tpdm: remove redundant check for drvdata
      coresight: change helper_ops to accept coresight_path
      coresight: change the sink_ops to accept coresight_path

Leo Yan (8):
      coresight: Change device mode to atomic type
      coresight: etm4x: Always set tracer's device mode on target CPU
      coresight: etm3x: Always set tracer's device mode on target CPU
      coresight: etm4x: Correct polling IDLE bit
      coresight: etm4x: Add context synchronization before enabling trace
      coresight: etm4x: Properly control filter in CPU idle with FEAT_TRF
      coresight: etm4x: Remove the redundant DSB
      coresight: etm4x: Remove the state_needs_restore flag

Xiaoqi Zhuang (1):
      coresight: ETR: Fix ETR buffer use-after-free issue

 .../bindings/arm/qcom,coresight-tpdm.yaml          |  23 ++-
 drivers/hwtracing/coresight/coresight-catu.c       |  10 +-
 drivers/hwtracing/coresight/coresight-core.c       |  30 ++--
 drivers/hwtracing/coresight/coresight-ctcu-core.c  |   9 +-
 drivers/hwtracing/coresight/coresight-cti-core.c   |   5 +-
 drivers/hwtracing/coresight/coresight-cti.h        |   5 +-
 drivers/hwtracing/coresight/coresight-dummy.c      |   2 +-
 drivers/hwtracing/coresight/coresight-etb10.c      |   8 +-
 drivers/hwtracing/coresight/coresight-etm-perf.c   |   3 +-
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  59 ++++---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 140 +++++++++++------
 drivers/hwtracing/coresight/coresight-etm4x.h      |   5 -
 drivers/hwtracing/coresight/coresight-priv.h       |   3 +-
 drivers/hwtracing/coresight/coresight-sysfs.c      |   2 +-
 drivers/hwtracing/coresight/coresight-tmc-etf.c    |  10 +-
 drivers/hwtracing/coresight/coresight-tmc-etr.c    |  22 ++-
 drivers/hwtracing/coresight/coresight-tmc.h        |   3 +-
 drivers/hwtracing/coresight/coresight-tpda.c       |   7 -
 drivers/hwtracing/coresight/coresight-tpdm.c       | 174 +++++++++++++++++----
 drivers/hwtracing/coresight/coresight-tpdm.h       |  12 ++
 drivers/hwtracing/coresight/coresight-tpiu.c       |   2 +-
 drivers/hwtracing/coresight/coresight-trbe.c       |   4 +-
 drivers/hwtracing/coresight/ultrasoc-smb.c         |   9 +-
 include/linux/coresight.h                          |  42 ++---
 24 files changed, 402 insertions(+), 187 deletions(-)

