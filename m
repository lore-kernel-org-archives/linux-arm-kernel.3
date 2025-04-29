Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730C2C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 14:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wBjgqJmieR7DJHSg+66WYd/OAVSF9qfUFkVkpy0fHEI=; b=Nge5jB0KWAGGH9LYDmvDCI8Ko3
	1seDFb1NVdfzHSM2ryEVQhtk20y92LculPGJq3oloyZns0vRgfgqxj5NOQ/JUxaXMenIOkxvra81q
	gks6wI7p61hEhAet3anJlmohkhEnpoIS1KzHbrG0XWhIPrfCkg4D/UQu+vdjzPoRb50cz+jOvv2Wj
	34TdBKP8BF0Q81w6dsACvblCzev6/878SB1jbvyVgeztY+1j/Ah9rQlZ9G9TgPgHhn0kMnZeG8RiE
	C49QCHnbhBK6tNv/9Ewx5XHRaUTV3ZmTTCG+JNg7bMP1oTCToW5dt0RlrzaNJ02ELHzFez/Bck42f
	K5jVpm6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9liv-00000009tmk-1MRP;
	Tue, 29 Apr 2025 14:14:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lA0-00000009nMl-49ok
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 13:38:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD6D81515;
	Tue, 29 Apr 2025 06:38:01 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 916F93F673;
	Tue, 29 Apr 2025 06:38:06 -0700 (PDT)
Date: Tue, 29 Apr 2025 14:38:03 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>, Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v3 02/42] arm64: sysreg: Update ID_AA64MMFR4_EL1
 description
Message-ID: <20250429133803.GB1859293@e124191.cambridge.arm.com>
References: <20250426122836.3341523-1-maz@kernel.org>
 <20250426122836.3341523-3-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426122836.3341523-3-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_063809_069518_A60AE0DF 
X-CRM114-Status: GOOD (  15.45  )
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

On Sat, Apr 26, 2025 at 01:27:56PM +0100, Marc Zyngier wrote:
> Resync the ID_AA64MMFR4_EL1 with the architectue description.
> 
> This results in:
> 
> - the new PoPS field
> - the new NV2P1 value for the NV_frac field
> - the new RMEGDI field
> - the new SRMASK field
> 
> These fields have been generated from the reference JSON file.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/tools/sysreg | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index e5da8848b66b5..fce8328c7c00b 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -1946,12 +1946,21 @@ EndEnum
>  EndSysreg
>  
>  Sysreg	ID_AA64MMFR4_EL1	3	0	0	7	4
> -Res0	63:40
> +Res0	63:48
> +UnsignedEnum	47:44	SRMASK
> +	0b0000	NI
> +	0b0001	IMP
> +EndEnum
> +Res0	43:40
>  UnsignedEnum	39:36	E3DSE
>  	0b0000	NI
>  	0b0001	IMP
>  EndEnum
> -Res0	35:28
> +Res0	35:32
> +UnsignedEnum	31:28	RMEGDI
> +	0b0000	NI
> +	0b0001	IMP
> +EndEnum
>  SignedEnum	27:24	E2H0
>  	0b0000	IMP
>  	0b1110	NI_NV1
> @@ -1960,6 +1969,7 @@ EndEnum
>  UnsignedEnum	23:20	NV_frac
>  	0b0000	NV_NV2
>  	0b0001	NV2_ONLY
> +	0b0010	NV2P1
>  EndEnum
>  UnsignedEnum	19:16	FGWTE3
>  	0b0000	NI
> @@ -1979,7 +1989,10 @@ SignedEnum	7:4	EIESB
>  	0b0010	ToELx
>  	0b1111	ANY
>  EndEnum
> -Res0	3:0
> +UnsignedEnum	3:0	PoPS
> +	0b0000	NI
> +	0b0001	IMP
> +EndEnum
>  EndSysreg
>  
>  Sysreg	SCTLR_EL1	3	0	1	0	0

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

