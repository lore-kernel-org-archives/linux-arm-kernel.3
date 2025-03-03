Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BB0C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 10:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PcTxQPvw7yavhXchduhtx09cw9o8g1/u2+xEpXeIAmI=; b=FWMjojVx6iOMtecrCKCtSjTPgq
	ocS3fRyDqBPnnpnL6xhKR7Z+y32SGSkbQUmvHpjQMyEaVa+CYgIR9C/dJDX/o4HzB0+Z9aBPlibTe
	XEBLpEMMBpU4p1YkntB+RTsmPphoKpOcaG69KUCNwXHO7aGuFueNMTGB6k6D0ry+4Fu3LIXb/iBgj
	sB+K1NmkYj2o869gLAOHO3zqvFVBws4FuQNZCn6+pPxYvZtqSticjUwrB3cpZJw1GFzmn1i2WRe5Y
	UqoSZEylSx2PdivqIBRQiKk7MqpyntU1oOIpwR2YvUjxONRUdSCL0IWce2WEa0Hgikq9C+xkV1UtX
	iwu+Mj5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp2z9-00000000Jdv-0uoi;
	Mon, 03 Mar 2025 10:25:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp2xa-00000000JSa-0F36
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 10:23:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6491F12FC;
	Mon,  3 Mar 2025 02:23:55 -0800 (PST)
Received: from [10.1.26.155] (XHFQ2J9959.cambridge.arm.com [10.1.26.155])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 814F63F66E;
	Mon,  3 Mar 2025 02:23:39 -0800 (PST)
Message-ID: <9dd8e02c-9abb-47e6-92df-cf7af6cda99c@arm.com>
Date: Mon, 3 Mar 2025 10:23:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/8] arm64/mm: Drop PXD_TABLE_BIT
Content-Language: en-GB
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 arm-kernel@lists.infradead.org
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 James Morse <james.morse@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250221044227.1145393-1-anshuman.khandual@arm.com>
 <aa71c6ed-8ff2-4b52-b8f7-49147c7769ba@arm.com>
 <a9600c92-bef0-4dd1-95d4-c696d686da18@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <a9600c92-bef0-4dd1-95d4-c696d686da18@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_022342_193263_D4872BAA 
X-CRM114-Status: GOOD (  24.59  )
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

On 03/03/2025 05:02, Anshuman Khandual wrote:
> 
> 
> On 2/28/25 21:02, Ryan Roberts wrote:
>> On 21/02/2025 04:42, Anshuman Khandual wrote:
>>> Remove the PXX_TABLE_BIT definitions and instead rely on PXX_TYPE_MASK,
>>> PXX_TYPE_SECT and PXX_TYPE_TABLE. The latter versions are more abstract
>>> and also include the PTE_VALID bit.
>>>
>>> This abstraction is valuable for the impending D128 page table support,
>>> which doesn't have a single page table bit to determine table vs block.
>>> Instead it has the skip level (SKL) field, where it will consider 0 to
>>> mean table and any other value to mean a block entry. So PXX_TABLE_BIT
>>> therefore doesn't fit into the D128 model well, but the type fields do.
>>
>> All the patches look logically correct to me and I agree with the intention of
>> removing PXX_TABLE_BIT. But personally I'd prefer to see a single patch that
>> just does everything that's required to remove PXX_TABLE_BIT. And then a second
>> patch for the pud_bad() fix/improvement (currently patch 6) which is orthogonal
>> to the removal of PXX_TABLE_BIT.
>>
>> That would make it much easier to review IMHO, and would also allow for writing
>> a single commit log which provides the justification for the change. I find the
>> current set of 7 commit logs to not be hugely helpful.
> 
> Dropping PXX_TABLE_BIT from individual functional components which stand on their
> own progressively leads to its complete removal from the tree. Even though goal
> is PXX_TABLE_BIT mask's complete removal, each patch here could be justified on
> its own improving consistent reasoning around various section mapping creation
> and identification while keeping the functionality unchanged and also improving
> code readability as well.
> 
>>
>> But I wrote the original patches and wrote them as I'm suggesting, so I would
>> say that :)
> 
> I can understand :) Although it also follows and expands on the previous attempt
> in removing this mask that formed a patch series instead.
> 
> https://lore.kernel.org/all/20241005123824.1366397-1-anshuman.khandual@arm.com/
> 
> TBH this is not a big deal. I can merge all but last one into a single patch as
> you have suggested if that's a general consensus. Although I would prefer the
> current logically progressive series based approach but that's just me.

I guess leave as is for now and see what others say.

> 
>>
>> I'm guessing I shouldn't provide a Reviewed-By here, given I wrote the code
>> originally...
>>
>> Thanks,
>> Ryan
>>
>>
>>>
>>> This series applies on v6.14-rc3.
>>>
>>> Changes in V2:
>>>
>>> - Changed pmd_mkhuge() and pud_mkhuge() implementation
>>> - Changed pud_bad() implementation with an additional patch
>>>
>>> Changes in V1:
>>>
>>> https://lore.kernel.org/all/20241005123824.1366397-1-anshuman.khandual@arm.com/
>>>
>>> Cc: Marc Zyngier <maz@kernel.org>
>>> Cc: Oliver Upton <oliver.upton@linux.dev>
>>> Cc: James Morse <james.morse@arm.com>
>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>> Cc: Will Deacon <will@kernel.org>
>>> Cc: Ard Biesheuvel <ardb@kernel.org>
>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>> Cc: Mark Rutland <mark.rutland@arm.com>
>>> Cc: kvmarm@lists.linux.dev
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: linux-kernel@vger.kernel.org
>>>
>>> Anshuman Khandual (6):
>>>   KVM: arm64: ptdump: Test PMD_TYPE_MASK for block mapping
>>>   arm64/ptdump: Test PMD_TYPE_MASK for block mapping
>>>   arm64/mm: Clear PXX_TYPE_MASK in mk_[pmd|pud]_sect_prot()
>>>   arm64/mm: Clear PXX_TYPE_MASK and set PXD_TYPE_SECT in [pmd|pud]_mkhuge()
>>>   arm64/mm: Check PXD_TYPE_TABLE in [p4d|pgd]_bad()
>>>   arm64/mm: Drop PXD_TABLE_BIT
>>>
>>> Ryan Roberts (2):
>>>   arm64/mm: Check PUD_TYPE_TABLE in pud_bad()
>>>   arm64/mm: Check pmd_table() in pmd_trans_huge()
>>>
>>>  arch/arm64/include/asm/pgtable-hwdef.h |  5 --
>>>  arch/arm64/include/asm/pgtable.h       | 65 ++++++++++++++++++--------
>>>  arch/arm64/kvm/ptdump.c                |  4 +-
>>>  arch/arm64/mm/ptdump.c                 |  4 +-
>>>  4 files changed, 50 insertions(+), 28 deletions(-)
>>>
>>


