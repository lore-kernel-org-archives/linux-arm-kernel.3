Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B683DCD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 10:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FtxLrk0xf3uhjR82jKTIdOjO+JUT7ecs7+HwT0s7sQ=; b=ygfoHt0mDMnGzMmWYLg3+5WtCW
	c+EN8/z0ccot49gSmPy4e38bUgybWHRX/vZsjRRpN75gVJxVuXwVvifC+feRzXY0KW7RT55dacQCp
	O14yIWf3uHe2brAU0YJZbemGY/XmZOP2auirTOmQWfIoE1k/9ljojhtG7X6iOhKKwHbbHV0bneCez
	9mRHtVLkRUfMjnEPUdQN8NxQlWYqYymgnbhb0Hw2+1MN3+yomSn2IIQ5WpxFbu/CjLX+X9Wb8t9Ed
	WrvUz+izIHTqGvUmrHWtVgVnJC7Q4a/cQF/cckRGr690aR234ZMZf/ZgVQkYKrUTFpgQAB8kwKeJ/
	sU9QI9SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLIZZ-00000006FU7-3kQ3;
	Fri, 08 May 2026 10:36:45 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLIZX-00000006FSB-1MqW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 10:36:44 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=6FtxLrk0xf3uhjR82jKTIdOjO+JUT7ecs7+HwT0s7sQ=;
	b=gxTMY6KugrdTfN3OIHYny/ktf/UiDu4S2JuCMcWeYd3BwbesUY8M9Hi7SxbLuqWG+fyBSO11n
	SdKvuCQR8Imu+rWXtEDTi0wM6mBo+49ZgBoi8KqmGoy+lAlfqBpBmo3YICXxTpD91rpsr79IL/n
	0f5lvgFPx//5y1KeMbzQ9Cg=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4gBlhw29XqzRhR9;
	Fri,  8 May 2026 18:29:04 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 14D43203B8;
	Fri,  8 May 2026 18:36:38 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 8 May 2026 18:36:37 +0800
Received: from [10.67.120.139] (10.67.120.139) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Fri, 8 May 2026 18:36:36 +0800
Message-ID: <f5ab300f-8368-4799-aa2c-11f8f3ee2e04@huawei.com>
Date: Fri, 8 May 2026 18:36:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yushan Wang <wangyushan12@huawei.com>
Subject: Re: [RFT PATCH v2 7/7] perf-iostat: Enable iostat mode for HiSilicon
 PCIe PMU
To: Ian Rogers <irogers@google.com>
CC: <peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>, <mark.rutland@arm.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<adrian.hunter@intel.com>, <james.clark@arm.com>, <john.g.garry@oracle.com>,
	<will@kernel.org>, <mike.leach@arm.com>, <linux-perf-users@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<jic23@kernel.org>, <leo.yan@linux.dev>, <robin.murphy@arm.com>,
	<linuxarm@huawei.com>, <hejunhao3@huawei.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <wangzhou1@hisilicon.com>
References: <20260507063737.3542950-1-wangyushan12@huawei.com>
 <20260507063737.3542950-8-wangyushan12@huawei.com>
 <CAP-5=fXW7_kRBJ_B-iWnAFnwiN2OKD3WsA45JDD_Fqr4+cwTnQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAP-5=fXW7_kRBJ_B-iWnAFnwiN2OKD3WsA45JDD_Fqr4+cwTnQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.139]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_033643_566721_1931208A 
X-CRM114-Status: GOOD (  12.66  )
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

On 5/8/2026 12:20 AM, Ian Rogers wrote:
> On Wed, May 6, 2026 at 11:37 PM Yushan Wang <wangyushan12@huawei.com> wrote:

[...]

>> +
>> +static void __attribute__((constructor)) hisi_iostat_pmu_init(void)
>
> This looks good. My concerns are over:
>  - the use of the constructor attribute,
>  - the naming of iostat_pmu,
>  - we probably don't want a per PMU C file in tools/perf/util as there
> could be many,
>  - we might be able to move things into json and better share code, etc.
>
> Thanks,
> Ian

Hi Ian, thanks for the fast comments and reviewed-by tags, and sorry for the
delay of v2 patches.

I will try to merge those *_iostat.c into one file to avoid redundancy,
currently replacing iostat with json configs as a whole may be a huge work, but
eliminating redundant codes may not.

I think iostat can start by supporting variant platforms by providing structs
and callbacks, and migrate to totally json configurable for convenience of
extensibility in the future. After all, json metrics are firstly converted to a
big static string before being compiled into binary, and rebuild is necessary to
make any change of metric effective :)

Thanks,
Yushan

>
>> +{
>> +       unsigned int i;
>> +
>> +       for (i = 0; i < ARRAY_SIZE(hisi_iostat_pmu_list); i++)
>> +               register_iostat_pmu(&hisi_iostat_pmu_list[i]);
>> +}
>> --
>> 2.33.0
>>



