Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD7BCFA453
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 17:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3rK6XUAGf+zp3ZYAxTqwreJKtv0hg5oC2bWy724WbEc=; b=gixUxC3TqOi4W5shXEJNPDs4A3
	fp7Yz0qPr9MvVZNXvvyks2wIXWBay679Sx7b62UzgqpplFkVKIa4D4tTWtNypxBS2aMYMjYPZ5zui
	M3ak412JpWHS6Il5o9Nv0d8M8xGZf+tid74/RP2FVLUhhVsfaQWWg9ipb2fB9AUR4tYGacNEkrg7k
	31actYOzgwlQQIF9De/8KKo0gZ2uhlhFLe6vb0qahbkPTgj0Mg1T6/80L0LfsZn9zrOO5OsXjN04s
	VjjjvevZkFjdcyRYwtYht++LhViGHU9vRyKk5CoZc5ekeAJk8Yhw10H/eUMP3UNb2WLZnTbp4YDqo
	rFHBz1BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3erH-0000000FJ89-3IlF;
	Wed, 23 Oct 2024 17:09:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eDP-0000000FA4V-15sy
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 16:28:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3rK6XUAGf+zp3ZYAxTqwreJKtv0hg5oC2bWy724WbEc=; b=bM0ArL6qTOO3qU5Yl3o7iY5ztv
	/ly+q6QW/pvYIbQnMKoU94LHTE+MwVe+rOLkUq/ejdOiILmao+L84awfJp/u3iouLm70Cl0slNgwt
	p7kGRE9ot8MTi3yVA1LfW+qVgKk7DayDP5xQzc9BUs7mITzARaeMGvBT3GNjV/EWfs0qvTuwqelgR
	VVOJ/RDVeZfzfjJsw2h0fxFGVdlTp5jxPm4YRN3Zy/q4UXgftg+RZcm9OjvcZJJA/NAQjqTmC1x1+
	cUNmDzOwH/UnnKs9tdaRL0yWEt0x9CuwzRK2WdhsJO3RZXZeLF42W7d0JpGU4bAaQcvscwRccjHNR
	evIcA6OQ==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eDL-00000008S3f-2vgO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:28:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 67A4EA41B5B;
	Wed, 23 Oct 2024 16:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E22FC4CEE4;
	Wed, 23 Oct 2024 16:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729700882;
	bh=zkeVv4fB7aAAgQYMCWrMQpSx+Wxiy24fLuoD6zVLmHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WIuCvnFIc3qhI53Mp59QeREFUcbbwtIsLq2lccLsJdLdXN1e8g8T3LOVqJ70kyeTy
	 ikusaWlsVE5JKwDNcxZbYkoWfScz+UWeskYre5dVWSiD6Ie8XU2oTrqiANkjx3ADHG
	 FBzf0TJjv4XszeS5Y2lM8fxmd70wIqdocB6aG5mA7nwSopdAM9+zEiGNBbdXFu1AaM
	 pj8hkxi5T+YioS/6GEux9Itc0LQF3EqbuzYRUD+qLAiiOZnfATzDChW4NfGKmY/mnC
	 2E/mTWZPMiUvFGN386v9h/lJdJnekjn2wvzvy66zrAOVncFKuVsU0qwtg1+pDKGZyO
	 aB/O2iI5Q7bDg==
Date: Wed, 23 Oct 2024 17:27:56 +0100
From: Will Deacon <will@kernel.org>
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>,
	Rich Wiley <rwiley@nvidia.com>, Bob Knight <rknight@nvidia.com>
Subject: Re: [PATCH 3/3] perf: arm_cspmu: nvidia: enable NVLINK-C2C port
 filtering
Message-ID: <20241023162755.GB29251@willie-the-truck>
References: <20240918215846.1424282-1-bwicaksono@nvidia.com>
 <20240918215846.1424282-4-bwicaksono@nvidia.com>
 <20241014132839.GC17353@willie-the-truck>
 <SJ0PR12MB5676D1817E2C2F3693B82D4EA0452@SJ0PR12MB5676.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ0PR12MB5676D1817E2C2F3693B82D4EA0452@SJ0PR12MB5676.namprd12.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_172804_218564_CB93F0E0 
X-CRM114-Status: GOOD (  19.07  )
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

On Tue, Oct 15, 2024 at 05:29:28PM +0000, Besar Wicaksono wrote:
> > > diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > > index d1cd9975e71a..cd51177347e5 100644
> > > --- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > > +++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > > @@ -149,6 +149,7 @@ static struct attribute *pcie_pmu_format_attrs[] = {
> > >
> > >  static struct attribute *nvlink_c2c_pmu_format_attrs[] = {
> > >       ARM_CSPMU_FORMAT_EVENT_ATTR,
> > > +     ARM_CSPMU_FORMAT_ATTR(port, "config1:0-1"),
> > >       NULL,
> > >  };
> > >
> > > @@ -193,7 +194,7 @@ static u32 nv_cspmu_event_filter(const struct
> > perf_event *event)
> > >       const struct nv_cspmu_ctx *ctx =
> > >               to_nv_cspmu_ctx(to_arm_cspmu(event->pmu));
> > >
> > > -     if (ctx->filter_mask == 0)
> > > +     if (ctx->filter_mask == 0 || event->attr.config1 == 0)
> > >               return ctx->filter_default_val;
> > 
> > Isn't this a bit too broad? It looks like this filter function is used
> > beyond the C2C PMU (i.e. the PCIe PMU) and you're also checking the whole
> > of config1 rather than just the port field.
> > 
> 
> I think the other PMUs (PCIE and CNVLINK) that have similar filters will also benefit
> from this change, since a filter value of 0 on these PMUs are meaningless. Should I
> make the intention clearer by moving this particular change into a separate patch?

Yes. If you want to change the behaviour for other PMUs, then please be
explicit about that. In any case, I don't think you should check the whole
of config1.

Will

