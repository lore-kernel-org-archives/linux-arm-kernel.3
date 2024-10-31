Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B907D767F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 17:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9E8U5MzcZGR3giVp+xiRgBKX1lANXLsIHfeh1N4U8MI=; b=GabYvtfNpYwrHwAlHLQ3rrsOno
	WzbiAIGq1aceL4Q0FcJM+JsmWmKqpISoB0RDD/njjBMkKu/0FXkGjilQcV50TNWh5uUX+lbwlOQiw
	0usrytLviDwHFccVBcaYopZ0SHhTCzXHaW+KMVLYmZF0ScgPxDFFM0vC+3ElpYQUQ7xv52+844MSi
	/AvuQf7e8jiPioSoqga5GW0PO0aP6vZhp5TDd5/krxEhDSwUJKLckcVmb0Inal4HrZAActvloV1P4
	zlwlnB84VPZsHq49FvTbjdqvqTtDgM+gc8qmCYWmLgCZd3rF8tVEVDuRiqb9dkZzR2mk5Fr7KZaTu
	7MLfeVCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Z0r-00000004Lw3-2DbS;
	Thu, 31 Oct 2024 17:31:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6YxQ-00000004LOC-05US
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 17:27:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39CD41063;
	Thu, 31 Oct 2024 10:28:08 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 521D83F73B;
	Thu, 31 Oct 2024 10:27:37 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Fixes for v6.12(Round 2)
Date: Thu, 31 Oct 2024 17:27:34 +0000
Message-Id: <20241031172734.3109140-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_102740_172533_5D67EAB6 
X-CRM114-Status: UNSURE (   7.10  )
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

Please pull ! Sorry for the late pull request. The ones that need to go
for v6.12 stable carry fixes tags, so it is ok if you pull it for v6.13
if its too late.

Regards,
Sudeep

-->8

The following changes since commit da1642bc97c4ef67f347edcd493bd0a52f88777b:

  firmware: arm_scmi: Queue in scmi layer for mailbox implementation (2024-10-14 21:36:46 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fixes-6.12-2

for you to fetch changes up to 54962707f8b8b53812d3d7fca279a68c6e18faae:

  firmware: arm_scmi: Use vendor string in max-rx-timeout-ms (2024-10-28 14:49:27 +0000)

----------------------------------------------------------------
Arm SCMI fixes for v6.12(part 2)

Couple of fixes to address slab-use-after-free in scmi_bus_notifier()
via scmi_dev->name and possible incorrect clear channel transport
operation on A2P channel if some sort of P2A only messages are initiated
on A2P channel(occurs when stress tested passing /dev/random to the
channel).

Apart from this, there are fixes to address missing "arm" prefix in the
recently added property max-rx-timeout-ms which was missed in the review
but was identified when further additions to the same binding were
getting reviewed.

----------------------------------------------------------------
Cristian Marussi (3):
      firmware: arm_scmi: Reject clear channel request on A2P
      dt-bindings: firmware: arm,scmi: Add missing vendor string
      firmware: arm_scmi: Use vendor string in max-rx-timeout-ms

Xinqi Zhang (1):
      firmware: arm_scmi: Fix slab-use-after-free in scmi_bus_notifier()

 Documentation/devicetree/bindings/firmware/arm,scmi.yaml |  2 +-
 drivers/firmware/arm_scmi/bus.c                          |  7 ++++---
 drivers/firmware/arm_scmi/common.h                       |  2 ++
 drivers/firmware/arm_scmi/driver.c                       | 10 ++++++++--
 4 files changed, 15 insertions(+), 6 deletions(-)

