Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874BDCD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sPTHzm/3bNsWVUZ2tOWYcZZC9hA8O3zorDQzoFPkZ94=; b=qLuKJoERhFYdWbWwoL1KvNRv0P
	T6HStmIZDv5+izTHyqtIa4IXtgAao7i0/HIExTBnXEi3OYYGknIIW078IgGjiQI7ndI+JGALqKqTb
	FJhIyA8jv7EYLlUAIr7boOD2tplc9BpeVLSEQRHb/XrGGzErdwUUWrADCCprY66crKwOG1HhTMFMv
	o2vgxMTSwEgzO26oRmGrW9KtYUslOnFHyNWXx9UwWiYBpJkWAynrDex2wamSxz8OGdx/uUQ2ANk6N
	BrQaOyMJ2DM6Ae9GrhLMxpJW/DWsX1qAsXwrNOQiiknOX1y6rHZFTRvDNuLif/bfY4nToNmW0H/t+
	SrEZ7uQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMJY-000000021ii-1wrz;
	Tue, 19 May 2026 15:25:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMJE-000000021OY-2yG3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:24:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2CE256021C;
	Tue, 19 May 2026 15:24:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39E56C2BCB3;
	Tue, 19 May 2026 15:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779204279;
	bh=ZpDPEyrHHGSEIW/Lk4hpvpfy/+NDSsltJfIB8NnQOKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vMLyGIE1zDz7NIASBpV6KbBPyd5xb2HjOeJPCgEHRlFT+TNaInQb+b3uKbmpngnXF
	 zd2uvG9TiUEPzLgHY7blf8fGMO07AS60F2OprZ52E74Lm/hvq69Yyc0XgW03l/etF1
	 vHYF1l/ts6bMekTy8Xu/f0ES67uIVpOxyFaXZLtxhxO2QgqgGj1tshcEHvOBxcFxGS
	 HCIf+4DWCGl8arZloEFXAn3FpfxceAYfEhG2tSVOtk1F19VNBfIDzvqetXF2OPT4cN
	 ha6vhOu1zwgCU1LBAWY3ebLC0jpDiGKUMBqiMjILmugn5i/1jtwcDoAEx+adO3TqyY
	 h1CcaCpRTyXyQ==
Date: Tue, 19 May 2026 16:24:35 +0100
From: Will Deacon <will@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64/cpufeature: Define hwcaps for 2025 dpISA
 features
Message-ID: <agyAs0UXGulhFXga@willie-the-truck>
References: <20260518-arm64-dpisa-2025-v2-0-b3367b73bd00@kernel.org>
 <20260518-arm64-dpisa-2025-v2-1-b3367b73bd00@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518-arm64-dpisa-2025-v2-1-b3367b73bd00@kernel.org>
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

On Mon, May 18, 2026 at 04:07:29PM +0100, Mark Brown wrote:
> The features added by the 2025 dpISA are all straightforward instruction
> only features so there is no state to manage, we can just expose hwcaps to
> let userspace know they are available.
> 
> F16MM is slightly odd in that the feature is FEAT_F16MM but it is discovered
> via ID_AA64FPFR0_EL1.F16MM2. We follow the feature name.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  Documentation/arch/arm64/elf_hwcaps.rst | 24 ++++++++++++++++++++++++
>  arch/arm64/include/uapi/asm/hwcap.h     |  8 ++++++++
>  arch/arm64/kernel/cpufeature.c          | 11 +++++++++++
>  arch/arm64/kernel/cpuinfo.c             |  8 ++++++++
>  4 files changed, 51 insertions(+)
> 
> diff --git a/Documentation/arch/arm64/elf_hwcaps.rst b/Documentation/arch/arm64/elf_hwcaps.rst
> index 97315ae6c0da..07ff9ea1d605 100644
> --- a/Documentation/arch/arm64/elf_hwcaps.rst
> +++ b/Documentation/arch/arm64/elf_hwcaps.rst
> @@ -451,6 +451,30 @@ HWCAP3_LS64
>      of CPU. User should only use ld64b/st64b on supported target (device)
>      memory location, otherwise fallback to the non-atomic alternatives.
>  
> +HWCAP3_SVE_B16MM
> +    Functionality implied by ID_AA64ZFR0_EL1.B16B16 == 0b0011
> +
> +HWCAP3_SVE2P3
> +    Functionality implied by ID_AA64ZFR0_EL1.SVEver == 0b0100
> +
> +HWCAP3_SME_LUT6
> +    Functionality implied by ID_AA64SMFR0_EL1.LUT6 == 0b1
> +
> +HWCAP3_SME2P3
> +    Functionality implied by ID_AA64SMFR0_EL1.SMEver == 0b0100
> +
> +HWCAP3_F16MM
> +    Functionality implied by ID_AA64FPFR0_EL1.F16MM2 == 0b1
> +
> +HWCAP3_F16F32DOT
> +    Functionality implied by ID_AA64ISAR0_EL1.FHM == 0b0010
> +
> +HWCAP3_F16F32MM
> +    Functionality implied by ID_AA64ISAR0_EL1.FHM == 0b0011
> +
> +HWCAP3_SVE_LUT6
> +    Functionality implied by ID_AA64ISAR2_EL1.LUT == 0b0010 and
> +    ID_AA64PFR0_EL1.SVE == 0b0001.

I've queued this, but I'm curious why you've called out the
'ID_AA64PFR0_EL1.SVE == 0b0001' part here and not for any of the other
SVE caps you're adding? It's also formatted inconsistently from
pre-existing entries (such as HWCAP2_SVE_B16B16) which put the
ID_AA64PFR0_EL1.SVE part of the antecedent first.

Will

