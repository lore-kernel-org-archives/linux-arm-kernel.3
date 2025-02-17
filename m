Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF33DC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 17:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vhO6TKqpsRSX/Z3PyNgRIwuNSxJl8FNrUTnyd+ppH1c=; b=xw92tIcFsHn5yK4m68ERWjQUgx
	xvHf2cF6Bk8hPDs/cJzPJura+WSJsS7hQEpK2NLnLzycJS/bks720/4S5DFbkVKd2aqYd7FoQ+alX
	VAa2yQAMtM0r0CJZSd9VBAFeiPg5RwLIP8wsS9UskFv/uF7U2d7YJW4rmxVPeakSLnnu5rY5+bt5D
	Co3hVMSfzexJKDQCj1kOGQy2D8m7mV+eyYp4U1l2gYOuitOioPZm8EYbq/0+eJd3ZxuRh4OcSKqSk
	GARl0RdqEp8mLgx4mTxXU/YJmBIwEEJJlXu+QKMblgniEKZwlzo7W7jo4joRg3pVSq+7pSS1HJv6p
	4fcZCvFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk4g1-00000005PnN-3T1T;
	Mon, 17 Feb 2025 17:13:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3QT-000000059Sd-2KgX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 15:52:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB129152B;
	Mon, 17 Feb 2025 07:53:11 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 63D0D3F5A1;
	Mon, 17 Feb 2025 07:52:51 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm_scmi: Fix for v6.14
Date: Mon, 17 Feb 2025 15:52:46 +0000
Message-Id: <20250217155246.1668182-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_075253_637881_62941534 
X-CRM114-Status: UNSURE (   7.24  )
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

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fix-6.14

for you to fetch changes up to ab027c488fc4a1fff0a5b712d4bdb2d2d324e8f8:

  firmware: arm_scmi: imx: Correct tx size of scmi_imx_misc_ctrl_set (2025-02-13 14:27:37 +0000)

----------------------------------------------------------------
Arm SCMI fix for v6.14

Just a single fix to address the incorrect size of the Tx buffer in the
function scmi_imx_misc_ctrl_set() which is part of NXP/i.MX SCMI vendor
extensions.

----------------------------------------------------------------
Peng Fan (1):
      firmware: arm_scmi: imx: Correct tx size of scmi_imx_misc_ctrl_set

 drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

