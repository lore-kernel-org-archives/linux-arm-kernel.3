Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AEFC44524
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 07:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=npvx1Rov5V/ign/oNITAn9lusftU9TKPldrXYwuOVG4=; b=wjPUwt+9TUmKrWhG3v0U+boYV1
	hmfIkEzCHCm4V2f5R2PvFmVKbK7PMOFd3LJoNpeK0jSnDTwCrlOQ43RD8U7uwGLLaUFmJEscc94j3
	VDLXy5787pkLgKqljkdiE06fpnO7JAMpUxnx9nKs7CKfiXLIGgROWst24BPDfP9b1lOrPWdQv/CYm
	CzkxbkZ6JaV12EOHUVCdHFQo7jvRElux4i7iyzOq3cLz8uoS5/1KatMtAH7zYtTCiR6DJY2jLA7Iv
	ug274zttYkyFqKIATRWrovVugABguUq3JrbzeogruMhu5zZE3VVslOWpWucYOfafgJ0ja4uARIsQo
	UPPLjBgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmnpL-0000000DdYm-2TdH;
	Thu, 23 Jul 2026 07:26:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmnpG-0000000DdXx-2XOm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 07:26:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F75C1BA8;
	Thu, 23 Jul 2026 00:26:32 -0700 (PDT)
Received: from [10.163.164.40] (unknown [10.163.164.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7AC7D3F66F;
	Thu, 23 Jul 2026 00:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784791596; bh=fQuZig5GU+0ps47Kg12JnM/El3X9xLJIqbg58kBalr0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bJPVYry9PIJ3A/ep4TkHZ19XXXBNH7h7R90L2lOV7qdvqmNZOu0QKcplp+57BfaMW
	 /89CQz+bPUvnOhQlzHmX4imQRWqyTYxkB0EHPMBIulUkfkO749VvgHk/ZmVWNL7u7Y
	 NyTTeFlBquEj44xjWAE3gQ3BamZfYXjPT+iE++yQ=
Message-ID: <2fe1b74f-70b1-4b24-b416-02db6d41a6d2@arm.com>
Date: Thu, 23 Jul 2026 12:56:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: cpufeature: Extend bbml2_noabort support
 list
To: Linu Cherian <linu.cherian@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Gavin Shan <gshan@redhat.com>
References: <20260723044034.2983651-1-linu.cherian@arm.com>
 <20260723044034.2983651-4-linu.cherian@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260723044034.2983651-4-linu.cherian@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_002639_515629_FFD53351 
X-CRM114-Status: GOOD (  14.01  )
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



On 23/07/26 10:10 AM, Linu Cherian wrote:
> Add below cpus to the midr list, which supports
> BBML2_NOABORT.
> 
> Cortex A520(AE)
> Cortex A715
> Cortex A720(AE)
> Cortex A725
> Neoverse N3
> C1-Nano
> C1-Pro
> C1-Ultra
> C1-Premium
> 
> C1-Ultra and C1-Premium both suffer from erratum 3683289,
> where Break-Before-Make must be followed to avoid a livelock.
> For both CPUs, the erratum is fixed from r1p1.
> Hence we do not enable BBML2_NOABORT for CPU revisions <= r1p0.
> 
> The relevant SDENs are:
> * C1-Ultra: https://developer.arm.com/documentation/111077/9-00/
> * C1-Premium: https://developer.arm.com/documentation/111078/9-00/
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> ---
>  Documentation/arch/arm64/silicon-errata.rst |  4 ++++
>  arch/arm64/kernel/cpufeature.c              | 10 ++++++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
> index 014aa1c215a1..57c778446936 100644
> --- a/Documentation/arch/arm64/silicon-errata.rst
> +++ b/Documentation/arch/arm64/silicon-errata.rst
> @@ -242,10 +242,14 @@ stable kernels.
>  +----------------+-----------------+-----------------+-----------------------------+
>  | ARM            | Neoverse-V3AE   | #4193784        | ARM64_ERRATUM_4118414       |
>  +----------------+-----------------+-----------------+-----------------------------+
> +| ARM            | C1-Premium      | #3683289        | N/A                         |
> ++----------------+-----------------+-----------------+-----------------------------+
>  | ARM            | C1-Premium      | #4193780        | ARM64_ERRATUM_4118414       |
>  +----------------+-----------------+-----------------+-----------------------------+
>  | ARM            | C1-Pro          | #4193714        | ARM64_ERRATUM_4193714       |
>  +----------------+-----------------+-----------------+-----------------------------+
> +| ARM            | C1-Ultra        | #3683289        | N/A                         |
> ++----------------+-----------------+-----------------+-----------------------------+
>  | ARM            | C1-Ultra        | #4193780        | ARM64_ERRATUM_4118414       |
>  +----------------+-----------------+-----------------+-----------------------------+
>  | ARM            | MMU-500         | #562869,        | ARM_SMMU_MMU_500_CPRE_ERRATA|
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 9a22df0c5120..98d2cfc2dc90 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2152,6 +2152,16 @@ bool cpu_supports_bbml2_noabort(void)
>  		MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
>  		MIDR_ALL_VERSIONS(MIDR_AMPERE1),
>  		MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A520AE),
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A715),
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A720AE),
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A725),
> +		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N3),
> +		MIDR_ALL_VERSIONS(MIDR_C1_NANO),
> +		MIDR_ALL_VERSIONS(MIDR_C1_PRO),
> +		/* Erratum 3683289 fixed in r1p1 */
> +		MIDR_RANGE(MIDR_C1_ULTRA, 1, 1, 0xf, 0xf),
> +		MIDR_RANGE(MIDR_C1_PREMIUM, 1, 1, 0xf, 0xf),

This in line with what Mark had suggested earlier.
>  		{}
>  	};
>  

