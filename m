Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BB8C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 11:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:CC:References:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmCYoH2zSxr5WJH3t09zdKaocIisOAhi8yC2NakxiUU=; b=1w7R2EL9R9Fvkwrtx97qMxqk9r
	tMkBpAIiuPLT97wMyJGzE87/YDY4AxeAjsaYdXP/gyrns+03xovZnZknTB8CcsMgJ5NdUClfn9sfk
	7uQSbmm3/sz2ECi0VLZ803pZDnzmCRtCQLbeC4Y7iem0epw2pBIXlarSsOKZ1JrYmbkSuUeqitRrd
	wRkbJw7IJfXw2CnVxMbFW8iAvqoL6XVw07CkH8MGJp1Nj/E8bbcGYEqSADHJ+lPqQdc92gEfrxzmL
	PPKaJQrq4RHwACuCFYK7kVXLXw1r1y7di8QIslRPLaD/dLr3rcYnv73pBOVjnkC+mtpMSsFLEwWFd
	rvtX8MFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud5RV-0000000EAk4-1BCx;
	Sat, 19 Jul 2025 11:09:25 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud5P1-0000000EAb6-3cRZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 11:06:53 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4bkkKK2DQYz2gKdp;
	Sat, 19 Jul 2025 19:03:01 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 0BE5A1A0188;
	Sat, 19 Jul 2025 19:05:40 +0800 (CST)
Received: from kwepemn500004.china.huawei.com (7.202.194.145) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 19 Jul 2025 19:05:39 +0800
Received: from [10.67.120.218] (10.67.120.218) by
 kwepemn500004.china.huawei.com (7.202.194.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 19 Jul 2025 19:05:39 +0800
Subject: Re: [PATCH v2 1/3] coresight: tmc: Add missing doc of
 tmc_drvdata::reading
To: Leo Yan <leo.yan@arm.com>
References: <20250620075412.952934-1-hejunhao3@huawei.com>
 <20250620075412.952934-2-hejunhao3@huawei.com>
 <20250702152720.GA794930@e132581.arm.com>
CC: <anshuman.khandual@arm.com>, <coresight@lists.linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linuxarm@huawei.com>, <jonathan.cameron@huawei.com>,
	<yangyicong@huawei.com>, <prime.zeng@hisilicon.com>
From: hejunhao <hejunhao3@huawei.com>
Message-ID: <41ddbd02-f2a5-f287-5096-90a420aee441@huawei.com>
Date: Sat, 19 Jul 2025 19:05:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20250702152720.GA794930@e132581.arm.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.218]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemn500004.china.huawei.com (7.202.194.145)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_040652_091473_0B0900F6 
X-CRM114-Status: GOOD (  21.32  )
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


On 2025/7/2 23:27, Leo Yan wrote:
> On Fri, Jun 20, 2025 at 03:54:10PM +0800, Junhao He wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> tmc_drvdata::reading is used to indicate whether a reading process
>> is performed through /dev/xyz.tmc. Document it.
>>
>> Reviewed-by: James Clark <james.clark@linaro.org>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> Signed-off-by: Junhao He <hejunhao3@huawei.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-tmc.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
>> index 6541a27a018e..3ca0d40c580d 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc.h
>> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
>> @@ -220,6 +220,7 @@ struct tmc_resrv_buf {
>>    * @pid:	Process ID of the process that owns the session that is using
>>    *		this component. For example this would be the pid of the Perf
>>    *		process.
>> + * @reading:	buffer's in the reading through "/dev/xyz.tmc" entry
> Are you working on the latest code base? For example, the mainline
> kernel or coresight next branch.
> The latest code already has comment for reading, and I saw a duplicated
> "reading" field in tmc_drvdata.

This patch is based on mainline kernel v6.16-rc1, and adds a comment to 
struct tmc_drvdata::reading.
Perhaps, this git log could easily be misunderstood as adding comments 
to tmc_resrv_buf::reading.

> The tmc_resrv_buf structure does not have the fields "pid",
> "stop_on_flush", "buf", etc. They have been moved into the tmc_drvdata
> structure.
>
> Thanks,
> Leo
>
>>    * @stop_on_flush: Stop on flush trigger user configuration.
>>    * @buf:	Snapshot of the trace data for ETF/ETB.
>>    * @etr_buf:	details of buffer used in TMC-ETR
>> -- 
>> 2.33.0
>>
> _______________________________________________
> CoreSight mailing list -- coresight@lists.linaro.org
> To unsubscribe send an email to coresight-leave@lists.linaro.org
> .
>


