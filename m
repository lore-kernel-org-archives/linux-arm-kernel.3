Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB81CD0C5E5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 08:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4UvIr1TF/htZ+TQS+gL84cjH2WM0yCRW4DTCJg39uWY=; b=VhItVhZVr8TLZ/c8DWjsMtJHKu
	nFeekelYXi3ywil9c1AfwrcmDBFd//uppp0SPU2zSNlXXtKBZj4QqBfAhi334jhGQoVEDpbtkdovM
	wWjKrZ2Lu4tkyYSvI55KXmkv9/BpuZ3Nbny1+1SDnVTTqF7OAGG/Pk2eqCkcQPC8a5cMNW6Q0OZYp
	e2CJNQsudN2u3irJQY57nxxGwGnuxLHjoWtRScObyDGCdqP8Q0dK0jw257G/ggJMrlji6ceW7rxhW
	3W7LFaMRehyw9X5aC2wByagfQY0KLvxM52AfchJoQI68Ma3OFjFqVzIQSCRUoL1RFxIQ371VlQRhi
	H/PF8DXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Fni-0000000300z-1Hgi;
	Fri, 25 Oct 2024 08:36:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FjT-00000002zDZ-0Try
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 08:31:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 287DA339;
	Fri, 25 Oct 2024 01:32:10 -0700 (PDT)
Received: from [10.57.66.80] (unknown [10.57.66.80])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C29B3F73B;
	Fri, 25 Oct 2024 01:31:36 -0700 (PDT)
Message-ID: <c35d8783-c754-4864-b964-4a3bfaa4cd11@arm.com>
Date: Fri, 25 Oct 2024 10:31:33 +0200
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
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <6b575236-7e4e-4128-9ab6-7ecec7b81428@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_013143_278884_4DA4D375 
X-CRM114-Status: GOOD (  29.91  )
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

On 23/10/2024 18:51, Dave Hansen wrote:
> On 10/23/24 08:05, Kevin Brodsky wrote:
> ...> diff --git a/tools/testing/selftests/mm/pkey-x86.h
> b/tools/testing/selftests/mm/pkey-x86.h
>> index 5f28e26a2511..53ed9a336ffe 100644
>> --- a/tools/testing/selftests/mm/pkey-x86.h
>> +++ b/tools/testing/selftests/mm/pkey-x86.h
>> @@ -34,6 +34,8 @@
>>  #define PAGE_SIZE		4096
>>  #define MB			(1<<20)
>>  
>> +#define PKEY_ALLOW_NONE		0x55555555
> Hi Kevin,
>
> Looking at this in context, I think "PKEY_ALLOW_NONE" is not a great
> name.  On one hand, we have:
>
> 	PKEY_DISABLE_ACCESS
> 	PKEY_DISABLE_WRITE
>
> which are values for *A* pkey.
>
> But PKEY_ALLOW_NONE is a whole register value and spans permissions for
> many keys.  We don't want folks trying to do something like:
>
> 	pkey_alloc(flags, PKEY_ALLOW_NONE);
>
> If I were naming it in x86 code, I'd probably call it:
>
> 	PKRU_ALLOW_NONE
>
> or something.

I agree, the naming is not ideal, I lacked inspiration! Maybe
PKEY_REG_ALLOW_NONE to remain generic?

>
>>  static inline void __page_o_noops(void)
>>  {
>>  	/* 8-bytes of instruction * 512 bytes = 1 page */
>> diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
>> index a8088b645ad6..b5e1767ee5d9 100644
>> --- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
>> +++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
>> @@ -37,6 +37,8 @@ pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
>>  pthread_cond_t cond = PTHREAD_COND_INITIALIZER;
>>  siginfo_t siginfo = {0};
>>  
>> +static u64 pkey_reg_no_access;
> Ideally, this would be a real const or a #define because it really is
> static.  Right?  Or is there something dynamic about the ARM
> implementation's value?

It isn't dynamic no, the issue is that on architectures where pkeys
restrict execution we need to allow X for pkey 0. Of course it would be
possible to define PKEY_REG_ALLOW_ALL in such a way that X is allowed
for pkey 0, but I was concerned this might be misleading. No strong
opinion either way, happy to make it purely a macro, maybe with a better
name?

> ...
>>  	 * Setup alternate signal stack, which should be pkey_mprotect()ed by
>> @@ -142,7 +145,8 @@ static void *thread_segv_maperr_ptr(void *ptr)
>>  	syscall_raw(SYS_sigaltstack, (long)stack, 0, 0, 0, 0, 0);
>>  
>>  	/* Disable MPK 0.  Only MPK 1 is enabled. */
>> -	__write_pkey_reg(0x55555551);
>> +	pkey_reg = set_pkey_bits(pkey_reg_no_access, 1, 0);
>> +	__write_pkey_reg(pkey_reg);
> The existing magic numbers are not great, but could we do:
>
> #define PKEY_ALLOW_ALL 0x0
>
> So that this can be written like this:
>
> 	pkey_reg = PKRU_ALLOW_NONE;
> 	pkey_reg = set_pkey_bits(pkey_reg, 1, PKEY_ALLOW_ALL);
>
> That would get rid of the magic '0'.

Definitely better yes. But how about using Yury's uapi addition,
PKEY_UNRESTRICTED [1]?

[1]
https://lore.kernel.org/all/20241022120128.359652-1-yury.khrustalev@arm.com/

>
>>  	/* Segfault */
>>  	*bad = 1;
>> @@ -240,6 +244,7 @@ static void test_sigsegv_handler_with_different_pkey_for_stack(void)
>>  	int pkey;
>>  	int parent_pid = 0;
>>  	int child_pid = 0;
>> +	u64 pkey_reg;
>>  
>>  	sa.sa_flags = SA_SIGINFO | SA_ONSTACK;
>>  
>> @@ -257,7 +262,9 @@ static void test_sigsegv_handler_with_different_pkey_for_stack(void)
>>  	assert(stack != MAP_FAILED);
>>  
>>  	/* Allow access to MPK 0 and MPK 1 */
>> -	__write_pkey_reg(0x55555550);
>> +	pkey_reg = set_pkey_bits(pkey_reg_no_access, 0, 0);
>> +	pkey_reg = set_pkey_bits(pkey_reg, 1, 0);
>> +	__write_pkey_reg(pkey_reg);
> ... and using the pattern from above, this is quite a bit more readable:
>
> 	pkey_reg = PKRU_ALLOW_NONE;
> 	pkey_reg = set_pkey_bits(pkey_reg, 0, PKEY_ALLOW_ALL);
> 	pkey_reg = set_pkey_bits(pkey_reg, 1, PKEY_ALLOW_ALL);
>
> ...
>> +	/* Only allow X for MPK 0 and nothing for other keys */
>> +	pkey_reg_no_access = set_pkey_bits(PKEY_ALLOW_NONE, 0,
>> +					   PKEY_DISABLE_ACCESS);
> If the comment says "only allow X", then I'd expect the code to say:
>
> 	pkey_reg_no_access = set_pkey_bits(PKEY_ALLOW_NONE, 0, PKEY_X);
>
> ... or something similar.

I could #define PKEY_X PKEY_DISABLE_ACCESS but is the mixture of
negative and positive polarity really helping? We cannot define PKEY_R
and PKEY_W so that (for instance) PKEY_R | PKEY_X does what it says.
Having to use PKEY_DISABLE_ACCESS to mean "X only" is not ideal, but
this is what userspace already has to do.

Either way if we define PKEY_REG_ALLOW_NONE or similar to allow X for
pkey 0 as suggested then this will go.

Thanks for the review!

Kevin


