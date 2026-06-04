Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9F6CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 15:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LFcIhFobV7ZJwfSK6vgcWYcTdu+qYOmh0JDjUatcR6c=; b=jWMB77X3UGuJRzH9Epv30+GStb
	q6LqRb5CSULv9vYQEoY5Qf1n6CFH4E6AsazIxBp8mA+1V/LUPsDwktQRgXvae1EsR+RQb2e1uw6Hn
	7+6GcGnHIG6y7rIbpcNwKlVE9hA57rpTsOQJsN/vkHPgVGpRRIAVA1o6/zG1VIozMdzVqmEMcjERh
	tWC5QtYi7UnlFkvQUG1CTLfli0WFYG/dmjaiPLSGMbUQZcQokotjEWYAgzWdZPrVrfRL8eaz/z4RL
	a5+Iceu2uQ6QTBtCY0+pEj1ZVQ3C3X+7fh67x/f415D1tsa4oe4dyV98Y1/ARhSh7al59k81j1CrG
	uorbfwhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9rN-0000000Gyxu-3rFE;
	Thu, 04 Jun 2026 15:19:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9rL-0000000Gyx4-3EZQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 15:19:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C959F479C;
	Thu,  4 Jun 2026 08:19:42 -0700 (PDT)
Received: from [10.1.34.54] (e122027.cambridge.arm.com [10.1.34.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 703933F86F;
	Thu,  4 Jun 2026 08:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780586387; bh=mRslR92UBVFk9szOYwdXFeTxrFDO6f1XAumMp3y2mwA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mlzeQn6XiknQgV7rw+hr4FPslR3VC6bxMOsWhACn8Xe/OZcz1omXoL/Ol7ltEtEj5
	 Xnvm42I6VOmV47kV+GNbMfe8DNSfDxum0e9uP+P+VK65N6WwygdJzFIdANCh8w5Y0r
	 mz6AjznB8vDvmWWWHggva+c8RvrH5eafQcMYB5vk=
Message-ID: <83085359-c685-4d2c-9302-d3f31d5131b7@arm.com>
Date: Thu, 4 Jun 2026 16:19:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 10/44] arm64: RMI: Add support for SRO
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-11-steven.price@arm.com> <yq5a7bp0szrw.fsf@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <yq5a7bp0szrw.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_081951_889078_9119277F 
X-CRM114-Status: GOOD (  18.31  )
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

On 19/05/2026 07:02, Aneesh Kumar K.V wrote:
> Steven Price <steven.price@arm.com> writes:
> 
>> +static unsigned long donate_req_to_size(unsigned long donatereq)
>> +{
>> +	unsigned long unit_size = RMI_DONATE_SIZE(donatereq);
>> +
>> +	switch (unit_size) {
>> +	case 0:
>> +		return PAGE_SIZE;
>> +	case 1:
>> +		return PMD_SIZE;
>> +	case 2:
>> +		return PUD_SIZE;
>> +	case 3:
>> +		return P4D_SIZE;
>> +	}
>> +	unreachable();
>> +}
>>
>> +
>> +static void rmi_smccc_invoke(struct arm_smccc_1_2_regs *regs_in,
>> +			     struct arm_smccc_1_2_regs *regs_out)
>> +{
>> +	struct arm_smccc_1_2_regs regs = *regs_in;
>> +	unsigned long status;
>> +
>> +	do {
>> +		arm_smccc_1_2_invoke(&regs, regs_out);
>> +		status = RMI_RETURN_STATUS(regs_out->a0);
>> +	} while (status == RMI_BUSY || status == RMI_BLOCKED);
>> +}
>> +
>> +int free_delegated_page(phys_addr_t phys)
>> +{
>> +	if (WARN_ON(rmi_undelegate_page(phys))) {
>> +		/* Undelegate failed: leak the page */
>> +		return -EBUSY;
>> +	}
>> +
>> +	free_page((unsigned long)phys_to_virt(phys));
>> +
>> +	return 0;
>> +}
>> +
>> +static int rmi_sro_ensure_capacity(struct rmi_sro_state *sro,
>> +				   unsigned long count)
>> +{
>> +	if (WARN_ON_ONCE(sro->addr_count > RMI_MAX_ADDR_LIST))
>> +		return -EOVERFLOW;
>> +
>> +	if (count > RMI_MAX_ADDR_LIST - sro->addr_count)
>> +		return -ENOSPC;
>> +
>> +	return 0;
>> +}
>> +
>> +static int rmi_sro_donate_contig(struct rmi_sro_state *sro,
>> +				 unsigned long sro_handle,
>> +				 unsigned long donatereq,
>> +				 struct arm_smccc_1_2_regs *out_regs,
>> +				 gfp_t gfp)
>> +{
>> +	unsigned long unit_size = RMI_DONATE_SIZE(donatereq);
>> +	unsigned long unit_size_bytes = donate_req_to_size(donatereq);
>> +	unsigned long count = RMI_DONATE_COUNT(donatereq);
>> +	unsigned long state = RMI_DONATE_STATE(donatereq);
>> +	unsigned long size = unit_size_bytes * count;
>> +	unsigned long addr_range;
>>
> 
> Looking at above and the related code, I am wondering whether we should
> use u64 instead of unsigned long for everything that the specification
> defines as 64-bit.

I'm split on this. The kernel makes use of "(unsigned) long" for a
register sized value in quite a few places. Not least in struct
arm_smccc_1_2_regs which is ultimately where most of the values are read
from or written to.

I'm not a great fan of the kernel's approach to using long like this -
there's a good argument that uintptr_t is more correct. Equally when
we're in arch code for a 64 bit architecture (i.e. "arm64") then we know
the size is u64.

The disadvantage here is that if I use u64 then there's a bunch of
implicit conversions going on between unsigned long and u64 - which
might come back to bite if anything changes. Hence my current view that
"unsigned long" is the best option here in the kernel.

Anyone else have any view on the best type here?

Thanks,
Steve


