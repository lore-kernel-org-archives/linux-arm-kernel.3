Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB99E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 09:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d2Z7ljRosyxzRIcbKhe3YbkoxAYWz4U36Hhq5IW19dE=; b=VTKCoATcZ1D6fKr3sKJeDK8k9f
	1m8SZlgPppya6CDsteNx4FaCp1uAz71HmWCWyheezFexYfBKhKhTM1wm0xyw7yXyVVR0DFMIFNjXz
	FwkwY64IINS/OK2vnTM+ALLvUarExjBnMFdef1XsIQr0Abhdurq8anZzgcPhv4F5h2qlVodqFCRBY
	a4QxKL8u+b1W8xcvZSy/Tn6VVxu4cpoGbk13hQ5Okxx4/wpaZXprP94Zsx285mryufKb/d8pEXZf6
	gWZtcilxiRaVgqqhWQ8hGaYOogqsLT44xpqPmVBqJWVtklcUrsUpp47Z4ymbeK8ze9E4FwEAQjrv+
	vxo9ErEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHIg-0000000A1jV-1eM0;
	Thu, 02 Jan 2025 09:15:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHHP-0000000A1bl-3NaZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 09:14:13 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 502465vE020986;
	Thu, 2 Jan 2025 09:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d2Z7ljRosyxzRIcbKhe3YbkoxAYWz4U36Hhq5IW19dE=; b=ZoKFiDUljF5G8sWi
	ZdiZs1IZzKOi7WEuz/9mM29GsKzsiq2cMjs7oSnyq9C9QBH1sogo5/7kZep2pSOw
	ZDQLbKS/V+XRGx4sNOuvzxkqP8dLu7m7PIObNG2QWj5yyAQw9hOztT5ep6WVasDj
	+Q0usF4mVJCP/ihA4BCTeH67A+FlmLdDbPkwi1JuJjb/HR6TvTY+O50ELBx5THG7
	RkcV7qKa4XLWyaCK+dTAlU1ZOcZ/I1Mfk1wUsRwb3L/dmfCWn3VgNib3R4pIwINZ
	y2vn8mKaV2bXP7h+lk3gh/Qtqn9OabVbJQ8KE06sZP9HNYvaOugLZkYvrUEmFakt
	I5tdlA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43wkfj8hey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jan 2025 09:14:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5029DxkI018347
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 2 Jan 2025 09:13:59 GMT
Received: from [10.239.132.245] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 2 Jan 2025
 01:13:55 -0800
Message-ID: <79d23b92-998c-4148-a93c-75979d047d4e@quicinc.com>
Date: Thu, 2 Jan 2025 17:13:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: mm: vmemmap populate to page level if not
 section aligned
To: Anshuman Khandual <anshuman.khandual@arm.com>,
        Catalin Marinas
	<catalin.marinas@arm.com>
CC: <will@kernel.org>, <ardb@kernel.org>, <ryan.roberts@arm.com>,
        <mark.rutland@arm.com>, <joey.gouly@arm.com>,
        <dave.hansen@linux.intel.com>, <akpm@linux-foundation.org>,
        <chenfeiyang@loongson.cn>, <chenhuacai@kernel.org>,
        <linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>
References: <20241209094227.1529977-1-quic_zhenhuah@quicinc.com>
 <20241209094227.1529977-2-quic_zhenhuah@quicinc.com>
 <Z2W3qA7wbBTaq6DQ@arm.com> <a720aaa5-a75e-481e-b396-a5f2b50ed362@quicinc.com>
 <Z2rAr9APkgpkwOl8@arm.com> <971b9a05-4ae0-4e6c-8e48-e9e529896ecf@arm.com>
 <22fd3452-748c-4d4b-bd51-08e6faeaa867@quicinc.com>
 <88dc8823-1439-40ed-80a3-becb4a51aff7@arm.com>
Content-Language: en-US
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
In-Reply-To: <88dc8823-1439-40ed-80a3-becb4a51aff7@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 105t-5MwB74blxyhsr57r4wz3VJWlyLu
X-Proofpoint-ORIG-GUID: 105t-5MwB74blxyhsr57r4wz3VJWlyLu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501020078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_011411_987980_B79A6BFF 
X-CRM114-Status: GOOD (  34.18  )
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



On 2025/1/2 11:51, Anshuman Khandual wrote:
> On 12/30/24 13:18, Zhenhua Huang wrote:
>> Hi Anshuman,
>>
>> On 2024/12/27 15:49, Anshuman Khandual wrote:
>>> On 12/24/24 19:39, Catalin Marinas wrote:
>>>> On Tue, Dec 24, 2024 at 05:32:06PM +0800, Zhenhua Huang wrote:
>>>>> Thanks Catalin for review!
>>>>> Merry Christmas.
>>>>
>>>> Merry Christmas to you too!
>>>>
>>>>> On 2024/12/21 2:30, Catalin Marinas wrote:
>>>>>> On Mon, Dec 09, 2024 at 05:42:26PM +0800, Zhenhua Huang wrote:
>>>>>>> Fixes: c1cc1552616d ("arm64: MMU initialisation")
>>>>>>
>>>>>> I wouldn't add a fix for the first commit adding arm64 support, we did
>>>>>> not even have memory hotplug at the time (added later in 5.7 by commit
>>>>>> bbd6ec605c0f ("arm64/mm: Enable memory hot remove")). IIUC, this hasn't
>>>>>> been a problem until commit ba72b4c8cf60 ("mm/sparsemem: support
>>>>>> sub-section hotplug"). That commit broke some arm64 assumptions.
>>>>>
>>>>> Shall we add ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
>>>>> because it broke arm64 assumptions ?
>>>>
>>>> Yes, I think that would be better. And a cc stable to 5.4 (the above
>>>> commit appeared in 5.3).
>>>
>>> Agreed. This is a problem which needs fixing but not sure if proposed patch
>>> here fixes that problem.
>>>
>>>>
>>>>>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>>>>>> index e2739b69e11b..fd59ee44960e 100644
>>>>>>> --- a/arch/arm64/mm/mmu.c
>>>>>>> +++ b/arch/arm64/mm/mmu.c
>>>>>>> @@ -1177,7 +1177,9 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>>>>>>>     {
>>>>>>>         WARN_ON((start < VMEMMAP_START) || (end > VMEMMAP_END));
>>>>>>> -    if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES))
>>>>>>> +    if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES) ||
>>>>>>> +    !IS_ALIGNED(page_to_pfn((struct page *)start), PAGES_PER_SECTION) ||
>>>>>>> +    !IS_ALIGNED(page_to_pfn((struct page *)end), PAGES_PER_SECTION))
>>>>>>>             return vmemmap_populate_basepages(start, end, node, altmap);
>>>>>>>         else
>>>>>>>             return vmemmap_populate_hugepages(start, end, node, altmap);
>>>>>>
>>>>>> An alternative would be to fix unmap_hotplug_pmd_range() etc. to avoid
>>>>>> nuking the whole vmemmap pmd section if it's not empty. Not sure how
>>>>>> easy that is, whether we have the necessary information (I haven't
>>>>>> looked in detail).
>>>>>>
>>>>>> A potential issue - can we hotplug 128MB of RAM and only unplug 2MB? If
>>>>>> that's possible, the problem isn't solved by this patch.
>>>
>>> Believe this is possible after sub-section hotplug and hotremove support.
>>>
>>>>>
>>>>> Indeed, seems there is no guarantee that plug size must be equal to unplug
>>>>> size...
>>>>>
>>>>> I have two ideas:
>>>>> 1. Completely disable this PMD mapping optimization since there is no
>>>>> guarantee we must align 128M memory for hotplug ..
>>>>
>>>> I'd be in favour of this, at least if CONFIG_MEMORY_HOTPLUG is enabled.
>>>> I think the only advantage here is that we don't allocate a full 2MB
>>>> block for vmemmap when only plugging in a sub-section.
>>>
>>> Agreed, that will be the right fix for the problem which can be back ported.
>>> We will have to prevent PMD/PUD/CONT mappings for both linear and as well as
>>
>> Thanks Anshuman, yeah.. we must handle linear mapping as well.
>>
>>> vmemmap for all non-boot memory sections, that can be hot-unplugged.
>>>
>>> Something like the following ? [untested]
>>>
>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>> index 216519663961..56b9c6891f46 100644
>>> --- a/arch/arm64/mm/mmu.c
>>> +++ b/arch/arm64/mm/mmu.c
>>> @@ -1171,9 +1171,15 @@ int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
>>>    int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>>>                   struct vmem_altmap *altmap)
>>>    {
>>> +       unsigned long start_pfn;
>>> +       struct mem_section *ms;
>>> +
>>>           WARN_ON((start < VMEMMAP_START) || (end > VMEMMAP_END));
>>>    -       if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES))
>>> +       start_pfn = page_to_pfn((struct page *)start);
>>> +       ms = __pfn_to_section(start_pfn);
>>> +
>>> +       if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES) || !early_section(ms))
>>
>> LGTM. I will follow your and Catalin's suggestion to prepare further patches, Thanks!
>>
>>>                   return vmemmap_populate_basepages(start, end, node, altmap);
>>>           else
>>>                   return vmemmap_populate_hugepages(start, end, node, altmap);
>>> @@ -1334,10 +1340,15 @@ struct range arch_get_mappable_range(void)
>>>    int arch_add_memory(int nid, u64 start, u64 size,
>>>                       struct mhp_params *params)
>>>    {
>>> +       unsigned long start_pfn = page_to_pfn((struct page *)start);
>>> +       struct mem_section *ms = __pfn_to_section(start_pfn);
>>>           int ret, flags = NO_EXEC_MAPPINGS;
>>>             VM_BUG_ON(!mhp_range_allowed(start, size, true));
>>>    +       if (!early_section(ms))
>>> +               flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>>
>> However, here comes another doubt, given that the subsection size is 2M, shouldn't we have ability to support PMD SECTION MAPPING if CONFIG_ARM64_4K_PAGES? This might be the optimization we want to maintain?>
>> Should we remove NO_BLOCK_MAPPINGS and add more constraints to avoid pud_set_huge if CONFIG_ARM64_4K_PAGES ?
> 
> I guess this has been covered on the thread.

Yeah, the example I shared on separated thread, we can wrap up the 
discussion here :)

> 
>>
>>> +
>>>           if (can_set_direct_map())
>>>                   flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>>>   
>>>>
>>>>> 2. If we want to take this optimization.
>>>>> I propose adding one argument to vmemmap_free to indicate if the entire
>>>>> section is freed(based on subsection map). Vmemmap_free is a common function
>>>>> and might affect other architectures... The process would be:
>>>>> vmemmap_free
>>>>>      unmap_hotplug_range //In unmap_hotplug_pmd_range() as you mentioned：if
>>>>> whole section is freed, proceed as usual. Otherwise, *just clear out struct
>>>>> page content but do not free*.
>>>>>      free_empty_tables // will be called only if entire section is freed
>>>>>
>>>>> On the populate side,
>>>>> else if (vmemmap_check_pmd(pmd, node, addr, next)) //implement this function
>>>>>      continue;    //Buffer still exists, just abort..
>>>>>
>>>>> Could you please comment further whether #2 is feasible ?
>>>>
>>>> vmemmap_free() already gets start/end, so it could at least check the
>>>> alignment and avoid freeing if it's not unplugging a full section. It
>>>
>>> unmap_hotplug_pmd_range()
>>> {
>>>      do {
>>>          if (pmd_sect(pmd)) {
>>>              pmd_clear(pmdp);
>>>              flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>>>                           if (free_mapped)
>>>                                   free_hotplug_page_range(pmd_page(pmd),
>>>                                                           PMD_SIZE, altmap);
>>>          }
>>>      } while ()
>>> }
>>>
>>> Do you mean clearing the PMD entry but not freeing the mapped page for vmemmap ?
>>> In that case should the hot-unplug fail or not ? If we free the pfns (successful
>>> hot-unplug), then leaving behind entire PMD entry for covering the remaining sub
>>> sections, is going to be problematic as it still maps the removed pfns as well !
>>
>> Could you please help me to understand in which scenarios this might cause issue? I assume we won't touch these struct page further?
> 
> Regardless of whether the non-present pfns are accessed or not from the cpu, having
> page table mappings covering them might probably create corresponding TLB entries ?
> IIUC from an arch perspective, this seems undesirable and possibly some what risky.
> 

Got it.. I know it's tricky indeed.

>>
>>>
>>>> does leave a 2MB vmemmap block in place when freeing the last subsection
>>>> but it's safer than freeing valid struct page entries. In addition, it
>>>> could query the memory hotplug state with something like
>>>> find_memory_block() and figure out whether the section is empty.
>>>
>>> I guess there are two potential solutions, if unmap_hotplug_pmd_range() were to
>>> handle sub-section removal.
>>>
>>> 1) Skip pmd_clear() when entire section is not covered
>>>
>>> a. pmd_clear() only if all but the current subsection have been removed earlier
>>>      via is_subsection_map_empty() or something similar.
>>>
>>> b. Skip pmd_clear() if the entire section covering that PMD is not being removed
>>>      but that might be problematic, as it still maps potentially unavailable pfns,
>>>      which are now hot-unplugged out.
>>>
>>> 2) Break PMD into base pages
>>>
>>> a. pmd_clear() only if all but the current subsection have been removed earlier
>>>      via is_subsection_map_empty() or something similar.
>>>
>>> b. Break entire PMD into base page mappings and remove entries corresponding to
>>>      the subsection being removed. Although the BBM sequence needs to be followed
>>>      while making sure that no other part of the kernel is accessing subsections,
>>>      that are mapped via the erstwhile PMD but currently not being removed.
>>>
>>>>
>>>> Anyway, I'll be off until the new year, maybe I get other ideas by then.
>>>>
>>


