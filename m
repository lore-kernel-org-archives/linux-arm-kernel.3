Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920E6C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 18:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hWAMWTCVspgPae1UWmVXhHE0Xa+u/7brG0CwZz8F8vc=; b=jeOpZ54pqCgaItutBCeHKe8FMI
	Q1r8xqVPaN7S+VJerihzRjiH1HwraUHO9/xDpk3h9esRAlwt7+K0WbzjrIvFgSBptFhnyhKC4biTo
	zjlEApPGRy4ZZcaK8SmlvmtvwKP5moYghr/uPfHqxahpNc2GSfV9OU2rd+UgHdDLMWgcgUasRNYkk
	5fPiKebCA3HdVOJiqA6DHZ55hiyCgkmyCrX+YXOiCiqC4J33YoqegUBiGh+enLluJD2L9XRmMIpDo
	ceWZHjYZ2QF5VFNOWnVQemsAu2ln+81dR1aNK2Fzb3gaXgcmsuGoQ6400PjPm5s5Ej4yNWtK+K2SC
	ChluqkRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YWF-000000033b3-0RQt;
	Fri, 04 Sep 2026 18:20:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YWE-000000033ak-1HoM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 18:20:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B01960209;
	Fri,  4 Sep 2026 18:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCDD91F00A3D;
	Fri,  4 Sep 2026 18:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788546005;
	bh=hWAMWTCVspgPae1UWmVXhHE0Xa+u/7brG0CwZz8F8vc=;
	h=Date:From:To:Cc:Subject;
	b=e02BFwuePHonUF1YIPD9m86xgm2JZJVc/6OOEEBLdl119PjE3e232pczq+BUXuq5+
	 NrYPDac4tuZtDxDQ/8N2brCRnjyl/21VPBghfAWkJ+Z7uhlfPjVYdG1dpZ/WGXofFL
	 /gI1IkEcrG5hV//QXEQJdwB7pFmM9up0KcT4XRnmEZR7+nbotC2tXi4EYm5jXN4dMh
	 mHnZd7Q2xL2mLz7xZNqA63UYSmhOnvccXCRSfj3jB7G0xh8318DTlPhomo4ULMjV1I
	 wLgAA4wq3WWGFXeL9aFbxap7JQ5ovmyFWlPaeZvcl6vHmDmNnWo8OPH++eVKwoVPIC
	 4R7+e2yXhub2A==
Date: Fri, 4 Sep 2026 19:20:00 +0100
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, mark.rutland@arm.com, maz@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: [GIT PULL] arm64 fixes for -rc2
Message-ID: <apsL0Jd_RUiP20Vd@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Please pull this batch of arm64 fixes for -rc2. As you can see from the
tag, there's nothing Earth-shattering, but worthwhile fixes nonetheless.

Cheers,

Will

--->8

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to 5445d64199626974269fcdf347769ad44b0bb53b:

  arm64: Don't read GMID_EL1 when MTE is disabled (2026-09-03 13:03:23 +0000)

----------------------------------------------------------------
arm64 fixes for -rc2

- Disable interrupts during page-table walk in show_pte()

- Fix kexec_file_load() with 52-bit capable kernels on machines without
  52-bit addressing

- Fix MIDR matching in CPU errata handling for KVM guests

- Avoid reading MTE-specific ID registers when MTE support is disabled

----------------------------------------------------------------
Breno Leitao (1):
      arm64: trans_pgd: clone only the linear map that exists at runtime

Fuad Tabba (1):
      arm64: Don't read GMID_EL1 when MTE is disabled

Karl Mehltretter (1):
      arm64: mm: Fix the lockless page-table walk in show_pte()

Khushit Shah (1):
      arm64: errata: pass REVIDR when matching target implementation CPUs

 arch/arm64/include/asm/cpu.h        |  1 +
 arch/arm64/include/asm/cpufeature.h |  7 -------
 arch/arm64/kernel/cpu_errata.c      |  2 +-
 arch/arm64/kernel/cpufeature.c      | 33 +++++++++++++++++++++++++++++----
 arch/arm64/kernel/cpuinfo.c         |  2 +-
 arch/arm64/kernel/machine_kexec.c   |  3 ++-
 arch/arm64/mm/fault.c               | 12 ++++++++----
 7 files changed, 42 insertions(+), 18 deletions(-)

