Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F113E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 16:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMWLza5xRt+SErU35cIUGde4WH3Kl75rNlMr7596lF0=; b=3ZD+g4iUkd5mSbeuf3HPIoCemu
	Y1DGVQHHUGXstm+gtUWoE9ZDl4WM/VJK6DwMc/vLvQ7Ds7W1gmDeh5j+Gl8nZzQtCLZdyTIhaCc8r
	eA2q4T/tG4gBQXiXJc3a/JoC8wJX0ADZqRiKn9oTD+B0aBnP8FcsjLavgDN7Qg8JDEAXDcwKkQrZU
	bdyGmAapdJBa3eIccrXmQHLAv36SNb66te9kmtyUeUv2LSTBpbDZuzzLgHJ15NprtDjTBsC9c8JmQ
	rgqX+fMN4ByKjcj+YUt59gS8PvZG+BIcbmsPzFrDtt78MFh6NCIX89sv2JBXjdh44+jx9mmopZqM/
	QfCVGa6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3K7-0000000C8SB-36FZ;
	Tue, 10 Dec 2024 16:42:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3J1-0000000C8Dx-2OCV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 16:41:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5DA0EA40873;
	Tue, 10 Dec 2024 16:39:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D716C4CED6;
	Tue, 10 Dec 2024 16:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733848910;
	bh=xaA23xB16z/5D+tNHd073yTElA75DnnIwElqjGk2tNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GITZ7eJpcEZSY5m72sNsQhL6soXf+boRvXJVnxzGeJDi6RRIB5aBNRe46mdySblN0
	 N4jZXZk21kCMZ9dOZRGYOghk4n8ZZbDD0HtMffn5aj5X3jvdzEbecK3j9Qlnatd9xl
	 Q0QRYGVFeFebnrC8lU07p9YtawyXrpQS/f1AXZhTCJoiqfs5zkvUSDvezrMGh4DSZT
	 1Wv2IVYaNlKKZQH6QoYqyGxZq7lj5M9+GXtkcYnnBvNu0CM3L9+09G4H6e7B9qOFJu
	 aAIc4JulW9babXWjiqksRWYyd1yCLlxjY+ucD+qJTWmwh8iZwEUmfE7q8Ij77FLTVC
	 VukvPPeSrbsWA==
Date: Tue, 10 Dec 2024 16:41:44 +0000
From: Will Deacon <will@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, kvmarm@lists.linux.dev
Subject: Re: [PATCH V2 5/7] arm64/cpufeature: Add field details for
 ID_AA64DFR1_EL1 register
Message-ID: <20241210164144.GA16039@willie-the-truck>
References: <20241028053426.2486633-1-anshuman.khandual@arm.com>
 <20241028053426.2486633-6-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028053426.2486633-6-anshuman.khandual@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_084151_731944_CD76CA6F 
X-CRM114-Status: GOOD (  19.03  )
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

On Mon, Oct 28, 2024 at 11:04:24AM +0530, Anshuman Khandual wrote:
> This adds required field details for ID_AA64DFR1_EL1, and also drops dummy
> ftr_raz[] array which is now redundant. These register fields will be used
> to enable increased breakpoint and watchpoint registers via FEAT_Debugv8p9
> later.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> cc: Mark Brown <broonie@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/kernel/cpufeature.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 718728a85430..bd4d85f5dd92 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -530,6 +530,21 @@ static const struct arm64_ftr_bits ftr_id_aa64dfr0[] = {
>  	ARM64_FTR_END,
>  };
>  
> +static const struct arm64_ftr_bits ftr_id_aa64dfr1[] = {
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_ABL_CMPs_SHIFT, 8, 0),
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_DPFZS_SHIFT, 4, 0),
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_EBEP_SHIFT, 4, 0),
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_ITE_SHIFT, 4, 0),
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_ABLE_SHIFT, 4, 0),
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_PMICNTR_SHIFT, 4, 0),
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_SPMU_SHIFT, 4, 0),
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_CTX_CMPs_SHIFT, 8, 0),
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_WRPs_SHIFT, 8, 0),
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_BRPs_SHIFT, 8, 0),
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_SYSPMUID_SHIFT, 8, 0),
> +	ARM64_FTR_END,
> +};

I think I mentioned this on an earlier series, but it would be useful to
see some justification in the commit message as to why some of these
features are considered STRICT vs NONSTRICT and why LOWER_SAFE is
preferred over EXACT.

For example, why is EBEP strict whereas other PMU-related fields aren't?
Why is the CTX_CMPs field treated differently to the same field in DFR0?

I'm not saying the above table is wrong, it just looks arbitrary without
the justification.

Will

