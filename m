Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58022C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 01:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yb3fV9A3EsW/ju/Sf4tl8WT1FkScqISau3tEHiGsBsw=; b=vydGM6C1Pe8q6JzuYzr1TeHnxC
	uYVe1YxsRVJIRhAb6CgUW27yLusdVycwZq2m9Y+syvK1hbAxA8WX00LZbCmSNEaP1GhB3qDMVf2na
	bb+ODb9S8xO8Ur36vN4O2gJVGuhSmTSj90bwcrkmRQRLREQFfZ21qldX9rB5gDiZFMOZIbhN9wcE2
	Ri8kUByeghy3XxRoYW20dDLs7BJme2RNWsJ+BLs2EmmQnP/uFtZwAtOQGWwQ515icGBd4UKY45Jrn
	Pr9vy20W4GKWy1lkVGgArNoFjl7GNJZV8iFz3mqJuQNlZ5VhOsPN2s5qEHhgkxq8Oa/2uV4ZMRcFm
	dy6CQ+QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaOzR-0000000G9Pw-1bWx;
	Sat, 12 Jul 2025 01:25:21 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaOx5-0000000G9KB-2DgJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 01:22:56 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4bf9ln5zHKztSfD;
	Sat, 12 Jul 2025 09:21:41 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id E1E18140132;
	Sat, 12 Jul 2025 09:22:47 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 12 Jul 2025 09:22:47 +0800
Received: from [10.67.121.59] (10.67.121.59) by kwepemn100009.china.huawei.com
 (7.202.194.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 12 Jul
 2025 09:22:47 +0800
Message-ID: <3c031732-9090-454c-b52a-a5c01135f466@huawei.com>
Date: Sat, 12 Jul 2025 09:22:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: hisilicon: kunpeng_hccs: Fix incorrect log
 information
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, <linuxarm@huawei.com>
CC: <xuwei5@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <zhanjie9@hisilicon.com>
References: <20250711063706.3121253-1-lihuisong@huawei.com>
 <20250711113816.00003403@huawei.com>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <20250711113816.00003403@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.59]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemn100009.china.huawei.com (7.202.194.112)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_182255_725489_61DFD114 
X-CRM114-Status: GOOD (  13.29  )
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


在 2025/7/11 18:38, Jonathan Cameron 写道:
> On Fri, 11 Jul 2025 14:37:06 +0800
> Huisong Li <lihuisong@huawei.com> wrote:
>
>> The hccs_get_all_spec_port_idle_sta() will tell user which port
>> is busy when firmware doesn't allow to decrease HCCS lane number.
>> However, the current log prints the index of die and port instead
>> of the hardware ID user perceived.
>>
>> Signed-off-by: Huisong Li <lihuisong@huawei.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>
> Maybe adding an example of a wrong print and how it is fixed to this
> patch description would make the problem even more obvious?
Yes.
The problem and modification are very simple, and this description is 
also enough.
> Not worth respin for that though!
ok, thanks for your review.
>
>> ---
>>   drivers/soc/hisilicon/kunpeng_hccs.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soc/hisilicon/kunpeng_hccs.c b/drivers/soc/hisilicon/kunpeng_hccs.c
>> index 7fc353732d55..65ff45fdcac7 100644
>> --- a/drivers/soc/hisilicon/kunpeng_hccs.c
>> +++ b/drivers/soc/hisilicon/kunpeng_hccs.c
>> @@ -1295,11 +1295,11 @@ static int hccs_get_all_spec_port_idle_sta(struct hccs_dev *hdev, u8 port_type,
>>   				if (ret) {
>>   					dev_err(hdev->dev,
>>   						"hccs%u on chip%u/die%u get idle status failed, ret = %d.\n",
>> -						k, i, j, ret);
>> +						port->port_id, chip->chip_id, die->die_id, ret);
>>   					return ret;
>>   				} else if (idle == 0) {
>>   					dev_info(hdev->dev, "hccs%u on chip%u/die%u is busy.\n",
>> -						k, i, j);
>> +						 port->port_id, chip->chip_id, die->die_id);
>>   					return 0;
>>   				}
>>   			}

