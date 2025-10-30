Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05757CCF9FA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 07:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZp2u0B67QsAETphUXyRmOTAga0TDFm7uEB1RHsxask=; b=pCt08RDqqlvSz3yTdjBAABRjsB
	shDT2rK+I74l8p8oJiJF4mGYq0LrxTe57fVC+VMIoTnpiuTaUChd+63Ccay+f6nVCRRzU+gqoBRsH
	qA6qgR5CdRzLHzsYVFhMdFSGz+xG9qpxtQlgKERdo+ug5OnI7IdPSkD6Noz2cZcyrBnZWLrWsPgfj
	vKsjFkIv+oHXNZq3tJMfcmnN0vH/vVq31zKY6/2bIhweT/B7rpVUe/psTze5LdLbnddRSc8UbihqV
	Rq8TiUaBMm67YLEVfAdI8MqF+2USeeL5A82hso3i1sghuJwRmW7ReaQSdVWw9ZvxFhwpJ+h8HgEDr
	CYObeyig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENEH-00000003dWF-2OSl;
	Thu, 30 Oct 2025 07:37:53 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENEE-00000003dU3-43EO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 07:37:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1761809788;
	bh=oZp2u0B67QsAETphUXyRmOTAga0TDFm7uEB1RHsxask=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=ZVpsHK9AZfcg4dvlIsbuPMJkZqb6I5D5+OMbNKWAOAIxTESE/b4QfCBr58MtQl56J
	 EMEgwNV4LaGLdIu+iTIWP9IYsuz054eTxM8iIKuFRtHb9zIgMcyWSCE7b4+4I8OAKw
	 YbwBuqOQH+BAeIOrAZYn6+r91V+luxN185o+tKM4=
X-QQ-mid: esmtpsz18t1761809778t3d9bdc78
X-QQ-Originating-IP: A5pFw7+bvHf6LNPL2Gm+8xBIcV9Yxvpvjn5Fl5DM/QE=
Received: from [10.10.74.117] ( [123.114.60.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 30 Oct 2025 15:36:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 1780263289059606745
Message-ID: <BD93A8DBE27154B0+22bf4a83-a850-4f78-8e0d-84cc93fe2715@uniontech.com>
Date: Thu, 30 Oct 2025 15:36:16 +0800
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
Content-Language: en-US
From: Qiang Ma <maqianga@uniontech.com>
In-Reply-To: <CAMj1kXHu5ABgxKsc_gg1j=pWMz6DbWoqv=qAAjx-5CiSF2PAiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: NU4e3V92LJuQkE+CV323mLOZVEj/xEptM+EfU2jLOShEY8x54WnR3bSX
	TQHVJXl6jTPsPmcAowT08Mz6YDVPYgqBXnwcZ91lmi0k8HsFMgbWhxi5hKl1b/hfluBvQK5
	4uY+DT0nKG5UXoVxLouSbgYoewIgFP+YYby2/CijCAUX7ygcHrA1dQi+D58u4EZDlSF5lTH
	7iNs2tFSrjgsEob7wbevxMDE2tZH8wE7BPb20pcNHkbLEkcK5OrsOAC0hIo96+HqtUh9ql7
	k+icoLZCsQLkdYVChLsyo5+r7zV+aSxjp3i9WriUkYUBvNdAhTyvOwZCLwDlQrCvMm9OySl
	O0XtJaYs/SX8tpfhZ0PztVRVb/PcaptFx8uHOV9dFku3vp58Ga25kWIRZH4y9dEN0PZ49hN
	2ixpnH++7ySdIb3IFx2eRaHKVeqhvixiZbCQpdoOVTvGWzCEBqXdgxeTZZxwv0iPKjEkrjK
	E4ZDGb5JgoyB4FkU2GEbLN1aCkBpGuI1pDVc8gxVsZdMbFAn2GrD3mvqAlG14fCYODRPt3C
	Nn+HUJIGT6ATO0cqVrpSy0jVO0toY6ToH2dpMHaidpMt7RxkXpRNv2EhmAJ8HP/ZoNM9sM8
	7xR/fpNqrL3DTmaB0//HTisxDu1U9BozaUXi9cyrQqisDqymHC0I3W6yjr2aq2szONX9Yu2
	bV8S1T95eob/l/4KLxBMRZq1Jv62hvMEXRf1DniykyhM0A/hgXoMKB6+42QaD0JdNALNFwz
	+RCn0zTp4LdD70SBqLinw7xWlqSZdSzH0CqNiZLUw2C3Fvjz8F/vQeEPtR6zU4AnT8Z4AVA
	RkftDGardTFkkcVUWlNfbbWjIlcEd8cpVhMN/snPbWArGlmK5v6cpkll/Th7T/GubKyy2CT
	rAtz8ncjeO2pIbj0C0kPKV86zGpMJkkls9Vi8iAXFiHUnzox10J8fN0Ysaq1OUzzDgq8qyN
	Z3EaQwDhz0NCRbTkSlq3Ffv2aKZqCwlqCpJSyOkF2aUoPwFisrj3uk3WFkpkX1bqYvliC/C
	FeLjPnDmTkLPPBGMox
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_003751_897220_3B6E4346 
X-CRM114-Status: GOOD (  15.55  )
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


在 2025/10/29 22:15, Ard Biesheuvel 写道:
> On Wed, 29 Oct 2025 at 10:55, Qiang Ma <maqianga@uniontech.com> wrote:
>>
>> 在 2025/10/28 21:42, Ard Biesheuvel 写道:
>>> On Mon, 27 Oct 2025 at 04:46, Qiang Ma <maqianga@uniontech.com> wrote:
>>>> 在 2025/10/23 16:30, Ard Biesheuvel 写道:
>>>>> On Thu, 23 Oct 2025 at 10:22, Qiang Ma <maqianga@uniontech.com> wrote:
>>>>>> In the efi_virtmap_init(), permission settings have been applied:
>>>>>>
>>>>>> static bool __init efi_virtmap_init(void)
>>>>>> {
>>>>>>            ...
>>>>>>            for_each_efi_memory_desc(md)
>>>>>>                    ...
>>>>>>                    efi_create_mapping(&efi_mm, md);
>>>>>>            ...
>>>>>>            efi_memattr_apply_permissions(&efi_mm, efi_set_mapping_permissions);
>>>>>>            ...
>>>>>> }
>>>>>>
>>>>>> Therefore, there is no need to apply it again in the efi_create_mapping().
>>>>>>
>>>>>> Fixes: 9fc68b717c24 ("ARM/efi: Apply strict permissions for UEFI Runtime Services regions")
>>>>>>
>>>>>> Signed-off-by: Qiang Ma <maqianga@uniontech.com>
>>>>> No, efi_memattr_apply_permissions() uses the /optional/ memory
>>>>> attributes table, whereas efi_create_mapping() uses the permission
>>>>> attributes in the EFI memory map. The memory attributes table is
>>>>> optional, in which case any RO/XP attributes from the memory map
>>>>> should be used.
>>>>>
>>>> I see.
>>>>
>>>> Then, can it be modified like this?
>>> No
>>>
>>>> --- a/arch/arm/kernel/efi.c
>>>> +++ b/arch/arm/kernel/efi.c
>>>> @@ -65,16 +65,13 @@ int __init efi_create_mapping(struct mm_struct *mm,
>>>> efi_memory_desc_t *md)
>>>>                    desc.type = MT_MEMORY_RWX_NONCACHED;
>>>>            else if (md->attribute & EFI_MEMORY_WC)
>>>>                    desc.type = MT_DEVICE_WC;
>>>> +       else if (md->attribute & (EFI_MEMORY_RO | EFI_MEMORY_XP))
>>> This will be true for RO, XP or RO+XP.
>>>
>>>> +               desc.type = MT_MEMORY_RO;
>>> This will apply RO permissions even to XP regions, which need to be writable.
>>>
>> Thanks for your review.
>> I see.
>>
>> I can introduce a new type MT_MEMORY_RO_XP, to describe RO+XP,
>> and then we can use the RO+XP attribute to implement memory mapping.
>>
> Why? The current code is working fine, no?
>
Yes, the current code is running normally.

The reasons for the modification are as follows:
I noticed that the arm64/RISC-V efi_create_mapping() always return 0,
but in the code where efi_virtmap_init() calls it, it is as follows:

ret = efi_create_mapping(&efi_mm, md);
if (ret) {
     pr_warn("  EFI remap %pa: failed to create mapping (%d)\n",
         &phys, ret);
     return false;
}

This return error print is unnecessary, so I want to remove it.
But, the return value of efi_create_mapping() in the arm doesn't
always return 0, so I'm trying to modify it.


