Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6268CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 03:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYr/vR9bJSPqrVBQ6JLNseWrZphnuiEjGvHQjuvKy3Y=; b=F7l2V3SGM8pn4IAeVGMhDswKsg
	eWeQ9l4oHDFPGz/mbcVSq4OgtTCKyixRgu91RT/ChPOaZY+VzM1bPJ47KUQb5tqEWAi/B3d7axYj+
	cbU8FOimZbk9vjASTzsUgQJasfHh716eKq08JoqgzDYhDr4AHkr245VaSVeWgI30g+jA4JEOHOzWg
	wfECTPNZRvP0mKnN2ZbKVix0AFZUUXd/XgrgD8BVgOqUHKqsrByFq1RYJIbnooNBrP8dYmj/E/LFT
	8d7weBmu+yvFPj0ykQa8EgDlOm0JrhvG+Jv8m1fZkVBU9Ile965BH06DoUi7fKXgXuwgDtWt80kpV
	5ueNhQwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIfHw-00000006SdB-3Wes;
	Tue, 11 Nov 2025 03:43:24 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIfHu-00000006Saf-48Et
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 03:43:24 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4d5C534bS2z12LDN;
	Tue, 11 Nov 2025 11:41:43 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id DBDE41401F0;
	Tue, 11 Nov 2025 11:43:15 +0800 (CST)
Received: from kwepemq200004.china.huawei.com (7.202.195.237) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 11 Nov 2025 11:43:15 +0800
Received: from [10.67.121.115] (10.67.121.115) by
 kwepemq200004.china.huawei.com (7.202.195.237) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 11 Nov 2025 11:43:14 +0800
Message-ID: <43558551-5ebc-0987-efdd-880021e7f906@hisilicon.com>
Date: Tue, 11 Nov 2025 11:43:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v7 6/7] KVM: arm64: Enable FEAT_{LS64, LS64_V} in the
 supported guest
Content-Language: en-US
To: Oliver Upton <oupton@kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <maz@kernel.org>,
	<oliver.upton@linux.dev>, <joey.gouly@arm.com>, <suzuki.poulose@arm.com>,
	<yuzenghui@huawei.com>, <arnd@arndb.de>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<yangyccccc@gmail.com>, <prime.zeng@hisilicon.com>, <xuwei5@huawei.com>
References: <20251107072127.448953-1-wangzhou1@hisilicon.com>
 <20251107072127.448953-7-wangzhou1@hisilicon.com>
 <aQ5APpLg0Elv4YoH@kernel.org>
From: Zhou Wang <wangzhou1@hisilicon.com>
In-Reply-To: <aQ5APpLg0Elv4YoH@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.115]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq200004.china.huawei.com (7.202.195.237)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_194323_175900_24B2EB10 
X-CRM114-Status: GOOD (  12.30  )
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

On 2025/11/8 2:53, Oliver Upton wrote:
> Hi Zhou,
> 
> On Fri, Nov 07, 2025 at 03:21:26PM +0800, Zhou Wang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> Using FEAT_{LS64, LS64_V} instructions in a guest is also controlled
>> by HCRX_EL2.{EnALS, EnASR}. Enable it if guest has related feature.
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
> 
> The ordering of this patch is incorrect as patch #5 has the side-effect
> of exposing ID_AA64ISAR1_EL1.LS64 to KVM guests. This one should come
> first instead.
Hi Oliver,

I got this point, will change the order in next version.

Thanks,
Zhou

> 
> Thanks,
> Oliver
> 
>> ---
>>  arch/arm64/include/asm/kvm_emulate.h | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
>> index bab967d65715..29291e25ecfd 100644
>> --- a/arch/arm64/include/asm/kvm_emulate.h
>> +++ b/arch/arm64/include/asm/kvm_emulate.h
>> @@ -695,6 +695,12 @@ static inline void vcpu_set_hcrx(struct kvm_vcpu *vcpu)
>>  
>>  		if (kvm_has_sctlr2(kvm))
>>  			vcpu->arch.hcrx_el2 |= HCRX_EL2_SCTLR2En;
>> +
>> +		if (kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64))
>> +			vcpu->arch.hcrx_el2 |= HCRX_EL2_EnALS;
>> +
>> +		if (kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64_V))
>> +			vcpu->arch.hcrx_el2 |= HCRX_EL2_EnASR;
>>  	}
>>  }
>>  #endif /* __ARM64_KVM_EMULATE_H__ */
>> -- 
>> 2.33.0
>>
>>
> 
> .

