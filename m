Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133A6E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 15:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lB17iS9sBDDvGdJpTuo7hHtSRfB14ZZi0ONL32MxpmQ=; b=uj6oNtQkMIetij4xXbYlXFEVEv
	4EvH5sih8JbqEJyjLpjMgkHHFIaE9p8jxagb+XV6rYUTTMf65HOZOpqNk9XutBQmThH0bfRrjTQNt
	vJz074t92eyqBzp0NdZBk8KrTHRm2fqqFX07m4RLTV23X3U7CLoypgBUL1s+klvuj78tBE7GxMR3P
	k3l5gPIHWHQzL7ErgvVlYIeyxckjMxAOFvqY9y5Z3V7L1S0Cx52tTrr44JAb9jHzlvPDrA0WSwhAq
	Pk4jmKoRH4ex7qBWeB7ARI1eofaHchFZlytiQ2jWe23C/U36ajvXwcK26sLtbYxzktz+/oCEIwqvY
	xNFNCkHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTNKZ-0000000AjYK-1hma;
	Thu, 02 Jan 2025 15:41:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTNJJ-0000000AjQB-4ASh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 15:40:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABF2011FB;
	Thu,  2 Jan 2025 07:41:01 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5EDD03F59E;
	Thu,  2 Jan 2025 07:40:32 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v6.14
Date: Thu,  2 Jan 2025 15:40:24 +0000
Message-Id: <20250102154024.2168165-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_074034_076193_56009299 
X-CRM114-Status: UNSURE (   7.37  )
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

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-6.14

for you to fetch changes up to 3f3f0e53e9ae906844e8309fa433b48372f905e1:

  firmware: arm_scmi: Add aliases to transport modules (2024-12-10 10:30:45 +0000)

----------------------------------------------------------------
Arm SCMI updates for 6.14

This mainly has 2 updates:
1. Extension of the transport properties read from devicetree to support
   multiple SCMI platform/server instances
2. Addition of the capability to automatically load the proper SCMI vendor
   protocol module. The vendor protocol selection is already provided by
   the SCMI core while the automatic loading of vendor protocols was not.

----------------------------------------------------------------
Cristian Marussi (4):
      firmware: arm_scmi: Allow transport properties for multiple instances
      firmware: arm_scmi: Support vendor protocol modules autoloading
      firmware: arm_scmi: Add module aliases to i.MX vendor protocols
      firmware: arm_scmi: Add aliases to transport modules

 drivers/firmware/arm_scmi/common.h                 |  4 +-
 drivers/firmware/arm_scmi/driver.c                 | 74 ++++++++++++++++------
 drivers/firmware/arm_scmi/transports/mailbox.c     |  1 +
 drivers/firmware/arm_scmi/transports/smc.c         |  1 +
 drivers/firmware/arm_scmi/transports/virtio.c      |  1 +
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c |  5 +-
 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    |  5 +-
 include/linux/scmi_imx_protocol.h                  |  9 +--
 8 files changed, 71 insertions(+), 29 deletions(-)

