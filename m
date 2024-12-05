Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A28E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 11:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TjIYSwR1en6TVbikCdXDTULY0tAgp+kPXlk3D/uKF4Y=; b=jph4vFu8sy/TnjftasQwfEqBuu
	NyoF2diIS2A2BL25ApccdwQQo+PTm8j/tka+PjMNu9ov+c00El6udmC5Tn1V23/YDajvZGxve9C+Y
	qkMBkLgKLzDx9CsQu/R862YGJx+KN8grc1AiCLpxmjhay/OGkBxTo9w61lcPoUZ4e57Aiti/wf7y+
	JeeUFYJMvjzSdM4Px3V9SglyYnzpaefaNCTX+VlsKAXnMshk1rJ5j6XW39k1tAyWailQLrQ5Y1rKj
	YbtfSMm1I29q2M0TzG+Nr2lMq4YndUDkD17u6FHFE1mB/ETAntkfdK9f1dDNBiemklnLunBY6q1ZY
	R2ztdu3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJALJ-0000000Fn2l-3GBU;
	Thu, 05 Dec 2024 11:48:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAHB-0000000Flco-4BHX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 11:44:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6047DFEC;
	Thu,  5 Dec 2024 03:44:37 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3B8C13F71E;
	Thu,  5 Dec 2024 03:44:08 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_ffa: Fixes for v6.13
Date: Thu,  5 Dec 2024 11:44:06 +0000
Message-Id: <20241205114406.708710-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_034410_073268_691845E7 
X-CRM114-Status: UNSURE (   7.04  )
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

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-fixes-6.13

for you to fetch changes up to 81c8b1c2ef7a75fa5f7f805fdb7f681bbbed07e5:

  firmware: arm_ffa: Drop le64_to_cpu() on UUID in ffa_msg_send_direct_req2() (2024-12-04 09:59:54 +0000)

----------------------------------------------------------------
Arm FF-A fixes for v6.13

Couple of fixes to address:

1. A possible race around setting ffa_dev->properties in ffa_device_register()
   by updating ffa_device_register() to take all the partition information
   received from the firmware and updating the struct ffa_device accordingly
   before registering the device to the bus/driver model in the kernel.

2. Incorrect endian conversion or byte swapping of the UUID by dropping
   le64_to_cpu() for uuid in ffa_msg_send_direct_req2(). This was added
   to fix the compiler warning but missed to get proper end-to-end testing
   as it was relatively new API.

----------------------------------------------------------------
Levi Yun (2):
      firmware: arm_ffa: Fix the race around setting ffa_dev->properties
      firmware: arm_ffa: Drop le64_to_cpu() on UUID in ffa_msg_send_direct_req2()

 drivers/firmware/arm_ffa/bus.c    | 15 +++++++++++----
 drivers/firmware/arm_ffa/driver.c | 13 ++++---------
 include/linux/arm_ffa.h           | 13 ++++++++-----
 3 files changed, 23 insertions(+), 18 deletions(-)

