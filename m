Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4186C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 13:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9HBbWj+cWU9F3KjAKpSwDiEf0EShmH7Gm5YHr46a7Yg=; b=u0cBZyIj4eUPn5FUC0uP04SfTe
	c5NNbElo4pNmXO6kGL4Ndr5X5iGxlz2SkXcI30taOb1eYxUpQ+1qQUB7SWIA0tiqMyxxoF4Fdhab8
	12+lQxPG2QPQw4fFcPAngR50RhgHet1VZxac8QIzqZh7559NSOLL6N12u99esrOLV9BnmXgX2g1ig
	9QJ9/8oHwIK7BcyrPQnq5rsGIX2NV6u/dgHgd5Lpx6kLGZfb8R4qcR8GGYNDtWwi8bE+tD8l05Idj
	c+RlL5C0U0cSIQxRWBcz0XPB8CUU1S+kLx8fod8TRiM0ZflDU+nesXO/+c+gGNhpudAPJWRw+tlUV
	IeGLMwmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJu1l-0000000Am8I-2kmp;
	Tue, 27 May 2025 13:07:33 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJtzc-0000000AldJ-0jnW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 13:05:21 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4b6CVm4T0kz13Lsf;
	Tue, 27 May 2025 21:03:28 +0800 (CST)
Received: from kwepemg100001.china.huawei.com (unknown [7.202.181.18])
	by mail.maildlp.com (Postfix) with ESMTPS id D126C140134;
	Tue, 27 May 2025 21:05:11 +0800 (CST)
Received: from [10.67.121.183] (10.67.121.183) by
 kwepemg100001.china.huawei.com (7.202.181.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 27 May 2025 21:05:11 +0800
Message-ID: <86bcc70b-f41f-45d3-967e-c6190c6ceadd@huawei.com>
Date: Tue, 27 May 2025 21:05:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: Make HCX writable from userspace
To: Oliver Upton <oliver.upton@linux.dev>
CC: <maz@kernel.org>, <yuzenghui@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <wangzhou1@hisilicon.com>,
	<shameerali.kolothum.thodi@huawei.com>, <liuyonglong@huawei.com>,
	<jiangkunkun@huawei.com>
References: <20250325121126.1380681-1-yangjinqian1@huawei.com>
 <Z-LX5H5mjGyTQ9N4@linux.dev>
From: Jinqian Yang <yangjinqian1@huawei.com>
In-Reply-To: <Z-LX5H5mjGyTQ9N4@linux.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.183]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemg100001.china.huawei.com (7.202.181.18)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_060520_365925_475C5278 
X-CRM114-Status: GOOD (  18.00  )
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


> Hi Jinqian,
>
> On Tue, Mar 25, 2025 at 08:11:26PM +0800, Jinqian Yang wrote:
>> Allow userspace to modify guest visible value for HCX in
>> ID_AA64MMFR1_EL1.
>>
>> Signed-off-by: Jinqian Yang <yangjinqian1@huawei.com>
>
> This is fine, but I would rather we handle all the features like FEAT_HCX
> instead of a trickle of one-off patches.
>
> So, could you please:
>
> - Identify all of the features that describe an *EL2* feature which
>   we've exposed to non-nested VMs
>
> - Implement patch(es) to make those fields writable (i.e. allow them to
>   be downgraded)
>
> - Add corresponding test cases to the set_id_regs selftest
>
> Thanks,
> Oliver
>
Hi Oliver，

Thanks for the detailed explantation!

During our testing of cross-generation live migration, we encountered
an issue that requires applying the patch. The problem arises when two
chips have inconsistent FEAT_HCX. To ensure consistent virtual machine
behavior before and after migration, we need to make FEAT_HCX writable,
thereby aligning the feature flags across source and destination hosts.


Above is the context of this patch. I will revise this patch following your
suggestions, but I need to confirm: does the term *EL2* feature specifically
refer to capabilities related to ​​HCRX_EL2​​ and ​​HCR_EL2​​?

Jinqian


>> ---
>>  arch/arm64/kvm/sys_regs.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>> index 82430c1e1dd0..b105f156bdf6 100644
>> --- a/arch/arm64/kvm/sys_regs.c
>> +++ b/arch/arm64/kvm/sys_regs.c
>> @@ -2666,7 +2666,6 @@ static const struct sys_reg_desc 
>> sys_reg_descs[] = {
>>                      ID_AA64MMFR0_EL1_TGRAN16_2 |
>>                      ID_AA64MMFR0_EL1_ASIDBITS)),
>>      ID_WRITABLE(ID_AA64MMFR1_EL1, ~(ID_AA64MMFR1_EL1_RES0 |
>> -                    ID_AA64MMFR1_EL1_HCX |
>>                      ID_AA64MMFR1_EL1_TWED |
>>                      ID_AA64MMFR1_EL1_XNX |
>>                      ID_AA64MMFR1_EL1_VH |
>> -- 
>> 2.33.0
>>
>

