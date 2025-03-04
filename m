Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92A8C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 09:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hqbwbg7la+zzEU/UnmAdZqVVkloDx480OcALkPkoW1E=; b=vzfECH8J8BttCEBlSTNZjAxnwv
	eKDl10/PhDCRDt8W9eRYAAr7fM1bBzAJvIcS7mkBa0MJa6Jy27OM8QIbhqr4A/PBKlJl2Zi+OEUBm
	nmg33QyacLADfmSFLqpVlODR1BxtNFcIyvdSyH1G8FrKNSvlX+Kcjf+0YQtVxSeVk2T6POdfrrJt1
	83B3VCwfjjjX9QiqxxFqfGZXyGXff7gpymc86EmG0MdTZiJo4bSqj/2gk5TH0DjYmIITKqkgI/L6+
	UikXXlUs4zToDYHKWGI/p2VMC4C6TdHUZZ507MxtSQLyBmk1mQbXW0qeIyIgZ/Blphx1dEnuZzZu2
	X21Al1SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOUN-00000003rT2-16Ly;
	Tue, 04 Mar 2025 09:22:59 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOSm-00000003r4R-2ua0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 09:21:22 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Z6VVV3RPXz6K9BZ;
	Tue,  4 Mar 2025 17:18:58 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 592D9140A08;
	Tue,  4 Mar 2025 17:21:10 +0800 (CST)
Received: from localhost (10.96.237.92) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 4 Mar
 2025 10:21:07 +0100
Date: Tue, 4 Mar 2025 17:21:02 +0800
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Yicong Yang <yangyicong@huawei.com>
CC: Will Deacon <will@kernel.org>, <yangyicong@hisilicon.com>,
	<mark.rutland@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <wangyushan12@huawei.com>
Subject: Re: [PATCH 1/9] drivers/perf: hisi: Extend struct hisi_pmu_dev_info
Message-ID: <20250304172102.00006e54@huawei.com>
In-Reply-To: <e6cfcfd0-5412-20bb-f4b5-cf266884c5d0@huawei.com>
References: <20250218092000.41641-1-yangyicong@huawei.com>
	<20250218092000.41641-2-yangyicong@huawei.com>
	<20250301062343.GA27700@willie-the-truck>
	<e6cfcfd0-5412-20bb-f4b5-cf266884c5d0@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.96.237.92]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_012120_876405_116097EF 
X-CRM114-Status: GOOD (  19.13  )
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

On Mon, 3 Mar 2025 22:43:35 +0800
Yicong Yang <yangyicong@huawei.com> wrote:

> On 2025/3/1 14:23, Will Deacon wrote:
> > On Tue, Feb 18, 2025 at 05:19:52PM +0800, Yicong Yang wrote:  
> >> From: Junhao He <hejunhao3@huawei.com>
> >>
> >> The counter bits and event range may differ from versions of a
> >> certain uncore PMU. Make this device specific information into
> >> struct hisi_pmu_dev_info. This will help to simplify the
> >> initialization process by using a list of struct hisi_pmu_dev_info
> >> rather than checking the version.
> >>
> >> Signed-off-by: Junhao He <hejunhao3@huawei.com>
> >> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> >> ---
> >>  drivers/perf/hisilicon/hisi_uncore_pmu.h | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.h b/drivers/perf/hisilicon/hisi_uncore_pmu.h
> >> index f4fed2544877..777675838b80 100644
> >> --- a/drivers/perf/hisilicon/hisi_uncore_pmu.h
> >> +++ b/drivers/perf/hisilicon/hisi_uncore_pmu.h
> >> @@ -72,6 +72,8 @@ struct hisi_uncore_ops {
> >>  struct hisi_pmu_dev_info {
> >>  	const char *name;
> >>  	const struct attribute_group **attr_groups;
> >> +	u32 counter_bits;
> >> +	u32 check_event;
This name is a little confusing.  Maybe nr_events or similar?


> >>  	void *private;
> >>  };  
> > 
> > This doesn't really do anything on its own; please just fold it into the
> > patch where the new fields are used.
> >   
> 
> sure, will make this into the following patch.
> 
> Thanks.
> 


