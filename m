Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFCCC282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 15:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQuzuPi3dEBxN+dycBQgGTGLRVJwxD4hf+DE7IGKdTg=; b=p9JHYrwUPPzgFfWloSqyQ3VNxk
	X8jOLHJGMNZsk7DGiGOg2CSUQNo3QGHlmd/AAYO9mv0amBKuc93UueY85wXCFyCDtDnITdXLekWbn
	Xf3WzR1bL3EbyBf5ykWQmWTCfg4jCR9v8/WDhhvoX6OgNd2l6fvQ1VdLCcPuVatELoTUcpXBMPmGd
	mirLD52vCku6klEXgXnbdfIHBYR8dL7KLEdv93IGwSjTWlR/OyGe9v9R3K1ZPnwUnAjkpWP9dRoCv
	AXjAad2KbrGayC06I3K8sgu5urTk2MWvDgCmnYm0n5v2g/sB0agrv15K8y8katKhgT9oO+HDUtJ8c
	5qKh4m7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7QH-00000001EUB-484r;
	Mon, 03 Mar 2025 15:09:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7MM-00000001Dck-0xlR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 15:05:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE735106F;
	Mon,  3 Mar 2025 07:05:47 -0800 (PST)
Received: from [10.1.39.33] (e122027.cambridge.arm.com [10.1.39.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE1793F5A1;
	Mon,  3 Mar 2025 07:05:29 -0800 (PST)
Message-ID: <59f84354-e890-48c8-ba06-87dda471f364@arm.com>
Date: Mon, 3 Mar 2025 15:05:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/45] arm64: RME: Add wrappers for RMI calls
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
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
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-6-steven.price@arm.com>
 <8f08b96b-8219-4d51-8f46-bc367bbf2031@redhat.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <8f08b96b-8219-4d51-8f46-bc367bbf2031@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_070534_399915_AEC991D3 
X-CRM114-Status: GOOD (  20.56  )
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

On 03/03/2025 03:42, Gavin Shan wrote:
> On 2/14/25 2:13 AM, Steven Price wrote:
>> The wrappers make the call sites easier to read and deal with the
>> boiler plate of handling the error codes from the RMM.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes from v5:
>>   * Further improve comments
>> Changes from v4:
>>   * Improve comments
>> Changes from v2:
>>   * Make output arguments optional.
>>   * Mask RIPAS value rmi_rtt_read_entry()
>>   * Drop unused rmi_rtt_get_phys()
>> ---
>>   arch/arm64/include/asm/rmi_cmds.h | 508 ++++++++++++++++++++++++++++++
>>   1 file changed, 508 insertions(+)
>>   create mode 100644 arch/arm64/include/asm/rmi_cmds.h
>>
> 
> With the following nitpicks addressed:
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>

Thanks, there were a couple of other pages and params_ptr references
that I've updated to granules and just 'params' too now. With hindsight
conflating pages and granules in the earlier versions of this series was
a big mistake ;)

Steve

>> diff --git a/arch/arm64/include/asm/rmi_cmds.h b/arch/arm64/include/
>> asm/rmi_cmds.h
>> new file mode 100644
>> index 000000000000..043b7ff278ee
>> --- /dev/null
>> +++ b/arch/arm64/include/asm/rmi_cmds.h
>> @@ -0,0 +1,508 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2023 ARM Ltd.
>> + */
>> +
>> +#ifndef __ASM_RMI_CMDS_H
>> +#define __ASM_RMI_CMDS_H
>> +
> 
> [...]
> 
>> +
>> +/**
>> + * rmi_rec_aux_count() - Get number of auxiliary granules required
>> + * @rd: PA of the RD
>> + * @aux_count: Number of pages written to this pointer
>                   ^^^^^^^^^^^^^^^
>                   Number of granules
>> + *
>> + * A REC may require extra auxiliary pages to be delegated for the
>> RMM to
>                                         ^^^^^
>                                         granules
> 
>> + * store metadata (not visible to the normal world) in. This function
>> provides
>> + * the number of pages that are required.
>                     ^^^^^
>                     granules
>> + *
>> + * Return: RMI return code
>> + */
>> +static inline int rmi_rec_aux_count(unsigned long rd, unsigned long
>> *aux_count)
>> +{
>> +    struct arm_smccc_res res;
>> +
>> +    arm_smccc_1_1_invoke(SMC_RMI_REC_AUX_COUNT, rd, &res);
>> +
>> +    if (aux_count)
>> +        *aux_count = res.a1;
>> +    return res.a0;
>> +}
>> +
>> +/**
>> + * rmi_rec_create() - Create a REC
>> + * @rd: PA of the RD
>> + * @rec: PA of the target REC
>> + * @params_ptr: PA of REC parameters
>> + *
>> + * Create a REC using the parameters specified in the struct
>> rec_params pointed
>> + * to by @params_ptr.
>> + *
>> + * Return: RMI return code
>> + */
>> +static inline int rmi_rec_create(unsigned long rd, unsigned long rec,
>> +                 unsigned long params_ptr)
>> +{
>> +    struct arm_smccc_res res;
>> +
>> +    arm_smccc_1_1_invoke(SMC_RMI_REC_CREATE, rd, rec, params_ptr, &res);
>> +
>> +    return res.a0;
>> +}
>> +
> 
> 'params_ptr' may be renamed to 'params'.
> 
> 
> [...]
>> +#endif /* __ASM_RMI_CMDS_H */
> 
> Thanks,
> Gavin
> 


