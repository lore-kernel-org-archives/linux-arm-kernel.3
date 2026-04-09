Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23278EA3C4E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 11:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+3AxzYcFt9VeCMpYuXxu6IYBoyPzW/ekyBRCfkbiO2g=; b=ZPhJjLPXdgTg0IsrVe6/uU6GCE
	q+CK0bOpQGhjA2QwXQpbWYSshA277lAGjUcYbv80ktG1dKXxSztGWvwY0UBKqUJ10zkemeTYu2yfG
	Y769QkzZN9T8Bp0Ty0uFI5vxRt+hOHYgEMW0EYLJMqxDGlN/rM/VHSZF79+NwUOt1Bkd7B074W+4c
	rJNoc8he32nrSPsU5TtfYTrWT4dTgc7YTqpfvwJBP3qx2Q5RMb5U4jwyRkOxQoKlNyy1WN5ufHh0/
	/KcMcw0TJMBDlDXJOZGuOUTSaYCJF1POYvEZaFEaig4ZzB3ZUv+VBBmGQ8Fm2uMUGbY3X/Z35FJGz
	yfq5FyCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAne4-0000000AHY2-2a5K;
	Thu, 09 Apr 2026 11:34:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAndz-0000000AHXg-3HEF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 11:33:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09BA12E98;
	Thu,  9 Apr 2026 04:33:49 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A625A3F632;
	Thu,  9 Apr 2026 04:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775734434; bh=CNq6QdX054NW/AuTIE+mAJAxxpPam5NVbcXRjsHjS0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I+t/jmSCB3TqxIVZidBOnZrV18cGfF6qdqizNuLLbeUk2GDK4TrUZp/j0ztz5O/WH
	 MAo1UtFIXfwzxMfa2Z9nZnUNQENHfhZnZFWLbVNrEo2nB5c0Arkz0zqtPQqOYNAvA9
	 5Un/Ngqb/zfogituQtsdZWWlcj4KAOgv8ZgL399w=
Date: Thu, 9 Apr 2026 12:33:50 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 7/8] arm64/cpufeature: Define hwcaps for 2025 dpISA
 features
Message-ID: <adeOnmy60AUQzSvo@arm.com>
References: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
 <20260302-arm64-dpisa-2025-v1-7-0855e7f41689@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302-arm64-dpisa-2025-v1-7-0855e7f41689@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_043357_496629_E942FD21 
X-CRM114-Status: GOOD (  15.83  )
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

On Mon, Mar 02, 2026 at 10:53:22PM +0000, Mark Brown wrote:
> @@ -3290,11 +3295,13 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
>  	HWCAP_CAP(ID_AA64ISAR1_EL1, I8MM, IMP, CAP_HWCAP, KERNEL_HWCAP_I8MM),
>  	HWCAP_CAP(ID_AA64ISAR1_EL1, LS64, LS64, CAP_HWCAP, KERNEL_HWCAP_LS64),
>  	HWCAP_CAP(ID_AA64ISAR2_EL1, LUT, IMP, CAP_HWCAP, KERNEL_HWCAP_LUT),
> +	HWCAP_CAP(ID_AA64ISAR2_EL1, LUT, LUT6, CAP_HWCAP, KERNEL_HWCAP_LUT6),

IIUC that's a LUTI6 SVE instruction which would not be available if
SVE2p3 is not available (or SVE in general), though we have the
equivalent SME one with SME2p3 (and a separate HWCAP for it). We should
rename it to HWCAP_SVE_LUT6 and make it conditional on
has_sve_feature().

KVM will probably confuse guests here if SVE is disabled but the
ISAR2.LUT field is not capped (I haven't checked). The conditional
has_sve_feature() would solve this but it won't address the MRS
emulation. Arguably it's a KVM problem for exposing inconsistent
id regs: ISAR2.LUT==0b0010 is not permitted without SVE2p3 or SME2p3.
But the spec isn't greatly written either - why does a field about
AdvSIMD all of a sudden reports SVE instructions availability?

On SME, unless I'm misreading the spec, the bits seem to have been
written by three different people in isolation:

- ID_AA64ZFR0_EL1.SVEver + ID_AA64PFR1_EL1.SME (and if these weren't
  enough, we have ID_AA64SMFR0_EL1.SMEver) tells us that SME2p3 is
  implemented. LUTI6 is mandated by SME2p3

- ID_AA64SMFR0_EL1.LUT6 means that the LUTI6 instruction is present but
  this field can only be 0b1 with SME2p3

- ID_AA64ISAR2_EL1.LUT == 0b0010 means that LUTI6 instruction is present
  (if SVE2p3 or SME2p3) and, again, that's the only value permitted by
  SME2p3

So a lot of redundancy and we did end up reporting the fine-grained
details to the user already. The SMExpy versions seem to be cumulative
unless Arm decides to make some of the instructions optional (it still
doesn't explain why we have the same information in SMFR0 and ISAR2). I
guess that's where the fine-grained HWCAPs come in handy.

I wonder if the user would ever be able to parse these ID fields
correctly if using the MRS emulation. We'd need to sanity-check KVM as
well, not sure it proactively caps id fields.

-- 
Catalin

