Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0291CC6B00
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 03:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j98bfMfsCWtDp07VFYlUTyTLZgSB6CElM/PsxDfAV+0=; b=4V79yaknomBq4xCOr2TgDpAIkq
	O92T6vWwYy2owqA6rQQmH9gfygIab/cBRfSsnX/B2yjJBo42SV8li8MPRrnq8otl/G1xq4uD1zN4v
	PxB7AWA5f6oUivREprXN/V53s7YeEgKFRXXvC6am0dBYK+0AR2FtjSSwvZgkX/thaSnPfAc9OJu4q
	69pc02gODOymnjoJgFn05QCcFRciwDPmvcKdjXzlmtu6uXDTkuXR1s0vvctKUaARAxMoQnvNF4oqT
	Sa2DUIyl9Vjw581Un8UlDbE6nqLBZcTQr7UQOojN+r91VhAyz+S/Ko/uKvK2o6mfb7KzstUobhUzk
	H6wxDqOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w895r-0000000GgSX-3V3E;
	Thu, 02 Apr 2026 03:51:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w895q-0000000GgSA-0ozX
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 03:51:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=j98bfMfsCWtDp07VFYlUTyTLZgSB6CElM/PsxDfAV+0=; b=WhCROntZvSq4zcixUS61f2xKCu
	0Ge7G4eLaoEAXpnQzePK7Kjb6giYF6rPglNKNntuePKBlI0z8Dw3ilCbQT/iZY8Clgtc0RWeUXD4P
	H7Rfr0W1mQq/aUpl3git9RR8DCbaNg2PGLx1DRjx12OHCYmwusiD3S/jJjBSWSjVgJNP3IwoXzrXV
	gOOXIT2jgjb1nwuK9VBZ6FAuKxrGwm3Poqjv273BkdPfVlZsS5nLnOIoZGIirmVbKAKxD0ZsJS88o
	Veq1Vyr1Oo0Mm2ZhRwsmBN3ZOgnpCoOLM+V/CURq2uFRVhHMhNtqLaCMhiFmvOtJdy9fHgcYm3AnI
	Ypd8PNDQ==;
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w895g-00000001huh-0UIX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 03:51:40 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=j98bfMfsCWtDp07VFYlUTyTLZgSB6CElM/PsxDfAV+0=;
	b=CcFoy4txwoulWUG9kwcJTkGrJpGJbgeSNPUpkz2j+7RRjr5AvKrumdOHsMMcM484IG9mihcx8
	5BbFNwL4vXB2hkUFd2hOy1EK3ivSlTG1f98p/S/alHQR88Ya6gYo2ZJY8zhGFsoQjKDDCgXcwmr
	Fo+G9i7d+7fztiVkZvnsR2o=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fmSRY4fXWz1T4L2;
	Thu,  2 Apr 2026 11:45:13 +0800 (CST)
Received: from kwepemj200003.china.huawei.com (unknown [7.202.194.15])
	by mail.maildlp.com (Postfix) with ESMTPS id 9C27E40569;
	Thu,  2 Apr 2026 11:50:55 +0800 (CST)
Received: from [10.67.120.170] (10.67.120.170) by
 kwepemj200003.china.huawei.com (7.202.194.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 2 Apr 2026 11:50:54 +0800
Message-ID: <b0e67dac-a95f-4b8f-b4c6-3e992b66a780@huawei.com>
Date: Thu, 2 Apr 2026 11:50:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/5] iommu/arm-smmu-v3: Add basic debugfs framework
To: Nicolin Chen <nicolinc@nvidia.com>
CC: <robin.murphy@arm.com>, <will@kernel.org>, <jpb@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<wangzhou1@hisilicon.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <jonathan.cameron@huawei.com>,
	<wuyifan50@huawei.com>, <linuxarm@huawei.com>
References: <20260328101706.3448655-1-xiaqinxin@huawei.com>
 <20260328101706.3448655-2-xiaqinxin@huawei.com> <acpUoZ7wx9gdT5BG@nvidia.com>
From: Qinxin Xia <xiaqinxin@huawei.com>
In-Reply-To: <acpUoZ7wx9gdT5BG@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.170]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemj200003.china.huawei.com (7.202.194.15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_045138_025095_B9DB7D36 
X-CRM114-Status: GOOD (  20.68  )
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



On 2026/3/30 18:46:57, Nicolin Chen <nicolinc@nvidia.com> wrote:
> On Sat, Mar 28, 2026 at 06:17:02PM +0800, Qinxin Xia wrote:
>> Add basic debugfs framework for ARM SMMUv3 driver.This creates the
> 
> Needs a space after "."
> 
>> +static int smmu_debugfs_capabilities_show(struct seq_file *seq, void *unused)
>> +{
>> +	struct arm_smmu_device *smmu = seq->private;
>> +
>> +	if (!smmu) {
>> +		seq_puts(seq, "SMMU not available\n");
>> +		return 0;
>> +	}
>> +
>> +	seq_puts(seq, "SMMUv3 Capabilities:\n");
>> +	seq_printf(seq, "  Stage1 Translation: %s\n",
>> +		   smmu->features & ARM_SMMU_FEAT_TRANS_S1 ? "Yes" : "No");
>> +	seq_printf(seq, "  Stage2 Translation: %s\n",
>> +		   smmu->features & ARM_SMMU_FEAT_TRANS_S2 ? "Yes" : "No");
>> +	seq_printf(seq, "  Coherent Walk: %s\n",
>> +		   smmu->features & ARM_SMMU_FEAT_COHERENCY ? "Yes" : "No");
>> +	seq_printf(seq, "  ATS Support: %s\n",
>> +		   smmu->features & ARM_SMMU_FEAT_ATS ? "Yes" : "No");
>> +	seq_printf(seq, "  PRI Support: %s\n",
>> +		   smmu->features & ARM_SMMU_FEAT_PRI ? "Yes" : "No");
>> +	seq_printf(seq, "  Stream Table Size: %d\n", 1 << smmu->sid_bits);
>> +	seq_printf(seq, "  Command Queue Depth: %d\n",
>> +		   1 << smmu->cmdq.q.llq.max_n_shift);
>> +	seq_printf(seq, "  Event Queue Depth: %d\n",
>> +		   1 << smmu->evtq.q.llq.max_n_shift);
> 
> Nit: should we do all sizes or all depths? Any good reason to mix
> them here?
>

Stream Table is a table, not a queue, so 'Size' is more appropriate; 
queues use 'Depth'. But I can change to unify if preferred.

>> +/**
>> + * arm_smmu_debugfs_remove() - Clean up debugfs entries for an SMMU device
>> + * @smmu: SMMU device
>> + *
>> + * This function removes the debugfs directories created by setup.
>> + */
>> +void arm_smmu_debugfs_remove(struct arm_smmu_device *smmu)
>> +{
>> +	struct arm_smmu_debugfs *debugfs;
>> +
>> +	scoped_guard(mutex, &arm_smmu_debugfs_lock) {
> 
> It could be just normal guard().
> 
>> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>> index 4d00d796f078..cbb3fccc501b 100644
>> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>> @@ -4904,6 +4904,15 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>>   	/* Check for RMRs and install bypass STEs if any */
>>   	arm_smmu_rmr_install_bypass_ste(smmu);
>>   
>> +#ifdef CONFIG_ARM_SMMU_V3_DEBUGFS
>> +	char name[32];
> 
> This could be moved to the top, as iommu_device_sysfs_add() can use
> it, whether CONFIG_ARM_SMMU_V3_DEBUGFS=y or =n.
> 
>> +	snprintf(name, sizeof(name), "smmu3.%pa", &ioaddr);
> 
> And this could be moved after ioaddr gets a copy from res->start.
> 
>>   
>> +#ifdef CONFIG_ARM_SMMU_V3_DEBUGFS
>> +struct arm_smmu_debugfs {
>> +	struct dentry			*smmu_dir;
> 
> A personal preference: for new structures, maybe drop those tabs?
> 
>>   /* An SMMUv3 instance */
>>   struct arm_smmu_device {
>>   	struct device			*dev;
>> @@ -803,6 +813,11 @@ struct arm_smmu_device {
>>   
>>   	struct rb_root			streams;
>>   	struct mutex			streams_mutex;
>> +
>> +#ifdef CONFIG_ARM_SMMU_V3_DEBUGFS
>> +	/* DebugFS Info */
> 
> Doesn't seem very useful. I'd drop it.
> 
>> +	struct arm_smmu_debugfs		*debugfs;
>> +#endif
>   
> Nicolin
> 
-- 
Thanks,
Qinxin


