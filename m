Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7AFC982CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 12:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OkJ29jk0iOc03/WReMTwt6zJM1KMUFFuqOfIwnxMfLo=; b=NymKOcnzJTz6FgVaKRlhrVofv7
	LP9Lb9NEf75NKFfUTW0Cdw6+rDYFNGeCZFlaAUb/gb/uB0CiI1DrEKfH+n7Se/SlW6roQFvFYY9hE
	BoLMch34jV/ru9dPgn3Roi3CYN1cyiabZ1lLCMHatIPPwsCku36gWkDr46XKpftLWvXORZJB4ONME
	KhVAavr4l1+CILBXDAFaJf3cCbbzSmdbRHcQY9LJSJ3MzUtS6A59fCPqfyjY1F18oEg2ykhZqloUl
	fNeJbub6jX/BAuy+h66VLL/ndR4AEa+CflcSmY4oV9dbcB38A3ldNF0TPNd3Yr5VVeQVP28k4633e
	i9mw8PyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BKl-0000000BJ2m-0lO7;
	Thu, 17 Sep 2026 12:35:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BKk-0000000BJ2e-26BT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 12:35:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D483417A5;
	Thu, 17 Sep 2026 12:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29CD81F00893;
	Thu, 17 Sep 2026 12:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789648521;
	bh=OkJ29jk0iOc03/WReMTwt6zJM1KMUFFuqOfIwnxMfLo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=LXhtuXsIDCJxJc98whNldI0xeJFkpUFF9s/k0xdHnU0sMFQnFc1oemMAF+H/nf0c7
	 5bFS3PytdlLmtlf9gkZaotZLolf7C5jJmSjHiqQnZ/rxCQIP0+XfLuPlsGGJxIHpYZ
	 FPt6UPL1h8kB9jeMtidUmF1p4KUnYoySMH7Hitp74X9P7sjR6uPfVAanG1a/DuC16t
	 KzIXLWBEotKvqsE/wbnNpSI1IrGiKaaH45CSGSWNmdV19i/3sc9boQw9FWaWq6mrm5
	 /O4uVpRDNmDZDLLadS/7xHzSMznLbvZAdfjf0tkm0OYhyNza5rWuSQrt/cTFY8fDLg
	 2xDNhSb0h81lw==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 4604D198003A;
	Thu, 17 Sep 2026 08:35:19 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Thu, 17 Sep 2026 08:35:19 -0400
X-ME-Sender: <xms:hd6rakxmCGpBPswD99bIM2VSrBOXJOPOCGwn16lMHqENgCiSIxfejA>
    <xme:hd6rajGqGsPddqNi2kCc6qjYz82fL97t2T_lwMKiO3Cgc0qXvJiXjBoOotl45d3to
    4HrP4ux0f-wo4SoHOdi5uRnfi5sfAtNc8TuFBeLcUYYezNI3Y3ZCUKA>
X-ME-Proxy-Cause: dmFkZTGEMfJSejSgFQJkjeyRwcnZSNU96M52qtltlJ3X5088C9HeXX9iUR3xe2fJJOuxAG
    fJiKTCLqogXmUrQR3qkpt5E1zk/Y6AM1HEXcBcBI30xnMy2BpOGDKTibsa9zjHoOYw0Ez5
    FVzvmsAa+q3zgam/O3zIDRc5F6iCwVVN/qWTXaRrx25458DMA5ZebyOp+3WcLFyAiwCdLa
    DsO4bHux51m2h+8IoevCSvYMNse+FSd26eUX3SXmyNBcdN8+52trgooEbMifHzZdtQmMq2
    Jc1iYO3D8yu1CqmQDYxNILW71AwDj813BzKTdDdiuZgUeIJ8ZNO7/P9sq+R+UhPTS2VBrV
    QyV3ltq4pzyFV0tSnthRp5xlpiQUC0tSgFTmBqfkaAwQOR85nYoZzN3sHrEzhVQYwP+I8v
    gMVEbpYbC0Jv9ri9pIzDcAUC3LfAF6f0PCoeWQOvHvV6SFvcefFZPsJhWtPaLMP/rENaDK
    iKAOWdO0kM7QN6+XdpWato2PIzqkT7bZlIrRAdwpSe9gkzBQXPg/mVADXzHDpLpqeC8HkH
    XkWPZDMWfqGuCfkl6SbcdAidsx2g9ms9EJOCl8nI9SWab6fRghEHAYZNsJ///4jAwBmPIB
    Vyc3NszQUzzmFC5V32gYmGKlLC1d7m32xMJSW/LhnA22oZf3n3jxmSpJryQA
X-ME-Proxy: <xmx:h96raofej0iN4HjKDMA7MKG13uboLbKJqTnh1YsCtd8BO6eiDdrprA>
    <xmx:h96rajh5kEG3ZNZ0PsAHGQtluLiUMcPKJ67Ll6luNTu5ns_F1pwwpw>
    <xmx:h96ragy8gW2f2QcGptOJFNPi9hyzYMMUdo1YNzKLhmhWsC0VnrehZw>
    <xmx:h96ravP3b4GK3O9CoGdsHMWsbahFDfD5vNjUGCMv_3vwqLi3eEKEaA>
    <xmx:h96rahVbfRGDaXGnVSYQAr2ecN1ljzPBkBpTI-dFA28_BWOznZCu8EbW>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id A5C47F8007E; Thu, 17 Sep 2026 08:35:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 17 Sep 2026 14:34:57 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Vladimir Murzin" <vladimir.murzin@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, liulhong617 <liulhong617@gmail.com>,
 "Mike Rapoport" <rppt@kernel.org>
Message-Id: <01f1f6d9-e10f-43f9-b731-f6393010a11c@app.fastmail.com>
In-Reply-To: <a2b4186d-b3b0-4543-9f77-505e8ae67ae8@arm.com>
References: <20260908162033.74509-1-vladimir.murzin@arm.com>
 <947a1506-dfe4-4906-9673-6a7227946433@app.fastmail.com>
 <a2b4186d-b3b0-4543-9f77-505e8ae67ae8@arm.com>
Subject: Re: [PATCH] arm64: mm: Fix pfn_is_map_memory() misreporting mapped memory
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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



On Thu, 17 Sep 2026, at 14:26, Vladimir Murzin wrote:
> On 9/16/26 11:13, Ard Biesheuvel wrote:
>> (cc Mike)
>>=20
>> On Tue, 8 Sep 2026, at 18:20, Vladimir Murzin wrote:
>>> Commit 7ace06a01efa ("arm64: mm: fix accidental linear mapping of
>>> no-map reserved memory") removed sub-page no-map regions from the
>>> linear mapping. However, pfn_is_map_memory() can still report that
>>> such a region is mapped.
>>>
>>> For instance, with 64K pages, say we have
>>>
>>> normal:        ...=E2=80=930xa2007fff
>>> no-map: 0xa2008000=E2=80=930xa200ffff
>>> normal: 0xa2010000=E2=80=93...
>>>
>>> The range 0xa2000000=E2=80=930xa200ffff is not linearly mapped, but
>>> pfn_is_map_memory(__phys_to_pfn(0xa2008000)) aligns the address to
>>> page granularity and passes 0xa2000000 to memblock_is_map_memory().
>>> That address belongs to the preceding normal memblock region, so the
>>> no-map region is ignored and the function returns true.
>>>
>>> Fix that by checking if entire page is subset of memory block.
>>>
>>> Fixes: 7ace06a01efa ("arm64: mm: fix accidental linear mapping of=20
>>> no-map reserved memory")
>>> Assisted-by: LLM
>>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>>> ---
>>>  arch/arm64/mm/init.c | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
>>> index fbf215ecc7d0..5da80e1e1727 100644
>>> --- a/arch/arm64/mm/init.c
>>> +++ b/arch/arm64/mm/init.c
>>> @@ -172,7 +172,8 @@ int pfn_is_map_memory(unsigned long pfn)
>>>  	if (PHYS_PFN(addr) !=3D pfn)
>>>  		return 0;
>>>
>>> -	return memblock_is_map_memory(addr);
>>> +	return memblock_is_region_memory(addr, PAGE_SIZE) &&
>>> +		memblock_is_map_memory(addr);
>>>  }
>>>  EXPORT_SYMBOL(pfn_is_map_memory);
>>>
>> memblock_is_region_memory() only tells you whether the range in
>> question is covered by a single entry in memblock.memory.regions[].
>>=20
>> memblock has other flags, which may or may not be set on sub-page
>> regions too. So I don't think this is the right solution in the
>> general case, even if it fixes your example.
>>=20
>
> Ack.
>
>> Given that the no-map attribute fundamentally only applies to page
>> granular regions, it would make sense to round those outwards
>> whenever they are created.
>>=20
>> --- a/mm/memblock.c
>> +++ b/mm/memblock.c
>> @@ -1119,6 +1119,10 @@
>>  int __init_memblock memblock_mark_nomap(phys_addr_t base, phys_addr_=
t size)
>>  {
>> +       phys_addr_t end =3D PAGE_ALIGN(base + size);
>> +
>> +       base &=3D PAGE_MASK;
>> +       size =3D end - base;
>>         return memblock_setclr_flag(&memblock.memory, base, size, 1, =
MEMBLOCK_NOMAP);
>>  }
>> =20
>>=20
>
> Should the same be applied to memblock_clear_nomap()?
>

Yes.

> This is indeed much nicer way to fix the problem! Now, when no-map is
> rounded outwards, do we still need 7ace06a01efa?
>

Probably not, but there are some corner cases to consider before we
go down this route:
- what happens when marking a range no-map where the outward rounding
  would exceed the limits of the existing memblock memory range?
- what happens when removing a non-page aligned region from memblock
  that intersects with a (page aligned) no-map region?

=20

