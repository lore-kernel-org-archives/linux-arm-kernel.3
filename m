Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFB5C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 01:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VIRv+z3mPNZFa1bmE43M/kgaKBia3XUx5hcUcZMH5lg=; b=e+/wiyhM9w7HxlaQGLVN7u2ivc
	qICmPV3qDM1ed7ECSKcwpzLjJQcfYA1gvDU/s88gmfOQrAZidKc/YRV2IwVYoQw3dMeL7JT0OYB7E
	zgNJtq5gVyhr5ocgDt3tUEqtKfxtV4HLEY7Mc7w5TrZUFHZSwgJw80sKHaPvBl8q5FXyFBZi2yGOc
	6Qv4KTTdRrpaqFnx64D5EaSVWxJDAVymhfuqr/LBfhbDBsK5jO59eFn+eaTkIRujBRDUdrwVjRD89
	4NH/gqtZL2zCYDWQMIJMDQO3bPnTGQB+P+Pgyt/nZ9MA8qkanMcvBur/BVO+6EAfLw4mQ4mwkyDhO
	E8DkzOig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1vq2-0000000G8nL-2ZqH;
	Thu, 03 Sep 2026 01:01:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1vq1-0000000G8my-0Vuh;
	Thu, 03 Sep 2026 01:01:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=VIRv+z3mPNZFa1bmE43M/kgaKBia3XUx5hcUcZMH5lg=; b=RvHCfdH3QVzTyy081zRM1gAbDO
	n6QmCbiMyAI9Ifamg9FQdfvtPYDp+0W8GJAfE01p3ocP796sLiU8Wzjpbn8UEJ9RI5eGb3LJJI2QV
	3yu31P+0GXbPnwR8JyIeyg38K84AcYjpdNy4aACSm20rhVkpjUFccdRToU/lSlZVCpqpW63KyEOlM
	ePt+k3wEOHP+yrAP91LSnUWZmLbiNeoAg9iyGvJNhH/RHK783KYcZdP2ASBF1m8AflpC3gHAJLiKk
	xVRwPSKVH5NAU+ga0XfyEeE2NbVwR45IImyjFyC62MCm2bygHfiUWzT4P0mTFn/YBulbsZfm6+Xq7
	NqE0Nsig==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1vpw-00000008KeR-1HTv;
	Thu, 03 Sep 2026 01:01:55 +0000
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8CxQNH3xphq0P8HAA--.22980S3;
	Thu, 03 Sep 2026 09:01:43 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJDxRs30xphqzu0ZAA--.42143S2;
	Thu, 03 Sep 2026 09:01:41 +0800 (CST)
Subject: Re: [PATCH v2 02/20] KVM: selftests: Use the common minimum GPA for
 page tables on LoongArch
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>,
 Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>,
 Nicholas Piggin <npiggin@gmail.com>, Ritesh Harjani <ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com>
 <20260902164123.2546762-3-seanjc@google.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <170acb36-7542-e6f8-d834-250816ddfbfc@loongson.cn>
Date: Thu, 3 Sep 2026 09:01:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20260902164123.2546762-3-seanjc@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qMiowJDxRs30xphqzu0ZAA--.42143S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZF43uFy8JrWDCF15CFWUJrc_yoW8CrWUpa
	ykAryY9r4rGr17KFZ7WwnYqFy8Wa97GFWxAr1S9ryDurnrAry2gFWxKasrXFy5Z39Yq34S
	v3WI93W5Za1kZwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUd529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUtVW8ZwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l
	4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUShiSDUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_020152_974008_C1C60034 
X-CRM114-Status: GOOD (  17.17  )
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



On 2026/9/3 上午12:41, Sean Christopherson wrote:
> Use the common minimum GPA for page tables (0x180000) on LoongArch instead
> of LoongArch's custom minimum of 0x200000, so that LoongArch can use
> vm_alloc_page_table() instead of open coding a rough equivalent.  There are
> no known reasons why LoongArch can't use a lower, less-aligned minimum.
> The more-aligned value was originally selected to support huge pages for
> the guest, but that only requires the address of the final allocation to be
> aligned, the addresses of page table pages is irrelevant on that front.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   tools/testing/selftests/kvm/lib/loongarch/processor.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/lib/loongarch/processor.c b/tools/testing/selftests/kvm/lib/loongarch/processor.c
> index 47bbde3e205a..057a77713542 100644
> --- a/tools/testing/selftests/kvm/lib/loongarch/processor.c
> +++ b/tools/testing/selftests/kvm/lib/loongarch/processor.c
> @@ -9,7 +9,6 @@
>   #include "processor.h"
>   #include "ucall_common.h"
>   
> -#define LOONGARCH_PAGE_TABLE_PHYS_MIN		0x200000
>   #define LOONGARCH_GUEST_STACK_VADDR_MIN		0x200000
>   
>   static gpa_t invalid_pgtable[4];
> @@ -57,7 +56,7 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
>   	child = table = 0;
>   	for (i = 0; i < vm->mmu.pgtable_levels; i++) {
>   		invalid_pgtable[i] = child;
> -		table = vm_phy_page_alloc(vm, LOONGARCH_PAGE_TABLE_PHYS_MIN,
> +		table = vm_phy_page_alloc(vm, KVM_GUEST_PAGE_TABLE_MIN_PADDR,
>   				vm->memslots[MEM_REGION_PT]);
>   		TEST_ASSERT(table, "Fail to allocate page tale at level %d\n", i);
>   		virt_set_pgtable(vm, table, child);
> 
Reviewed-by: Bibo Mao <maobibo@loongson.cn>


