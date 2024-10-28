Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DC5D13570
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 10:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bmhpyzKwivp1MPmXjUPqcRT+n1WMkVSe66d8hP62sVw=; b=P0c/lPToZtEbm9SaoTf52jb56X
	o/b3lq+cmOzZEX1Bjmm/QHdK8GgD9fFgmEauYsDlG5sRUbzWkoHFrrvQdUh0Hx0k2Wg+noEh2ITtB
	gE5aJnIMBGu990GmzFXT8PgBXIndll3F91Iq1i11lYkFWR1ycsccR24lucWoxES4jyIeUkk8sl0x1
	Dg2wFDux9ona8a2c/R/lHzs8z2lvuJmm7/aY4H2JdmXA2/aJC0RGGn6kgxEKcbKHtWjCcRjm29c0T
	3qbjvlA12Rkozs3Q/LIY8dT6RXQdl7NTm6IrM6k3DKAy5g8n3DfOq6DWVHbmq7CG0xueDiIPJOJRF
	PJ9wT10Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5MuZ-0000000ANuD-3APO;
	Mon, 28 Oct 2024 10:23:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5MrT-0000000ANMX-2tKf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 10:20:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E73A9497;
	Mon, 28 Oct 2024 03:21:01 -0700 (PDT)
Received: from [10.57.64.61] (unknown [10.57.64.61])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A0EA3F528;
	Mon, 28 Oct 2024 03:20:28 -0700 (PDT)
Message-ID: <03ddf191-f0bc-4d63-abcc-932141512314@arm.com>
Date: Mon, 28 Oct 2024 11:20:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] selftests/mm: Use generic pkey register
 manipulation
To: Dave Hansen <dave.hansen@intel.com>, linux-arm-kernel@lists.infradead.org
Cc: akpm@linux-foundation.org, anshuman.khandual@arm.com,
 aruna.ramakrishna@oracle.com, broonie@kernel.org, catalin.marinas@arm.com,
 dave.hansen@linux.intel.com, dave.martin@arm.com, jeffxu@chromium.org,
 joey.gouly@arm.com, pierre.langlois@arm.com, shuah@kernel.org,
 sroettger@google.com, will@kernel.org, linux-kselftest@vger.kernel.org,
 x86@kernel.org, Yury Khrustalev <Yury.Khrustalev@arm.com>
References: <20241023150511.3923558-1-kevin.brodsky@arm.com>
 <20241023150511.3923558-5-kevin.brodsky@arm.com>
 <6b575236-7e4e-4128-9ab6-7ecec7b81428@intel.com>
 <c35d8783-c754-4864-b964-4a3bfaa4cd11@arm.com>
 <5fa27331-db95-4d60-8fd9-19fbd18f12bb@intel.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <5fa27331-db95-4d60-8fd9-19fbd18f12bb@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_032035_879950_B45D8EC5 
X-CRM114-Status: GOOD (  27.94  )
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

On 25/10/2024 17:09, Dave Hansen wrote:
> [...]
>>>>  static inline void __page_o_noops(void)
>>>>  {
>>>>  	/* 8-bytes of instruction * 512 bytes = 1 page */
>>>> diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
>>>> index a8088b645ad6..b5e1767ee5d9 100644
>>>> --- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
>>>> +++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
>>>> @@ -37,6 +37,8 @@ pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
>>>>  pthread_cond_t cond = PTHREAD_COND_INITIALIZER;
>>>>  siginfo_t siginfo = {0};
>>>>  
>>>> +static u64 pkey_reg_no_access;
>>> Ideally, this would be a real const or a #define because it really is
>>> static.  Right?  Or is there something dynamic about the ARM
>>> implementation's value?
>> It isn't dynamic no, the issue is that on architectures where pkeys
>> restrict execution we need to allow X for pkey 0. Of course it would be
>> possible to define PKEY_REG_ALLOW_ALL in such a way that X is allowed
>> for pkey 0, but I was concerned this might be misleading. No strong
>> opinion either way, happy to make it purely a macro, maybe with a better
>> name?
> I do think we should differentiate truly "no access" value from the one
> that allows X on pkey 0, at least in the selftest.  Define a helper that
> uses the *real* "no access" value:
>
> /*
>  * Returns the most restrictive register value
>  * that can be used in the selftest.
>  */
> static inline u64 pkey_reg_restrictive_default(void)
> {
> 	/*
> 	 * The selftest code runs (mostly) with its code mapped with
> 	 * pkey-0.  Allows execution on pkey-0 so that each site doesn't
> 	 * have to do this:
> 	 */
> 	return set_pkey_bits(PKEY_REG_NO_ACCESS, 0, PKEY_X);
> }
>
> and then use it like this:
>
> 	pkey_reg = pkey_reg_restrictive_default();
>  	pkey_reg = set_pkey_bits(pkey_reg, 1, PKEY_ALLOW_ALL);

Didn't think of introducing a helper, that looks good, thanks! Inlining
and optimisations should be able to reduce the call to a constant,
another win compared to using a global. Will go for that in v3.

> [...]
>>> ...
>>>> +	/* Only allow X for MPK 0 and nothing for other keys */
>>>> +	pkey_reg_no_access = set_pkey_bits(PKEY_ALLOW_NONE, 0,
>>>> +					   PKEY_DISABLE_ACCESS);
>>> If the comment says "only allow X", then I'd expect the code to say:
>>>
>>> 	pkey_reg_no_access = set_pkey_bits(PKEY_ALLOW_NONE, 0, PKEY_X);
>>>
>>> ... or something similar.
>> I could #define PKEY_X PKEY_DISABLE_ACCESS but is the mixture of
>> negative and positive polarity really helping? We cannot define PKEY_R
>> and PKEY_W so that (for instance) PKEY_R | PKEY_X does what it says.
>> Having to use PKEY_DISABLE_ACCESS to mean "X only" is not ideal, but
>> this is what userspace already has to do.
> There would be some churn, but we could also convert the whole thing
> over to just use explicit RWX enable bits, like in the
> thread_segv_maperr_ptr() test:
>
> 	// Truly turn everything off:
> 	pkey_reg = PKEY_REG_NO_ACCESS;
>  	pkey_reg = set_pkey_perm(pkey_reg, 1, PKEY_RW);

I suppose that not granting X permission for pkey 1 would make sense,
but since we don't have anything mapped with PROT_EXEC and pkey 1 the
benefits are minimal.

> I'm not sure that's worth the churn though.

I'm not convinced either. I'd rather keep using the standard uapi
macros, even though they can be confusing (but they at least combine in
the way you'd expect).

Kevin

