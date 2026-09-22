Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33554C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSkso6VTuE1j2eIC6Omi4Exf0hrumTUhbwJQCS8v0Jk=; b=493Z6m7RdtaUHdao//Iz/vUHZu
	xvQla/qph/WGTDCTaahaTf/3FACavPPdIqSg8D+35zpL8QJgka9TtPY/G79z90FHsASOwb5F04AAu
	BaxxWuODY3olX4nVmvBOTf7wGyeATBB88e1lq6tzv8vH132OHF0Dkinc04/rMhYPQLuFvg7mxxW7K
	HddmmmNeW+NkpaXsx6RwGAkBlMJ5rFfDeY/RdXu8CFIIQJ6nUTpM0+UZs3MZECQlzol8EPU71EiYG
	BbASK8TjfES2tRKw/w8+PJJCiTqmZryFajYTTAimbnaQ7ncMrI1tNdQhBQq9Kq1SZrKk0STgIjm91
	+/rZ3/wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wER-00000004li3-4BNI;
	Tue, 22 Sep 2026 08:52:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wEQ-00000004lhc-3S0T
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 08:52:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=aSkso6VTuE1j2eIC6Omi4Exf0hrumTUhbwJQCS8v0Jk=; b=W2/12kTEyT1CUWjm4MN+s4VE9g
	Tn1cTHDE2oNqyqTtlZ2kMNQVxOWNQ2Ww1RIRzc5GQdmBijzHU5wFvtOjm0BvJSLMJgfLzLTiM7JWc
	0dXfUajM22aoCRcVVbfefl5dGcG4inX05jKy2wJRTKdkA1XUvYAOShDjSoY6cIRgYq8vXZCuM22X6
	Pn4C7XQ+63iPAcyr1NaT3q+k6zMTVkJU3LeYYhrZYHFfr8yzwrM+WoQtj3DavVdDBfOoDktjjp6Jz
	m+dnlEv9V/Tg8zEnwGzxnC9HK8fhGWuez0iFZoh7/yc/gBKZoCK+zuHmWKgk5WHIg8OYi1hJAYO1u
	Jbhc/H9w==;
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8wEN-0000000DIih-2L66
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 08:52:05 +0000
Received: from [133.11.54.183] (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 68M8p4AY014493
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 22 Sep 2026 17:51:04 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=aSkso6VTuE1j2eIC6Omi4Exf0hrumTUhbwJQCS8v0Jk=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-ID:To:Subject:Date;
        s=rs20250326; t=1790067065; v=1;
        b=GYGFi7CfxySCHkGNYbviQhaWOIu1Icg3BpQNl8WTUTnxz6bpbIpzI/2GnR3wN+5C
         /+NmBvMA6MgnGbzs3tydcuW8Joxi4k8evpn9t9aeX+GsspiZG8s3KAyzq4wQWZ9p
         4pi4AkOg+S0lMC8DVWBSyu03KE3H6d+fhYpu3/ovlHVKtNzFYHIbX242v6ARhL4P
         nuajrFOV+CvPgjNvzkEDCsQfQgY+Oj61G8zWDMJGWmdzCfp/7HzoNBELyQsAyDMY
         I/W6QKkNfvvgU2nVb90KvmRugT+HS7wpKpX1ex1jGX3DymUno/Fcx7STsKXcXHms
         tMDWY7Hnfy1e/O7ACYz74w==
Message-ID: <67b1a5dd-372e-4548-a44d-ea77f38ea07f@rsg.ci.i.u-tokyo.ac.jp>
Date: Tue, 22 Sep 2026 17:51:03 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 09/21] KVM: arm64: PMU: Recreate events after MDCR_EL2
 changes
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu
 <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Steffen Eiden <seiden@linux.ibm.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>,
        Sean Christopherson <seanjc@google.com>,
        Shannon Zhao <shannon.zhao@linaro.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org
References: <20260920-hybrid-v11-0-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
 <20260920-hybrid-v11-9-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
 <arImQ6SG7s1k9uJk@kernel.org>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <arImQ6SG7s1k9uJk@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_095204_198874_106D7337 
X-CRM114-Status: GOOD (  18.41  )
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

On 2026/09/22 15:54, Oliver Upton wrote:
> On Sun, Sep 20, 2026 at 08:15:50PM +0900, Akihiko Odaki wrote:
>> +void kvm_pmu_apply_mdcr(struct kvm_vcpu *vcpu, u64 old, u64 val)
>> +{
>> +	u64 changed = old ^ val;
>> +
>> +	/*
>> +	 * HPMN determines which counters HPMD and HLP apply to. Changes to
>> +	 * these fields require new perf event filters and sample periods.
>> +	 */
>> +	if (changed & (MDCR_EL2_HPMN | MDCR_EL2_HPMD | MDCR_EL2_HLP))
>> +		kvm_pmu_request_recreate(vcpu);
>> +	else if (changed & MDCR_EL2_HPME)
>> +		kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
>> +}
>> +
> 
> Urgh... I'm not a fan of this. Can you just modify kvm_vcpu_reload_pmu()
> to discard all backing perf events and recompute them only for enabled
> PMCs? We set KVM_REQ_RELOAD_PMU pretty rarely.
> 
>>   	__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, &=, mask);
>>   	__vcpu_rmw_sys_reg(vcpu, PMINTENSET_EL1, &=, mask);
>> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>> index 75624725adf1..7dd2cafce247 100644
>> --- a/arch/arm64/kvm/sys_regs.c
>> +++ b/arch/arm64/kvm/sys_regs.c
>> @@ -3114,17 +3114,22 @@ static bool access_mdcr(struct kvm_vcpu *vcpu,
>>   	}
>>   
>>   	__vcpu_assign_sys_reg(vcpu, MDCR_EL2, val);
>> -
>> -	/*
>> -	 * Request a reload of the PMU to enable/disable the counters
>> -	 * affected by HPME.
>> -	 */
>> -	if ((old ^ val) & MDCR_EL2_HPME)
>> -		kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
>> +	kvm_pmu_apply_mdcr(vcpu, old, val);
>>   
>>   	return true;
>>   }
> 
>> +static int set_mdcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
>> +		    u64 val)
>> +{
>> +	u64 old = __vcpu_sys_reg(vcpu, MDCR_EL2);
>> +
>> +	__vcpu_assign_sys_reg(vcpu, MDCR_EL2, val);
>> +	kvm_pmu_apply_mdcr(vcpu, old, val);
>> +
>> +	return 0;
>> +}
>> +
> 
> Just keep the old ^ new test inline for access_mdcr() and set the
> request unconditionally from set_mdcr(). In the usual case
> KVM_REQ_RELOAD_PMU is already set on a vCPU that userspace is restoring.

Hi Oliver,

Thanks for the feedback. I'll make both changes for v2.

I originally tried to preserve existing behavior and keep things 
consistent, but I agree that simplicity is much better here given how 
rarely KVM_REQ_RELOAD_PMU is set.

Regards,
Akihiko Odaki

