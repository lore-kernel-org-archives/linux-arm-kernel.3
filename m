Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7811C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 06:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwqVAFyafYk7ZkJ+IKzcE9WC2F6hvkZZkWXxJvS4qCs=; b=Vc+RNZrGfq0RMKOc8Mvz8+CDq1
	AHbp6wsx2AzOBbDVQbW7quwcyLwlc/vOy1+UBcvtJUSfCWvdsXw+lUblrrBImnTeM74Bp+rx25yC0
	pHchPxp7P8npTS1tgPYSJtyVNCR7Ke8GXlDPGb8E5LyhX6LQnqlAYvneC7KjwO3GM/Fs/6Ue2x7GY
	H3TOIZOwaU8Zt6hlOZlVbt02ZCkk6zmntFOEKYG/AL6DXl6gYRBoL6ADMZYqeP9kkgHahArkBH5rv
	NVhsPkegC6Hii6UzRNAqdkhZOGnU8Dsc2pQyUCs4fskIPiSGur2V2n4gm+dRmIT46s2GVYSh9nNrY
	6rpKlqFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toGHv-0000000DVga-0Hxj;
	Sat, 01 Mar 2025 06:25:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toGGM-0000000DVbq-3bOF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 06:23:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0EC6A5C4369;
	Sat,  1 Mar 2025 06:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E075AC4CEDD;
	Sat,  1 Mar 2025 06:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740810229;
	bh=ykUC0yVuYh8esAQTZSAX9HlvVvWcsQQeaxtZoPbiGnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k0klQzH3S/kOg2+U3PiboIBD/0DApyEpcWc51PTaK4+EvuJzkfV3BUZYdKTIFwUhf
	 a4Y4HtuR9MysUHyVwfojyaz3q4IQQFr7Gim3wrx9z14EDa9QxW1iG/NZufl/bJmPy9
	 4yeAFqiZcIUsceGrX7TYrmtbDRWS3eYlh0TzucVJIhSgUxaHwbidLpTh98AJx71V4y
	 xRjouKwn/+BW6MMkj8PUFfXpePFFSNXC5fm8zw5GPKH28Ur7PRM8YsI+R+av9+8Cgh
	 Qo1l4UcGcc94Lhvz8eka2/gn/ie8siTLrEoPprfy2CqiZiS6YvihIHL8Y02IIBkEms
	 WyKiFDwDo7X+A==
Date: Sat, 1 Mar 2025 06:23:44 +0000
From: Will Deacon <will@kernel.org>
To: Yicong Yang <yangyicong@huawei.com>
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, jonathan.cameron@huawei.com,
	prime.zeng@hisilicon.com, linuxarm@huawei.com,
	yangyicong@hisilicon.com, wangyushan12@huawei.com
Subject: Re: [PATCH 1/9] drivers/perf: hisi: Extend struct hisi_pmu_dev_info
Message-ID: <20250301062343.GA27700@willie-the-truck>
References: <20250218092000.41641-1-yangyicong@huawei.com>
 <20250218092000.41641-2-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218092000.41641-2-yangyicong@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_222350_957758_CF9E5799 
X-CRM114-Status: GOOD (  17.15  )
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

On Tue, Feb 18, 2025 at 05:19:52PM +0800, Yicong Yang wrote:
> From: Junhao He <hejunhao3@huawei.com>
> 
> The counter bits and event range may differ from versions of a
> certain uncore PMU. Make this device specific information into
> struct hisi_pmu_dev_info. This will help to simplify the
> initialization process by using a list of struct hisi_pmu_dev_info
> rather than checking the version.
> 
> Signed-off-by: Junhao He <hejunhao3@huawei.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  drivers/perf/hisilicon/hisi_uncore_pmu.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.h b/drivers/perf/hisilicon/hisi_uncore_pmu.h
> index f4fed2544877..777675838b80 100644
> --- a/drivers/perf/hisilicon/hisi_uncore_pmu.h
> +++ b/drivers/perf/hisilicon/hisi_uncore_pmu.h
> @@ -72,6 +72,8 @@ struct hisi_uncore_ops {
>  struct hisi_pmu_dev_info {
>  	const char *name;
>  	const struct attribute_group **attr_groups;
> +	u32 counter_bits;
> +	u32 check_event;
>  	void *private;
>  };

This doesn't really do anything on its own; please just fold it into the
patch where the new fields are used.

Will

