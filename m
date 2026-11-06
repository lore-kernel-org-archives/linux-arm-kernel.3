Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14913606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=juqT+E6n;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=h53tQAGQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SxUZdl1nxNmZdMNHl/mAId5VPOOSyhyBaIunfeJwQ5s=; b=juqT+E6nPBffrr
	Rx+0aspU2d1SgvphgWmSz2ALovNuWZWvyW6IRBSOfpgEPUQmrcmgHv+KwcVy3rMooKH5TCAqapj1h
	tHPKAqYL7tu/Nb+bNx0ZOpoVTG9PAYVO4aQ0K+uv7IN9eJHXF3eY0LHzREH7LGOKydX9mE3jiwFiX
	+u1MY0bLY5qYrSmLPHMd2YFt5k3SWKTLSl38JOPUEYSYD2uktSbBVJADkIFUigbwFnCY8+O36wGSO
	rsLeiuys38I6a9hOkaxTX5S06Uo2PAUKe1Jdk7secCjrm5DVi71J7pvSV3x8xdfXHZA/bE8raU1CX
	qTczS3zbDEJlZLpN4a1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHAX-0000000BvYE-1WzA;
	Fri, 06 Nov 2026 10:27:37 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHAT-0000000BvWN-0aZW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 10:27:35 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=SxUZdl1nxNmZdMNHl/mAId5VPOOSyhyBaIunfeJwQ5s=;
	b=h53tQAGQkAc6oUDOj1QWs7jrAmp3A7l4aeZkvG4ny3FjBaa0BPtLnE9b1YH4Wi3QdvU+wQqJU
	R/iZycLsdkiiUeQ73aC4bqFkUWlwU65f0HQ+xed9nr0AW0Rx9rnG98M0+I7MjNm+oGkad21luYh
	jTSKQsEtgoATxj4BULMkQB0=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4jLb2X2gsXzpSwn;
	Fri,  6 Nov 2026 18:27:00 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 0467B4063F;
	Fri,  6 Nov 2026 18:27:29 +0800 (CST)
Received: from [10.67.120.103] (10.67.120.103) by
 kwepemr100010.china.huawei.com (7.202.195.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 6 Nov 2026 18:27:27 +0800
Message-ID: <5a096cca-713a-4449-83dc-c763dc06c085@huawei.com>
Date: Fri, 6 Nov 2026 18:27:27 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/15] KVM: arm64: Add HDBSS buffer size ioctl for
 dirty-bitmap mode
To: Leonardo Bras <leo.bras@arm.com>
CC: <maz@kernel.org>, <oupton@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <corbet@lwn.net>, <pbonzini@redhat.com>,
	<yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>, <yangjinqian1@huawei.com>,
	<caijian11@h-partners.com>, <liuyonglong@huawei.com>,
	<tangchengchang@huawei.com>, <yezhenyu2@huawei.com>, <yubihong@huawei.com>,
	<linuxarm@huawei.com>, <joey.gouly@arm.com>, <kvmarm@lists.linux.dev>,
	<kvm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <seiden@linux.ibm.com>,
	<suzuki.poulose@arm.com>, <fuad.tabba@linux.dev>, <mark.rutland@arm.com>,
	<seanjc@google.com>, <rdunlap@infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <skhan@linuxfoundation.org>
References: <20260929103655.85107-1-zhengtian10@huawei.com>
 <20260929103655.85107-14-zhengtian10@huawei.com> <auioRICO9Frhk-zT@LeoBrasDK>
From: Tian Zheng <zhengtian10@huawei.com>
In-Reply-To: <auioRICO9Frhk-zT@LeoBrasDK>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_022733_806392_E29DDBEC 
X-CRM114-Status: GOOD (  19.66  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/2/2026 11:12 PM, Leonardo Bras wrote:
> On Tue, Sep 29, 2026 at 06:36:53PM +0800, Tian Zheng wrote:
>> In dirty-bitmap mode, a larger HDBSS buffer lets the guest dirty more
>> pages between VM exits, at the cost of memory. The default of one page
>> per vCPU is a reasonable starting point, so allow userspace to opt
>> into a larger buffer via KVM_CAP_ARM_HDBSS_BUFFER_SIZE.
>>
>> The size is specified in bytes through KVM_ENABLE_CAP and must be a
>> power of two in [PAGE_SIZE, SZ_2M]: the upper bound is the largest
>> HDBSSBR_EL2.SZ encoding, and the power-of-two requirement matches the
>> buddy allocator. It must be set before any vCPU is created: -EINVAL
>> after vCPUs exist, -EBUSY if already set.
>>
>> The capability is rejected in dirty-ring mode, where the size is
>> pinned by kvm_arch_dirty_ring_size_updated().
>>
>> KVM_CHECK_EXTENSION returns the configured size for a VM, or SZ_2M
>> when queried globally with a NULL kvm.
>>
>> Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
>> ---
>>   arch/arm64/kvm/arm.c     | 34 ++++++++++++++++++++++++++++++++++
>>   include/uapi/linux/kvm.h |  1 +
>>   2 files changed, 35 insertions(+)
>>
>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>> index 5a7046acb62e..eadbf3a88d31 100644
>> --- a/arch/arm64/kvm/arm.c
>> +++ b/arch/arm64/kvm/arm.c
>> @@ -19,6 +19,7 @@
>>   #include <linux/kvm.h>
>>   #include <linux/kvm_irqfd.h>
>>   #include <linux/irqbypass.h>
>> +#include <linux/log2.h>
>>   #include <linux/sched/stat.h>
>>   #include <linux/psci.h>
>>   #include <trace/events/kvm.h>
>> @@ -203,6 +204,31 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
>>   		r = 0;
>>   		set_bit(KVM_ARCH_FLAG_EXIT_SEA, &kvm->arch.flags);
>>   		break;
>> +	case KVM_CAP_ARM_HDBSS_BUFFER_SIZE: {
>> +		u64 size = cap->args[0];
>> +
>> +		if (!system_supports_hdbss())
>> +			break;
>> +		if (kvm->dirty_ring_size)
>> +			break;
>> +		if (size < KVM_ARM_HDBSS_DEFAULT_SIZE ||
>> +		    size > KVM_ARM_HDBSS_MAX_SIZE)
>> +			break;
>> +		if (!is_power_of_2(size))
>> +			break;
>> +
>> +		mutex_lock(&kvm->lock);
>> +		if (kvm->created_vcpus) {
>> +			r = -EINVAL;
>> +		} else if (kvm->arch.hdbss_buffer_size) {
>> +			r = -EBUSY;
>> +		} else {
>> +			kvm->arch.hdbss_buffer_size = size;
>> +			r = 0;
>> +		}
>> +		mutex_unlock(&kvm->lock);
>> +		break;
>> +	}
>>   	default:
>>   		break;
>>   	}
>> @@ -500,6 +526,14 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>>   		else
>>   			r = KVM_ARM_EAGER_SPLIT_CHUNK_SIZE_DEFAULT;
>>   		break;
>> +	case KVM_CAP_ARM_HDBSS_BUFFER_SIZE:
>> +		if (!system_supports_hdbss())
>> +			r = 0;
>> +		else if (kvm)
>> +			r = kvm->arch.hdbss_buffer_size ?: KVM_ARM_HDBSS_DEFAULT_SIZE;
> 
> This whole thing of allowing hdbss_buf_size to be set only once makes
> everything more complex. Why do we have this limitation again?
> 
> I mean, if we want to restrict size changes after the first hdbss buffer
> gets allocated, it makes sense, other than that, I would like to understand
> the reason for that.
> 
> Thanks!
> Leo

Hi Leo,

You're right, I re-examined the whole flow and the "set once"
restriction isn't actually needed. I'll remove it.

Thanks,
Tian


