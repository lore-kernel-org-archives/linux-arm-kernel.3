Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DDDE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 09:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1r/Nuz2yUfsVwRwyiYeNWJ/0Qtmk0WSZFrWqsWfJxKI=; b=mNmTzyzsJ8SwK1lePvlyL7Hy3T
	2SIFqbXIUUYZad6kR/qCkED/876wYp9SQJRQQSX5MGouox1cjzsg/m63MtHbgEZpqUdP/ubTbIXbD
	OytjzPwOyRXS0FcH5HP+aAv/WhOcW3oYUGTNDWkfJo71xD0ZvMytCRR9rFDU3PuQydKbumov781iT
	SiuUiHkTNjobhNj9NfXKDAlnfSThlur8k/e6Xd4MJVmLOmaU2+1Zb0J72CyU3C6hnRMJhdF0ys3vn
	JU6SvkRRpVKkiHVvr8MtJmZjDLXxEipOidEhgEIKP+zLZRn6HwqK0iU+M2bBim2FoJLvZUHAkjT7b
	VwTKmrBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZSC-00000004Rq6-1VLJ;
	Fri, 20 Dec 2024 09:37:52 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZR1-00000004RcG-0Zci
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 09:36:41 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4YF2NJ3RsGz1JFv6;
	Fri, 20 Dec 2024 17:36:00 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 432311402C4;
	Fri, 20 Dec 2024 17:36:25 +0800 (CST)
Received: from [10.174.179.163] (10.174.179.163) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 20 Dec 2024 17:36:24 +0800
Message-ID: <65e556b6-61e1-7d84-ab8a-becaf55dbb18@huawei.com>
Date: Fri, 20 Dec 2024 17:36:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH mpam mpam/snapshot/v6.12-rc1 v3 4/5] arm_mpam:
 Automatically synchronize the configuration of all sub-monitoring groups
Content-Language: en-US
To: Dave Martin <Dave.Martin@arm.com>
CC: <james.morse@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <jonathan.cameron@huawei.com>,
	<xiexiuqi@huawei.com>, "Wangshaobo (bobo)" <bobo.shaobowang@huawei.com>
References: <20241207092136.2488426-1-zengheng4@huawei.com>
 <20241207092136.2488426-5-zengheng4@huawei.com>
 <Z1sM7TMK+BHQEwgI@e133380.arm.com>
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <Z1sM7TMK+BHQEwgI@e133380.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.163]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_013639_349782_9828567A 
X-CRM114-Status: GOOD (  13.00  )
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



On 2024/12/13 0:18, Dave Martin wrote:
> Hi,
> 
>> @@ -3072,9 +3080,20 @@ struct mpam_write_config_arg {
>>   
>>   static int __write_config(void *arg)
>>   {
>> +	int closid_num = resctrl_arch_get_num_closid(NULL);
>>   	struct mpam_write_config_arg *c = arg;
>> +	u32 reqpartid, req_idx;
>> +
>> +	WARN_ON(c->partid >= closid_num);
>>   
>> -	mpam_reprogram_ris_partid(c->ris, c->partid, &c->comp->cfg[c->partid]);
>> +	/* Synchronize the configuration to each sub-monitoring group. */
>> +	for (req_idx = 0; req_idx < get_num_reqpartid_per_closid();
>> +	     req_idx++) {
>> +		reqpartid = req_idx * closid_num + c->partid;
>> +
>> +		mpam_reprogram_ris_partid(c->ris, reqpartid,
>> +					 &c->comp->cfg[c->partid]);
>> +	}
>>   
>>   	return 0;
>>   }
> 
> I haven't decided whether this iteration belongs here or in
> mpam_resctrl.c.
> 
> Your approach looks like it should work; I do it in
> resctrl_arch_update_one() instead [1], but I think the approaches are
> pretty much equivalent -- but let me know if you have any thoughts on
> it.
> 

Yes, the actual functions of these two locations are essentially the
same. However, at the __write_config position, we can reduce the
repeated judgments of cfg[partid] in mpam_update_config() and also
decrease the times of smp_call remote invocations.

What about your option towards it?

Best regards,
Zeng Heng

