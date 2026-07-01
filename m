Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA5DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 10:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rify2m3sjIh3aC/lTvFMRM7SPVnvMs2NF3CP+ccm4o8=; b=tP8UfH+LxL496/I/+3JTS5he5T
	No3SCzWtOtU6hlcCaaFWmOW8e1ZmDTIfJ0+5Teg7UvX346vB9nP/8NJo5cFhatWQVftfGMns2nv7S
	seoMIBOGlSBCTVgQ6yriJQxv6aHi6EBAn4LOuhKoHfMPr66ClcsN4FETyRALO5wCrzmRhJ2yYbLk9
	2wCueerABfhZ+hvLOob4muu1xiB+XJQa2KTtx4x69cNhXCYYgoPnKN/6oLx9XU7K/p07mIzsi5SBB
	TlsXZFZT4tohZnnPAJEwP+0Dc+v/xfeQzHhPPdVMC559Sj8niE7DccyeojwBymZCh9D3ab6HrPvpr
	vEs1+z2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werv0-00000001Hlv-2WvK;
	Wed, 01 Jul 2026 10:11:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werux-00000001HlF-2rMx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 10:11:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7AA322BCC;
	Wed,  1 Jul 2026 03:11:34 -0700 (PDT)
Received: from [10.57.30.25] (unknown [10.57.30.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7624B3F85F;
	Wed,  1 Jul 2026 03:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782900698; bh=GCujk2R5vMwTbm59tbrnwfcbiLxK4IZAXVxai7uFQuI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f08AZdiB7CEFN8nAGQMT/lCGlFQgIL5I0j38ruBq3e6ISOnGNa6twAUC20um9R67K
	 O6F594EIh9yieP+/2Rl61cdQ3wCf3pKrAJJGlxbMODAYFVXNVT3ydcDh/hBs1BFMfN
	 K5AeIZ+8sQ/F5mkbHCfL/rBMbPIIVySOLQLmu6Eo=
Message-ID: <830a4d39-c829-4e79-a0ec-5a3633b58aa6@arm.com>
Date: Wed, 1 Jul 2026 11:11:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add BBML3 cpu feature
Content-Language: en-GB
To: Linu Cherian <linu.cherian@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260701094131.677636-1-linu.cherian@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260701094131.677636-1-linu.cherian@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_031143_771637_30A8A838 
X-CRM114-Status: GOOD (  11.14  )
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

On 01/07/2026 10:41, Linu Cherian wrote:
> Patches 1 and 2 introduces BBML3 cpu feature
> Patches 3, 4 and 5 adds more cpus to the BBML3 support list,
> 	which dont advertise themselves through the standard
> 	MMFR2_ID registers.
> 
> Linu Cherian (5):
>    arm64: cpufeature: Add BBML3
>    arm64: cpufeature: Detect BBML3 based on MMFR2 ID


>    arm64: cputype: Add Cortex-A520AE definitions
>    arm64: cputype: Add C1-Nano definitions
>    arm64: cpufeature: Extend bbml3 support list

If you could move the last 3 patches to the top, would be easier
for people to back port the "enable" BBLM3 for those CPUs, without
the renaming conflicts.

Suzuki


> 
>   arch/arm64/include/asm/cpufeature.h |  6 ++--
>   arch/arm64/include/asm/cputype.h    |  4 +++
>   arch/arm64/kernel/cpufeature.c      | 51 +++++++++++++---------------
>   arch/arm64/mm/contpte.c             | 21 +++++-------
>   arch/arm64/mm/mmu.c                 | 52 ++++++++++++++---------------
>   arch/arm64/mm/proc.S                |  4 +--
>   arch/arm64/tools/cpucaps            |  2 +-
>   arch/arm64/tools/sysreg             |  1 +
>   8 files changed, 69 insertions(+), 72 deletions(-)
> 


