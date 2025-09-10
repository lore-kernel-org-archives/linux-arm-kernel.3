Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5ADCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 03:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XixQww98L5jAvwKCT2VbL5/NBlvZpQ2B23MZonkr06Y=; b=Tx70SXhjIHpWQbySqiXG7mB6Ao
	ZwUeKJHN60Etl1AqCCCz+3sdvlJ1vnJgzWfNQ26GIQh+vH4eVIc2T9sqxepREWGaw6SbphMB46X2B
	sps7IaLvws//DKzQBCVwgh9rOin3Am3TbwTy7zdtCTtZ4Y7Jatzr5Owfvp//28OYdy7TPQSpL2GCl
	ocCtV76N65wbvw0zbqFWFUJ78XHtE3hxm5D1Iz+ijMJ5gr9Un0DqfH2JMIhUe1eVX5w995WGRm9HI
	v3yyVmRCWJGShDIN0WJ7YJk1y+T/Mve1Ls/zqB3Bu9JRIeMaFMaAxqa0jhY8TmkWbOHnZG6m3WpB6
	i2LG+I6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwBNa-0000000Boo6-2wo7;
	Wed, 10 Sep 2025 03:20:18 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwBNX-0000000Bolt-0sJT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 03:20:17 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4cM5T141kzz2TT8k;
	Wed, 10 Sep 2025 11:16:53 +0800 (CST)
Received: from kwepemj200003.china.huawei.com (unknown [7.202.194.15])
	by mail.maildlp.com (Postfix) with ESMTPS id 2631D14027A;
	Wed, 10 Sep 2025 11:20:09 +0800 (CST)
Received: from [10.67.120.170] (10.67.120.170) by
 kwepemj200003.china.huawei.com (7.202.194.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 10 Sep 2025 11:20:08 +0800
Message-ID: <f2720f17-5e81-4f69-aaf5-791b47973178@huawei.com>
Date: Wed, 10 Sep 2025 11:20:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] iommu: Add io_ptdump debug interface for iommu
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<yangyicong@huawei.com>, <wangzhou1@hisilicon.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<jonathan.cameron@huawei.com>, <linuxarm@huawei.com>
References: <20250814093005.2040511-1-xiaqinxin@huawei.com>
 <20250902161028.GC184112@ziepe.ca>
From: Qinxin Xia <xiaqinxin@huawei.com>
In-Reply-To: <20250902161028.GC184112@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.170]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemj200003.china.huawei.com (7.202.194.15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_202015_410176_F46BCA7E 
X-CRM114-Status: GOOD (  12.65  )
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



On 2025/9/3 00:10:28, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> On Thu, Aug 14, 2025 at 05:30:03PM +0800, Qinxin Xia wrote:
>> This patch supports the iopgtable_dump function (similar to kernel_page_dump).
>> The IOMMU page table dump debugging function is added to the framework layer.
>> Different architectures only need to provide the implemented dump ops.
>> It also provides the implementation of ARM SMMUv3 and io-pgtable-arm.
>>
>> Qinxin Xia (2):
>>    iommu/debug: Add IOMMU page table dump debug facility
>>    iommu/io-pgtable: Add ARM SMMUv3 page table dump support
> 
> I'd prefer we do this on top of iommu pt please, I don't want to
> further deeping the hole of changing all the page table code in all
> drivers for debugfs.
> 
> Jason
Ok, I see, my colleague Wang Zhou also released a version of io_ptdump
a long time ago, which is implemented in smmu debugfs. Will recommends 
that io_ptdump be implemented in a way similar to CPU page table dump. 
Using debugfs to expose the data and using format-specific callbacks to 
implement specific data dumps, I'll talk to him about this as well.


