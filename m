Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F251CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFlr4efB97JwSVAAo84Sbj91IVg+sa9UpmbiWhKuaEs=; b=tSCBBrh9nNUhHsMAcYsrlahu4d
	LApfSQYWbSGsV1sOlbi3Vrthu9NUzfZIbrfZheRoc/VUXDQHu6sVoUyHQiH4ecqqy45hL/xGmcOaK
	O2SLKp4dr5ntwQ7hrbCB3usdlJ7lZozmePQ80AQsnxg+hiYBKoIpOnKeIJmwdavLXq2qAuVoHaOWA
	GHdZGa7gvhMdZyr/5dlgCyaN17f1Am/dCuhdl3RtCX5w/6oai+dvB8idK3PUAjkO2SCYqInQ5FueZ
	iQFVQeFun02GxNVrBHpZmJ4ZZ4RDrEBJyCStkPHA+p8kYRbTI14rZf6FVdMq9P0FzqkccScZnp8Hu
	Zd1rZf5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gPt-0000000ATDJ-17ha;
	Mon, 22 Sep 2025 13:17:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gPr-0000000ATCi-3661
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 22 Sep 2025 13:17:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FFlr4efB97JwSVAAo84Sbj91IVg+sa9UpmbiWhKuaEs=; b=pw+feo2xcoKbhTEUhvtA+r7xTG
	eebJROu4TBvP46P/jbLFfhrbbPa70bF7li5pKBxjMGcAYmAq3SDe9JNRPyMbO19GZ1MftpY+iPKLh
	RvnNkeTkiDTw8lny7aII7yJhBESvdAlOHTcZqJC/4HfzkE/dA3JzqGyxbaurftzMrGEQXha2C2kt9
	6Hv4TYWBitPBuPnQWgN0Y1unx7ohBvg2u5wExTw4RPVjg5JEcDxhKkiXyUALaYORxAxbhutrNREQ7
	5dFNQ1w0hJO1jViFNumPfk0psynnbgcIdH8nJtg4c5kQgx1X/msYXDT6UW6hYQXcnjiByfgwv6R3T
	2c0SiSdA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gPo-00000008IRJ-2BK6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 13:17:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BA735445C4;
	Mon, 22 Sep 2025 13:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45420C113D0;
	Mon, 22 Sep 2025 13:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758547030;
	bh=qwlHTg4aPlAq/HCxAc3/+aeHYqycjOb3rj/8p3g4PnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RWNHE1G8YssERyk1JUnokVu8CrXeaw1eWFhIRuQFSw6pRErrBu+05ocN1tFmTXwgy
	 eaw2JmgICPM2yMS5GZRcFx7CZz2+RFGtM3AAd+H6TmXEejZtMYCvQaIlyIe2SVJBVr
	 ZmetPjKzkSJouyK2Ua+85ZuT546YQ2CJXqaOIt1BffPoo/BJGVRLafjDALG4AVKtVC
	 KzJOtBAvD+Wl5mN4YF1IMRtaJYlfJU0dyufMiABtVAukHFsdgwPNcLiqodRhzERJEO
	 DoxDpJ6ddAq/ZErS+GhzMIz+UqQEUv4+YLDJtuENmujcjJxl70wr+g6UFQQijjCIjZ
	 jnH0axWKI9Vww==
Date: Mon, 22 Sep 2025 14:17:05 +0100
From: Will Deacon <will@kernel.org>
To: Yushan Wang <wangyushan12@huawei.com>
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com,
	yangyicong@huawei.com, Jonathan.Cameron@huawei.com,
	liuyonglong@huawei.com, wanghuiqiang@huawei.com,
	prime.zeng@hisilicon.com, hejunhao3@h-partners.com,
	linuxarm@huawei.com, fanghao11@huawei.com
Subject: Re: [PATCH v3 5/9] drivers/perf: hisi: Extend the field of tt_core
Message-ID: <aNFMUdPJeJo9XU1e@willie-the-truck>
References: <20250829101427.2557899-1-wangyushan12@huawei.com>
 <20250829101427.2557899-6-wangyushan12@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829101427.2557899-6-wangyushan12@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_141713_113672_32291C20 
X-CRM114-Status: GOOD (  20.68  )
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

On Fri, Aug 29, 2025 at 06:14:23PM +0800, Yushan Wang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Currently the tt_core's using config1's bit [7, 0] and can not be
> extended. For some platforms there's more the 8 CPUs sharing the
> L3 cache. So make tt_core use config2's bit [15, 0] and the remaining
> bits in config2 is reserved for extension.
> 
> Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
> ---
>  drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
> index a372dd2c07b5..39444f11cbad 100644
> --- a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
> +++ b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
> @@ -55,10 +55,10 @@
>  #define L3C_V1_NR_EVENTS	0x59
>  #define L3C_V2_NR_EVENTS	0xFF
>  
> -HISI_PMU_EVENT_ATTR_EXTRACTOR(tt_core, config1, 7, 0);
>  HISI_PMU_EVENT_ATTR_EXTRACTOR(tt_req, config1, 10, 8);
>  HISI_PMU_EVENT_ATTR_EXTRACTOR(datasrc_cfg, config1, 15, 11);
>  HISI_PMU_EVENT_ATTR_EXTRACTOR(datasrc_skt, config1, 16, 16);
> +HISI_PMU_EVENT_ATTR_EXTRACTOR(tt_core, config2, 15, 0);
>  
>  static void hisi_l3c_pmu_config_req_tracetag(struct perf_event *event)
>  {
> @@ -397,7 +397,7 @@ static const struct attribute_group hisi_l3c_pmu_v1_format_group = {
>  
>  static struct attribute *hisi_l3c_pmu_v2_format_attr[] = {
>  	HISI_PMU_FORMAT_ATTR(event, "config:0-7"),
> -	HISI_PMU_FORMAT_ATTR(tt_core, "config1:0-7"),
> +	HISI_PMU_FORMAT_ATTR(tt_core, "config2:0-15"),
>  	HISI_PMU_FORMAT_ATTR(tt_req, "config1:8-10"),
>  	HISI_PMU_FORMAT_ATTR(datasrc_cfg, "config1:11-15"),
>  	HISI_PMU_FORMAT_ATTR(datasrc_skt, "config1:16"),

I'm a _tiny_ bit worried about this change in that it has the potential
to break any users who've hardcoded the 'tt_core' encoding in 'config1'.
Granted, they should be parsing this out of sysfs, but you never know.

If we were going to avoid the possibility of a regression entirely, I
think we'd either need to (a) split the field so that the upper 8 bits
of 'tt_core' live in 'config2' but the bottom 8 bits stay where they
are or (b) leave 'config1:0-7' as an alias of 'config2:0-7'.

The latter is still do-able, as you haven't re-allocated the config1
bits yet.

Will

