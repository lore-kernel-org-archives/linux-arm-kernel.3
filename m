Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80175CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 10:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2O6UfvoDf2q39veAVk0xoKX64L8ZAcRZ+Hfjh7dr2I=; b=mHI5qVjfstPnOfNS1y7X83IG3d
	blWaeU6FBM8x8iihFJ9SOXMdqhYdQ1Qnat2jyzAOCIjFftyWh0itR4pO40A/P/We6cnu46iXmb0tl
	0xs/81dd4eEhJYeUt9BX6dLGnkv7DoZN/bV84d+UH+PhBDCuVF/SR0IFhtmviWn/aND1pDccz9lpv
	es9qA1SRJ7Bi4q8aFZZa4g1QhinB86xbhNCy6ykuGbbQkre/Fza6pJcpoLAB+5dSl+BSQt0nzOoOr
	gP2xNvzD24IwCth7jX45j6s68Dw0ZQU1eQTGF0ixCWfumjGLFqy9Rt6ukL2J4xu59lR3r0zXDdZ71
	3NZP/3fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uogHb-0000000DDLQ-1Hs4;
	Wed, 20 Aug 2025 10:43:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uof1p-0000000CuJD-17CY
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 Aug 2025 09:22:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=N2O6UfvoDf2q39veAVk0xoKX64L8ZAcRZ+Hfjh7dr2I=; b=I1oLHTQ7dAeQQ3vChYkINRwPx+
	UhnDDAg7JRDTJ0W0bGbS8zBnc84FXhF1oY4CTx+yN1/d7/cXuoXAXrEYc9NNW8/jK5UodwGEXtoRh
	Wj28XRk/3kPDBRjnwSr3U3KSK1TY8/H+kYl6LGT8JrQNbtB7e6McTFtv9T+xK7MYUB+UuZK1Ylq1q
	x8KxIcBhjysn0ljIdEn3MCneXZ/pnyhG4TqCUL+0C1sDcDImryw+s5b8rBvoz1py9+LOhPn40LH17
	YyHlTWrK3NQ35B7r9BWSOo3nmbMgQOwJfiBWEo4rcu61dviSyEYlgvL475DNW6dRG6faytcR+wwYX
	CiYmv0QQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uof1m-00000000FtM-1BVF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 09:22:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AF9C152B;
	Wed, 20 Aug 2025 02:22:33 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA4553F58B;
	Wed, 20 Aug 2025 02:22:35 -0700 (PDT)
Date: Wed, 20 Aug 2025 11:22:20 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: Lifeng Zheng <zhenglifeng1@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, rafael@kernel.org,
	viresh.kumar@linaro.org, sudeep.holla@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxarm@huawei.com,
	jonathan.cameron@huawei.com, vincent.guittot@linaro.org,
	yangyicong@hisilicon.com, zhanjie9@hisilicon.com,
	lihuisong@huawei.com, yubowen8@huawei.com, zhangpengjie2@huawei.com,
	linhongye@h-partners.com
Subject: Re: [PATCH v5 1/3] arm64: topology: Set scale freq source only for
 the CPUs that have not been set before
Message-ID: <aKWTzPl3bYPy-81e@arm.com>
References: <20250819072931.1647431-1-zhenglifeng1@huawei.com>
 <20250819072931.1647431-2-zhenglifeng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819072931.1647431-2-zhenglifeng1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_102242_598617_05753CFB 
X-CRM114-Status: GOOD (  17.37  )
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

I'd say it will apply across the series, but shorter commit message could be
used, like:

	arm64: topology: Skip already covered CPUs when setting freq source

Otherwise, once that's updated:
Reviewed-by: Beata Michalska <beata.michalska@arm.com>

---
BR
Beata


On Tue, Aug 19, 2025 at 03:29:29PM +0800, Lifeng Zheng wrote:
> The scale freq source of the CPUs in 'amu_fie_cpus' mask are already set to
> AMU tick before, so in amu_fie_setup(), only the CPUs in the 'cpus' mask
> should be set.
> 
> Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>
> ---
>  arch/arm64/kernel/topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 5d07ee85bdae..9317a618bb87 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -373,7 +373,7 @@ static void amu_fie_setup(const struct cpumask *cpus)
>  
>  	cpumask_or(amu_fie_cpus, amu_fie_cpus, cpus);
>  
> -	topology_set_scale_freq_source(&amu_sfd, amu_fie_cpus);
> +	topology_set_scale_freq_source(&amu_sfd, cpus);
>  
>  	pr_debug("CPUs[%*pbl]: counters will be used for FIE.",
>  		 cpumask_pr_args(cpus));
> -- 
> 2.33.0
> 

