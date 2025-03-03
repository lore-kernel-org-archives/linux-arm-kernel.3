Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A39C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 14:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16bK9czKZNNI3w0tf9suiybaEnCThywxBAfkvP5pCo8=; b=1xFzInkkc+ZWWAhIXc4JCGQbd3
	2iAML6qgAH8hhRN7w1S7jnqYBwsp8+W/XPQMYEuz1WZ3U77bUZQHKngJXpX0DRPP8NKjqjM4TUoQJ
	N1GnI+pvbS8Ur+8YEfVSY4C7vNd16qnCklPRVTXrhqTVTJCkNQEjwrv72U2KUU1x1zGM3sV3YuIeA
	ZDql6dxtcMG+pB6o/ObAPzzeDCl4qaeW13/rDLuMUXxOhmQjF5IxYFRDfe2NLESjHNOTD9/rZ9ZIO
	zxN7i2SOL7uvkhYrR66S7EcYe1pMeriFZ06UV8b3vbCZAJX625ZPZ2ypWo+dL8iUNMHvwGgktKJUx
	CGUCtJzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp751-00000001AMK-3qeI;
	Mon, 03 Mar 2025 14:47:39 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp71B-000000019bo-0Er9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 14:43:42 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Z61fk4VT0z2DkjD;
	Mon,  3 Mar 2025 22:39:26 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id E40DA1A0188;
	Mon,  3 Mar 2025 22:43:36 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 3 Mar 2025 22:43:36 +0800
CC: <yangyicong@hisilicon.com>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <wangyushan12@huawei.com>
Subject: Re: [PATCH 1/9] drivers/perf: hisi: Extend struct hisi_pmu_dev_info
To: Will Deacon <will@kernel.org>
References: <20250218092000.41641-1-yangyicong@huawei.com>
 <20250218092000.41641-2-yangyicong@huawei.com>
 <20250301062343.GA27700@willie-the-truck>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <e6cfcfd0-5412-20bb-f4b5-cf266884c5d0@huawei.com>
Date: Mon, 3 Mar 2025 22:43:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20250301062343.GA27700@willie-the-truck>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_064341_285941_C3D549D3 
X-CRM114-Status: GOOD (  14.44  )
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

On 2025/3/1 14:23, Will Deacon wrote:
> On Tue, Feb 18, 2025 at 05:19:52PM +0800, Yicong Yang wrote:
>> From: Junhao He <hejunhao3@huawei.com>
>>
>> The counter bits and event range may differ from versions of a
>> certain uncore PMU. Make this device specific information into
>> struct hisi_pmu_dev_info. This will help to simplify the
>> initialization process by using a list of struct hisi_pmu_dev_info
>> rather than checking the version.
>>
>> Signed-off-by: Junhao He <hejunhao3@huawei.com>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>  drivers/perf/hisilicon/hisi_uncore_pmu.h | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.h b/drivers/perf/hisilicon/hisi_uncore_pmu.h
>> index f4fed2544877..777675838b80 100644
>> --- a/drivers/perf/hisilicon/hisi_uncore_pmu.h
>> +++ b/drivers/perf/hisilicon/hisi_uncore_pmu.h
>> @@ -72,6 +72,8 @@ struct hisi_uncore_ops {
>>  struct hisi_pmu_dev_info {
>>  	const char *name;
>>  	const struct attribute_group **attr_groups;
>> +	u32 counter_bits;
>> +	u32 check_event;
>>  	void *private;
>>  };
> 
> This doesn't really do anything on its own; please just fold it into the
> patch where the new fields are used.
> 

sure, will make this into the following patch.

Thanks.


