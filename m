Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C35E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 10:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nJVW/+up0PM8YMKGfoJVpwFub0IHiAvU04TCTrTl/+I=; b=AXD5lfIdWB8fw1OCCBt5RpvmCj
	GBxlhJDSHhbjWZJkPK49nvaZj66xoWC+sQfOyR2Uqo1vRln3hPEc+HGT3//CaWlxB7g85NHZuFZ0g
	aSZ3chQ4/XAslKg82kOd1hAfvAJ901lYZO3utHjzzUEKQ7LSPlzf+cj15UlRH+C4E934Mou9w1Ztj
	kx45otT8DaPdFZxoxqYVW5cxom7IpkA7AgPtVfvOBCgvrXL2v5zzmyTj7OfPthXJcMD/6mO9RihBh
	M8E9q+BzNfKeLTpGRLUIfhVZIn47hU4NOc3DkRihLZgX5UadefXCCh1x/gyaWHxxqG2NoYVe+mK8K
	Xp6OeRzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKxIh-0000000B6jC-4Al5;
	Tue, 10 Dec 2024 10:17:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKxD5-0000000B5Gi-3sCD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 10:11:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 288E1113E;
	Tue, 10 Dec 2024 02:11:47 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1F6D43F58B;
	Tue, 10 Dec 2024 02:11:18 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL v2] firmware: arm_ffa: Fix for v6.13
Date: Tue, 10 Dec 2024 10:11:13 +0000
Message-Id: <20241210101113.3232602-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_021120_001812_D5B099D4 
X-CRM114-Status: UNSURE (   6.49  )
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

Please pull ! Sorry for the confusion, this is updated PR with wrong patch
dropped.

Regards,
Sudeep

-->8

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-fix-6.13

for you to fetch changes up to 6fe437cfe2cdc797b03f63b338a13fac96ed6a08:

  firmware: arm_ffa: Fix the race around setting ffa_dev->properties (2024-12-04 09:59:54 +0000)

----------------------------------------------------------------
Arm FF-A fix for v6.13

A single fix to address a possible race around setting ffa_dev->properties
in ffa_device_register() by updating ffa_device_register() to take all
the partition information received from the firmware and updating the
struct ffa_device accordingly before registering the device to the
bus/driver model in the kernel.

----------------------------------------------------------------
Levi Yun (1):
      firmware: arm_ffa: Fix the race around setting ffa_dev->properties

 drivers/firmware/arm_ffa/bus.c    | 15 +++++++++++----
 drivers/firmware/arm_ffa/driver.c |  7 +------
 include/linux/arm_ffa.h           | 13 ++++++++-----
 3 files changed, 20 insertions(+), 15 deletions(-)

