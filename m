Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9A0F53D69
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 15:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pk+TV8B8ulOBw6RXpe6xSA9kW9b0vww7DdvuUC2T5S0=; b=D8tIx9W+m4y/qHOkabKZwzD7Ai
	8dEraN7cjVcKLgr049SGhNhGI+blakQltoxuPWQjdYjLSg6AEcIotslx1YJoLXizWTZEh+bO1x+ly
	t9jejBylTE7jTahBK8tlIYRJ6937IIEq7WdelWjk8cLjQWXdXXSldDQxOgWbanen1noYCEu95nmHL
	9ZpZkQD/jxSMc/3x6WNyaZE8G20I4dVQB/lFVWKsfW3V9LmGuv9DuUdLjhIKjKVDxiWqVFF24qkzD
	OYFRsQY8TGvK2iOwDpcnl2CY9rflF/mYCHwJDl/yss6gCnZbf/SZnbKq132D8qHqqRInwrkZQjFyE
	ZBPgUzjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29ym-00000004LcU-1M3H;
	Mon, 16 Mar 2026 15:35:40 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29yi-00000004Lb9-42n8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 15:35:39 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=pk+TV8B8ulOBw6RXpe6xSA9kW9b0vww7DdvuUC2T5S0=;
	b=pL4trkp5800SX+0IhS5TOwLDf5PfI76ALJQVmfmFm3Z418aQEt6/C3zKeDatamdYXIKpPfrXU
	jnfUcoJRbMG8DoUWpKsmgqp8kC/S+6BXhwc4YhjSSvPk1BV7qRZukEtfE7/aJbBI/Dlv3oulTRw
	UIVVG1EsEw4iHksL0y1vd1M=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4fZJv65Y4fzKm4J;
	Mon, 16 Mar 2026 23:30:26 +0800 (CST)
Received: from kwepemj200003.china.huawei.com (unknown [7.202.194.15])
	by mail.maildlp.com (Postfix) with ESMTPS id E4AC740565;
	Mon, 16 Mar 2026 23:35:25 +0800 (CST)
Received: from [10.67.120.170] (10.67.120.170) by
 kwepemj200003.china.huawei.com (7.202.194.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 16 Mar 2026 23:35:25 +0800
Message-ID: <1a42d502-a2c4-4c41-ba7e-4dc115159ed6@huawei.com>
Date: Mon, 16 Mar 2026 23:35:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/5] iommu/arm-smmu-v3: Add register display to
 debugfs
To: Robin Murphy <robin.murphy@arm.com>, <will@kernel.org>, <jpb@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<wangzhou1@hisilicon.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <jonathan.cameron@huawei.com>, <linuxarm@huawei.com>
References: <20260313104351.3502293-1-xiaqinxin@huawei.com>
 <20260313104351.3502293-3-xiaqinxin@huawei.com>
 <68add41b-bafa-4884-be70-c03d6ce851eb@arm.com>
From: Qinxin Xia <xiaqinxin@huawei.com>
In-Reply-To: <68add41b-bafa-4884-be70-c03d6ce851eb@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.170]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemj200003.china.huawei.com (7.202.194.15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_083538_038271_915AB783 
X-CRM114-Status: GOOD (  20.52  )
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



On 2026/3/16 23:19:53, Robin Murphy <robin.murphy@arm.com> wrote:
> On 2026-03-13 10:43 am, Qinxin Xia wrote:
>> Add register display functionality to debugfs.This allows reading
>> and displaying key SMMU register values including control registers
>> and queue pointers.
>>
>> The registers file shows:
>> - CR0, CR1, CR2 control registers
>> - Command and Event queue pointers
>>
>> Signed-off-by: Qinxin Xia <xiaqinxin@huawei.com>
>> ---
>>   .../arm/arm-smmu-v3/arm-smmu-v3-debugfs.c     | 68 ++++++++++++++++++-
>>   1 file changed, 67 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c b/ 
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c
>> index 542bd6047f26..f9bf955f3351 100644
>> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c
>> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-debugfs.c
>> @@ -12,11 +12,20 @@
>>    * - Capability reporting covering all major SMMU features and 
>> configuration
>>    * - Extensible architecture designed for adding future debug 
>> functionality
>>    * - Comprehensive error handling and resource cleanup
>> + * - Display of control registers (CR0, CR1, CR2) with bitfield decoding
>> + * - Command and Event queue pointer monitoring (PROD/CONS)
>> + *
>> + * Register Information Displayed:
>> + * - CR0: SMMU global control with enable states and queue enables
>> + * - CR1/CR2: Additional control and configuration registers
>> + * - CMDQ_PROD/CONS: Command queue producer and consumer pointers
>> + * - EVTQ_PROD/CONS: Event queue producer and consumer pointers
>>    *
>>    * Directory Structure:
>>    * /sys/kernel/debug/iommu/arm_smmu_v3/
>>    * └── smmu0/
>> - *     └── capabilities    # SMMU feature capabilities and configuration
>> + *     ├── capabilities    # SMMU feature capabilities and configuration
>> + *     └── registers       # SMMU Key registers
>>    *
>>    * The capabilities file provides detailed information about:
>>    * - Architecture version and translation stage support (Stage1/Stage2)
>> @@ -24,6 +33,11 @@
>>    * - Stream table size and command/event queue depths
>>    * - All feature bits from the SMMU device structure
>>    *
>> + * The register display provides crucial visibility into:
>> + * - SMMU operational state (enabled/disabled)
>> + * - Queue operation and potential stalls
>> + * - Configuration settings affecting all streams
>> + *
>>    * Copyright (C) 2025 HiSilicon Limited.
>>    * Author: Qinxin Xia <xiaqinxin@huawei.com>
>>    */
>> @@ -69,6 +83,54 @@ static int smmu_debugfs_capabilities_show(struct 
>> seq_file *seq, void *v)
>>   }
>>   DEFINE_SHOW_ATTRIBUTE(smmu_debugfs_capabilities);
>> +/**
>> + * smmu_debugfs_registers_show() - Display SMMU register values
>> + * @seq: seq_file to write to
>> + * @v: private data (SMMU device)
>> + *
>> + * Return: 0 on success, negative error code on failure
>> + */
>> +static int smmu_debugfs_registers_show(struct seq_file *seq, void *v)
>> +{
>> +    struct arm_smmu_device *smmu = seq->private;
>> +    void __iomem *base;
>> +
>> +    if (!smmu || !smmu->base) {
>> +        seq_puts(seq, "SMMU not available\n");
>> +        return 0;
>> +    }
>> +
>> +    base = smmu->base;
>> +
>> +    seq_puts(seq, "SMMUv3 Key Registers:\n");
>> +
>> +    /* 32-bit control registers */
>> +    seq_printf(seq, "CR0: 0x%08x [%s%s%s]\n",
>> +           readl_relaxed(base + ARM_SMMU_CR0),
>> +           readl_relaxed(base + ARM_SMMU_CR0) & CR0_SMMUEN ?
>> +           "Enabled " : "Disabled ",
>> +           readl_relaxed(base + ARM_SMMU_CR0) & CR0_EVTQEN ?
>> +           "EventQ " : "",
>> +           readl_relaxed(base + ARM_SMMU_CR0) & CR0_CMDQEN ?
>> +           "CmdQ " : "");
> 
> There's really no point printing these extra strings, since if any of 
> those were *not* enabled then we'd have already failed probe and never 
> created the debugfs entry. And if anyone ever were to be trying to 
> change the driver behaviour at that level, I'd very much expect them to 
> be able to be able to read the bottom 4 bits of a CR0 value in hex 
> anyway ;)
> 
> Thanks,
> Robin.
> 

Since Kunpeng supports ECMDQ(have not been submitted upstream), the
intention was to check whether the SMMU supports ECMDQ, and the logging
for other queues was added incidentally. The prints for the event queue
and command queue indeed seem unnecessary. I will remove them in the
next version.

>> +
>> +    seq_printf(seq, "CR1: 0x%08x\n", readl_relaxed(base + 
>> ARM_SMMU_CR1));
>> +    seq_printf(seq, "CR2: 0x%08x\n", readl_relaxed(base + 
>> ARM_SMMU_CR2));
>> +
>> +    /* 32-bit queue pointer registers */
>> +    seq_printf(seq, "CMDQ_PROD: 0x%08x\n",
>> +           readl_relaxed(base + ARM_SMMU_CMDQ_PROD));
>> +    seq_printf(seq, "CMDQ_CONS: 0x%08x\n",
>> +           readl_relaxed(base + ARM_SMMU_CMDQ_CONS));
>> +    seq_printf(seq, "EVTQ_PROD: 0x%08x\n",
>> +           readl_relaxed(base + ARM_SMMU_EVTQ_PROD));
>> +    seq_printf(seq, "EVTQ_CONS: 0x%08x\n",
>> +           readl_relaxed(base + ARM_SMMU_EVTQ_CONS));
>> +
>> +    return 0;
>> +}
>> +DEFINE_SHOW_ATTRIBUTE(smmu_debugfs_registers);
>> +
>>   /**
>>    * arm_smmu_debugfs_setup() - Initialize debugfs for SMMU device
>>    * @smmu: SMMU device to setup debugfs for
>> @@ -120,6 +182,10 @@ int arm_smmu_debugfs_setup(struct arm_smmu_device 
>> *smmu, phys_addr_t ioaddr)
>>                    &smmu_debugfs_capabilities_fops))
>>           goto err_cleanup;
>> +    if (!debugfs_create_file("registers", 0444, smmu_dir, smmu,
>> +                 &smmu_debugfs_registers_fops))
>> +        goto err_cleanup;
>> +
>>       pr_info("SMMUv3 debugfs initialized for smmu%pa\n", &ioaddr);
>>       return 0;
> 
> 

-- 
Thanks,
Qinxin


