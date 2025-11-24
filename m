Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C92ECFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 15:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qyoupWuyNWjhlYprb9sGzYLDXJ55IhuIjhPmAeNFJLc=; b=04XRu5UqMD/lae8fzPMVwup6m4
	sgZpkaIORjX+8sovWJW7ZzHugjA7EejtkHZJHBEu4LyGufWFABISME/fbz5UwClB48eswIUKkC1ku
	k1l6ihCL/X9m6kiF2SQMQ/t7ZpnLzzLG9Sf6JhlVIJ+R4cXlJYBIDshlmFXr2Qe87a+qPYKlbPIke
	4NJM9QSee3bCG1lpfjKLv4Gw8vt/HemtBXoHlCztfFEbjntFl0I1hKw/0ClR/iX0ajOrUFdqq9aJk
	0XyzP18U+eIMz5KZYEmMUIxOm4Ur8mVXSTFGeCnb+t09VmxsEQ3eiK1SxXfyRBRQPlAWs8av0BmM/
	Gcwjckaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYnO-0000000BwaN-35cd;
	Mon, 24 Nov 2025 15:48:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYnN-0000000BwaG-0ZTf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 15:48:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3912760123;
	Mon, 24 Nov 2025 15:48:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E42C4CEF1;
	Mon, 24 Nov 2025 15:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763999283;
	bh=FLMx1GivANRnocEV0MytSyDj5vCao8uRa4BcsNsMBug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jcYdACyvMEq/0Zc274gSXP4imq025Og9F1TSdafiZcVQF6Js2BRoVwA2lKOGxDpiD
	 lFvX9zstpZxY14uuYtBmlQXtVzcHTqN3IQ5sDjJnHp/q17x22kUok2AXPeiWvyp7YR
	 r7aj/lMzCY68w32lclRkQ3LEqq0OvnSh7sJg5JOcey5jCdSODsBk8gz120kXgGu/C0
	 gguoVkEkwkTvJjkUkZjGOhzaBSS4o/BINs7Y0hTYXKY+vTzSCZj0k1YRTJ4A7QRY10
	 on5N8HnAJs0O5Vb9KDJV0ofSnPo+5KNnFT+AUdhwkdDOCddXh4PRna4ZFG1NBRJu7G
	 N0HFRImdbys3w==
Date: Mon, 24 Nov 2025 15:47:58 +0000
From: Will Deacon <will@kernel.org>
To: Shouping Wang <allen.wang@hj-micro.com>
Cc: robin.murphy@arm.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	andy.xu@hj-micro.com, peter.du@hj-micro.com
Subject: Re: [PATCH 1/2] perf/arm-ni: rename PMU device name
Message-ID: <aSR-Lu-nkSJl0V-x@willie-the-truck>
References: <20251107084320.555979-1-allen.wang@hj-micro.com>
 <20251107084320.555979-2-allen.wang@hj-micro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107084320.555979-2-allen.wang@hj-micro.com>
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

On Fri, Nov 07, 2025 at 04:43:18PM +0800, Shouping Wang wrote:
> The PMU device names are arm_ni_1_*,arm_ni_2_*, etc. 
> The device names change based on the order of registration 
> for multiple NI instances. By naming the PMU device using 
> its address, the device name can be made independent of 
> the registration order.
> 
> Signed-off-by: Shouping Wang <allen.wang@hj-micro.com>
> ---
>  drivers/perf/arm-ni.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
> index 1615a0564031..32eabdbe877a 100644
> --- a/drivers/perf/arm-ni.c
> +++ b/drivers/perf/arm-ni.c
> @@ -53,6 +53,7 @@
>  
>  #define NI_NUM_COUNTERS		8
>  #define NI_CCNT_IDX		31
> +#define NI_PMU_PA_SHIFT		12
>  
>  /* Event attributes */
>  #define NI_CONFIG_TYPE		GENMASK_ULL(15, 0)
> @@ -115,7 +116,6 @@ struct arm_ni {
>  	struct device *dev;
>  	void __iomem *base;
>  	enum ni_part part;
> -	int id;
>  	int cpu;
>  	int num_cds;
>  	struct hlist_node cpuhp_node;
> @@ -560,7 +560,7 @@ static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node *node, u64 res_s
>  		.read = arm_ni_event_read,
>  	};
>  
> -	name = devm_kasprintf(ni->dev, GFP_KERNEL, "arm_ni_%d_cd_%d", ni->id, cd->id);
> +	name = devm_kasprintf(ni->dev, GFP_KERNEL, "arm_ni_%llx", res_start >> NI_PMU_PA_SHIFT);

Doesn't this have the potential to break userspace (e.g. scripts) that
expect the current naming to be stable?

Either way, I'll need Robin's acks for these changes.

Will

