Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C7A6CCF9F6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 09:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xlpZYqLQWghCTXXagIIntJughDFQUhVwALKDs3UuqsA=; b=pGbWPs9gcFvQKXLXFFgYHRFlju
	uae6Rshzc79MshSSqzbgkRBnW5vRodR+QXgN3TW1fDhtlq9/LG8oPUPjhkOte+ci/IE5KL5wJ5Npa
	exiMX+1e+598F4eNZr9tP5QWFTapHY1W3eCp6ERH7iHYY2cb2wvb09I3HLispW9En9yZN+ZRPvhuN
	oTlzVetq/6Foe+yYiIXD/lGqzmiZU9VWudd2R5lFtAc51gWtMyVAea3teSHGlnmtbdNTonQ+Ihrfh
	waDNqmXX+drBRsCr9KpTjEsyWgoVsRgMZI366cKUIfioZjcfnnSDLH037q7hMu6k8Qzrp0fVdTAp9
	zRRJuXBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE2uI-00000000apy-2wi7;
	Wed, 29 Oct 2025 09:55:54 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE2uE-00000000ajo-2oSf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 09:55:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1761731678;
	bh=xlpZYqLQWghCTXXagIIntJughDFQUhVwALKDs3UuqsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=R3buXpdbN+SnO929BpkVRxgJGR80zynsfEO8Ov3hFdR20DpxHK50WY1C84j+WCwiv
	 pjtHG1JKIXkuzJSgYVyXjVaKuc/hVIHiiCqJcuZGfSkIfp7SY2ZfDt+RIWLOVCd9Gu
	 iNj9/B0pS1ipEivllhYyMKLlmF/19VSKEs8YpqcY=
X-QQ-mid: esmtpgz11t1761731672t980a5a36
X-QQ-Originating-IP: DeTMd+qj/0zMyYJILpslmoa/GD3vcu4qvH35zRnrhA8=
Received: from [10.10.74.117] ( [123.114.60.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Oct 2025 17:54:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14243424483596737068
Message-ID: <9F7F632B7963434F+abad2548-a90d-4448-ae79-dd4bf637ee6e@uniontech.com>
Date: Wed, 29 Oct 2025 17:54:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ARM/efi: Remove duplicate permission settings
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux@armlinux.org.uk, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20251023082129.75612-1-maqianga@uniontech.com>
 <CAMj1kXHs3vC4TEWg1ogG=N8Dd5L0rkQ=qAFLWKiAA5yi_He3GA@mail.gmail.com>
 <10D9A93B0633E6BE+75720e07-b39d-452c-952e-41f8ab6aad94@uniontech.com>
 <CAMj1kXHQ6WQWfbkMP4JUk=nKwSt7CovY25RC4JA0ZM7vRWu6dA@mail.gmail.com>
Content-Language: en-US
From: Qiang Ma <maqianga@uniontech.com>
In-Reply-To: <CAMj1kXHQ6WQWfbkMP4JUk=nKwSt7CovY25RC4JA0ZM7vRWu6dA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: M+Qa/yP3m2vGayM6cQsPSxH0gCOmwR00EfZoXMxhsAO9kOiwiDPjC3+o
	fOLsDpx/7HnBub6Sr0udnawRm/2TiY5aIeKR74WAli2UKJMLeojxZp7LIZn5g6xNfL5srgj
	OdkQtdSenLyhlLsLrWbEo4wW8RLHfcO/B2REqQG/ACcJ8H5wRI3BEfbQvuQpFPk+ClFn4om
	cMNkULvHRa94IDZ7flkuAxYjQC7BzOBY+oWSE0J5avU2hRZnHPszFG9ZLqPB9GQHmpyYy4y
	W/0x5jniFw9X7XJ202CB67iB6Cagbaxve+y0bjb6XwmD4CvEogvSc6Jdr9Js3aHtygSJJEB
	HrQ2Z6DDzZE4rNajepE1mJ7qUCeIqBeAIgNinnuLsxel5q80UAcn2IQMjNS+4bdAfdsHdsu
	wTBmeMA9HFHiBmENaK/OV1TishQu4fgPahuT6TalefYnLykatubopxojFn9p+5jsu1ZRzOa
	E1leJolJ42OlSkyOD3JBEHYugGYaEVtcSL3m2e8eL8VTc20S/gVPISzz7i1ZBq8O9M6eJj2
	Oibb4O6WZweZ9vIk2K12BwJzJSntsvfRr7lurb9phLZZlKMqjkr5KFP/WIN2gQ5OrpFsM2h
	LtSadGbcv7g79AKDJJHtNLnMzPxJo20pRT1oZWps2DzNOgg9w7F+UT/jkmhLeq4tZdFWMzB
	060/5k+DiMAZQsAWm3vJqAU7Yk7CJ50KPU9asxjy46e0xZ5p9a+r5KBg61qwHqVIQEb/Y45
	4roo7H9ZQZDpgD+Qxtf0MGJFivx2wYaIuXC6W/ppw/PHw0t0+0yGD5VLQ6KKtffHnWSFea3
	fdFg4YQ1eN0psM36l2hEKg0lKzYTrNjngAKnV6ZLe35EdPVAzlyugnDcpsW/FcyohCA3dT1
	t6Q2fvqXiptDBLqC8rS4An4ef1beaTEyVDN4c+zxW0sbt7cEIFC4M+LcHTZ1grWwM5XJ2VP
	BJSjYNcKifHBeneo2CcyOHdrOw0pMrbgrbcRpgISU5rP+xTFbRFwC8ld8ufMz8G7Rsqpdg2
	A6a6dx1dCLJjl19+uMS9xroidHBDXn1Y9ijXO7w9XIlSJy6tFd7SjFYQsWhbIFUhZhszGcq
	lbSV8p3G5+jJU3LkAGDxRAybL1o1mwfiLyMAn3t8PtPrSpXn6u/wh0=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_025552_767181_F8106EE4 
X-CRM114-Status: GOOD (  13.58  )
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


在 2025/10/28 21:42, Ard Biesheuvel 写道:
> On Mon, 27 Oct 2025 at 04:46, Qiang Ma <maqianga@uniontech.com> wrote:
>>
>> 在 2025/10/23 16:30, Ard Biesheuvel 写道:
>>> On Thu, 23 Oct 2025 at 10:22, Qiang Ma <maqianga@uniontech.com> wrote:
>>>> In the efi_virtmap_init(), permission settings have been applied:
>>>>
>>>> static bool __init efi_virtmap_init(void)
>>>> {
>>>>           ...
>>>>           for_each_efi_memory_desc(md)
>>>>                   ...
>>>>                   efi_create_mapping(&efi_mm, md);
>>>>           ...
>>>>           efi_memattr_apply_permissions(&efi_mm, efi_set_mapping_permissions);
>>>>           ...
>>>> }
>>>>
>>>> Therefore, there is no need to apply it again in the efi_create_mapping().
>>>>
>>>> Fixes: 9fc68b717c24 ("ARM/efi: Apply strict permissions for UEFI Runtime Services regions")
>>>>
>>>> Signed-off-by: Qiang Ma <maqianga@uniontech.com>
>>> No, efi_memattr_apply_permissions() uses the /optional/ memory
>>> attributes table, whereas efi_create_mapping() uses the permission
>>> attributes in the EFI memory map. The memory attributes table is
>>> optional, in which case any RO/XP attributes from the memory map
>>> should be used.
>>>
>> I see.
>>
>> Then, can it be modified like this?
> No
>
>> --- a/arch/arm/kernel/efi.c
>> +++ b/arch/arm/kernel/efi.c
>> @@ -65,16 +65,13 @@ int __init efi_create_mapping(struct mm_struct *mm,
>> efi_memory_desc_t *md)
>>                   desc.type = MT_MEMORY_RWX_NONCACHED;
>>           else if (md->attribute & EFI_MEMORY_WC)
>>                   desc.type = MT_DEVICE_WC;
>> +       else if (md->attribute & (EFI_MEMORY_RO | EFI_MEMORY_XP))
> This will be true for RO, XP or RO+XP.
>
>> +               desc.type = MT_MEMORY_RO;
> This will apply RO permissions even to XP regions, which need to be writable.
>
Thanks for your review.
I see.

I can introduce a new type MT_MEMORY_RO_XP, to describe RO+XP,
and then we can use the RO+XP attribute to implement memory mapping.

--- a/arch/arm/kernel/efi.c
+++ b/arch/arm/kernel/efi.c
@@ -68,13 +68,16 @@ int __init efi_create_mapping(struct mm_struct *mm, 
efi_memory_desc_t *md)
         else
                 desc.type = MT_DEVICE;

+       if ((md->attribute & EFI_MEMORY_RO) &&
+           (md->attribute & EFI_MEMORY_XP))
+               desc.type = MT_MEMORY_RO_XP;
+       else if ((md->attribute & EFI_MEMORY_RO)
+               desc.type = MT_MEMORY_RO;
+       else if (md->attribute & EFI_MEMORY_XP)
+               desc.type = MT_MEMORY_RW;
+
         create_mapping_late(mm, &desc, true);

