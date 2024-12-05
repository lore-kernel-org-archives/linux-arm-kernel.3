Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28ACFE7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 11:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0nJdEhC2O3r8IFo3UBonEOR7lGpODIWg2oWGi3FM7ko=; b=DlhI3qc5nRjeWbaTp2XBTN+Dc9
	w16oQ28afANF87U/JmBulT+jdWpE8tql1NdwPeympACynteAJE5ULot3SM67Rm3L9HLeN0oa5Pc5T
	e4u6RvCkGUBLL/FKymZMFv5f6W+2ZK+owamIw+pZ0fp5zYnQE5R7pRSBEN42QnYtow5YwS+dtj67B
	QbsBBEMx2xKwl+3KU7zeWU1b9U42YxPBFYjxcWtu+Ns9w6qFBYWhP0g9JpIDqoYsTPEcSG8PYfA/8
	iC7JmeAeKx5X0Yy25A4vM+yJcbkYUxd7PakKbE8zJMNqcH4BfIF8yQmOijobuAb4eENudI2h77uAC
	UiC6l+wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAKK-0000000Fmka-0jS3;
	Thu, 05 Dec 2024 11:47:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAGu-0000000FlY8-30C0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 11:43:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E0A6FEC;
	Thu,  5 Dec 2024 03:44:20 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 08BB13F71E;
	Thu,  5 Dec 2024 03:43:50 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Fix for v6.13
Date: Thu,  5 Dec 2024 11:43:48 +0000
Message-Id: <20241205114348.708618-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_034352_804614_0F88ED65 
X-CRM114-Status: UNSURE (   8.69  )
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

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fix-6.13

for you to fetch changes up to 514b2262ade48a0503ac6aa03c3bfb8c5be69b21:

  firmware: arm_scmi: Fix i.MX build dependency (2024-12-03 15:47:11 +0000)

----------------------------------------------------------------
Arm SCMI fix for v6.13

Fix for the build issue in the ASoC driver with the SCMI support by
enforcing the link-time dependency if IMX_SCMI_MISC_DRV is a loadable
module but not if that is disabled.

----------------------------------------------------------------
Arnd Bergmann (1):
      firmware: arm_scmi: Fix i.MX build dependency

 drivers/firmware/arm_scmi/vendors/imx/Kconfig | 1 +
 drivers/firmware/imx/Kconfig                  | 1 -
 sound/soc/fsl/Kconfig                         | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)

