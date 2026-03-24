Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0642EF532C0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 01:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/roqlaxdiFnJGWNHZnkt15qiKJnl2bsx2ss6szTsrY=; b=rmMsnm0oPew3yIi2WuJ+p9YcOL
	P+gRQNpltvOG5TOOBXgcuCyvUtxtQ0apNGC4IGBf3Z40IHKcxbaXdenRutVKJe+fJh4U1UAljNRBZ
	vJVsMCH5KkM9QpKAcfF2k643Th1yDXVIBVtAK903CyNF2iyJ/uD1IRk1Us0JO1yeeUgAq5stIP72S
	CmEcr1lGzwILeB5VbhMjO11o/uTU6DbMeSCxdnRw6O5U0GfNCbuaqVYUlAIeqduo2xoFJc/4Ovgan
	MZx1WrYT+VzyF/HShfSSuVpGsUBNF0gA1VkxWZEhU5Cnwh+x5/EkkhhLlsYxj5HWCi9tjgobw4TpG
	tQMk7z7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4qwp-00000000KyS-13xh;
	Tue, 24 Mar 2026 01:52:47 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4qwm-00000000KxA-0vaZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 01:52:45 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=5/roqlaxdiFnJGWNHZnkt15qiKJnl2bsx2ss6szTsrY=;
	b=uD8lDVgTvzVReoD0EYD3G6BcGUCdQoytjSExmxjAF40Bi2Q89TSdr6jAwqzCCe04+NWnlTpHK
	F3kXoEpup5dn9dycnblIIi3NI//7OOzBjPPIOEpl9AfYkwRC41ApKu0H1FlWczMuf4X6dCqNlQq
	eQ+lS2Gl0MufGCRbq7WdOtc=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4fftFP6xLNz12LDY;
	Tue, 24 Mar 2026 09:47:05 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 11C654056B;
	Tue, 24 Mar 2026 09:52:34 +0800 (CST)
Received: from [10.67.120.222] (10.67.120.222) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 24 Mar 2026 09:52:33 +0800
Message-ID: <64f498fe-a109-482b-bb49-339a4bc6210d@huawei.com>
Date: Tue, 24 Mar 2026 09:52:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch 8/9] selftests/resctrl: Add support for HiSilicon
 MBM/MBA test
To: Reinette Chatre <reinette.chatre@intel.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<shuah@kernel.org>, <tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>,
	<ben.horgan@arm.com>, <jonathan.cameron@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20260304040334.765860-1-wuyifan50@huawei.com>
 <20260304040334.765860-9-wuyifan50@huawei.com>
 <c0bf5728-55b5-46e5-aced-4f856144f746@intel.com>
 <76186614-aa16-4a73-8fa9-059bb0a70486@huawei.com>
 <27737fa5-0f32-48df-b9e4-cce8e7cdd18e@intel.com>
From: wuyifan <wuyifan50@huawei.com>
In-Reply-To: <27737fa5-0f32-48df-b9e4-cce8e7cdd18e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.222]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_185244_451080_E2E2CF2E 
X-CRM114-Status: GOOD (  12.70  )
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

Hi Reinette,

On 3/23/2026 11:52 PM, Reinette Chatre wrote:
> Hi Yifan,
>
> On 3/23/26 2:19 AM, wuyifan wrote:
>> Hi Reinette,
>>
>> On 3/13/2026 5:01 AM, Reinette Chatre wrote:
>>> Which baseline exposes MB_MON in resctrl?
>>>
>>> Reinette
>> In the MPAM architecture reference manual, the memory-system component
>> includes the cache and memory channel controller, among others. The memory
>> channel controller can implement a memory bandwidth usage monitor.
>> I noticed that arm_mpam maps other classes to l3 in the resctrl glue code,
>> so I will fix this in the next version.
> Were these tests written against a spec as opposed to the actual MPAM enabling
> code? How could it have been tested?
>
> Reinette
Oh, I should add that the current Linux arm_mpam resctrl glue code is
still under review and has not been merged. Therefore, this RFC is based
on the Linux distribution OS test, so please ignore this issue. I will
remove this in the next version.

Regards,
Yifan Wu

