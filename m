Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECA6D1039A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 12:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Yf3z2Ms2l6WFLpLoKfJUapanT3ncANvk30GijyreCw=; b=JoPDGjFIfmqtYZHc1hIbmuQ7Ge
	cQyKO7EKapvtt6bwaY8ePYcX1VfawQ1utR6HMg5SlJ9uh/78A9mQY/eKn5Oj7IQF8CXhpUnkYPOV1
	GEN5g+ySjCJFQGulU5VwBo3X6/Gm37djWbTaGoW4YRHe16tpMEEU7VquUaPK5kAVJpE9WD0CXS1E2
	UCA2fEadzfVhcegqtMKYASOc0Cx9vEAkeEAWbRGyb8Phi2bS7i8aA1P5XZtswjGXiEdeiKAtIxIEu
	PkoQtruw2pEaJ/7B8IGW0g+tcqRF76P/OBxc5jCTHRLxs0rZ+9bZJFaAmsumS9Ps8/7Recd6dgw0i
	nbTqHeBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5PHK-0000000Aqam-2gSS;
	Mon, 28 Oct 2024 12:55:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5P9n-0000000ApA0-27mN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 12:47:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A6DFEA419DD;
	Mon, 28 Oct 2024 12:45:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5529BC4CEC3;
	Mon, 28 Oct 2024 12:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730119658;
	bh=OlZRFoq/d2AxHvHoLmuiflTglaY8xpIsCiBPVNVcTJI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XgEqUa8ho42bb+yGuEH9XkK4eQ9oawObnaYQ3J0+IZvXG3ToTEigom2v9XbI+d6vy
	 xYQ4vHIt4IYi1Ksh39GYV77uXOYz85aZ6jNU+OWk6pHfDB7n2JfgjkouF6ofaaIYsF
	 3DmWhoIwwlhDRSMJnFhJgiSYQOKZ1gyvAoy5THY3hrTM4nCJjTtExvQJP3a7bUT88b
	 KRZA8e6CDinrPSPidQib2chsGbcvivIeelaa5WIkqDPDdtKZPwzWjqtpIXl5n7pwzx
	 Zwr4w9QCEfUecTACLN3WnN+9ont9VpdWNGxQpFtKImVKYe5he04xL0d4ueIv7Doyod
	 j4t6juMe+uiwQ==
X-Mailer: emacs 31.0.50 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 3/4] arm64: mte: update code comments
In-Reply-To: <87plnktt2q.wl-maz@kernel.org>
References: <20241028094014.2596619-1-aneesh.kumar@kernel.org>
 <20241028094014.2596619-4-aneesh.kumar@kernel.org>
 <87plnktt2q.wl-maz@kernel.org>
Date: Mon, 28 Oct 2024 18:17:30 +0530
Message-ID: <yq5attcwcs2l.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_054739_694059_3325BDF4 
X-CRM114-Status: GOOD (  23.38  )
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

Hi Marc,

Thanks for reviewing the changes.

Marc Zyngier <maz@kernel.org> writes:

> On Mon, 28 Oct 2024 09:40:13 +0000,
> "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:
>> 
>> commit d77e59a8fccd ("arm64: mte: Lock a page for MTE tag
>> initialisation") updated the locking such the kernel now allows
>> VM_SHARED mapping with MTE. Update the code comment to reflect this.
>> 
>> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>> ---
>>  arch/arm64/kvm/mmu.c | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> This is a KVM patch. Please make sure you write the subject
> accordingly, matching the existing conventions (in this case, this
> should read something like: "KVM: arm64: MTE: Update...").
>

Will update

>
>> 
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>> index a509b63bd4dd..b5824e93cee0 100644
>> --- a/arch/arm64/kvm/mmu.c
>> +++ b/arch/arm64/kvm/mmu.c
>> @@ -1390,11 +1390,8 @@ static int get_vma_page_shift(struct vm_area_struct *vma, unsigned long hva)
>>   * able to see the page's tags and therefore they must be initialised first. If
>>   * PG_mte_tagged is set, tags have already been initialised.
>>   *
>> - * The race in the test/set of the PG_mte_tagged flag is handled by:
>> - * - preventing VM_SHARED mappings in a memslot with MTE preventing two VMs
>> - *   racing to santise the same page
>> - * - mmap_lock protects between a VM faulting a page in and the VMM performing
>> - *   an mprotect() to add VM_MTE
>> + * The race in the test/set of the PG_mte_tagged flag is handled by
>> + * using PG_mte_lock and PG_mte_tagged together.
>
> How? This comment is pretty content-free. TO be useful, you should
> elaborate on *how* these two are used together.
>

I will add more details described in commit d77e59a8fccde7fb5dd8c57594ed147b4291c970
Should i quote the commit there in the comment? 

>
>>   */
>>  static void sanitise_mte_tags(struct kvm *kvm, kvm_pfn_t pfn,
>>  			      unsigned long size)
>> @@ -1646,7 +1643,10 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>>  	}
>>  
>>  	if (!fault_is_perm && !device && kvm_has_mte(kvm)) {
>> -		/* Check the VMM hasn't introduced a new disallowed VMA */
>> +		/*
>> +		 *  not a permission fault implies a translation fault which
>> +		 *  means mapping the page for the first time
>
> How about an Access fault due to page ageing?
>

IIUC access fault is already handled by the caller kvm_handle_guest_abort?
I can add that as part of the updated comments?

-aneesh

