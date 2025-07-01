Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34431C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 15:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:CC:References:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mo6ifGWlGfCI5skR/pXOSKu79CGKYJ18h7YVkHZTQ5w=; b=wAPkMx8Vz+XQGDzOPfpfTcKl3E
	tpr5B5bMbPfAIDYxDnAgw5xNiQch38H1AcLaKCDsGy0QnNR5EjoM+Ose9gyEX6h8JycLZJ6qZUjrB
	KzQa1zwY8R7CDGJYW/eT56NCdA4F+YYsoi31bKJj8KmmyGS3mMBpTQRpqQCK0Mc1c/PvIjqgVu/3g
	Wp8Tle32+c9F01efWOHnCj9NB6dBFKjBtRy/UuQAeNU/MiTmcrIxmDn8nDuQ7dL9FZwf9XJcIkjyS
	kMOuwLUS4LXXzbqhrM+dDdTRCNrmEF0tFjtJpWG6+0fgMTjqAgCa/dtw5AagQ2sO9VPDwAw3LVO8g
	isDGzQKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcjw-00000005rTA-16nz;
	Tue, 01 Jul 2025 15:17:44 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbBx-00000005XoO-2tnM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 13:38:35 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4bWkXK4cHKzHrFv;
	Tue,  1 Jul 2025 21:34:25 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 364CF180B63;
	Tue,  1 Jul 2025 21:38:26 +0800 (CST)
Received: from kwepemn500004.china.huawei.com (7.202.194.145) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 1 Jul 2025 21:38:25 +0800
Received: from [10.67.120.218] (10.67.120.218) by
 kwepemn500004.china.huawei.com (7.202.194.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 1 Jul 2025 21:38:25 +0800
Subject: Re: [PATCH v2 1/3] coresight: tmc: Add missing doc of
 tmc_drvdata::reading
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, <linuxarm@huawei.com>
References: <20250620075412.952934-1-hejunhao3@huawei.com>
 <20250620075412.952934-2-hejunhao3@huawei.com>
 <20250620125330.00004fa7@huawei.com>
CC: <suzuki.poulose@arm.com>, <james.clark@arm.com>, <leo.yan@arm.com>,
	<anshuman.khandual@arm.com>, <coresight@lists.linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yangyicong@huawei.com>, <prime.zeng@hisilicon.com>
From: hejunhao <hejunhao3@huawei.com>
Message-ID: <c4cede5e-4f0f-73e2-9b3a-96654c19a4a2@huawei.com>
Date: Tue, 1 Jul 2025 21:38:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20250620125330.00004fa7@huawei.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.218]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemn500004.china.huawei.com (7.202.194.145)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_063833_902602_A5B49B39 
X-CRM114-Status: GOOD (  14.20  )
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



On 2025/6/20 19:53, Jonathan Cameron wrote:
> On Fri, 20 Jun 2025 15:54:10 +0800
> Junhao He <hejunhao3@huawei.com> wrote:
>
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
> Hi,
>
> Perhaps reword:
>
> "buffer is being read through "/dev/xyz.tmc" entry" or
> "buffer read in progress through "/dev/xyz.tmc" entry"
>
> I've not checked what this actually means - just looking at what you have here.

Will update this. Thanks

Best regards,
Junhao.

>>    * @stop_on_flush: Stop on flush trigger user configuration.
>>    * @buf:	Snapshot of the trace data for ETF/ETB.
>>    * @etr_buf:	details of buffer used in TMC-ETR
> .
>


