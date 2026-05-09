Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D974ECD343F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 06:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=222u0TR8ykJbpjdx6ftJWd94M2nP9gtMYgy4JYnm4iE=; b=nA79vm3gwBhoeQeYPefz19yExK
	E6tbHQM0KOKdeukriSsCoG9EP1oajFZOeZi1hbNHqKiTWW3q2sVtfo7+CYq8ZijoMbCG0YvdDKpYX
	8pl5A1lNE5sgeOChTcUiPls0P2IQspPcoYRDPsG0yjOyFv96lhZi8IJPA+PhYsdGxnSxXVqXyN/ke
	1JpzpSAuxG0hIwaTqAAISLTvCsAEtA/zyfaolTLgtGqXtFrKoJcGRVyloabvwOJLhCZ0dOwQ8DhFV
	9aA1XNVJLulpYQj3cTHJcL3EqQpSDJY0A2mHIO+faY7z46MSYXgVTNAEGyazqxvVgfaYcOuSfWo8L
	zooSlhkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLb9B-00000008OPf-0PdP;
	Sat, 09 May 2026 06:26:45 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLb96-00000008ONf-0sZO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 06:26:42 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=222u0TR8ykJbpjdx6ftJWd94M2nP9gtMYgy4JYnm4iE=;
	b=JfZ0wHNSutxQ4JXr3jqeJbrODDWkeMm7ZePO6+yJqKQYpo3eFuXkDfXFqSv2+HjDpuAudj1qu
	zyt4T4VgBgcndXxA5jnE3dbLNiRwE65h8PxE/Cn+sYxypdqJQzchZhXAtEazCtNtETPotzAidas
	vtiiQrfFMcX83IhLd8yW4ZE=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4gCG636VYjz12LDB;
	Sat,  9 May 2026 14:19:07 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 79F1F40577;
	Sat,  9 May 2026 14:26:15 +0800 (CST)
Received: from [10.174.179.37] (10.174.179.37) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Sat, 9 May 2026 14:26:14 +0800
Message-ID: <41ffffa8-d02d-31c7-5f2b-f212dbca0f60@huawei.com>
Date: Sat, 9 May 2026 14:26:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 4/4] arm_mpam: Update architecture version check for
 MPAM MSC
Content-Language: en-US
To: Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <wangkefeng.wang@huawei.com>, <xry111@xry111.site>,
	<catalin.marinas@arm.com>, <yang@os.amperecomputing.com>,
	<reinette.chatre@intel.com>, <will@kernel.org>, <thuth@redhat.com>,
	<mrigendra.chaubey@gmail.com>, <fenghuay@nvidia.com>, <ahmed.genidi@arm.com>
References: <20260508162341.3762549-1-james.morse@arm.com>
 <20260508162341.3762549-5-james.morse@arm.com>
 <f3cdc225-110d-497b-9ff9-ebe6c13faf9f@arm.com>
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <f3cdc225-110d-497b-9ff9-ebe6c13faf9f@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.37]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_232640_895506_274361C5 
X-CRM114-Status: GOOD (  14.36  )
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

Hi all,

On 2026/5/9 0:35, Ben Horgan wrote:
> Hi James,
> 
> On 5/8/26 17:23, James Morse wrote:
>> From: Zeng Heng <zengheng4@huawei.com>
>>
>> In addition to updating the CPU MPAM version check, the MPAM MSC version
>> check also need to be updated. mpam_msc_check_aidr() is added to check
>> the MSC AIDR register, ensuring that both the major and minor version
>> numbers fall within the supported range of the MPAM architecture version.
>>
>> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
>> [ morse: changed mpam_msc_check_aidr() to accept versions like v1.2 ]
>> Signed-off-by: James Morse <james.morse@arm.com>
>> ---
>>   drivers/resctrl/mpam_devices.c | 23 ++++++++++++++++++++---
>>   1 file changed, 20 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index 916d8fd45ed5..1771e9712ca2 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -224,6 +224,24 @@ static inline void _mpam_write_monsel_reg(struct mpam_msc *msc, u16 reg, u32 val
>>   
>>   #define mpam_write_monsel_reg(msc, reg, val)   _mpam_write_monsel_reg(msc, MSMON_##reg, val)
>>   
>> +static bool mpam_msc_check_aidr(struct mpam_msc *msc)
>> +{
>> +	u32 aidr = __mpam_read_reg(msc, MPAMF_AIDR);
>> +	u32 major = FIELD_GET(MPAMF_AIDR_ARCH_MAJOR_REV, aidr);
>> +	u32 minor = FIELD_GET(MPAMF_AIDR_ARCH_MINOR_REV, aidr);
>> +
>> +	/*
>> +	 * v0.0 and >v2.x aren't supported, but anything else should be backward
>> +	 * compatible to v0.1 or v1.0.
>> +	 */
>> +	if (!major && !minor)
>> +		return false;
>> +	if (major > 1) >> +		return false;

Would it make sense to introduce a new macro that defines the maximum
supported major version?

~~~
#define MPAM_ARCH_MAJOR_VERSION_MAX    0x1

if (major > MPAM_ARCH_MAJOR_VERSION_MAX)
	return false;
~~~


Best regards,
Zeng Heng

>> +
>> +	return true;
>> +}
>> +
>>   static u64 mpam_msc_read_idr(struct mpam_msc *msc)
>>   {
>>   	u64 idr_high = 0, idr_low;
>> @@ -951,9 +969,8 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
>>   
>>   	lockdep_assert_held(&msc->probe_lock);
>>   
>> -	idr = __mpam_read_reg(msc, MPAMF_AIDR);
>> -	if ((idr & MPAMF_AIDR_ARCH_MAJOR_REV) != MPAM_ARCHITECTURE_V1) { >
> nit: MPAM_ARCHITECTURE_V1 is now unused.
> 
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> 

