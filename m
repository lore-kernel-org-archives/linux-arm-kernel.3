Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75644C36008
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 08:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+YPgVaFChAfNeehlGafwUtu/GB9A4hsnKmIsbej1+0=; b=ogGh9YDHoLTTmV4sSi7E+wCAjC
	WG1aWUJrt9Us7optz42vvij4EX1G9xuvxdfaPXQs2jmxLqnhJEEagfVHJhf+vgymKlYWO9076l9m/
	qF2DbvIxMwA+PI2mQU75Be9IcG+nZwNkz6JLXtVB3jPHpuO8ww4l/ODNuWSC7XJgkZZryxQkqOGic
	SVXPN3zz6QFq1XSVnlcwqHW7OBi+RQ9VirLb9NgsIMSowXxVBx4bOqTgPBFTXOLKSedZ38SceiS4n
	Y4CWaSe6HjbmMN/s+j2t4DOBX7LehuC8LF8iIEFexYEg+tN0RemwPCdkhwIFOzxlgo0JUBRaYkr8/
	x3P+ikvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyRmU-0000000Evwm-2M3A;
	Sat, 29 Mar 2025 08:43:06 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyRkk-0000000EvrU-1DL8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Mar 2025 08:41:20 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ZPrRG2zpbz1R7Ng;
	Sat, 29 Mar 2025 16:39:22 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 0DDB51800B2;
	Sat, 29 Mar 2025 16:41:11 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sat, 29 Mar 2025 16:41:10 +0800
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <oliver.upton@linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>,
	<shameerali.kolothum.thodi@huawei.com>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <yangyicong@hisilicon.com>,
	Yicong Yang <yangyicong@huawei.com>, Linuxarm <linuxarm@huawei.com>
Subject: Re: [PATCH 2/3] arm64/cpufeature: Add cpucap for HCR_EL2.E2H RES1
 (!FEAT_E2H0)
To: Marc Zyngier <maz@kernel.org>
References: <20250329034409.21354-1-yangyicong@huawei.com>
 <20250329034409.21354-3-yangyicong@huawei.com> <87semwz24p.wl-maz@kernel.org>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <75a93cfd-1e1b-3d8a-9ff0-3991b5ef05cc@huawei.com>
Date: Sat, 29 Mar 2025 16:41:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <87semwz24p.wl-maz@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_014118_691180_8F47BB6B 
X-CRM114-Status: GOOD (  24.33  )
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

On 2025/3/29 16:12, Marc Zyngier wrote:
> On Sat, 29 Mar 2025 03:44:08 +0000,
> Yicong Yang <yangyicong@huawei.com> wrote:
>>
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> Arm introduced a "new" feature FEAT_E2H0 indicates that HCR_EL2.E2H can
>> be programmed to the value 0 for legacy hardwares supported VHE. The
>> feature is indicated by ID_AA64MMFR4_EL1.E2H0 == 0. It is needed to
>> detect this feature for KVM mode initialization. Instead of bothering
>> the existed hardwares, introduce a new cpucap HAS_E2H_RES1 to indicate
>> FEAT_E2H0 is not supported. Make this a ARM64_CPUCAP_SYSTEM_FEATURE
>> just like VHE.
>>
>> Introduce cpu_has_e2h_res1() for checking the feature's support
>> which can be used in the early boot stage where CPU capabilities
>> are not initialized.
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>  arch/arm64/include/asm/cpufeature.h | 23 +++++++++++++++++++++++
>>  arch/arm64/kernel/cpufeature.c      | 12 ++++++++++++
>>  arch/arm64/tools/cpucaps            |  1 +
>>  3 files changed, 36 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
>> index c4326f1cb917..b35d393da28d 100644
>> --- a/arch/arm64/include/asm/cpufeature.h
>> +++ b/arch/arm64/include/asm/cpufeature.h
>> @@ -889,6 +889,29 @@ static inline bool cpu_has_hw_af(void)
>>  						ID_AA64MMFR1_EL1_HAFDBS_SHIFT);
>>  }
>>  
>> +/*
>> + * Check whether FEAT_E2H0 is not supported, in which case HCR_EL2.E2H
>> + * is implemented as RES1.
>> + */
>> +static __always_inline bool cpu_has_e2h_res1(void)
>> +{
>> +	u64 mmfr4;
>> +	u32 val;
>> +
>> +	/*
>> +	 * It's also used for checking the kvm mode cfg in early_param()
>> +	 * where boot capabilities is not initialized. In such case read
>> +	 * mmfr4 directly. This works same after boot stage since
>> +	 * ARM64_HAS_E2H_RES1 is a system feature, the cached sanitised
>> +	 * value keeps same with every single CPU.
>> +	 */
>> +	mmfr4 = read_sysreg_s(SYS_ID_AA64MMFR4_EL1);
> 
> This will result in traps to EL2 with nested. Are you expecting this
> to be used on any form of hot paths?
> 

No. If any use required in the hotpath, check ARM64_HAS_E2H_RES1 by
alternative_has_cap* instead. We cannot check the capabilites in
the early_param() (in early_kvm_mode_cfg()) since they are not initialized,
so we can only rely on the registers directly.

>> +	val = cpuid_feature_extract_signed_field(mmfr4,
>> +						 ID_AA64MMFR4_EL1_E2H0_SHIFT);
>> +
>> +	return val != ID_AA64MMFR4_EL1_E2H0_IMP;
> 
> This is going to break badly on Apple HW, which predate the
> "!FEAT_E2H0" relaxation and yet have HCR_EL2.E2H RAO/WI and
> ID_AA64MMFR4_EL1.E2H0==0.

currently maybe only a wrong declaration of HCR_EL2.E2H RES1 and we can have
a workaround for the apple? considering the only use case of this is in the
early_kvm_mode_cfg() described below.

> 
> The curent code was carefully designed to *avoid* doing this, because
> the kernel doesn't really need to know anything about FEAT_E2H0 apart
> from the very early boot.
> 
> What do we gain with this?
> 

Only one usecase introduced in patch 3/3, avoid triggering the warning on
!E2H0 platforms when booting with "kvm-arm.mode=nvhe". In such case "nvhe"
is inavailable but user has no hint on this, booting with "kvm-arm.mode=nvhe"
will trigger the warn [1]. Need to give some hint if user try to boot with
"nvhe" mode on !FEAT_E2H0 platforms. But we need a ARM64_CPUCAP_SYSTEM_FEATURE
capability to make this feature system wide consistent.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/kvm/arm.c#n2917

Thanks.



