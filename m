Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E3EF54ACB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 14:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p/Zo6NShFi8HSlICOdDjNGNGZAZnwb6R4w2JQYLGp0M=; b=F79So8mr2HZqGO5Ns5mIUMSu4Q
	qU94rdGBzblJslHUeB4Wy0VCWKFiu6aUzxYPSOG+uHO2iQoDlbcnYmes/AuG8V256gCCivcVxQ5s3
	xGw+xFlMGmImBRN5jQu8sTLTvS3fPFXUwQVJd1DgOk1XrOiKYvISri3HjmMlwaX6rR3AOcYWS8Vx6
	KAS9ZuKV16or7+nH5tt6H7mAFRaXbvHAZmllYZyLASJ3nGawfnBrJOS6vtCAHtIJJB9s4t0gAELdk
	RJc5hMYhsgTTDQehFX9jqC4OJ3aM/4rOt/RpcD/+AnTGbe96yfMEteaOh9VY3/BdQ4fBttDDUo9OC
	rRoOoyBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w539v-00000001hB4-2VOG;
	Tue, 24 Mar 2026 14:55:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w539p-00000001h8F-3Rci
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 14:55:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31F9D14BF;
	Tue, 24 Mar 2026 07:54:53 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 638653F915;
	Tue, 24 Mar 2026 07:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774364099; bh=7m7jcKmXqO1sTQ38TYr7OO0Ri9bYkWMYtiPW+oyCnhY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QeHzDmRP3CWEWa1dRjkF7lnY5fVKH35+Xc8iZ1/5hFYcWjbCv9eSKtaqkVr631zYb
	 dT8OyLdPKcwtyToCPTPFu9m1MZz+kFhZYoaBjJYIS/qQbSMa5lhnjKl0HLOeYsPyx9
	 YdVaPlvHAelmubIFhR57Vu6REfoDt0hC+pta+t8g=
Message-ID: <0f8d0966-4e05-4d5a-a523-098b3dbcf7d9@arm.com>
Date: Tue, 24 Mar 2026 14:54:54 +0000
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v10 28/30] KVM: arm64: selftests: Skip impossible invalid
 value tests
To: Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>,
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>, Eric Auger <eric.auger@redhat.com>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
 <20260306-kvm-arm64-sme-v10-28-43f7683a0fb7@kernel.org>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260306-kvm-arm64-sme-v10-28-43f7683a0fb7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_075501_993797_AC46DF3D 
X-CRM114-Status: GOOD (  25.31  )
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

On 3/6/26 17:01, Mark Brown wrote:
> The set_id_regs test currently assumes that there will always be invalid
> values available in bitfields for it to generate but this may not be the
> case if the architecture has defined meanings for every possible value for
> the bitfield. An assert added in commit bf09ee918053e ("KVM: arm64:
> selftests: Remove ARM64_FEATURE_FIELD_BITS and its last user") refuses to
> run for single bit fields which will show the issue most readily but there
> is no reason wider ones can't show the same issue.
> 
> Rework the tests for invalid value to check if an invalid value can be
> generated and skip the test if not, removing the assert.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/kvm/arm64/set_id_regs.c | 63 +++++++++++++++++++++----
>  1 file changed, 53 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
> index bfca7be3e766..928e7d9e5ab7 100644
> --- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
> +++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
> @@ -317,11 +317,12 @@ uint64_t get_safe_value(const struct reg_ftr_bits *ftr_bits, uint64_t ftr)
>  }
>  
>  /* Return an invalid value to a given ftr_bits an ftr value */
> -uint64_t get_invalid_value(const struct reg_ftr_bits *ftr_bits, uint64_t ftr)
> +uint64_t get_invalid_value(const struct reg_ftr_bits *ftr_bits, uint64_t ftr,
> +			   bool *skip)
>  {
>  	uint64_t ftr_max = ftr_bits->mask >> ftr_bits->shift;
>  
> -	TEST_ASSERT(ftr_max > 1, "This test doesn't support single bit features");
> +	*skip = false;
>  
>  	if (ftr_bits->sign == FTR_UNSIGNED) {
>  		switch (ftr_bits->type) {
> @@ -329,42 +330,81 @@ uint64_t get_invalid_value(const struct reg_ftr_bits *ftr_bits, uint64_t ftr)
>  			ftr = max((uint64_t)ftr_bits->safe_val + 1, ftr + 1);
>  			break;
>  		case FTR_LOWER_SAFE:
> +			if (ftr == ftr_max)
> +				*skip = true;
>  			ftr++;
>  			break;
>  		case FTR_HIGHER_SAFE:
> +			if (ftr == 0)
> +				*skip = true;
>  			ftr--;
>  			break;
>  		case FTR_HIGHER_OR_ZERO_SAFE:
> -			if (ftr == 0)
> +			switch (ftr) {
> +			case 0:
>  				ftr = ftr_max;
> -			else
> +				break;
> +			case 1:
> +				*skip = true;
> +				break;
> +			default:
>  				ftr--;
> +				break;
> +			}
>  			break;
>  		default:
> +			*skip = true;
>  			break;
>  		}
>  	} else if (ftr != ftr_max) {
>  		switch (ftr_bits->type) {
>  		case FTR_EXACT:
>  			ftr = max((uint64_t)ftr_bits->safe_val + 1, ftr + 1);
> +			if (ftr >= ftr_max)
> +				*skip = true;
>  			break;
>  		case FTR_LOWER_SAFE:
>  			ftr++;
>  			break;
>  		case FTR_HIGHER_SAFE:
> -			ftr--;
> +			/* FIXME: "need to check for the actual highest." */
> +			if (ftr == ftr_max)
> +				*skip = true;
> +			else
> +				ftr--;
>  			break;
>  		case FTR_HIGHER_OR_ZERO_SAFE:
> -			if (ftr == 0)
> -				ftr = ftr_max - 1;
> -			else
> +			switch (ftr) {
> +			case 0:
> +				if (ftr_max > 1)
> +					ftr = ftr_max - 1;
> +				else
> +					*skip = true;
> +				break;
> +			case 1:
> +				*skip = true;
> +				break;
> +			default:
>  				ftr--;
> +				break;
> +			}
>  			break;
>  		default:
> +			*skip = true;
>  			break;
>  		}
>  	} else {
> -		ftr = 0;
> +		switch (ftr_bits->type) {
> +		case FTR_LOWER_SAFE:
> +			if (ftr == 0)
> +				*skip = true;
> +			else
> +				ftr = 0;
> +			break;
> +		default:
> +			*skip = true;
> +			break;
> +		}
>  	}

I hacked up a quick loop to check what this function is doing.
With a mask=0x1 I see some value returned that have bits set
outside of the mask.

safe_val ftr out

UNSIGNED

FTR_EXACT
0x0 0x0 0x1
0x0 0x1 0x2 # out of range
0x1 0x0 0x2 # out of range
0x1 0x1 0x2 # out of range
FTR_LOWER_SAFE
0x0 0x0 0x1
0x0 0x1 SKIP
0x1 0x0 0x1
0x1 0x1 SKIP
FTR_HIGHER_SAFE
0x0 0x0 SKIP
0x0 0x1 0x0
0x1 0x0 SKIP
0x1 0x1 0x0
FTR_HIGHER_OR_ZERO_SAFE
0x0 0x0 0x1
0x0 0x1 SKIP
0x1 0x0 0x1
0x1 0x1 SKIP

SIGNED

FTR_EXACT
0x0 0x0 SKIP
0x0 0x1 SKIP
0x1 0x0 SKIP
0x1 0x1 SKIP
FTR_LOWER_SAFE
0x0 0x0 0x1
0x0 0x1 0x0
0x1 0x0 0x1
0x1 0x1 0x0
FTR_HIGHER_SAFE
0x0 0x0 0xffffffffffffffff # out of range
0x0 0x1 SKIP
0x1 0x0 0xffffffffffffffff # out of range
0x1 0x1 SKIP
FTR_HIGHER_OR_ZERO_SAFE
0x0 0x0 SKIP
0x0 0x1 SKIP
0x1 0x0 SKIP
0x1 0x1 SKIP

Thanks,

Ben

>  
>  	return ftr;
> @@ -399,12 +439,15 @@ static void test_reg_set_fail(struct kvm_vcpu *vcpu, uint64_t reg,
>  	uint8_t shift = ftr_bits->shift;
>  	uint64_t mask = ftr_bits->mask;
>  	uint64_t val, old_val, ftr;
> +	bool skip;
>  	int r;
>  
>  	val = vcpu_get_reg(vcpu, reg);
>  	ftr = (val & mask) >> shift;
>  
> -	ftr = get_invalid_value(ftr_bits, ftr);
> +	ftr = get_invalid_value(ftr_bits, ftr, &skip);
> +	if (skip)
> +		return;
>  
>  	old_val = val;
>  	ftr <<= shift;
> 


