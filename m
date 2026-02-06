Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC50CEE2080
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 10:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tt/apNU651co1/FFDBARgi66XwWLSw6qcjsHG+8hCXA=; b=vQWrqi6wiOWetDipV7wGwTrX6+
	UvQxuIiBnbzCkKq+QOGhUEoiCRGYXyWPs+RK/7NLJBjfpCK9Vl+RQcxfnaCnroJ5CRdRJvT6JXrVb
	/6H83l6bfNtUiDkf9fg3HpNogDJJDLq8h6sZNbXgy30D5a+eenQjzFQqY8SBylhoxIp1SuxIHLHjQ
	YodtRa3Wmf96MAvJ1fzZge1KbAjpEmFV7urqjiXk+ofa+IYLghXtMSfEiBvUV17RflUEUsbnt0Fh7
	tYhD9pNqjlg/x3n736I2+aZmkMt8WIgtLzZTKIUzvXnteJCJ/XHhixbsEXbshqPRJNRAgvQjpBzZ8
	5jfg0YZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voIkt-0000000B9CE-0l9l;
	Fri, 06 Feb 2026 10:08:03 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voIkp-0000000B99S-3mKc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 10:08:02 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=tt/apNU651co1/FFDBARgi66XwWLSw6qcjsHG+8hCXA=;
	b=g0ZfPotUFYgfyMGRd9ZvMJ94EPrmBnyyyzf/2tUq+FbPqv7NNoHQi7IOhmzQaAJo0R/N+FwW6
	PWbgcaHY//nD/aE78g5c/SkVs01zEJOlFVtyO+sCwj9QO7pJ71I5+blX3l8IusLX0BicDatvRwI
	5iDLV1Pwb+xL7YqIu33oE5Y=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4f6qS41Rtyz12LCb;
	Fri,  6 Feb 2026 18:04:04 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 36DF140363;
	Fri,  6 Feb 2026 18:07:53 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 6 Feb 2026 18:07:53 +0800
Received: from [10.67.120.139] (10.67.120.139) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Fri, 6 Feb 2026 18:07:52 +0800
Message-ID: <4c5eaf8f-2433-4971-b5d0-4f35acb2820e@huawei.com>
Date: Fri, 6 Feb 2026 18:07:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: wangyushan <wangyushan12@huawei.com>
Subject: Re: [PATCH 1/3] soc cache: L3 cache driver for HiSilicon SoC
To: Jonathan Cameron <jonathan.cameron@huawei.com>, Linus Walleij
	<linusw@kernel.org>
CC: <alexandre.belloni@bootlin.com>, <arnd@arndb.de>, <fustini@kernel.org>,
	<krzk@kernel.org>, <linus.walleij@linaro.org>, <will@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<fanghao11@huawei.com>, <linuxarm@huawei.com>, <liuyonglong@huawei.com>,
	<prime.zeng@hisilicon.com>, <wangzhou1@hisilicon.com>,
	<xuwei5@hisilicon.com>, <linux-mm@vger.kernel.org>, SeongJae Park
	<sj@kernel.org>, Yushan Wang <wangyushan12@huawei.com>
References: <20260203161843.649417-1-wangyushan12@huawei.com>
 <20260203161843.649417-2-wangyushan12@huawei.com>
 <CAD++jLn+TDfu-aQ+Kfm=unYp4Zjg=endP3GGzZcpuYFR=s1K1g@mail.gmail.com>
 <20260204134020.00002393@huawei.com>
Content-Language: en-US
In-Reply-To: <20260204134020.00002393@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.139]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_020800_534279_D72B325C 
X-CRM114-Status: GOOD (  15.16  )
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

On 2/4/2026 9:40 PM, Jonathan Cameron wrote:
> On Wed, 4 Feb 2026 01:10:01 +0100
> Linus Walleij <linusw@kernel.org> wrote:
>
>> Shouldn't the MM subsystem be in charge of determining, locking
>> down and freeing up hot regions in L3 cache?
>>
>> This looks more like userspace is going to determine that but
>> how exactly? By running DAMON? Then it's better to keep the
>> whole mechanism in the kernel where it belongs and let the
>> MM subsystem adapt locked L3 cache to the usage patterns.
> I haven't yet come up with any plausible scheme by which the MM
> subsystem could do this.
>
> I think what we need here Yushan, is more detail on end to end
> use cases for this.  Some examples etc as clearer motivation.
>

Hi,

Let me try to explain the use case here.

The idea is similar to this article:
https://www.cl.cam.ac.uk/~rnw24/papers/201708-sigcomm-diskcryptnet.pdf

Suppose we have data on SSD that need to be transferred through network.
We have technologies like DDIO and IO stash to make data flow through
L3 cache instead of DDR to avoid the influence of DDR bandwidth.

But if something is to be done to the data instead of merely copying,
and cores needs to participate, we'd like to make data to climb a bit
higher up through the memory hierarchy and stay there before data
processing is done. That is, correct amount of data being fetched to
L3 cache, and consumed just in time, then free L3 for next batch.
It is more of a userspace defined pipeline that utilizes capability
provided by kernel, where cache locks are allocated and freed quickly
with batches.

In above use case, C2C latency is chosen to avoid DDR latency, precisely
which L3 cache to store the data is not required. (For this part maybe
including steering tag as the hint to choose the correct L3 is a smarter
way, like AMD SDCIAE).

Memory management is, in many way, independent to architecture and
vendors, we might not want to take hardware specific feature into
account when kernel makes decisions of, say, swapping a page or not,
but we can control the hardware resource to lean more on a process,
like resctl.

Thanks,
Yushan


