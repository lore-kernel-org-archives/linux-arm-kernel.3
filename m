Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588C7CDDE61
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 10:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KtwreFk2GG4wSEsb0OxFHJlgyYbZgwzSvyL1JYa6zS8=; b=cxlh0SYi17eGiScyDMSN6ndZcH
	OQYV7bNpx08gyIU6ZkDZPLQkTI20mRnyZgCtyyywE0CnCAGk/luVOnJF9jw62Ox5uV191diyRDJfi
	xyoz0BB/ALpY0mKS4BUdtzcCET7lKzjxJZkomx6e5H5ToVTWsU9fuuFogBY52KPJG6KsGGrOEcSlb
	t6/Xm0M77iLCWzbk/HNxNzpz5MSGpUq9fUtAqcRflu79oKyq9GkxqnJLsY17tXB43OxLsdc7E+nxp
	VXDHcL6TqhB/JhE29prU8Im27P0rbs4HVbp9SpRfyD2q7KVLjV18tejbXPrSa6F6w6Q/g5BxFIaCU
	tajxi+uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YpA-0000000E1Mi-18Kq;
	Wed, 23 Oct 2024 10:42:44 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YIE-0000000Dvhn-0JAE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 10:09:11 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4XYPpB0Xjkz10NvM;
	Wed, 23 Oct 2024 18:06:26 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id F3366140259;
	Wed, 23 Oct 2024 18:08:27 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Wed, 23 Oct 2024 18:08:27 +0800
CC: <yangyicong@hisilicon.com>, <will@kernel.org>, <maz@kernel.org>,
	<mark.rutland@arm.com>, <broonie@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <oliver.upton@linux.dev>,
	<ryan.roberts@arm.com>, <linuxarm@huawei.com>, <jonathan.cameron@huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>, <prime.zeng@hisilicon.com>,
	<xuwei5@huawei.com>, <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v3 2/5] arm64: setup: name 'tcr2' register
To: Catalin Marinas <catalin.marinas@arm.com>
References: <20241022092734.59984-1-yangyicong@huawei.com>
 <20241022092734.59984-3-yangyicong@huawei.com> <ZxfY28R4w5ZJmTe5@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <5826454e-0c46-feb6-1495-f0b8ef14872f@huawei.com>
Date: Wed, 23 Oct 2024 18:08:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <ZxfY28R4w5ZJmTe5@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_030842_682681_80576A61 
X-CRM114-Status: GOOD (  19.12  )
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

On 2024/10/23 0:54, Catalin Marinas wrote:
> On Tue, Oct 22, 2024 at 05:27:31PM +0800, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> TCR2_EL1 introduced some additional controls besides TCR_EL1. Currently
>> only PIE is supported and enabled by writing TCR2_EL1 directly if PIE
>> detected.
>>
>> Introduce a named register 'tcr2' just like 'tcr' we've already had.
>> It'll be initialized to 0 and updated if certain feature detected and
>> needs to be enabled. Touch the TCR2_EL1 registers at last with the
>> updated 'tcr2' value if FEAT_TCR2 supported by checking
>> ID_AA64MMFR3_EL1.TCRX. Then we can extend the support of other features
>> controlled by TCR2_EL1.
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>  arch/arm64/mm/proc.S | 12 ++++++++++--
>>  1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
>> index 8abdc7fed321..ccbae4525891 100644
>> --- a/arch/arm64/mm/proc.S
>> +++ b/arch/arm64/mm/proc.S
>> @@ -465,10 +465,12 @@ SYM_FUNC_START(__cpu_setup)
>>  	 */
>>  	mair	.req	x17
>>  	tcr	.req	x16
>> +	tcr2	.req	x15
>>  	mov_q	mair, MAIR_EL1_SET
>>  	mov_q	tcr, TCR_T0SZ(IDMAP_VA_BITS) | TCR_T1SZ(VA_BITS_MIN) | TCR_CACHE_FLAGS | \
>>  		     TCR_SHARED | TCR_TG_FLAGS | TCR_KASLR_FLAGS | TCR_ASID16 | \
>>  		     TCR_TBI0 | TCR_A1 | TCR_KASAN_SW_FLAGS | TCR_MTE_FLAGS
>> +	mov	tcr2, xzr
>>  
>>  	tcr_clear_errata_bits tcr, x9, x5
>>  
>> @@ -525,11 +527,16 @@ alternative_else_nop_endif
>>  #undef PTE_MAYBE_NG
>>  #undef PTE_MAYBE_SHARED
>>  
>> -	mov	x0, TCR2_EL1x_PIE
>> -	msr	REG_TCR2_EL1, x0
>> +	orr	tcr2, tcr2, TCR2_EL1x_PIE
>>  
>>  .Lskip_indirection:
>>  
>> +	mrs_s	x1, SYS_ID_AA64MMFR3_EL1
>> +	ubfx	x1, x1, #ID_AA64MMFR3_EL1_TCRX_SHIFT, #4
>> +	cbz	x1, 1f
>> +	msr	REG_TCR2_EL1, tcr2
>> +1:
> 
> It makes sense to mimic the TCR_EL1 configuration here with a single MSR
> at the end.
> 
> I was wondering whether to simply check if the tcr2 reg (x15) is
> non-zero under the assumption that bits in it would only be set if the
> features are present (and those features imply TCRX). However, we can
> set RES0 bits in here even if the feature is not supported in hardware
> (more on the next patch).
> 
> So I think this patch is ok as is.
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> .

Thanks.


