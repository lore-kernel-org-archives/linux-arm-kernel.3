Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C42C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 07:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJTzDgS4HrP7FwU9iq+wqQqPBdA0xEUpatyllYQ3AcM=; b=NS9nKHexEQSGcr2OkUmyckGkGE
	istj310CyEiSV+MspB+Mev5aCRDnH38Z3ZsT1L72gRh+JH74vBJ7hgOMG2VFRjveJF6CXGiLm4SN5
	tIx3FSQ/G4h5ZFDmndPaTSntGtQTfZt7lW4jRNpJnjUHclq6LsDcm0Bir4yoIEfzXGkh443oCHS2k
	ysIQkxVzKsYZ1tEQ/hQndMfBykUIOo4XXxkjwJcYst23ks8mWj8vayp0hrHadAYlK8++PsMr83ClH
	GbCutJ6XtCvSZcs5QYbc5S/BQmF9APN2rvVTrMH8Fd9FZhnkLsO3IPIm+xfGTFZcAgIKiFAgwVBxF
	o48rj9fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urAXO-0000000EPfB-39fp;
	Wed, 27 Aug 2025 07:25:42 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urAUe-0000000EOzc-0uLj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 07:22:54 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4cBbV51JHCz2CgJY;
	Wed, 27 Aug 2025 15:18:21 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 0AFD81A016C;
	Wed, 27 Aug 2025 15:22:47 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 27 Aug 2025 15:22:46 +0800
Received: from [10.67.120.139] (10.67.120.139) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 27 Aug 2025 15:22:46 +0800
Message-ID: <1a3d5331-2ad6-44fd-9156-f50970d8bf01@huawei.com>
Date: Wed, 27 Aug 2025 15:22:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] Documentation: hisi-pmu: Add introduction to
 HiSilicon
To: Yicong Yang <yangyicong@huawei.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <yangyicong@hisilicon.com>, <robin.murphy@arm.com>,
	<Jonathan.Cameron@huawei.com>, <liuyonglong@huawei.com>,
	<wanghuiqiang@huawei.com>, <prime.zeng@hisilicon.com>,
	<hejunhao3@h-partners.com>
References: <20250821135049.2010220-1-wangyushan12@huawei.com>
 <20250821135049.2010220-10-wangyushan12@huawei.com>
 <d757a29e-6e13-d528-651b-beff8c2b2c21@huawei.com>
Content-Language: en-US
From: wangyushan <wangyushan12@huawei.com>
In-Reply-To: <d757a29e-6e13-d528-651b-beff8c2b2c21@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.139]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_002252_579114_93BFD9FD 
X-CRM114-Status: GOOD (  21.78  )
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



On 8/27/2025 10:27 AM, Yicong Yang wrote:
> Hi Yushan,
>
> the subject seems to be truncated? should it be like below?
>
> Documentation: hisi-pmu: Add introduction to HiSilicon v3 PMU
>
> other comments inline. sorry for the late reply..

The subject was automatically wrapped, sorry.

"Add introduction to HiSilicon v3 PMU" it is.



>
> On 2025/8/21 21:50, Yushan Wang wrote:
>> Some of HiSilicon V3 PMU hardware is divided into parts to fulfill the
>> job of monitoring specific parts of a device.  Add description on that
>> as well as the newly added ext operand for L3C PMU.
>>
>> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
>> ---
>>   Documentation/admin-guide/perf/hisi-pmu.rst | 38 +++++++++++++++++++--
>>   1 file changed, 36 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/perf/hisi-pmu.rst b/Documentation/admin-guide/perf/hisi-pmu.rst
>> index a307bce2f5c5..4c7584fe3c1a 100644
>> --- a/Documentation/admin-guide/perf/hisi-pmu.rst
>> +++ b/Documentation/admin-guide/perf/hisi-pmu.rst
>> @@ -12,8 +12,8 @@ The HiSilicon SoC encapsulates multiple CPU and IO dies. Each CPU cluster
>>   called Super CPU cluster (SCCL) and is made up of 6 CCLs. Each SCCL has
>>   two HHAs (0 - 1) and four DDRCs (0 - 3), respectively.
>>   
>> -HiSilicon SoC uncore PMU driver
>> --------------------------------
>> +HiSilicon SoC uncore PMU v1
> these (and below) new sections will break the ordered list of the options. this should not be
> necessary to mention the version, just add the newly added options in the current way and
> mention the introduced version should be enough.

Given ext operand is for L3C PMU only, I could add that to the existing option order lists, as well
as the relationship between ext and the PMU name formats.

>
>> +---------------------------
>>   
>>   Each device PMU has separate registers for event counting, control and
>>   interrupt, and the PMU driver shall register perf PMU drivers like L3C,
>> @@ -56,6 +56,9 @@ Example usage of perf::
>>     $# perf stat -a -e hisi_sccl3_l3c0/rd_hit_cpipe/ sleep 5
>>     $# perf stat -a -e hisi_sccl3_l3c0/config=0x02/ sleep 5
>>   
>> +HiSilicon SoC uncore PMU v2
>> +----------------------------------
>> +
>>   For HiSilicon uncore PMU v2 whose identifier is 0x30, the topology is the same
>>   as PMU v1, but some new functions are added to the hardware.
>>   
>> @@ -113,6 +116,37 @@ uring channel. It is 2 bits. Some important codes are as follows:
>>   - 2'b00: default value, count the events which sent to the both uring and
>>     uring_ext channel;
>>   
>> +HiSilicon SoC uncore PMU v3
>> +----------------------------------
>> +
>> +For HiSilicon uncore PMU v3 whose identifier is 0x40, some uncore PMUs are
>> +further divided into parts for finer granularity of tracing, each part has its
>> +own dedicated PMU, and all such PMUs together cover the monitoring job of events
>> +on particular uncore device. Such PMUs are described in sysfs with name format
>> +slightly changed::
>> +
>> +/sys/bus/event_source/devices/hisi_sccl{X}_<l3c{Y}_{Z}/ddrc{Y}_{Z}/noc{Y}_{Z}>
>> +
>> +Z is the sub-id, indicating different PMUs for part of hardware device.
>> +
>> +Usage of most PMUs with different sub-ids are identical. Specially, L3C PMU
>> +provides ``ext`` operand to allow exploration of even finer granual statistics
>> +of L3C PMU, L3C PMU driver use that as hint of termination when delivering perf
>> +command to hardware:
>> +
>> +- ext=0: Default, could be used with event names.
>> +- ext=1 and ext=2: Must be used with event codes, event names are not supported.
>> +
>> +An example of perf command could be::
>> +
>> +  $# perf stat -a -e hisi_sccl0_l3c1_0/event=0x1,ext=1/ sleep 5
>> +
>> +or::
>> +
>> +  $# perf stat -a -e hisi_sccl0_l3c1_0/rd_spipe/ sleep 5
>> +
>> +As above, ``hisi_sccl0_l3c1_0`` locates PMU on CPU cluster 0, L3 cache 1 pipe0.
> this isn't correct. sccl0 indicates the Super CPU CLuster 0 which is already
> described in the document.
>
> thanks.

Yes, will fix that, thanks.



