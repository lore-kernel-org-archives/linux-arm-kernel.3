Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394ECC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UTCQ+CVb55TQZlsh0XC7eCr/KrwwhkcV6q9wAW/my18=; b=YuZNN28kv/JP3rRnVBJY4Rvmq6
	haikeRmAJ0xpmtrJwVPyvchnuNF1Vrh7el7E3VWAQubBu5FhmITKe5bD36jET9iYZEZcGIMtmd+jN
	v2eZ5BuLnu4XTOiixb6Ybpr1WMk9v/7Mn3N1mi+WvarGJQ7u2r6KwyC2yfN4BuxBjqQZISiS2zaNs
	aB3U8w64SCd4r99K/32H2VudN4nGTAzE6wEi4Fg/Gp4vMwnRJNsVfh9KPs7T1acWhgVC9mIbjesbT
	cq/aU8gMJ6MymsMtf7qRKuCPAgq7X769dUJ2P26Q2vVuJavpfPG3Dc65oYaKZG5Tu+kZYyLhSErqB
	bXPuI5uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR4x-00000004Wnh-1mGO;
	Tue, 04 Mar 2025 12:08:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPz8-00000004IwP-0w6z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 10:58:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06972FEC;
	Tue,  4 Mar 2025 02:59:03 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F3B823F5A1;
	Tue,  4 Mar 2025 02:58:47 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [GIT PULL] firmware: smccc: Update for v6.15
Date: Tue,  4 Mar 2025 10:58:45 +0000
Message-Id: <20250304105845.432813-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_025850_305327_564A2B50 
X-CRM114-Status: UNSURE (   8.33  )
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

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/smccc-update-6.15

for you to fetch changes up to 5f9c23abc47744f2578af4a362655c31254c93b5:

  firmware: smccc: Support optional Arm SMCCC SOC_ID name (2025-03-03 14:53:46 +0000)

----------------------------------------------------------------
Arm SMCCC update for v6.15

Just a single update introducing the support for the optional SOC_ID
name string from the Arm SMCCC v1.6 specification.

If the SOC_ID name string is implemented, the machine field of the SoC
Device Attributes will reflect it.

The original intent of SOC_ID was to provide a JEP-106 code for the SiP
and the SoC revision to uniquely identify the SoC. However, there has
been a request to add this optional name so that SoC firmware can
directly provide the SoC name to the OS.

This change avoids the need for frequent updates to various tools that
would otherwise require maintaining hardcoded model/machine name tables
for new SoCs.

----------------------------------------------------------------
Paul Benoit (1):
      firmware: smccc: Support optional Arm SMCCC SOC_ID name

 drivers/firmware/smccc/soc_id.c | 80 +++++++++++++++++++++++++++++++++++++++++
 include/linux/arm-smccc.h       | 40 +++++++++++++++++++++
 2 files changed, 120 insertions(+)

