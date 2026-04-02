Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA85111224A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 01:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fpyuoqRhsa0MPUQAkvVYGReI2eoxdl7dtl+Yyx3fY5M=; b=IpVbjTx6hGbd48ZJxl9fTMZ6cX
	wLZgkCTbVkgtOFE9SYlVM/O/ZO341j8H+sGX6EDurJwd5DEQSAEZJ7euBhg9avPH68IxogQhYEpX4
	AIr+eqw9OlbvMCj3Cqle2lVvDrrYwJ/k2yW3E7kI7N1L5nUezxr8aM7otMTmcMAWMrZE4SE6pqv0q
	WZb8q8ZsuhmY6kFG6eNVjp7swzYTwVhLtrg+dusiqTKiPOw17BBCs6t/9kF3l7iIR6NNIQtkYGBPr
	+ZlgxN1bm2oPovICHnNR7h5FqkkbmDmBLOPzvp5sR64MME14a+0REwTE4422ApVp2ZWKXRSuFh+EF
	A4ZUIzGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w86fp-0000000GXFQ-3BOM;
	Thu, 02 Apr 2026 01:16:41 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w86fm-0000000GXA8-0Klq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 01:16:40 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=fpyuoqRhsa0MPUQAkvVYGReI2eoxdl7dtl+Yyx3fY5M=;
	b=nHeyRAEpxmymeQfk79R/agfVsRwUElVVqQrQKRGzpLdLej/PiQf1y+nC4iIh4YH4HKWFJ/f/r
	H/SEadxRo9wPd3OqnDjLIX8HKhpZQjGm3/QMLSEp4vGTiDLdlq23bZUrE6kd+mVuphD7UD2+38e
	VPsg7F5Kjq9b3IcTlfahN8I=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4fmNyL5m6Lz1prL9;
	Thu,  2 Apr 2026 09:08:10 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id D0C4040575;
	Thu,  2 Apr 2026 09:14:23 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 2 Apr 2026 09:14:23 +0800
Received: from [10.67.120.139] (10.67.120.139) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 2 Apr 2026 09:14:22 +0800
Message-ID: <4b262856-16e3-4273-bdc2-ab2282866afc@huawei.com>
Date: Thu, 2 Apr 2026 09:14:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH 0/7] perf tool: Support iostat for multiple platforms
To: Ian Rogers <irogers@google.com>
CC: <mike.leach@linaro.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>, <mark.rutland@arm.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<adrian.hunter@intel.com>, <peterz@infradead.org>, <john.g.garry@oracle.com>,
	<Jonathan.Cameron@huawei.com>, <shiju.jose@huawei.com>, <will@kernel.org>,
	<linux-perf-users@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxarm@huawei.com>, <liuyonglong@huawei.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <wangzhou1@hisilicon.com>
References: <20260126123514.3238425-1-wangyushan12@huawei.com>
 <CAP-5=fWkBjJy2i=e+zn1Ou5g3J8rapGKi8O7ryQ-ic2vXFEOoQ@mail.gmail.com>
 <d8639ed9-63d9-4a61-8cce-72f4b7fcb872@huawei.com>
 <CAP-5=fUmozPRDgms0QxHS5G3O8csrhyak9TWGGXeYE+QwiSHQA@mail.gmail.com>
Content-Language: en-US
From: Yushan Wang <wangyushan12@huawei.com>
In-Reply-To: <CAP-5=fUmozPRDgms0QxHS5G3O8csrhyak9TWGGXeYE+QwiSHQA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.139]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_181638_664838_2AB42DEF 
X-CRM114-Status: UNSURE (   7.40  )
X-CRM114-Notice: Please train this message.
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


On 4/2/2026 4:52 AM, Ian Rogers wrote:
>
> Hi Yushan, thanks for your effort on iostat! Did you have chance to
> work on follow up?
>
> Thanks,
> Ian
>

Yes, I am still working on it.

The next version will be posted in merge window or early 7.1 cycle.

Thanks for your attention!
Yuashan
>



