Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259EFF364AF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 18:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/8jD3qlSvbfRSD6jyNQlkUXDi3Y54XOi3v8k4yH2YtI=; b=uSITkqE5lpUcyEDVaIi8/TchiY
	GNCnw8LVwIknp6lH44rUtm5LUm37TLP1ARZjWqUCoKhaVtrlLq40FpM8IYJdJMcXkp8pfSIHjJprv
	zLwshls9velwCq9Y4YTjb8FmlhiKt3nVkrGe9MYAU2T4VG6emJhvgV/vFoAjyirlX4MnMb2uAHHb7
	6OxpfD2kG9oOnHQeRQjm69TkQEnwkGKaN+un+i4DqYIj7Gumre5rF8StREy8rh3wb3SL5P6Datwib
	IJjUMNa5YThivComA9XZHcsSzZFsOKQBM3j6ulUZm5sh4qhbSUhuxNTEDUlmOE9yxIkKEMXz/VMYq
	+DZ6A0pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAuHv-0000000B6Pk-3f5c;
	Thu, 09 Apr 2026 18:39:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAuHt-0000000B6PO-1pCl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 18:39:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 395F52008;
	Thu,  9 Apr 2026 11:39:26 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A69853FAF5;
	Thu,  9 Apr 2026 11:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775759971; bh=eLtatk8dvIzX0/T6Px2m9HfmszgWad2HE0vjpwe8k0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=okEE0VcjD3VfA/NdFrDuLTa0Sb7Ye2SjTOINsQMHerFH2eedXEEKqDo2auD0EHVjr
	 Kpf0wJbUtnuBSuU2oJGRsJxadRLviyPNMmtalU8DAVC49LkMGtbQqJvsO8c3Ofg0Si
	 hF4OhUyVa1l7HhzkAePFJ5u8TEmN8UzAPLFjyziI=
Date: Thu, 9 Apr 2026 19:39:27 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: (subset) [PATCH 0/8] arm64: Implement support for 2025 dpISA
 extensions
Message-ID: <adfyX_jaVIKeSy_Q@arm.com>
References: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
 <177575970227.3883927.939712260390088306.b4-ty@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177575970227.3883927.939712260390088306.b4-ty@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_113933_538719_5CB08378 
X-CRM114-Status: GOOD (  15.90  )
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

On Thu, Apr 09, 2026 at 07:35:02PM +0100, Catalin Marinas wrote:
> On Mon, 02 Mar 2026 22:53:15 +0000, Mark Brown wrote:
> > The 2025 dpISA extensions introduce a number of architecture features
> > all of which are fairly straightforward from a kernel point of view
> > since they only introduce new instructions, not any architecture state.
> > 
> > All the relevant newly added ID registers are already exported by KVM,
> > all non-RES0 bits in ID_AA64ZFR0_EL1 and ID_AA64FPFR0_EL1 are writable
> > and the updates to ID_AA64ISARx_EL1 are all additional values in already
> > exported bitfields.
> > 
> > [...]
> 
> Applied to arm64 (for-next/sysreg), thanks! That's only the sysreg
> definitions as these are stable. I also applied the KERNEL_HWCAP_*
> generation on a different branch.
> 
> [2/8] arm64/sysreg: Update ID_AA64ISAR0_EL1 description to DDI0601 2025-12
>       https://git.kernel.org/arm64/c/b964aa8d68f7
> [3/8] arm64/sysreg: Update ID_AA64ISAR2_EL1 description to DDI0601 2025-12
>       https://git.kernel.org/arm64/c/bb5e1e540501
> [4/8] arm64/sysreg: Update ID_AA64FPFR0_EL1 description to DDI0601 2025-12
>       https://git.kernel.org/arm64/c/d74576b51ba6
> [5/8] arm64/sysreg: Update ID_AA64ZFR0_EL1 description to DDI0601 2025-12
>       https://git.kernel.org/arm64/c/bf56250f34a4
> [6/8] arm64/sysreg: Update ID_AA64SMFR0_EL1 description to DDI0601 2025-12
>       https://git.kernel.org/arm64/c/306736fd5155

b4 ty got confused with two emails for the same series, so only one went
out. The first patch is on for-next/misc:

[1/8] arm64/hwcap: Generate the KERNEL_HWCAP_ definitions for the hwcaps
      https://git.kernel.org/arm64/c/abed23c3c44f

-- 
Catalin

