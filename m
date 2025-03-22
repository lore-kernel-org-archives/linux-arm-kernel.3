Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3F8C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 11:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UTGUGbQUE2yBy6fNmytOVRCkloT3VUILyaQFDzsliS0=; b=hhyPeml+kqVOZF95RtgtH7qBZj
	OaqZvWmhZFPnT7T7dJXVbc8e7LSW3t0pNKead3dZFLoGBt4DrlRpzOpuEl6psyEwe2oM3uSeJTvnO
	YKpib/bioz6x8VB1uvYls0ygee+yyiu5fR6Nns5kds7iQaXNJ7/SfKZ5Uw9xevljbX/RTPl7o59cI
	q/mQBzO4kFGUhPIUQf6m1SYZt+BI0OJotdSEW5xBcRs6yY/BmiVUaJ4VyRbztX1tbfwQsELgbwmiE
	isFwJCG+/aEyPwTp+dXOcIm6KUKR7URCkrkp4DmH9D0sx/RVAfr+0m48O5bzN36G5ofRNQ46Qlqb4
	gDqVcXDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvxLW-0000000HM2e-1BN9;
	Sat, 22 Mar 2025 11:48:58 +0000
Received: from out-72.smtpout.orange.fr ([193.252.22.72] helo=out.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvxJq-0000000HLti-0vFG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Mar 2025 11:47:16 +0000
Received: from [172.16.82.72] ([124.33.176.97])
	by smtp.orange.fr with ESMTPA
	id vxJVt69rhpih5vxJZtV7CB; Sat, 22 Mar 2025 12:47:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1742644026;
	bh=UTGUGbQUE2yBy6fNmytOVRCkloT3VUILyaQFDzsliS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=TOvo37+NuAbEYBETmhToZGFCO3XSA5A1TrbT/NKcYuQv0poRsQ5d7DFMcFpNEvptu
	 3LL0OJhePxXiuXBgCAq6ScWL0H6AYnx2YCTTtueGLcwm1YT1Nv9om3ykr+qlV8qKBv
	 t3aIsgQnpWbcyCI5DAJu4u/Q4X/3CEhDjyg0+aHS7opuCUb2WVNvDbhYiSoyf35X4p
	 VVuWK0ILd6Ftj1bXvaaLNXWhWOubtzjBnkGf7ULseUgH8rV/J1CfHOwvTYcGAmu7pT
	 liTnqE7rhR4C2PE4UICzKxE1RQPABxi1Oqvg31DicrVppqpBX7o0h+zCM7o0oYuGar
	 Wmpz5nqaTnLeA==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Sat, 22 Mar 2025 12:47:06 +0100
X-ME-IP: 124.33.176.97
Message-ID: <5d2af209-46bd-4a40-b82f-7772ed0b825d@wanadoo.fr>
Date: Sat, 22 Mar 2025 20:46:52 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] bits: introduce fixed-type genmasks
To: Yury Norov <yury.norov@gmail.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@aculab.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
References: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
 <20250305-fixed-type-genmasks-v4-3-1873dcdf6723@wanadoo.fr>
 <Z8hsRJvpjYoqh9RG@thinkpad> <Z9oiEkQEcHhA0a80@thinkpad>
 <5cbaefa8-e51f-415f-a9b3-4841e69bb3fa@arm.com>
 <1aba17f1-0cd2-429c-8338-28387ec16314@arm.com> <Z92cThxAyXu9JJdk@thinkpad>
Content-Language: en-US
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Autocrypt: addr=mailhol.vincent@wanadoo.fr; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 LFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI+wrIEExYKAFoC
 GwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQTtj3AFdOZ/IOV06OKrX+uI
 bbuZwgUCZx41XhgYaGtwczovL2tleXMub3BlbnBncC5vcmcACgkQq1/riG27mcIYiwEAkgKK
 BJ+ANKwhTAAvL1XeApQ+2NNNEwFWzipVAGvTRigA+wUeyB3UQwZrwb7jsQuBXxhk3lL45HF5
 8+y4bQCUCqYGzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrbYZzu0JG5w8gxE6EtQe6LmxKMqP6E
 yR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDldOjiq1/riG27mcIFAmceMvMCGwwF
 CQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8VzsZwr/S44HCzcz5+jkxnVVQ5LZ4B
 ANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <Z92cThxAyXu9JJdk@thinkpad>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_044714_668212_1A80D8F8 
X-CRM114-Status: GOOD (  25.17  )
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

On 22/03/2025 at 02:05, Yury Norov wrote:
> On Wed, Mar 19, 2025 at 09:43:06AM +0530, Anshuman Khandual wrote:
>> 
>> 
>> On 3/19/25 09:04, Anshuman Khandual wrote:
>>> On 3/19/25 07:16, Yury Norov wrote:
>>>> + Catalin Marinas, ARM maillist

(...)

>>> These were moved into uapi subsequently via the following 
>>> commit.
>>> 
>>> 21a3a3d015aee ("tools headers: Synchronize {uapi/}linux/bits.h 
>>> with the kernel sources")
>>> 
>>> But in general GENMASK_U128() is needed for generating 128 bit 
>>> page table entries, related flags and masks whether in kernel or
>>> in user space for writing kernel test cases etc.
>> 
>> In the commit 947697c6f0f7 ("uapi: Define GENMASK_U128"), 
>> GENMASK_U128() gets defined using __GENMASK_U128() which in turn 
>> calls __BIT128() - both of which are defined in UAPI headers 
>> inside (include/uapi/linux/).
>> 
>> Just wondering - are you suggesting to move these helpers from 
>> include/uapi/linux/ to include/linux/bits.h instead ?
> 
> Vincent is working on fixed-width GENMASK_Uxx() based on 
> GENMASK_TYPE().
> 
> https://lore.kernel.org/lkml/20250308-fixed-type-genmasks-v6-0- 
> f59315e73c29@wanadoo.fr/T/
> 
> The series adds a general GENMASK_TYPE() in the linux/bits.h. I'd 
> like all fixed-widh genmasks to be based on it. The implementation 
> doesn't allow to move GENMASK_TYPE() the to uapi easily.
> 
> There was a discussion regarding that, and for now the general 
> understanding is that userspace doesn't need GENMASK_Uxx().
> 
> Are your proposed tests based on the in-kernel tools/ ? If so, 
> linux/ bits.h will be available for you.
> 
> Vincent,
> 
> Can you please experiment with moving GENMASK_U128() to linux/ 
> bits.h and switching it to GENMASK_TYPE()-based implementation?
> 
> If it works, we can do it after merging of GENMASK_TYPE() and 
> ancestors.

I sent the new version with the split as you asked in a separate message.

I switched GENMASK_U128() from using __GENMASK_U128() to using
GENMASK_TYPE() in this patch of the second series:

https://lore.kernel.org/all/20250322-consolidate-genmask-
v1-2-54bfd36c5643@wanadoo.fr/

After this, the genmask_u128_test() unit tests from lib/test_bits.c are
all green, so this looks good. Note that because it is not yet used,
there isn't much more things to test aside from that unit test.

To be precise, I am not yet *moving* it. For now, I decoupled
GENMASK_U128() from __GENMASK_U128(). To complete the move, all what is
left is to remove __GENMASK_U128() from the uapi. To be honest, I am not
keen on touching either of the uapi or the asm variants myself. But, if
my work gets merged, that last step should be easy for you.



On a side note, at first glance, I was disturbed by the current
__GENMASK_U128() implementation:

  #define __GENMASK_U128(h, l) \
  	((_BIT128((h)) << 1) - (_BIT128(l)))

If calling __GENMASK_U128(127, x), the macro does a:

  _BIT128(127) << 1

which expands to:

  (unsigned __int128)1 << 127 << 1

So, while (unsigned __int128)1 << 128 is an undefined behaviour, doing
it in two steps: << 127 and << 1 is well defined and gives zero. Then,
when doing the subtraction, the unsigned integer wraparound restores the
most significant bits making things go back to normal.


The same applies to all the other variants. If doing:

  #define GENMASK_TYPE(t, h, l)				\
  	((t)(GENMASK_INPUT_CHECK(h, l) +		\
  	     (((t)1 << (h) << 1) - ((t)1 << (l)))))

The unit tests pass for everything and you even still get the warning if
h is out of bound.

But then, bloat-o-meter (x86_64, defconfig, GCC 12.4.1) shows a small
increase:

  Total: Before=22723482, After=22724586, chg +0.00%

So, probably not worth the change anyway. I am keeping the current version.


Yours sincerely,
Vincent Mailhol

