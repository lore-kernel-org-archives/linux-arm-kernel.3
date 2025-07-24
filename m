Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED11C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 10:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xvtnq9mQweBqJoluGgo+tMS9GnL9G2nNDRm+j95JWd8=; b=XK8ZpbElMYKF0A/S/lvLGrtCUb
	8S2P98upVnyEZ0kCf+fX3/g+UeXFpmrHPBSDabCTHqC6hT+JG2AbBwt1y91Zi/GJB3HnFcw3eZgYZ
	/m+JxMyMOdhAQaEkgfYVKFozFWMEBoWxHS76anx4w+2+VhoJcfG7kJB9BC8v4v0caAATFJ7h6tY1q
	17v0uHNa/r7aGluql9wLJgrGbLZOGYXffsujijpJZZ6c89zHnWTnug/mlt2Ut5GNX1vwLVdRKgaMT
	4yj5T3ERmBXavluU0nr3gW2410WeuDhjRPKRJgtH2GgprO/jbs97CIgjAdN+e/Vb3d021kRpHrB7Z
	Q7opjyNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uetfJ-00000007HID-35yZ;
	Thu, 24 Jul 2025 10:59:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesUl-000000075WL-2RD6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 09:44:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A3334562C;
	Thu, 24 Jul 2025 09:44:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9393AC4CEED;
	Thu, 24 Jul 2025 09:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753350251;
	bh=D3byKs9Kwszr4DgyFzPmK6s1lfZaS5QDw8nvwjwooa0=;
	h=Date:From:To:Cc:Subject:From;
	b=jvgzl6inm2gUq6RWsC4X3qU5YA3tseV0s77NazxsGNHNKZU+RV/J4aXYPzcBZO0SJ
	 aLg9nzUeejJM3S3on8hSjBPUoAm4Z5uOQENpBC2ClFxo8rLTEhcIvVEUEqW1HMhStL
	 AxB+8eF/LRvlCDq+nhqsJfI/FhmoAQynzwzw5wiZxU2kOCJeSti0fXkOqpXJ9P0i9N
	 mClsqG1Dk9gZK/2y+iLkAaoIoPEL6CPHNtAwXYz0vHSmfXy8qkF3lXXAQ4ofHxXhxK
	 fLKeiAY/04T+VIPtMRMPTot+PKbYovUdVZvERcndlz4+YY8vn72WwxOVDUBpMuzME0
	 XTEW7FN2TLqrg==
Date: Thu, 24 Jul 2025 10:44:06 +0100
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com,
	maz@kernel.org, mark.rutland@arm.com
Subject: [GIT PULL] arm64 fixes for 6.16
Message-ID: <aIIAZiQ6ca3DFHpE@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_024411_636428_AB04EE16 
X-CRM114-Status: GOOD (  10.50  )
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

Please pull these two important arm64 fixes ahead of the 6.16 release.

The first fixes a regression introduced during the merge window where
the KVM UUID (which is used to advertise KVM-specific hypercalls for
things like time synchronisation in the guest) was corrupted thanks to
an endianness bug introduced when converting the code to use the
UUID_INIT() helper.

The second fixes a stack-pointer corruption issue during context-switch
which has been observed in the wild when taking a pseudo-NMI with
shadow call stack enabled.

Please pull.

Cheers,

Will

--->8

The following changes since commit 9dd1757493416310a5e71146a08bc228869f8dae:

  arm64/mm: Drop wrong writes into TCR2_EL1 (2025-07-04 16:46:04 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to d42e6c20de6192f8e4ab4cf10be8c694ef27e8cb:

  arm64/entry: Mask DAIF in cpu_switch_to(), call_on_irq_stack() (2025-07-22 16:39:30 +0100)

----------------------------------------------------------------
arm64 fixes for 6.16

- Fix broken UUID value for the KVM/arm64 hypervisor SMCCC interface.

- Fix stack corruption on context-switch, primarily seen on (but not
  limited to) configurations with both pNMI and SCS enabled.

----------------------------------------------------------------
Ada Couprie Diaz (1):
      arm64/entry: Mask DAIF in cpu_switch_to(), call_on_irq_stack()

Jack Thomson (1):
      arm64: kvm, smccc: Fix vendor uuid

 arch/arm64/include/asm/assembler.h | 5 +++++
 arch/arm64/kernel/entry.S          | 6 ++++++
 include/linux/arm-smccc.h          | 2 +-
 3 files changed, 12 insertions(+), 1 deletion(-)

