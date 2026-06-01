Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E443CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 15:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NCS5TripKyJvnwhntJ5SfguNzHIdaleCIVbTVkLmcPg=; b=u1otlslMy6AWGSQsRJhqzmUxgW
	GZBVlhVCZj4SnlaQzMDmEYspWVOEKi55iHg5OYNfCS+ZeDtJEx1sK6FWMRw7v0X6dCXPD30oNEZ4G
	yYdR13hK0UtgGo4XJfTz04bqkmBfpW6wCmf6ML1UkAp/1F0G28pbXA6oENxG16K7hFFXk3Zm1oY/G
	c1T2Jnh0KAYy1r5m/FYKwg4m4buN3WOB76ZeCeX5mJZYyxHXv+Q0DweroRKvGdd6Rf3eeNrEQIq1H
	OCggRosL+mRPhnRZWRXljaxW4bzZxbl7iufh+RtPEbiKlrW6jZiSAZm+9x5Ujrg+Q7t4JmuPmy1TX
	/e5VHoRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU4GF-0000000BLjh-2MbU;
	Mon, 01 Jun 2026 15:09:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU4GE-0000000BLjb-0QSk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 15:09:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8BF29600AA;
	Mon,  1 Jun 2026 15:09:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 531FD1F00893;
	Mon,  1 Jun 2026 15:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780326541;
	bh=NCS5TripKyJvnwhntJ5SfguNzHIdaleCIVbTVkLmcPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gxlLFTJHnxQAOITTp4L9AoVMaMINdEEof984rJgzpOC2OWTv3ktvPhqGP/ahqhrnT
	 b3GrMWvE8/YcMFifkVP9ES9GGot0+tc2HN9wfux4/EgNVzuvvMYrVGFCMr4oo3guXP
	 mUeMxE3iJPzItvx/49GNGMuWJkNZkgxDGy6l2oKrDgHSMNH3/CiRW7HupO00JTKsGh
	 OVOsetMaBi399g4N1ViMQrh8bSrmB5RnqyyyX3jTtX1rUm5lOmg24X3wHLMxd1HYWG
	 vmuHJDwfRtHKhx2RC32LlYFaQHwgHDsHC+xR6jxm1lpzBMbShmdsB3pKdfV8tkT4dp
	 EpFNENMEMRwrA==
Date: Mon, 1 Jun 2026 16:08:56 +0100
From: Will Deacon <will@kernel.org>
To: Saurav Sachidanand <sauravsc@amazon.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	aghayev@amazon.com, juew@amazon.com
Subject: Re: [PATCH 2/3] perf/arm_cspmu: nvidia: handle empty resource list
 in PCIE-TGT init
Message-ID: <ah2giNU4ZYN45emt@willie-the-truck>
References: <20260511210905.91917-1-sauravsc@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511210905.91917-1-sauravsc@amazon.com>
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

On Mon, May 11, 2026 at 09:09:04PM +0000, Saurav Sachidanand wrote:
> When acpi_dev_get_memory_resources() returns success but the resource
> list is empty (rentry is NULL), addr_filter_reg remains NULL from
> devm_kzalloc. Since IS_ERR(NULL) is false, the function proceeds
> without error and later dereferences the NULL pointer in
> pcie_tgt_pmu_config_addr_filter().
> 
> Set addr_filter_reg to ERR_PTR(-ENODEV) when the resource list is
> empty so the existing IS_ERR check catches it.
> 
> Fixes: 3dd73022306b ("perf/arm_cspmu: nvidia: Add Tegra410 PCIE-TGT PMU")
> Signed-off-by: Saurav Sachidanand <sauravsc@amazon.com>
> ---
>  drivers/perf/arm_cspmu/nvidia_cspmu.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

What happened to patch 1/3? I don't have it in my inbox and it seems to
be missing from the archive as well:

https://lore.kernel.org/all/20260511210905.91917-2-sauravsc@amazon.com/

Please can you post a v2, with all three patches and the R-b tags from
Besar?

Thanks,

Will

