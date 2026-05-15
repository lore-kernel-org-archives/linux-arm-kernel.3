Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EA2CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 10:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AsUycJ+zCiYZK5tBYyxZukzAw+VPDch/p8Fmpkqu1Ck=; b=obDF+ZpT+aamrvAZQzl8hYW2OR
	ThLu9OWhjjRnqOik0Ad8A1Ke+WCekwavi+D8X/0IOv3DkKGTXKccD9uc1iHNOWYkqbYedC9pDg+AF
	4LP05j/1iZgf+lj1Ozzl1UIIOO7ZFTCzJYORkKzm08HkvgBIygCZJ69uJqJWENNoUVoyzWgMg8utl
	URbo8fFVh8p4UeVWz4b7UaBxzUoxdC7u7cbKCJ5aD5uksNh8031JNj/j1o6mOQdbf1uZ3AvPL5XBk
	7szqz2YLEJNkrHn/AxYR2KtWYVtztzBtZ5WfW4QFrC/J7lFnZwyEPpRW5ZbDdgKxptw3VDW2/GASG
	OFNixyOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNpqQ-000000083eI-3Fr3;
	Fri, 15 May 2026 10:32:38 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNpqO-000000083ag-006f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 10:32:37 +0000
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4gH3Gn6NKmzLlTv;
	Fri, 15 May 2026 18:24:49 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id C2DA44056C;
	Fri, 15 May 2026 18:32:27 +0800 (CST)
Received: from [10.67.121.58] (10.67.121.58) by kwepemf200017.china.huawei.com
 (7.202.181.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 15 May
 2026 18:32:27 +0800
Message-ID: <b1c5e72f-6b8f-4601-b51c-c9aee56be8a4@hisilicon.com>
Date: Fri, 15 May 2026 18:32:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] devfreq: Add module owner to devfreq governor
To: Yaxiong Tian <tianyaxiong@kylinos.cn>, <cwchoi00@gmail.com>,
	<cw00.choi@samsung.com>, <myungjoo.ham@samsung.com>,
	<kyungmin.park@samsung.com>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <linuxarm@huawei.com>, <zhenglifeng1@huawei.com>,
	<zhangpengjie2@huawei.com>, <lihuisong@huawei.com>,
	<prime.zeng@hisilicon.com>
References: <20260513093832.1645890-1-zhanjie9@hisilicon.com>
 <20260513093832.1645890-5-zhanjie9@hisilicon.com>
 <fdcac90b-b253-45f2-81fa-81c980671f28@kylinos.cn>
Content-Language: en-US
From: Jie Zhan <zhanjie9@hisilicon.com>
In-Reply-To: <fdcac90b-b253-45f2-81fa-81c980671f28@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.58]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemf200017.china.huawei.com (7.202.181.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_033236_362211_6B088A06 
X-CRM114-Status: GOOD (  15.03  )
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



On 5/14/2026 2:14 PM, Yaxiong Tian wrote:
> 
> 在 2026/5/13 17:38, Jie Zhan 写道:
>> Add an 'owner' member to struct devfreq_governor, such that we can find
>> the module that holds the governor code when it's compiled as a kernel
>> module.  This allows the devfreq core to properly manage the lifecycle
>> of governors.
>>
>> Update devfreq_add_governor() and devm_devfreq_add_governor() to
>> automatically set 'owner' to THIS_MODULE via helper macros.
>>
>> This is a prerequisite for implementing governor reference counting to
>> prevent a governor module from being unloaded (except for force unload)
>> while a governor is in use.
>>
>> Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
>> ---
>>   drivers/devfreq/devfreq.c        | 26 +++++++++-----------------
>>   include/linux/devfreq-governor.h | 26 +++++++++++++++++++++++---
>>   2 files changed, 32 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
>> index 9e3e6a7348f8..e1363ab69173 100644
>> --- a/drivers/devfreq/devfreq.c
>> +++ b/drivers/devfreq/devfreq.c
>> @@ -1301,11 +1301,8 @@ void devfreq_resume(void)
>>       mutex_unlock(&devfreq_list_lock);
>>   }
>>   -/**
>> - * devfreq_add_governor() - Add devfreq governor
>> - * @governor:    the devfreq governor to be added
>> - */
>> -int devfreq_add_governor(struct devfreq_governor *governor)
>> +int __devfreq_add_governor(struct devfreq_governor *governor,
>> +               struct module *mod)
>>   {
>>       struct devfreq_governor *g;
>>   @@ -1322,37 +1319,32 @@ int devfreq_add_governor(struct devfreq_governor *governor)
>>           return -EINVAL;
>>       }
>>   +    governor->owner = mod;
>>       list_add(&governor->node, &devfreq_governor_list);
>>         return 0;
>>   }
>> -EXPORT_SYMBOL(devfreq_add_governor);
>> +EXPORT_SYMBOL(__devfreq_add_governor);
> 
> It's a bit strange to use the __ symbol here. Generally speaking, functions exported with EXPORT_SYMBOL are public, while __ indicates internal.
> 
> The same applies below.
> 
Actually it's common (typically in some kernel core code) to do this for
keeping the API the same while extending an existing ABI with more
parameters, such that those callers (in our case, governor code) don't have
to change.

If this is not favoured, we can also touch the existing governors and make
them assign 'governor->owner'.

I'm happy with both.

Thanks,
Jie

[ ... ]

