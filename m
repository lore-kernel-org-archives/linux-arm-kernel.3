Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D8AF53D67
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 15:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CXrgJ1GDap1aR44wHMv8maP7GiD3gazvQ5TCxA0JKV0=; b=utfuJkSdwSFIR+pi1O9plt7Zlu
	arFE1Ff1+9hFVfVDXhdbG7kQo2Y+S3+gNbGQU9G6dr6h7BMABnF9KDTGqS8ptZ6JvBoeCLrN1FChi
	yoc6psNNcx+BqcVomXSkW5wd/bIoAROYPx94IAEbvYQxyx4MdNc2XqP4q0lIWQTHjzti9aJgGBNBX
	FmwvM8WVjfJe8cEoWhsWS56HK1GKIWR/kPjJ4GjK5/Cx9fFBlVLSASlwdlWl9Pp4kPOQTh6hKOOuz
	t9cczvy/DMEG3dpx1fEKaS6fx/4pSpa4cVvc7UJUEGmvdtJQ+Y2L+a+iSsYuoxTsr0LqrdhuqL83i
	8bj6BBOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29ed-00000004Iqy-39yW;
	Mon, 16 Mar 2026 15:14:51 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29eZ-00000004IoY-2wCw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 15:14:50 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=CXrgJ1GDap1aR44wHMv8maP7GiD3gazvQ5TCxA0JKV0=;
	b=ePTVP7UTKr/u1blYNMIAYCir6lFMeiypDTn3T9F0/R8RGyVS9e88rAr7ltDgUcaMwlPTJj8TW
	Puin0mabrkwqFd8nv7GgpRHjrnWSTc+MutGgrIf6uesATw8mQtNBNe++ufbVIgG6qZof5X6ocou
	u+tdMUIqCCxEnJIZ7ikNjwY=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4fZJR15pXSz1prL7;
	Mon, 16 Mar 2026 23:09:33 +0800 (CST)
Received: from kwepemj200003.china.huawei.com (unknown [7.202.194.15])
	by mail.maildlp.com (Postfix) with ESMTPS id 872604056B;
	Mon, 16 Mar 2026 23:14:34 +0800 (CST)
Received: from [10.67.120.170] (10.67.120.170) by
 kwepemj200003.china.huawei.com (7.202.194.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 16 Mar 2026 23:14:33 +0800
Message-ID: <aad9e947-402e-454a-90fc-59c8848a55a0@huawei.com>
Date: Mon, 16 Mar 2026 23:14:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/5] iommu/arm-smmu-v3: Add basic debugfs framework
To: Nicolin Chen <nicolinc@nvidia.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <jpb@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<wangzhou1@hisilicon.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <jonathan.cameron@huawei.com>, <linuxarm@huawei.com>
References: <20260313104351.3502293-1-xiaqinxin@huawei.com>
 <20260313104351.3502293-2-xiaqinxin@huawei.com>
 <abRsdCYapDe16GtJ@Asurada-Nvidia>
From: Qinxin Xia <xiaqinxin@huawei.com>
In-Reply-To: <abRsdCYapDe16GtJ@Asurada-Nvidia>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.170]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemj200003.china.huawei.com (7.202.194.15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_081448_977420_BDF8AAC4 
X-CRM114-Status: GOOD (  17.58  )
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



On 2026/3/14 03:58:44, Nicolin Chen <nicolinc@nvidia.com> wrote:
> On Fri, Mar 13, 2026 at 06:43:47PM +0800, Qinxin Xia wrote:
>> +/**
>> + * smmu_debugfs_capabilities_show() - Display SMMU capabilities
>> + * @seq: seq_file to write to
>> + * @v: private data (SMMU device)
> 
> @v is not used
> 
>> +
>> +/**
>> + * arm_smmu_debugfs_setup() - Initialize debugfs for SMMU device
>> + * @smmu: SMMU device to setup debugfs for
>> + * @ioaddr: Physical base address of the SMMU device registers
>> + *
>> + * This function creates the basic debugfs directory structure for a SMMU device.
> 
> nit: an SMMU
> 
> Or maybe simply "@smmu"
> 
>> + *
>> + * Return: 0 on success, negative error code on failure
>> + */
>> +int arm_smmu_debugfs_setup(struct arm_smmu_device *smmu, phys_addr_t ioaddr)
>> +{
>> +	struct arm_smmu_debugfs *debugfs;
>> +	struct dentry *smmu_dir;
>> +	char name[32];
>> +	int ret;
>> +
>> +	/* Create root directory if it doesn't exist */
>> +	mutex_lock(&arm_smmu_debugfs_lock);
>> +	if (!smmuv3_root_dir) {
>> +		smmuv3_root_dir = debugfs_create_dir("arm_smmu_v3",
>> +						     iommu_debugfs_dir);
>> +		if (!smmuv3_root_dir) {
>> +			mutex_unlock(&arm_smmu_debugfs_lock);
>> +			return -ENOMEM;
>> +		}
>> +	}
>> +	mutex_unlock(&arm_smmu_debugfs_lock);
>> +
>> +	/* Allocate debugfs structure */
>> +	debugfs = kzalloc(sizeof(*debugfs), GFP_KERNEL);
> 
> kzalloc_obj(*debugfs)
> 
>> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>> index 4d00d796f078..211a0c87507a 100644
>> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>> @@ -33,6 +33,10 @@
>>   #include "arm-smmu-v3.h"
>>   #include "../../dma-iommu.h"
>>   
>> +#ifdef CONFIG_ARM_SMMU_V3_DEBUGFS
>> +static unsigned int arm_smmu_present;
>> +#endif
> 
> Unused
> 
>> @@ -4909,6 +4913,12 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		goto err_disable;
>>   
>> +#ifdef CONFIG_ARM_SMMU_V3_DEBUGFS
>> +	ret = arm_smmu_debugfs_setup(smmu, ioaddr);
>> +	if (ret)
>> +		dev_warn(dev, "Failed to create debugfs!\n");
>> +#endif
>> +
>>   	/* And we're up. Go go go! */
>>   	ret = iommu_device_sysfs_add(&smmu->iommu, dev, NULL,
>>   				     "smmu3.%pa", &ioaddr);
> 
> Since name is all we wanted, maybe follow iommu_device_sysfs_add()
> by passing in:
>     "const char *name, ..." instead of "phys_addr_t ioaddr"
> 
>> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
>> index 3c6d65d36164..247f27426f6b 100644
>> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
>> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
>> @@ -733,6 +733,15 @@ struct arm_smmu_impl_ops {
>>   			  const struct iommu_user_data *user_data);
>>   };
>>   
>> +#ifdef CONFIG_ARM_SMMU_V3_DEBUGFS
>> +struct arm_smmu_debugfs {
>> +	struct dentry *root_dir;
> 
> Unused
> 
>> +	struct dentry *smmu_dir;
>> +	struct arm_smmu_device *smmu;
> 
> Unused
> 
> Nicolin
> 

I'll delete the unuse variable, but I'll keep this struct there for
extensions.
-- 
Thanks,
Qinxin


