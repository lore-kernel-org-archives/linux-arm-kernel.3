Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D08E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 13:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MjdwPRbmSyVNFHa8aoT5DvbYJ1KQ+SpVtDOsm2CCGPk=; b=r2HVFMOSbhqQwZ9cdJx4UH7lWy
	ilHi7V4x6qDNrb3W4hAx8327KsvD9FEXpWy2SVW/udpXr+f57DCVqecH7cPchs3oea1sizlK1i2Su
	mAfO6QaORY9ZLt7HciK0WsJgJfGyarzV6Fu1bWoTXuxD7ZJKVCimO2VzzvontqJlzTb1/YXZwUoq/
	lvVdvvDeDAHO44aWDQ9NCIE36avi7FGvDsr9nvKO4J3Zys43YuKRqIWtIA942QC2xayowoGzPUzSm
	9XOIIueYAIqlrMoAI4JT0IxCGzlOQrqe6Wb1kgEO/ruNP+4ISfEsxSi3T42oeqI7WwqPNeiLwHvD3
	NpGbrwOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGmJ-00000001ygy-3C9b;
	Thu, 19 Dec 2024 13:41:23 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGl0-00000001yPc-01GR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 13:40:04 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4YDWml4jnPzFrcl;
	Thu, 19 Dec 2024 21:36:55 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 605D314010D;
	Thu, 19 Dec 2024 21:39:52 +0800 (CST)
Received: from [10.174.179.163] (10.174.179.163) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 19 Dec 2024 21:39:51 +0800
Message-ID: <0a84f8ce-80a3-c49a-28a1-0d3c5e8839fa@huawei.com>
Date: Thu, 19 Dec 2024 21:39:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Zeng Heng <zengheng4@huawei.com>
Subject: Re: [RFC PATCH mpam mpam/snapshot/v6.12-rc1 v3 2/5] arm_mpam: Read
 monitor value with new closid/rmid pair
To: Dave Martin <Dave.Martin@arm.com>
CC: <james.morse@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <jonathan.cameron@huawei.com>,
	<xiexiuqi@huawei.com>, "Wangshaobo (bobo)" <bobo.shaobowang@huawei.com>
References: <20241207092136.2488426-1-zengheng4@huawei.com>
 <20241207092136.2488426-3-zengheng4@huawei.com>
 <Z1sMxKM9o6lAiZGr@e133380.arm.com>
Content-Language: en-US
In-Reply-To: <Z1sMxKM9o6lAiZGr@e133380.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.163]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_054002_382459_C64C1A30 
X-CRM114-Status: GOOD (  12.22  )
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
> On Sat, Dec 07, 2024 at 05:21:33PM +0800, Zeng Heng wrote:
>> The MPAM driver statically assigns all reqPARTIDs to respective intPARTIDs.
>> For the new rmid allocation strategy, it will check if there is an
>> available rmid of any reqPARTID which belongs to the input closid, not just
>> the rmids belonging to the closid.
>>
>> For a mixture of MSCs system, for MSCs that do not support narrow-partid,
>> we use the PARTIDs exceeding the number of closids as reqPARTIDs for
>> expanding the monitoring groups.
>>
>> In order to keep the existing resctrl API interface, the rmid contains both
>> req_idx and PMG information instead of PMG only under the MPAM driver. The
>> req_idx represents the req_idx-th sub-monitoring group under the control
>> group. The new rmid would be like:
>>
>>      rmid = (req_idx << shift | pmg).
>>
>> The mapping relationships between each group's closid/rmid and the
>> respective MSCs' intPARTID/reqPARTID/PARTID are illustrated:
>>
>> n - Indicates the total number of intPARTIDs
>> m - Indicates the number of reqPARTIDs per intPARTID
>>
>> P - Partition group (control group)
>> M - Monitoring group
>>
>> Group closid rmid.req_idx (req)PARTID      MSCs with narrow-partid  MSCs without narrow-partid
>> P1    0      -            0                   intPARTID_1              PARTID_1
>> M1_1  0      0            0                       ├── reqPARTID_1_1       ├── PARTID_1_1
>> M1_2  0      1            0+n                     ├── reqPARTID_1_2       ├── PARTID_1_2
>> M1_3  0      2            0+n*2                   ├── reqPARTID_1_3       ├── PARTID_1_3
>>   ...                                              ├── ...                 ├── ...
>> M1_m  0      (m-1)        0+n*(m-1)               └── reqPARTID_1_m       └── PARTID_1_m
>>
>> P2    1      -            1                   intPARTID_2              PARTID_2
>> M2_1  1      0            1                       ├── reqPARTID_2_1       ├── PARTID_2_1
>> M2_2  1      1            1+n                     ├── reqPARTID_2_2       ├── PARTID_2_2
>> M2_3  1      2            1+n*2                   ├── reqPARTID_2_3       ├── PARTID_2_3
>>   ...                                              ├── ...                 ├── ...
>> M2_m  1      (m-1)        1+n*(m-1)               └── reqPARTID_2_m       └── PARTID_2_m
>>
>> Pn    (n-1)  -            (n-1)               intPARTID_n              PARTID_n
>> Mn_1  (n-1)  0            (n-1)                   ├── reqPARTID_n_1       ├── PARTID_n_1
>> Mn_2  (n-1)  1            (n-1)+n                 ├── reqPARTID_n_2       ├── PARTID_n_2
>> Mn_3  (n-1)  2            (n-1)+n*2               ├── reqPARTID_n_3       ├── PARTID_n_3
>>   ...                                              ├── ...                 ├── ...
>> Mn_m  (n-1)  (m-1)        (n-1)+n*(m-1) = n*m-1   └── reqPARTID_n_m       └── PARTID_n_m
>>
>> Based on the example provided, the conversion relationship between
>> closid/rmid and (req)PARTID/PMG is:
>>
>>      (req)PARTID = (rmid.req_idx * n) + closid,
>>      PMG = rmid.pmg.
> 
> It seemed more natural to me for the PARTIDs assigned to a particular
> CLOSID to be consecutively numbered (see [1]), though it works either
> way.
> 
> Otherwise, the approach makes sense.

Yes, I agree with your point and it would be included in the next 
version soon.


Best Regards,
Zeng Heng

