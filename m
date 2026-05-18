Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6487BCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 09:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2vVr/uimRMBFX0B8JcUaRpBXgnD5hWkWFZBFhi1DO0=; b=oDxDN95Tx26hqboGcFtGfKC/qq
	ReAbO/1sCClb6soHtuV9n7nLPYsKNQE8K/yt8fZ0yA0kkeqRK2Ah6Zisf6tUupzeF5P3LCI8Pt9Ln
	cjU62N27/+GRKon1AXIOBfXoeetSKAjcULsFS3Gp4PQ6Jz1o2wj60LUCOp4oHriFuUWVfIhPN6qvM
	ocpZ1aJ5ckm9j6Wwvwx+Ha8FAx9hkYCC9/fWqflYcZYz73+kbGnUtT9pumGj15pWQdLvaQVKDcs3n
	X9YvzrdRtKcOfirDozALZxGXe8zFCLB89zEzkDsDZucqztf/1QeHTKeOLgREqaor77rDRaddAY+Wk
	sn3cAGrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtqB-0000000EvMf-0kHn;
	Mon, 18 May 2026 09:00:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtq9-0000000EvLy-45aB
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 09:00:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=H2vVr/uimRMBFX0B8JcUaRpBXgnD5hWkWFZBFhi1DO0=; b=Q7K4zRxdaXEL5JwPPQoxrrjXn5
	LttZA0lO6XpvojwTUh2NK0CO0QN11dX3aUA2qD/NC+wFh9yM7baf8g7j+FcOI3B703p2fNFBt9/5Z
	UW/aQQiEAjomp+eFYPVeJbQUYLeTbRKAo5/tL8riaazNtqjkVYElUw4pDfrWg79fdb3JOLT3TCXcp
	3bCc3j1Y7i0rLu9xCCPdaXL1c0G55UAEEJ7kjKuJLTw8BqRKq13pMvznR3WnAGDSdkMvxy7XOuGnN
	403HXDNOcsvrv5AfNJLlTwikikZHJUXob8xEN+2AGbC4tfD3pi5omKbVQTozKL6mBzxkWTrLfAF8U
	OpxiI9ow==;
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtq5-0000000AUIt-2NQI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 09:00:44 +0000
X-UUID: 02384214529811f1aa26b74ffac11d73-20260518
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:7c304e6f-f36b-48ce-a03c-f6230c9c4b1d,IP:15,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:15
X-CID-INFO: VERSION:1.3.12,REQID:7c304e6f-f36b-48ce-a03c-f6230c9c4b1d,IP:15,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:15
X-CID-META: VersionHash:e7bac3a,CLOUDID:e5c072aeb588723cb41317fa48f4de54,BulkI
	D:260515183906C6QDF1VJ,BulkQuantity:2,Recheck:0,SF:17|19|38|64|66|78|80|81
	|82|83|102|127|841|865|898,TC:nil,Content:0|15|52,EDM:-3,IP:-2,URL:0,File:
	nil,RT:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:
	0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 02384214529811f1aa26b74ffac11d73-20260518
X-User: tianyaxiong@kylinos.cn
Received: from [192.168.12.149] [(116.128.244.171)] by mailgw.kylinos.cn
	(envelope-from <tianyaxiong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1877425875; Mon, 18 May 2026 17:00:25 +0800
Message-ID: <05839836-dd16-4476-9cf9-2e8dd3083fe1@kylinos.cn>
Date: Mon, 18 May 2026 17:00:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] devfreq: Get and put module refcount when
 switching governor
To: Jie Zhan <zhanjie9@hisilicon.com>, cwchoi00@gmail.com,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com, kyungmin.park@samsung.com,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linuxarm@huawei.com, zhenglifeng1@huawei.com, zhangpengjie2@huawei.com,
 lihuisong@huawei.com, prime.zeng@hisilicon.com
References: <20260513093832.1645890-1-zhanjie9@hisilicon.com>
 <20260513093832.1645890-6-zhanjie9@hisilicon.com>
 <d6e83d90-0c2a-40a7-a939-298c3b393602@kylinos.cn>
 <6f160e25-9903-4f49-8a95-1192b7acb96d@hisilicon.com>
 <66a14821-fd14-440e-b75f-98bc37eedba7@hisilicon.com>
Content-Language: en-US
From: Yaxiong Tian <tianyaxiong@kylinos.cn>
In-Reply-To: <66a14821-fd14-440e-b75f-98bc37eedba7@hisilicon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_100042_635967_050FC510 
X-CRM114-Status: GOOD (  23.05  )
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


在 2026/5/18 16:39, Jie Zhan 写道:
>
> On 5/15/2026 6:39 PM, Jie Zhan wrote:
>>
>> On 5/14/2026 2:50 PM, Yaxiong Tian wrote:
>>> 在 2026/5/13 17:38, Jie Zhan 写道:
>>>> A governor module can be dynamically inserted or removed if compiled as a
>>>> kernel module.  'devfreq->governor' would become NULL if the governor
>>>> module is removed when it's in use.
>>>>
>>>> To prevent the governor module from being removed (except for force
>>>> unload) when it's in use, get and put a refcount of the governor module
>>>> when starting and stopping the governor.
>>>>
>>>> As a result, unloading a governor module in use returns an error, e.g.:
>>>>     $ cat governor
>>>>     performance
>>>>     $ rmmod governor_performance
>>>>     rmmod: ERROR: Module governor_performance is in use
>>>>
>>>> Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
>>>> ---
>>>>    drivers/devfreq/devfreq.c | 17 ++++++++++++++++-
>>>>    1 file changed, 16 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
>>>> index e1363ab69173..2ea42325d030 100644
>>>> --- a/drivers/devfreq/devfreq.c
>>>> +++ b/drivers/devfreq/devfreq.c
>>>> @@ -345,24 +345,37 @@ static int devfreq_set_governor(struct devfreq *df,
>>>>                     __func__, df->governor->name, ret);
>>>>                return ret;
>>>>            }
>>>> +        module_put(old_gov->owner);
>>>>        }
>>>>          /* Start the new governor */
>>>> +    if (!try_module_get(new_gov->owner)) {
>>>> +        df->governor = NULL;
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>> Here, new_gov has already been checked in try_then_request_governor() for whether the module can be obtained.
>>>
>>> I think it might be more reasonable to merge try_then_request_governor() and devfreq_set_governor(), so that when new_gov cannot be obtained, the operation of the old governor is not affected.
>>>
>> Well yeah, indeed! I'll take a look at how to implement this.
>> Thanks for the suggestion.
>>
>> Jie
> Hi Yaxiong,
>
> A follow-up after digging deeper.
>
> 1. To be clear, the try_module_get() / module_put() pairs in
> try_then_request_governor() and devfreq_set_governor() protect different
> ranges.  Assuming no FORCE_UNLOAD, the former protects the governor module
> from the time it's queried until it's set as the working governor, while
> the latter protects when the governor is in use.
>
> However, I realized the former protection is no longer needed since I
> removed the governor list lock in v2.  devfreq_remove_governor() and the
> 'request and set' governor sequence are already synchronized by
> 'devfreq_list_lock'. Thus, patch 6 should be dropped.
>
> 2. devfreq_add_device() needs error prints because it's a probe path.
> governor_store() doesn't want error prints since it's not a good practice
> to print on a sysfs read/write.  Merging the two functions will violate
> either of them.
>
> Thanks,
> Jie
Okay, please ignore my suggestion.
>>>>        df->governor = new_gov;
>>>>        ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
>>>>        if (ret) {
>>>>            dev_warn(dev, "%s: Governor %s not started(%d)\n",
>>>>                 __func__, df->governor->name, ret);
>>>> +        module_put(new_gov->owner);
>>>>              /* Restore previous governor */
>>>>            df->governor = old_gov;
>>>>            if (!df->governor)
>>>>                return ret;
>>>>    +        if (!try_module_get(old_gov->owner)) {
>>>> +            df->governor = NULL;
>>>> +            return -EINVAL;
>>>> +        }
>>>> +
>>>>            ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
>>>>            if (ret) {
>>>>                dev_err(dev, "%s: restore Governor %s failed (%d)\n",
>>>>                    __func__, df->governor->name, ret);
>>>> +            module_put(old_gov->owner);
>>>>                df->governor = NULL;
>>>>                return ret;
>>>>            }
>>>> @@ -1040,9 +1053,11 @@ int devfreq_remove_device(struct devfreq *devfreq)
>>>>          devfreq_cooling_unregister(devfreq->cdev);
>>>>    -    if (devfreq->governor)
>>>> +    if (devfreq->governor) {
>>>>            devfreq->governor->event_handler(devfreq,
>>>>                             DEVFREQ_GOV_STOP, NULL);
>>>> +        module_put(devfreq->governor->owner);
>>>> +    }
>>>>        device_unregister(&devfreq->dev);
>>>>          return 0;

