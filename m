Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F816C83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 15:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JFZ63mxfh3I3CgSXOP9slH/57gv/A/oq/cvTMmIpOds=; b=ayP37a8Kb15hICG+1ts7ipE5Qk
	CmM1zEF+cWPlNIlGFbc8BHDvRE7wN8eM9YFSL9eWFLmWLWINJk1+NowfbqvWPBhN8fWfqHaDeM4pS
	8gabFYuzqu2fQ2KARAOAk5m7xnwGUU8XKhdgrTnn1C1Gexx79dHG6RVTLLughFNRzeKwUtiBdTiwW
	Hn6EAsd102yvaVfaL94UiFWY08rbhBWN/5iMtFQYnapmlO6mRtzrFQ2aOO0nmCYwiOvxRzRQ6zrvD
	8Y0xseztnG/eaCX7us2wlPVVR0K0lYwapEiBZ5NuQmlO2jubg9FO3TMTrOqO5weDirnCvUmseIY4l
	mD5KMDog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZWJV-000000095Q8-2dpt;
	Wed, 09 Jul 2025 15:02:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZTsV-00000008d8s-2gqp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 12:26:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C0E7152B;
	Wed,  9 Jul 2025 05:26:11 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9510B3F694;
	Wed,  9 Jul 2025 05:26:21 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [GIT PULL] firmware: smccc: Update for v6.17
Date: Wed,  9 Jul 2025 13:26:15 +0100
Message-Id: <20250709122615.1171419-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_052623_718855_948012A6 
X-CRM114-Status: UNSURE (   6.70  )
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/smccc-updates-6.17

for you to fetch changes up to 1733432638f323d80ec3d6ba411794cc20e2465f:

  firmware: smccc: Support both smc and hvc conduits for getting hyp UUID (2025-06-11 13:55:41 +0100)

----------------------------------------------------------------
firmware: smccc: Update for v6.17

Just a single update extending arm_smccc_hypervisor_has_uuid() to
support both SMC and HVC conduits, enabling UUID retrieval when Linux
runs as the root partition under Microsoft Hypervisor (MSHV), where
SMC is used. It leverages arm_smccc_1_1_invoke() to dynamically select
the appropriate conduit, enhancing compatibility beyond just HVC.

----------------------------------------------------------------
Anirudh Rayabharam (Microsoft) (1):
      firmware: smccc: Support both smc and hvc conduits for getting hyp UUID

 drivers/firmware/smccc/smccc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

