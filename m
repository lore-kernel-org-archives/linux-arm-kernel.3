Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D911ED0C850
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 10:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0jKgLHTHn0KxcgjhG8h9i6lrRHUyjGkRmzUhSsy3CsE=; b=GPMKMo+JUHUQ7qi/udjCDBT0GR
	2WjJB0895MhdXrM3BI3mK0YkeeXhfWfzuYqim5auoop9tHv/CMn+GTkuwuZHLy+oyLGHuIsx8kRFz
	58J8Pxgu4l8HJYZTG8JokEmDAezXOOxLcOkANhDDUNZJ2SbPzq0AedyR0CKYwix/5/VUK2WuS8Bab
	/NoDHspCB7S5zs1rvLScwUYHOsMeD4WyPfVMDJQfGWPz1K25ZxbekC5t7X1WM0WImDXVa7WaEsmDX
	PYYzQdBQa9aiS6FC4C+ZKnOKCJ3B9JAfBsqaqeMnqJsvnD57DbuxI1V0ZJDwjny0btPxwXhEqx1wH
	LELAnUkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc1J-00000006w4D-0DWA;
	Tue, 13 Jan 2026 10:53:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc1H-00000006w3i-1frg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 10:53:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D8BD497;
	Tue, 13 Jan 2026 02:52:55 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E56233F5A1;
	Tue, 13 Jan 2026 02:52:58 -0800 (PST)
Message-ID: <75ea1f3d-7589-4946-bffe-406459ee77d2@arm.com>
Date: Tue, 13 Jan 2026 10:52:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 28/30] KVM: arm64: selftests: Skip impossible invalid
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
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
 <20251223-kvm-arm64-sme-v9-28-8be3867cb883@kernel.org>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251223-kvm-arm64-sme-v9-28-8be3867cb883@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_025303_523628_9F51AFAA 
X-CRM114-Status: GOOD (  26.69  )
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

On 12/23/25 01:21, Mark Brown wrote:
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
>  tools/testing/selftests/kvm/arm64/set_id_regs.c | 58 ++++++++++++++++++++-----
>  1 file changed, 46 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
> index 322cd13b9352..641194c5005a 100644
> --- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
> +++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
> @@ -318,11 +318,12 @@ uint64_t get_safe_value(const struct reg_ftr_bits *ftr_bits, uint64_t ftr)
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
> @@ -330,42 +331,72 @@ uint64_t get_invalid_value(const struct reg_ftr_bits *ftr_bits, uint64_t ftr)
>  			ftr = max((uint64_t)ftr_bits->safe_val + 1, ftr + 1);

Don't you want the check you've got in the signed case here to deal with
safe_val or ftr being equal to ftr_max. In the 1 bit case we there won't
be any invalid values if the safe_val and ftr are different.

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
> -			break;
> +				break;
> +			}

Missing break for the outer switch statement.

>  		default:
> +			*skip = true;
>  			break;
>  		}
>  	} else if (ftr != ftr_max) {
>  		switch (ftr_bits->type) {
>  		case FTR_EXACT:
>  			ftr = max((uint64_t)ftr_bits->safe_val + 1, ftr + 1);
> +			if (ftr > ftr_max)
> +				*skip = true;
>  			break;
>  		case FTR_LOWER_SAFE:
> -			ftr++;
> +			if (ftr == ftr_max)
> +				*skip = true;

This is the opposite condition of the enclosing else if.

> +			else
> +				ftr++;
>  			break;
>  		case FTR_HIGHER_SAFE:
> -			ftr--;
> -			break;
> -		case FTR_HIGHER_OR_ZERO_SAFE:
>  			if (ftr == 0)
> -				ftr = ftr_max - 1;
> +				*skip = true;

Isn't ftr_max, -1, invalid in FTR_HIGHER_SAFE case when ftr is 0. Also,
need to check for the actual highest.

>  			else
>  				ftr--;
>  			break;
> +		case FTR_HIGHER_OR_ZERO_SAFE:
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
> +				ftr--;
> +				break;
> +			break;
> +			}
>  		default:
> +			*skip = true;
>  			break;
>  		}
>  	} else {
> -		ftr = 0;
> +		*skip = true;

Why do we always skip when signed and ftr is -1? Wouldn't 0 be an
invalid in the FTR_LOWER_SAFE case.

>  	}
>  
>  	return ftr;
> @@ -400,12 +431,15 @@ static void test_reg_set_fail(struct kvm_vcpu *vcpu, uint64_t reg,
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


Thanks,

Ben


