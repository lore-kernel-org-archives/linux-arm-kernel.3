Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF2BC5AD05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 23:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lY9Jps6uLxOk9NRRTEocbkemsvfBfLbCkGk/J7yRy8E=; b=D3889hFVt3rtGdpA08ooc9oTLT
	WO7yw4HgpR3PPctsdmwSROkJKSaoRoaxFTtdMLMdkQdTcPZsueQxIsuMJSrEayIY+PnovfsuSUYcH
	C6fkKQOWwbIl4wUIFMX4dwbumjxKS+FpOo3HT2oc3hB8zsn0jYzasJ6+xJKFXgYOPTGyI5Yvw6U8X
	Pv4wlU5C02mbZPWhz0lffDLrXkPZsE1GH7+sNo6We6iY8Q8G72SrJH3X50LCZnr3KWDkc8uwTPcm0
	gFtBcbKdDCGaLotoR58EaI6MLtPIyJ6T/sFDq29RuB74r2wNvOeILYi82zrf22FT6sYYBGsqS4xw5
	W7wUMaZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsTYy-00000008qfS-1DR2;
	Fri, 07 Aug 2026 23:01:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsTYv-00000008qep-00e8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 23:01:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 029EC1BF3;
	Fri,  7 Aug 2026 16:01:05 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DB1B63F632;
	Fri,  7 Aug 2026 16:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786143669; bh=Y4YnBIEHOVD5YBXV955IG1IS0Z5Nm1s2IpEL0Fgk224=;
	h=From:To:Cc:Subject:Date:From;
	b=SfxjORYxp6Uz6WjqCAQIkjOzWQhoYjAiX2y5Gpc1MG6Oi93ozUyR1/596B3q+U4y8
	 porfCZptlBNWcUzn1AJey96w7TetKS4sYbl6HiKfQLwjxh948L5UOpyGKEb8TYCWud
	 lyH8TPXnplA3r2WzKwdqgvEcakXoxDLLXfzYORCw=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: gregkh@linuxfoundation.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org,
	leo.yan@linux.dev,
	james.clark@linaro.org,
	mike.leach@arm.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [GIT PULL] coresight: Updates for Linux v7.3
Date: Sat,  8 Aug 2026 00:00:57 +0100
Message-ID: <20260807230057.119105-1-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_160113_576912_38C453A8 
X-CRM114-Status: UNSURE (   8.46  )
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

Please find this pull request for CoreSight subsystem targeting v7.3.
Almost all of them are fixes to the existing code, along with a MAINTAINERS
update for HiSilicon PTT driver.

Kindly pull

Suzuki



The following changes since commit 8cdeaa50eae8dad34885515f62559ee83e7e8dda:

  Linux 7.2-rc2 (2026-07-05 14:44:06 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git tags/coresight-next-v7.3

for you to fetch changes up to 9e3604d7369cfc0110100eb1a0acab1865ee2d18:

  coresight: etm4x: remove redundant fields in etmv4_save_state (2026-08-07 10:45:11 +0100)

----------------------------------------------------------------
coresight: Updates for Linux v7.3

This is relatively smaller update for CoreSight/hwtracing subsystem updates.
 - MAINTAINERS update for HiSilicon PCI Trace & Tune drivers
 - Minor fixes to hisi_ptt driver
 - Various fixes to the coresight etm4x dirvers

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

----------------------------------------------------------------
Jonathan Cameron (1):
      MAINTAINERS: Update HiSilicon PCI Trace and Tune maintainer

Kuan-Wei Chiu (1):
      coresight: etm3x: Fix cntr_val_show() to match cntr_val_store() behavior

Sanman Pradhan (2):
      hwtracing: hisi_ptt: Propagate DMA reset timeout in trace_start()
      hwtracing: hisi_ptt: Remove unnecessary trace buffer zeroing in trace_start()

Yeoreum Yun (5):
      coresight: etm4x: fix wrong check of etm4x_sspcicrn_present()
      coresight: etm4x: fix underflow for usage of (nrseqstate - 1)
      coresight: etm4x: fix leaked trace id
      coresight: etm4x: missing cscfg_csdev_disable_active_config() in perf enable
      coresight: etm4x: remove redundant fields in etmv4_save_state

 MAINTAINERS                                        |  3 +-
 .../hwtracing/coresight/coresight-etm3x-sysfs.c    | 15 ++----
 drivers/hwtracing/coresight/coresight-etm4x-cfg.c  |  2 +-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 59 +++++++++++++---------
 .../hwtracing/coresight/coresight-etm4x-sysfs.c    |  6 ++-
 drivers/hwtracing/coresight/coresight-etm4x.h      | 12 ++---
 drivers/hwtracing/ptt/hisi_ptt.c                   | 25 ++++-----
 7 files changed, 63 insertions(+), 59 deletions(-)

