Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12615CD4F47
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 17:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E/09V1etJfObwAjyh1bNfeE+m4govYg3Vc5PuAKIXco=; b=iexQzRLksnoz/J+2E2GitfDg9+
	GaxtljwN8hf0NbrVQaNPdIy/+0/y/6FVqwMZ2vxmRnvrzCrnSAT9TVdjR3/KMHt9EsYCztb+hiniy
	9JQYvvMltyZKAELU1Z8NhmC8UcYH+lhgLTuWh0owwwuUM4stNaN4h8uzVU1+XvrA8mV8uAKsAzVuT
	AqzaR2iaNKKXfOUxe+GNYlQEeMdiLElDEFqpT+Tl49l872E1uSymZRXPugmLCWb9AJgcvZ1ceZxYj
	QW6y9JDh7OUHT2VxoHmbueeZ4RBVpgriXGBz4ECsRfIVr6X+cXLK6VyWT+4/pwqLo0bveXlIpQTEY
	EMJ/kqhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNwb0-000000091Jo-0z0n;
	Fri, 15 May 2026 17:45:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNwax-000000091Iz-1cwl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 17:45:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B60AB2938;
	Fri, 15 May 2026 10:44:59 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE4ED3F85F;
	Fri, 15 May 2026 10:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778867104; bh=UUOi895HeyCRC3Wm4DvMf2sS2vj/NZ1Rkn/fVHC8akA=;
	h=Date:From:To:Cc:Subject:From;
	b=NrlZIVmHiLP0zGLOKV3XddfmIn2Fu31YXl92AGjwIgNqUlGi83KULb37BmjySjrm9
	 0l1L902tCCKUBKGWiK8RZZgh9zop8JICJt2MPXv2o1JLz24rzbhGo0iiOaFqb/oVxe
	 +Lobfc2GU2PYM/YHyFK3A9ObmiYNg9zTCJo8m5Rw=
Date: Fri, 15 May 2026 18:45:01 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64 fixes for 7.1-rc4
Message-ID: <agdbnfcTQATqM1K8@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_104507_476125_3F85E5F1 
X-CRM114-Status: UNSURE (   9.70  )
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

Hi Linus,

Please pull the MPAM fixes below. Thanks.

The following changes since commit 5cbb61bf4168859d97c068d88d364f4f1f440325:

  arm64/fpsimd: ptrace: zero target's fpsimd_state, not the tracer's (2026-05-06 12:11:49 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

for you to fetch changes up to 6ccbb613b42a1f1ba7bfd547a148f644a902a25c:

  arm_mpam: Check whether the config array is allocated before destroying it (2026-05-14 09:52:05 +0100)

----------------------------------------------------------------
arm64 MPAM fixes:

 - Fix NULL dereference and a false-positive warning when the driver
   probes hardware with surprising version numbers

 - Fix writing values to the wrong registers when probing
   cache-utilisation counters. Replace 'NRDY' probing with a version
   that is robust for platforms where the bit is writeable by both
   hardware and software

----------------------------------------------------------------
Ben Horgan (3):
      arm_mpam: Fix monitor instance selection when checking for hardware NRDY
      arm_mpam: Pretend that NRDY is always hardware managed
      arm_mpam: Improve check for whether or not NRDY is hardware managed

James Morse (2):
      arm_mpam: Fix false positive assert failure during mpam_disable()
      arm_mpam: Check whether the config array is allocated before destroying it

 drivers/resctrl/mpam_devices.c  | 81 ++++++++++++++++++++---------------------
 drivers/resctrl/mpam_internal.h |  2 -
 2 files changed, 40 insertions(+), 43 deletions(-)

-- 
Catalin

