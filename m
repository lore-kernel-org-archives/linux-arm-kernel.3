Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901E6CD5822
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 09:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XD5WC1ojXQnp/Bgn0217oPXNip7VYFbZhmVCiHMjAfA=; b=XcCabAbOloXR004Cl5xWWOyM8Q
	+vpatzkW049JKzrzpUSeRsY7FOBCUc1Wd3ASSGweubtx9v9UaZOX+WZjaCqeH6nMzO2nX7t3J6vrq
	QWPiqcfaVJCw5a3bsL7xjREGVZyy7lVG0XV/sf73gz57pjhyxTkzOa5EFbQfkAJp/W8HvRz8lQ31T
	JCvM8Vxa26ZuiCmjqRTK6rR6Be4Ijvo95HU2yLn4lwtfzfXarIDBBt1AgNNJ8Pky4rMt5u53CUMG6
	FDmuJO06FpfS6n+fNUBBT2ffrl9GQAiaDg5UVZh5Q4K1h0RlKzdKWDQ96cCHsuSzey07GvlxEUzPc
	roLoZ+LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQFt-0000000EbkZ-3KQi;
	Wed, 07 Jan 2026 09:55:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQFr-0000000Ebk0-2SMI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 09:55:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 398DB497;
	Wed,  7 Jan 2026 01:54:55 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25C213F6A8;
	Wed,  7 Jan 2026 01:55:00 -0800 (PST)
Message-ID: <4cb1ad60-f8cc-4efd-9c9d-9ae52001e547@arm.com>
Date: Wed, 7 Jan 2026 09:54:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] KVM: selftests: arm64: Skip all 32 bit IDs when
 set_id_regs is aarch64 only
To: Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Oliver Upton <oupton@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260106-kvm-arm64-set-id-regs-aarch64-v4-0-c7ef4551afb3@kernel.org>
 <20260106-kvm-arm64-set-id-regs-aarch64-v4-4-c7ef4551afb3@kernel.org>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20260106-kvm-arm64-set-id-regs-aarch64-v4-4-c7ef4551afb3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_015503_681448_0B10AF60 
X-CRM114-Status: GOOD (  21.30  )
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

Hi Mark,

On 1/6/26 16:35, Mark Brown wrote:
> On an aarch64 only system the 32 bit ID registers have UNDEFINED values.
> As a result set_id_regs skips tests for setting fields in these registers
> when testing an aarch64 only guest. This has the side effect of meaning
> that we don't record an expected value for these registers, meaning that
> when the subsequent tests for values being visible in guests and preserved
> over reset check the value they can spuriously fail. This can be seen by
> running on an emulated system with both NV and 32 bit enabled, NV will
> result in the guests created by the test program being 64 bit only but
> the 32 bit ID registers will have values.
> 
> Also skip those tests that use the values set in the field setting tests
> for aarch64 only guests in order to avoid these spurious failures.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/kvm/arm64/set_id_regs.c | 49 ++++++++++++++++++-------
>  1 file changed, 36 insertions(+), 13 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
> index 5837da63e9b9..908b3c8947d9 100644
> --- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
> +++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
> @@ -295,6 +295,13 @@ static const char *get_reg_name(u64 id)
>  	}
>  }
>  
> +static inline bool is_aarch32_id_reg(u64 id)
> +{
> +	return (sys_reg_Op0(id) == 3 && sys_reg_Op1(id) == 0 &&
> +		sys_reg_CRn(id) == 0 && sys_reg_CRm(id) >= 1 &&
> +		sys_reg_CRm(id) <= 3);
> +}
> +

This check looks correct to me now.

Not touched in this patch but the check for aarch64_only looks suspect to me.

From main()
val = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_ID_AA64PFR0_EL1));
el0 = FIELD_GET(ID_AA64PFR0_EL1_EL0, val);
aarch64_only = (el0 == ID_AA64PFR0_EL1_EL0_IMP);

As we are concerned with system registers that are accessible from EL1 and higher
should this not be checking ID_AA64PFR0_EL1_EL1 rather than ID_AA64PFR0_EL1_EL0?
Not sure if it makes sense for the two to be different though.

Thanks,

Ben


