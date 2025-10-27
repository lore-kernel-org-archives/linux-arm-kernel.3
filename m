Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21909CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 03:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GH1rp1IvB9GX2JiwW5ZpYAb3JZ2Tf3hU3x3vAETwZOw=; b=bJQEnU6IdVSC4/rSzoI7NaBPkg
	qhRWFuHgwV3rYwo6mzEq5sqetTU/obpSOTDw//Uf4i67Q+ORjABh2vvTo1LSnmxRY12i9m3p8PaVP
	3a+OSq1PR+cNkseJFOI78dOF92eu9HRCzBXK+qnS+bdwV1T2WH7myI0FckdJGG90Y8SKSeSD4Ie2l
	V1nd1WMT8UXIND+WIgsjCfKwCe55RgxzyxPn/NClkCXwkgWjW+/e85xMHxPe0jTCh18gO90nJngdD
	5J0/B0rLwBbc85rrthCBYXiiCYTfJGshXsGX6CW97Jysl7Hkb8FuaToTZzBmhQgFWutlygqFEaqPb
	mcHQ9psQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDECY-0000000D4Tc-3Ms8;
	Mon, 27 Oct 2025 03:47:22 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDECW-0000000D4SD-2ZXs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 03:47:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1761536765;
	bh=GH1rp1IvB9GX2JiwW5ZpYAb3JZ2Tf3hU3x3vAETwZOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=kE5CTSl9qHgVEE1xcvfg90p7ywuDJhzErjasbRGHBR27iY9HNQpQOQzkvduqlTnvV
	 Ov6w/Gx81jsqKprdhbEwxSUkwjE83bMt9F4r1WpLTDGoheKNjeYtdeGVjpeNzzt9tU
	 f7N0/qAPV1XG64bnSUe3kWbtlRdRPDAdyPqe50fA=
X-QQ-mid: zesmtpgz3t1761536758tae45e91c
X-QQ-Originating-IP: 5faAr8goJjyzbCyUMsccEbc0vjz64JAT+lkSY6B33kw=
Received: from [10.10.74.117] ( [123.114.60.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Oct 2025 11:45:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4447698992672488604
Message-ID: <10D9A93B0633E6BE+75720e07-b39d-452c-952e-41f8ab6aad94@uniontech.com>
Date: Mon, 27 Oct 2025 11:45:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ARM/efi: Remove duplicate permission settings
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux@armlinux.org.uk, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20251023082129.75612-1-maqianga@uniontech.com>
 <CAMj1kXHs3vC4TEWg1ogG=N8Dd5L0rkQ=qAFLWKiAA5yi_He3GA@mail.gmail.com>
Content-Language: en-US
From: Qiang Ma <maqianga@uniontech.com>
In-Reply-To: <CAMj1kXHs3vC4TEWg1ogG=N8Dd5L0rkQ=qAFLWKiAA5yi_He3GA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: NvjhxCSDgXIC1vjyXzfCUUD28uX6thRu0yRvJdVZlrrhgKumJz5F8RCD
	+1RIhmVkvLiUIebNUcRcMyeNjNlTHQvdfOjvBN4tQWBGrbjr8Lv3OVqdQEUI4r3v/1qrNn3
	6R/Hs+UZp3htX1qOuQ9BiUIMwHx98AR1oqiBPZQaHuEVw9Sma/lY5uurqWGnUTqBLXghsLH
	gQA5zyrpr43pC7BZmt+FpwVbrhK6JZQPZRfYu3PlVoUvQrZ+s5Bl2JB2i20fdm+hsZA8ZSc
	+73p9TfOsZqRnEOSmj509SDP1zysl+m9DkHpatoRxUV1B5hok1X2KESX/Oo0ek/L6r81r/h
	IxcSGj+FIXxvRY2C2jmU+9im4+f28lkZludhTIkbsLMM/IG03hZFXUruoRUyIC4CY77RR5W
	pT4ob4Ocz8qQOu9HW9Z3oARfZ642ac+Dbd6rGKuCuBHcDnu7VmiWhCzI5y3H8wqPRtpXH88
	Or2JqnOUFVuwUgfbdBZM11ZDiZSM9NSsx0xCr0+ouzhGTxkuIfb5EJBHR227nMabOKQtN0e
	OUPjztFGc4Xvvcj5qwX4cX4kap6OLhXgEmpBbbmha477v0qnUgPPpQS1fyTpPp6nC2duinF
	2mSj2Jvyv0bpTVWqht+1kSxg73LQlah+Y4zovrTR9HUNKhhkRa/dqMrCS8TiQU/wFJMOU4g
	ZOHIzHgQ2IO5AD9MX7jykHdDmfnhh8OQEvWNzIgg2TMsdRLbHL8vr8PzwsSUixRk//8KOjJ
	dhA0ShnqdV5/MD3NrHwoz0OtCS/bb7jTmu9uo0seO5Ez8OR/ZbXL5sE0hlmzvaIWXq/bRfS
	c/gGtAGDVPUutjrETJVrCgkmqs0ctBmCDis8uSEU/J7hEbpKsO1Zu2SksgJIrm6ibc3/k2J
	XgfN1Pp26XxRfDoIIK3qRXdb7pPTOtxyQ2sm+LKeXzsISSY036sj5OKp4f3sC6In/SdlJKQ
	2tXBje6jxxmWxkg1/8TmKvntfxOGy4OYUdomK8VGEFk/fErNwBUNuaPhOmiZHi6YNfiqla9
	Tp0nrgBCoe7t4gHmXq
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_204721_381862_8E5D8709 
X-CRM114-Status: GOOD (  14.45  )
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


在 2025/10/23 16:30, Ard Biesheuvel 写道:
> On Thu, 23 Oct 2025 at 10:22, Qiang Ma <maqianga@uniontech.com> wrote:
>> In the efi_virtmap_init(), permission settings have been applied:
>>
>> static bool __init efi_virtmap_init(void)
>> {
>>          ...
>>          for_each_efi_memory_desc(md)
>>                  ...
>>                  efi_create_mapping(&efi_mm, md);
>>          ...
>>          efi_memattr_apply_permissions(&efi_mm, efi_set_mapping_permissions);
>>          ...
>> }
>>
>> Therefore, there is no need to apply it again in the efi_create_mapping().
>>
>> Fixes: 9fc68b717c24 ("ARM/efi: Apply strict permissions for UEFI Runtime Services regions")
>>
>> Signed-off-by: Qiang Ma <maqianga@uniontech.com>
> No, efi_memattr_apply_permissions() uses the /optional/ memory
> attributes table, whereas efi_create_mapping() uses the permission
> attributes in the EFI memory map. The memory attributes table is
> optional, in which case any RO/XP attributes from the memory map
> should be used.
>
I see.

Then, can it be modified like this?
--- a/arch/arm/kernel/efi.c
+++ b/arch/arm/kernel/efi.c
@@ -65,16 +65,13 @@ int __init efi_create_mapping(struct mm_struct *mm, 
efi_memory_desc_t *md)
                 desc.type = MT_MEMORY_RWX_NONCACHED;
         else if (md->attribute & EFI_MEMORY_WC)
                 desc.type = MT_DEVICE_WC;
+       else if (md->attribute & (EFI_MEMORY_RO | EFI_MEMORY_XP))
+               desc.type = MT_MEMORY_RO;
         else
                 desc.type = MT_DEVICE;

         create_mapping_late(mm, &desc, true);

-       /*
-        * If stricter permissions were specified, apply them now.
-        */
-       if (md->attribute & (EFI_MEMORY_RO | EFI_MEMORY_XP))
-               return efi_set_mapping_permissions(mm, md, false);
         return 0;
  }

The create_mapping_late() finds the corresponding page table attribute 
from mem_types through type.
Here it is MT_MEMORY_RO, and its corresponding prot_pte is:
       ...
         [MT_MEMORY_RO] = {
                 .prot_pte  = L_PTE_PRESENT | L_PTE_YOUNG | L_PTE_DIRTY |
                              L_PTE_XN | L_PTE_RDONLY,
       ...

Finally, the page table is also set through the set_pte_ext().


Thanks.

>> ---
>>   arch/arm/kernel/efi.c | 5 -----
>>   1 file changed, 5 deletions(-)
>>
>> diff --git a/arch/arm/kernel/efi.c b/arch/arm/kernel/efi.c
>> index 6f9ec7d28a71..d2fca20d912e 100644
>> --- a/arch/arm/kernel/efi.c
>> +++ b/arch/arm/kernel/efi.c
>> @@ -70,11 +70,6 @@ int __init efi_create_mapping(struct mm_struct *mm, efi_memory_desc_t *md)
>>
>>          create_mapping_late(mm, &desc, true);
>>
>> -       /*
>> -        * If stricter permissions were specified, apply them now.
>> -        */
>> -       if (md->attribute & (EFI_MEMORY_RO | EFI_MEMORY_XP))
>> -               return efi_set_mapping_permissions(mm, md, false);
>>          return 0;
>>   }
>>
>> --
>> 2.20.1
>>


