Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4998DCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 02:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFoto0CQ6rg+RgoG9007lSvv//zhS03O/RO7gbpH3X4=; b=26pDo6TTTNnvc+2U2FgP8NyeL+
	v0q3kZbWK5kz2DCRAAWdGT+FAhFkpZZSqFjv25dl2wad897gFbEE+cbbL2/Xj3ASBFymMYQMXfiwn
	9HbUXSkNs4kmdI38QKv2yv8SCzcoHgftijT7g95YlkGtKH/J0qYFC0PoaGRlrxejoeQcw3Uw8WcpH
	uNOKB7rslZgjBbk8auagZcEZ0KEctaAJBq5F300SGZ+eoYmexRuHKd7HFHZJdGAjYfEsEbj9fKfXv
	QrApykTtWzafQaFZNcfKnyUjAjrsXWVq2XdvnWMZQP7yLD2go6qA9oyixmZsoVVUgU0KM6i69gDle
	zNUIn/Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLAvm-00000005Lx9-05gb;
	Fri, 08 May 2026 02:27:10 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLAvi-00000005LwB-3QBf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 02:27:09 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=FFoto0CQ6rg+RgoG9007lSvv//zhS03O/RO7gbpH3X4=;
	b=jWrlmnmPbPCBH38GdvP9OjZDfpJAb5gtkciJKDHVW4JDUnXGYrOUpKSFIK0BUZi+7xHCyDm6D
	9UHYbhivy+AXbnKfpk0Iibww2bQrUNU2zA9Ev0cdxtfs5jpFS7NQIpXDrRicevq8Z17DR+OOauT
	9lOgp1is9lkbt6BK8mcueSI=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4gBXqr3mVlz1cyQr;
	Fri,  8 May 2026 10:19:20 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 1C7254055B;
	Fri,  8 May 2026 10:26:53 +0800 (CST)
Received: from [10.174.179.37] (10.174.179.37) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Fri, 8 May 2026 10:26:51 +0800
Message-ID: <01ef61ca-7ba7-b282-7ec6-b1df5c301aa5@huawei.com>
Date: Fri, 8 May 2026 10:26:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/2] arm_mpam: Update architecture version check for
 MPAM MSC
Content-Language: en-US
To: James Morse <james.morse@arm.com>, <ben.horgan@arm.com>,
	<xry111@xry111.site>, <catalin.marinas@arm.com>, <maz@kernel.org>,
	<ardb@kernel.org>, <yang@os.amperecomputing.com>, <ryan.roberts@arm.com>,
	<kevin.brodsky@arm.com>, <reinette.chatre@intel.com>,
	<miko.lenczewski@arm.com>, <will@kernel.org>, <suzuki.poulose@arm.com>,
	<thuth@redhat.com>, <james.clark@linaro.org>, <lpieralisi@kernel.org>,
	<broonie@kernel.org>, <oupton@kernel.org>, <anshuman.khandual@arm.com>,
	<yeoreum.yun@arm.com>, <leo.yan@arm.com>, <mrigendra.chaubey@gmail.com>,
	<fenghuay@nvidia.com>, <ahmed.genidi@arm.com>, <mark.rutland@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<wangkefeng.wang@huawei.com>
References: <20260203095406.6437-1-zengheng4@huawei.com>
 <20260203095406.6437-3-zengheng4@huawei.com>
 <b9900d7a-eaaf-4f1a-b79e-aa968a7b6e29@arm.com>
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <b9900d7a-eaaf-4f1a-b79e-aa968a7b6e29@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.37]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_192707_472354_B8A9F2B0 
X-CRM114-Status: GOOD (  20.60  )
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

Hi James,

On 2026/5/8 0:03, James Morse wrote:
> Hi Zeng,
> 
> On 03/02/2026 09:54, Zeng Heng wrote:
>> In addition to updating the CPU MPAM version check, the MPAM MSC version
>> check also need to be updated. mpam_msc_check_aidr() is added to check
>> the MSC AIDR register, ensuring that both the major and minor version
>> numbers fall within the supported range of the MPAM architecture version.
> 
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index 744df3a6a078..a58031f0a280 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -202,6 +202,17 @@ static inline void _mpam_write_monsel_reg(struct mpam_msc *msc, u16 reg, u32 val
>>   
>>   #define mpam_write_monsel_reg(msc, reg, val)   _mpam_write_monsel_reg(msc, MSMON_##reg, val)
>>   
>> +static bool mpam_msc_check_aidr(struct mpam_msc *msc)
>> +{
>> +	u32 rev;
>> +
>> +	rev = __mpam_read_reg(msc, MPAMF_AIDR) & MPAMF_AIDR_ARCH_REV;
>> +
>> +	return rev == MPAM_ARCHITECTURE_V0_1 ||
>> +	       rev == MPAM_ARCHITECTURE_V1_0 ||
>> +	       rev == MPAM_ARCHITECTURE_V1_1;
>> +}
>> +
>>   static u64 mpam_msc_read_idr(struct mpam_msc *msc)
>>   {
>>   	u64 idr_high = 0, idr_low;
>> @@ -842,9 +853,8 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
>>   
>>   	lockdep_assert_held(&msc->probe_lock);
>>   
>> -	idr = __mpam_read_reg(msc, MPAMF_AIDR);
>> -	if ((idr & MPAMF_AIDR_ARCH_MAJOR_REV) != MPAM_ARCHITECTURE_V1) {
>> -		dev_err_once(dev, "MSC does not match MPAM architecture v1.x\n");
> 
> This deliberately only checks the major number. (The MSC architecture always had a
> major and minor number). Before your change, MPAM v1.2 is supported, after we'd
> get an error for a MPAM v1.2 MSC. (if such a thing exists)
> 
> I think its simpler to rule out the unsupported combinations, something like:
> | static bool mpam_msc_check_aidr(struct mpam_msc *msc)
> | {
> | 	u32 rev;
> |
> | 	rev = __mpam_read_reg(msc, MPAMF_AIDR) & MPAMF_AIDR_ARCH_REV;
> |
> | 	 /*
> | 	 * v0.0 and >v2.x aren't supported, but anything else should be backward
> |	 * compatible to v0.1 or v1.0.
> |	 */
> | 	if (!rev)
> | 		return false;
> | 	if (rev & MPAMF_AIDR_ARCH_MAJOR_REV > MPAM_ARCHITECTURE_V1)
> | 		return false;
> |
> | 	return true;
> | }
> 
>> +	if (!mpam_msc_check_aidr(msc)) {
>> +		dev_err_once(dev, "MSC does not match MPAM architecture\n");
>>   		return -EIO;
>>   	}
> 
> I'd like to keep the 'v1.x' in this message - this should help folk with old stable
> kernels running on new hardware work out why the feature isn't available.
> (assuming they have some documentation that says v2.0 in it!)
> 
> I've rebased this with the above changes, which I'll post shortly for fixes.
> 
> 

Agreed. Keep the backward compatibility extension for versions
(compatible with v0.x(x>0) and 1.x), and remove the redundant
MPAM_ARCHITECTURE_Vx_x macro definitions.

I've verified locally that everything works fine.


Best regards,
Zeng Heng

