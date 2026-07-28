Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B790C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 02:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ASOYmyKNB3RgIhGnkeOzdiUBhyogbI5E8BpZDTM+OM=; b=OJKxQ2v8O74tlHJF9S5J2RvzQS
	9tj93tsduZUtIWm+S1iPpq3RkGl+KyaQKS//NijZuKRheaUul/MOyjv/7Gt/KX81LFmsC/uGoCwhf
	riEt3p74JXPn+ZVX30MIahAHgHZv538UjoWU5qo7T+34Pg/aw5GTXXrGjPGrPpS4uCcimBLvNk/Aj
	F3THa2Hu032LFXHerzo4dqUNmm+ndvMJ/fJ0Dz19+VLmrtoyhkAj5ISt2CXH7b5lu/a9neED2NlWz
	5bYGN7VMAa0DON5S8fUiCV9KigEug6nlmexjDBpCBB5Cs6RLSP7DAZBRYRvrhHf69m6gYsg0nQmE0
	BSZV+XjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woXRs-00000004G1U-1lRg;
	Tue, 28 Jul 2026 02:21:40 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woXRp-00000004G0q-3Fjx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 02:21:40 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=0ASOYmyKNB3RgIhGnkeOzdiUBhyogbI5E8BpZDTM+OM=;
	b=AfwlhHKAm+GHhb8SEtnX2XkCsp7MyPl+wZ8e70crIdO7WCacoF+tvKMOFjn+dzgrXTtazz/c9
	YG7l9+PWbVlPVt1tV9epDu0twtXI42z62XqZb2B71zawtqDUhE+OB/cY5vDmHMCNFDrxyfL0tBA
	lq5b6xRpQMhBkAAV190Hixk=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4h8Jqv2syfz1cySC;
	Tue, 28 Jul 2026 10:11:55 +0800 (CST)
Received: from kwepemj200003.china.huawei.com (unknown [7.202.194.15])
	by mail.maildlp.com (Postfix) with ESMTPS id 2EA6F40565;
	Tue, 28 Jul 2026 10:21:20 +0800 (CST)
Received: from [10.67.120.170] (10.67.120.170) by
 kwepemj200003.china.huawei.com (7.202.194.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 28 Jul 2026 10:21:19 +0800
Message-ID: <4e71a9e4-5e15-4ff7-a137-8ed5b4aba721@huawei.com>
Date: Tue, 28 Jul 2026 10:21:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add debugfs support for ARM SMMUv3
To: Nicolin Chen <nicolinc@nvidia.com>
CC: <robin.murphy@arm.com>, <will@kernel.org>, <jpb@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<wangzhou1@hisilicon.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <jonathan.cameron@huawei.com>,
	<wuyifan50@huawei.com>, <linuxarm@huawei.com>, <linux-kernel@vger.kernel.org>
References: <20260328101706.3448655-1-xiaqinxin@huawei.com>
 <ahY1tY/KL4ynWghX@Asurada-Nvidia>
From: Qinxin Xia <xiaqinxin@huawei.com>
In-Reply-To: <ahY1tY/KL4ynWghX@Asurada-Nvidia>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.170]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemj200003.china.huawei.com (7.202.194.15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_192138_317838_5C237BBE 
X-CRM114-Status: GOOD (  11.83  )
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



On 2026/5/27 08:07:17, Nicolin Chen <nicolinc@nvidia.com> wrote:
> On Wed, May 20, 2026 at 02:37:06PM +0800, Qinxin Xia wrote:
>> Add a comprehensive debugfs framework to the ARM SMMUv3 driver,
>> providing visibility into internal hardware state for debugging
>> and performance analysis. The debugfs entries are organized under
>> /sys/kernel/debug/iommu/arm_smmu_v3/, with per-SMMU instance directories
>> and per-device stream table entries.
>>
>> Each SMMU instance provides:
>> - capabilities – static SMMU features and queue sizes.
>> - registers – SMMU key registers.
>> - stream_table/ – a directory per device with subdirectories per Stream ID.
>>
>> Each Stream ID subdirectory contains:
>> - ste – the Stream Table Entry in decoded and raw format.
>> - cd – all valid Context Descriptors (Stage 1 translation tables) associated with the device.
>> - a symlink named with the device's BDF/name pointing to its sysfs directory for easy navigation.
>>
>> /sys/kernel/debug/iommu/arm_smmu_v3/smmu0/stream_table/
>>      ├── <sid>/
>>      │   ├── ste
>>      │   ├── cd
>>      │   └── <dev_name>
>>
>> Changes since RFCv2:
>>    Address review comments from Nicolin Chen, kernel test robot, and Sashiko
>>    automated review:
> 
> This seems to reuse the same message ID as RFCv2's?
> 
> So, it ended up with attaching to RFCv2, on my side (mutt).
> 
> Sashiko also failed to review against the new patches:
> https://sashiko.dev/#/patchset/20260328101706.3448655-1-xiaqinxin%40huawei.com
> 
> Nicolin
> 

Sorry for the late reply – I've been juggling a few things and missed 
this update earlier.

I'll fold all the fixes into the next spin. Expect v3 soon.:-)

-- 
Thanks,
Qinxin


