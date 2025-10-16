Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1077CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 09:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/0hyDXsJ9IyuRvBK5rBVDSvme02eX6ojL/zPQdZPs68=; b=k4SiqktHNPbhdK10gJ9o63xYLp
	KOnKGHIOWtzoAivAIEpRE5t+pJpizQQmB/GLyV7bcZRfjCjj6jbauL9tGuaXnocGIaLtRPO+HLc9d
	WBJFGKkA1S7uaREEl8fv7XuSP0pkU/3CuPA6TUCmBK8XrYJq5gS23pupLhWBkZUxDuNuIcnhlJfnB
	oySCvc4QgJyXq8poaXvoYr2rLHtBhbtm1/+PdFW17uulDD0Tx1iJT6o+pU697d04/pCORVlrmdPTB
	jwUTZ6tSAbLVa2PcgEK2KVHiKkGgzrchQl9SOmjh8zgTvyFwH1zNCovDLt6iA4LUXqzZKSYs26OIW
	C6nfje/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KNq-00000004E6c-05Bq;
	Thu, 16 Oct 2025 09:34:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KNo-00000004E6C-0BRb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 09:34:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94B2A1688;
	Thu, 16 Oct 2025 02:34:43 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 47CFF3F6A8;
	Thu, 16 Oct 2025 02:34:50 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	arm-scmi@vger.kernel.org,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm_scmi: Fixes for v6.18
Date: Thu, 16 Oct 2025 10:34:48 +0100
Message-Id: <20251016093448.945198-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_023452_122983_602A2FDD 
X-CRM114-Status: UNSURE (   6.75  )
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

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fixes-6.18

for you to fetch changes up to 20b93a0088a595bceed4a026d527cbbac4e876c5:

  firmware: arm_scmi: Fix premature SCMI_XFER_FLAG_IS_RAW clearing in raw mode (2025-10-15 15:28:49 +0100)

----------------------------------------------------------------
Arm SCMI fixes for v6.18

This series contains a set of small, focused fixes that address
robustness and lifecycle issues in the Arm SCMI core and debug support,
ensuring safer handling of debug initialization failures, correct flag
management in raw mode, and consistent inflight counter tracking.

Brief summary:

 - Fix raw xfer flag clearing
 - Skip RAW debug initialization on failure
 - Make inflight counter helpers null-safe, preventing crashes if debug
   initialization fails
 - Account for failed debug initialization globally

There is no functional change for standard SCMI operation, but these
fixes improve stability in debug and raw modes, particularly in error
paths.

----------------------------------------------------------------
Artem Shimko (1):
      firmware: arm_scmi: Fix premature SCMI_XFER_FLAG_IS_RAW clearing in raw mode

Cristian Marussi (3):
      firmware: arm_scmi: Account for failed debug initialization
      include: trace: Fix inflight count helper on failed initialization
      firmware: arm_scmi: Skip RAW initialization on failure

 drivers/firmware/arm_scmi/common.h | 32 +++++++++++++++++----
 drivers/firmware/arm_scmi/driver.c | 59 ++++++++++++++------------------------
 2 files changed, 47 insertions(+), 44 deletions(-)

