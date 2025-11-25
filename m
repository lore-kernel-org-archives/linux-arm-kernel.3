Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB5DD0E6F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 16:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zg66MIfEW+duz6kJ+2zQr70CTx7GNtXEtQfGPRXqGdU=; b=W4pvyqQTKUAQdG/mtYPflaxzNQ
	gkYMceTpEu4n9STubXIuidsnKVkGI1uhwfbpHuHHg4Je0wd2NHsxbekxFvGJKh83DovqIUdD+Vcav
	8Bqi599u5s+LIXosc18S9V87asazoVgPhrx64f5Fuzrvcl/9AKRxM2SVQAwu2KBrqkxBLxYv1U/1b
	H6Vnbf6MT9H55tyOx1vHDKZ4SU3omc2Eg71T4gOMl+r9XJ3SfWTmvqYL159MkFfyq081akxI1mNU6
	N1v/HUiwGoUxyu0Z9eJBkjdDTb2EmrYil1CrJvhcWPvSrpZIyl2HbvmW8nSo5yTmBJHrQIAIJuial
	bgqlBJ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNveN-0000000DYyp-1k7u;
	Tue, 25 Nov 2025 16:12:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNveM-0000000DYyh-0hyE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 16:12:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 511446011F;
	Tue, 25 Nov 2025 16:12:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D66E6C4CEF1;
	Tue, 25 Nov 2025 16:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764087137;
	bh=sKdAesoRju7t5yt9nfunvApjuoRxWs5flWmaHfe8950=;
	h=Date:From:To:Cc:Subject:From;
	b=cMnpbViVR2B2ZYJ8FUk4h0iTOL3mP0sofnBOBHuUDIa3Y71/raZ7TM7bus0hEifM2
	 DAC+qpsUPUvHw2gWRS5pr86vtD1nU/0pJwQGyyI472wy8nexke5N50v+vv1zNmZ2+i
	 0ufyv2xxj8CQvA6hLpkQy5stlvU2SbUd5hK9Z9k921sarvVBAQIF6dlMkgyYYqXT7X
	 WHVz00xdljjav5n2SoBKZSiR/xasehl4iSEi9jZDWv5ggsAweM53ZuJ0PsU4BErF2A
	 yptNPY6sKKC8Py7TezyHT6QWJSn3BWFy7XHpo+MQmcYw4OM47UnjSCZWI7eUg6uWat
	 KqnYg5zpTuIFg==
Date: Tue, 25 Nov 2025 16:12:12 +0000
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: [GIT PULL] arm64 fixes for 6.18
Message-ID: <aSXVXLWDyDguHgiA@willie-the-truck>
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

Apologies for sending this during the US holidays but please can you
pull these three straightforward arm64 fixes for 6.18?

We've got a revert due to one of the recent CCA commits breaking ACPI
firmware-based error reporting, a fix for a hard-lockup introduced by a
prior fix affecting non-default (CONFIG_EXPERT) configurations and
another ACPI fix for systems using MMIO-based timers.

Other than that, we're looking pretty good.

Cheers,

Will

--->8

The following changes since commit 8e8ae788964aa2573b4335026db4068540fa6a86:

  arm64: Reject modules with internal alternative callbacks (2025-11-07 15:00:14 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to 165eb13e485c5c25c7cb276ac85f788a2bd200cb:

  arm64: proton-pack: Fix hard lockup when !MITIGATE_SPECTRE_BRANCH_HISTORY (2025-11-24 13:31:50 +0000)

----------------------------------------------------------------
arm64 fixes for 6.18

- Avoid hardlockup when CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY=n

- Fix regression in APEI/GHES error handling

- Fix MMIO timers when probed via ACPI

----------------------------------------------------------------
Jonathan Marek (1):
      arm64: proton-pack: Fix hard lockup when !MITIGATE_SPECTRE_BRANCH_HISTORY

Marc Zyngier (1):
      ACPI: GTDT: Correctly number platform devices for MMIO timers

Will Deacon (1):
      Revert "arm64: acpi: Enable ACPI CCEL support"

 arch/arm64/kernel/acpi.c        | 10 ----------
 arch/arm64/kernel/proton-pack.c |  2 ++
 drivers/acpi/arm64/gtdt.c       |  4 ++--
 3 files changed, 4 insertions(+), 12 deletions(-)

