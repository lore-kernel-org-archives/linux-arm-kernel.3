Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC2CCCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 10:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MRXsreiGcYdw08vCAm+5uQvjPGAu2tcntKPNgaJ66zc=; b=TdH/W7v4qFewj2gstY1q0vVXRL
	32c+sDqg8LV44mpFoFiTQxvfK69ccdpfmzVzXV7jP/LTWRFSMX06wejcOPYthqLrwNCMSajDS1Fo1
	cMURo4JPYCMN64u1OOv9iOyMtWZAngFP+1eU8QQEjjl9tTl6lAR/CX/GqaH2ZEzqzgh57quCKHy5X
	xRdh9MZ8dqFZdlRnqdnQ3eRiSlVEg2PPuEaJZrTMue490BST9KbiRG9MPVcdtaM7m//2cU7ygH6FO
	QtVGsZB3Rb2Ch/+KBqCHJ9l0DE78lCZtcm71sezrPGArOGgFdpTu8LVDEaAh6cMtYsiQ32gjBSX8z
	QzdrH2EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEQAh-000000041EE-2JyB;
	Thu, 30 Oct 2025 10:46:23 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEQAd-000000041BT-48T6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 10:46:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1761821107;
	bh=MRXsreiGcYdw08vCAm+5uQvjPGAu2tcntKPNgaJ66zc=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=WciZT9NTTavKJD4xEBfHtvqtfUTkDRYy1HaSt5lqdDanOLBS75+1ptFcKHykA6yPt
	 LSw99FeQ+yyzQ3gWAb/KsRUj42c/6oMAmlzVBojy6XUq547ooWaLAPWChewddJYneq
	 825uudRAS+ZACEd8gm8lpn8zhmwoPb+g8WQmuLN0=
X-QQ-mid: esmtpsz18t1761821100td57587fb
X-QQ-Originating-IP: UOM9KTHY+8oO5A1ca7+4BxY32mxy5LGe7L23reGSeDQ=
Received: from [10.10.74.117] ( [123.114.60.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 30 Oct 2025 18:44:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 9726592726005352863
Message-ID: <006327B65B574934+440b408c-499d-4ec9-837e-703991ad51fc@uniontech.com>
Date: Thu, 30 Oct 2025 18:44:58 +0800
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
 <9F7F632B7963434F+abad2548-a90d-4448-ae79-dd4bf637ee6e@uniontech.com>
 <CAMj1kXHu5ABgxKsc_gg1j=pWMz6DbWoqv=qAAjx-5CiSF2PAiQ@mail.gmail.com>
 <BD93A8DBE27154B0+22bf4a83-a850-4f78-8e0d-84cc93fe2715@uniontech.com>
 <CAMj1kXFUUCoE=gZ0kTMKx87qnJMU9J9skT75STTKjjakXb8kmw@mail.gmail.com>
 <89364700AD0CD6E1+dd8d745f-5a72-4b0a-80db-eaa1d00c4e64@uniontech.com>
 <CAMj1kXHpJ3gz=+Keswx0MZ8v6YQENR2pjeS_CE6g4cXML2LQhA@mail.gmail.com>
Content-Language: en-US
From: Qiang Ma <maqianga@uniontech.com>
In-Reply-To: <CAMj1kXHpJ3gz=+Keswx0MZ8v6YQENR2pjeS_CE6g4cXML2LQhA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: OBUAsW88a6arDPrmg2LFOEkCMx36cxdHU5WDQFVw6br3icDZtXGxdrYl
	XfJtZVIHhjIaMTrP5a8E/S+qyskYsGsYOUkn0N2GurLKaecxQTF8wVlCaSncR10cgsOE6MU
	YZJ62JWZjkdQ8mhfRr5HxiKHlswvvt3NuoEt2S/Zzw3TSJ/PXp2xBQ1OPm8UjNoG8ReVUAk
	3iAdOk0V9yE0OiGGyJW1pMhWQh7HJjPmNtHQsesWggWilLxc00DaMzWXKl/5NCBaex0vUsp
	H1+E2KXpeM/W/MWaa//csGPnv+sBJj3VN6aMXT21aQYLGekbu55WLI9zSSk5YmRB8szIViT
	6wa+NQRBIrABd6nAMAia8wTP8nHmRGjJbCjyTaKX11vxeKWJdKkjn9BRlWy2qULfqzK+VIE
	fAgAZeceiq3xU27ljqJlda+moFKqenhWz12O0DWecGHJpd+H7xfzx3iJuDnvfQ9DyqnWxcz
	paeulYyylUHDgyaf9sJM+59M3HKmNtsIAwYoArcH0mE3OVw+OC1FvPnRHku7EABx3xG5f5l
	1AKTOZDpm+k0rSoIXYeHXRdFKVRpax8IABQSfd7zxR+1Z5fqvqhYsZEMdf0+gdzQXpUdJzP
	tRnxCixOamV2G4PASSp86lz0U4SyypHNg7Ot+vamGP2PeOPSBIuA7c2qDuqNwj2aH+Kmx8o
	LNczh0k0/ZRq02KAiPzkiR+cr4KbDo6w/q256QXvPnLwqGhNx9adv8V4ZH3Kj9JFv79eKIU
	K/ACjzBVSE2ExcbSklfZESaZ+jAmJGJkOCFW6bkHq0YX7wmOGDw1D1GUqrw86Sda2fmcUpS
	o4HcyvgpOP+99ExvNwLe4jPGlHaYqdq/7K1WjnaSEBxsWoCux621U+l9bto2xGJjQ91w8UY
	kQk4mxEx5H00HzW7Xrjlc3XNr06qcMk2obLwaOysw6rWW9Qubc1AyUKMG46/kO+/ZyFt74D
	tdkSY7JxOs//+T7heip9pn89yw0pVlwj5LGOoNMw4Ed9dpEM5qBxBDZHXKfZDPHQ3Sb9VKH
	WZ6LsR/mf4uxRN0e9qWmEiUDlThKBODsrTKA5HGg==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_034620_399144_7FEB2F49 
X-CRM114-Status: GOOD (  17.35  )
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


在 2025/10/30 18:36, Ard Biesheuvel 写道:
> On Thu, 30 Oct 2025 at 11:25, Qiang Ma <maqianga@uniontech.com> wrote:
>>
>> 在 2025/10/30 18:02, Ard Biesheuvel 写道:
>>> On Thu, 30 Oct 2025 at 08:37, Qiang Ma <maqianga@uniontech.com> wrote:
>>>> 在 2025/10/29 22:15, Ard Biesheuvel 写道:
>>>>> On Wed, 29 Oct 2025 at 10:55, Qiang Ma <maqianga@uniontech.com> wrote:
>>>>>> 在 2025/10/28 21:42, Ard Biesheuvel 写道:
>>>>>>> On Mon, 27 Oct 2025 at 04:46, Qiang Ma <maqianga@uniontech.com> wrote:
>>>>>>>> 在 2025/10/23 16:30, Ard Biesheuvel 写道:
>>>>>>>>> On Thu, 23 Oct 2025 at 10:22, Qiang Ma <maqianga@uniontech.com> wrote:
>>>>>>>>>> In the efi_virtmap_init(), permission settings have been applied:
>>>>>>>>>>
>>>>>>>>>> static bool __init efi_virtmap_init(void)
>>>>>>>>>> {
>>>>>>>>>>              ...
>>>>>>>>>>              for_each_efi_memory_desc(md)
>>>>>>>>>>                      ...
>>>>>>>>>>                      efi_create_mapping(&efi_mm, md);
>>>>>>>>>>              ...
>>>>>>>>>>              efi_memattr_apply_permissions(&efi_mm, efi_set_mapping_permissions);
>>>>>>>>>>              ...
>>>>>>>>>> }
>>>>>>>>>>
>>>>>>>>>> Therefore, there is no need to apply it again in the efi_create_mapping().
>>>>>>>>>>
>>>>>>>>>> Fixes: 9fc68b717c24 ("ARM/efi: Apply strict permissions for UEFI Runtime Services regions")
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Qiang Ma <maqianga@uniontech.com>
>>>>>>>>> No, efi_memattr_apply_permissions() uses the /optional/ memory
>>>>>>>>> attributes table, whereas efi_create_mapping() uses the permission
>>>>>>>>> attributes in the EFI memory map. The memory attributes table is
>>>>>>>>> optional, in which case any RO/XP attributes from the memory map
>>>>>>>>> should be used.
>>>>>>>>>
>>>>>>>> I see.
>>>>>>>>
>>>>>>>> Then, can it be modified like this?
>>>>>>> No
>>>>>>>
>>>>>>>> --- a/arch/arm/kernel/efi.c
>>>>>>>> +++ b/arch/arm/kernel/efi.c
>>>>>>>> @@ -65,16 +65,13 @@ int __init efi_create_mapping(struct mm_struct *mm,
>>>>>>>> efi_memory_desc_t *md)
>>>>>>>>                      desc.type = MT_MEMORY_RWX_NONCACHED;
>>>>>>>>              else if (md->attribute & EFI_MEMORY_WC)
>>>>>>>>                      desc.type = MT_DEVICE_WC;
>>>>>>>> +       else if (md->attribute & (EFI_MEMORY_RO | EFI_MEMORY_XP))
>>>>>>> This will be true for RO, XP or RO+XP.
>>>>>>>
>>>>>>>> +               desc.type = MT_MEMORY_RO;
>>>>>>> This will apply RO permissions even to XP regions, which need to be writable.
>>>>>>>
>>>>>> Thanks for your review.
>>>>>> I see.
>>>>>>
>>>>>> I can introduce a new type MT_MEMORY_RO_XP, to describe RO+XP,
>>>>>> and then we can use the RO+XP attribute to implement memory mapping.
>>>>>>
>>>>> Why? The current code is working fine, no?
>>>>>
>>>> Yes, the current code is running normally.
>>>>
>>>> The reasons for the modification are as follows:
>>>> I noticed that the arm64/RISC-V efi_create_mapping() always return 0,
>>>> but in the code where efi_virtmap_init() calls it, it is as follows:
>>>>
>>>> ret = efi_create_mapping(&efi_mm, md);
>>>> if (ret) {
>>>>        pr_warn("  EFI remap %pa: failed to create mapping (%d)\n",
>>>>            &phys, ret);
>>>>        return false;
>>>> }
>>>>
>>>> This return error print is unnecessary, so I want to remove it.
>>> So what is preventing you from removing this from the RISC-V version?
>>>
>> The current idea is to first remove the unnecessary return print from
>> arm/arm64,
> Please leave the ARM code alone.
I see.
>> and then remove RISC-V later, as this RISC-V code is also adapted based
>> on arm64.
>>
> RISC-V copied the ARM code and used it as a starting point. That does
> not mean it has to remain that way.
I can propose a patch specifically for RISC-V.


