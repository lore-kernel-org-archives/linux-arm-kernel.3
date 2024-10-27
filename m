Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E91D13572
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 18:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3bDCnwr2tpiCqAF/4OFQ7NQ0kkACLDkBSUOszTtAHBM=; b=s2Gpy3ANp+aK1J21ZmYnkVBrak
	vxH1zGCaDgClrVlkPtM/WnKnKKu2goVjM7kJRX2jUy4gCd+v/zDBEyMSlpPJsii/m9I/SDtB0ZVxd
	AhOfkHAVZlIdDNPEqtJ2Px6kJta3P2knobYGFljX37LsOTXyx/a78DEfr/etQak1O+FOOP4SEVxQN
	IGQbw8hopoqTPmwg1IH46vBf1jzUBvY18WwWPx1sY/LeE6tPubzygosptjAb1AtSI5aLuj9+u2u6Q
	c7lHLz+bITAqzMeYp6wgGoT5EsR6InlDepimU4k84ZGPicfu99wrv2X0HgwOOwLgQ3uN6GPiJ6ITv
	J6VC2tdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t57rD-00000008fR7-1L5R;
	Sun, 27 Oct 2024 18:19:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t57pZ-00000008ezb-2Dxt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 18:17:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7972F497;
	Sun, 27 Oct 2024 11:18:03 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EEA5B3F73B;
	Sun, 27 Oct 2024 11:17:29 -0700 (PDT)
Date: Sun, 27 Oct 2024 19:16:56 +0100
From: Beata Michalska <beata.michalska@arm.com>
To: viresh.kumar@linaro.org, rafael@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, ionela.voinescu@arm.com,
	catalin.marinas@arm.com, sudeep.holla@arm.com, will@kernel.org,
	sumitg@nvidia.com, yang@os.amperecomputing.com,
	vanshikonda@os.amperecomputing.com, lihuisong@huawei.com,
	zhanjie9@hisilicon.com
Subject: Re: [PATCH v7 0/4] Add support for AArch64 AMUv1-based average freq
Message-ID: <Zx6DmCBYQZkLWRhf@arm.com>
References: <20240913132944.1880703-1-beata.michalska@arm.com>
 <Zw-cje76QgQIN5kq@arm.com>
 <ZxAnbflwMuIWpKCW@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxAnbflwMuIWpKCW@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_111737_633567_32CACA32 
X-CRM114-Status: GOOD (  26.60  )
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

On Wed, Oct 16, 2024 at 10:51:57PM +0200, Beata Michalska wrote:
> On Wed, Oct 16, 2024 at 11:59:25AM +0100, Catalin Marinas wrote:

Hi Viresh,
Hi Rafael,

> Hi Catalin,
> > Hi Beata,
> > 
> > On Fri, Sep 13, 2024 at 02:29:40PM +0100, Beata Michalska wrote:
> > > This series adds support for obtaining an average CPU frequency based on
> > > a hardware provided feedback. The average frequency is being exposed via
> > > dedicated yet optional cpufreq sysfs attribute - cpuinfo_avg_freq.
> > > The architecture specific bits are being provided for AArch64, caching on
> > > existing implementation for FIE and AMUv1 support: the frequency scale
> > > factor, updated on each sched tick, serving as a base for retrieving
> > > the frequency for a given CPU, representing an average frequency
> > > reported between the ticks.
> > > 
> > > The changes have been rather lightly (due to some limitations) tested on
> > > an FVP model. Note that some small discrepancies have been observed while
> > > testing (on the model) and this is currently being investigated, though it
> > > should not have any significant impact on the overall results.
> > > 
> > > Note that [PATCH 2/4] arm64: amu: Delay allocating cpumask for AMU FIE support
> > > can be merged independently.
> > 
> > What's the plan with the rest of the patches? Are you going to respin?
> > The first patch would need an ack from Rafael or Viresh if we are to
> > merge them via the arm64 tree.
> >
> I am still waiting on any feedback on [PATCH 1/4] - changes to cpufreq, as that
> one drives the changes in arch specific bits. There is also an ongoing discussion
> on how to handle idle cpu cases - so I would say we still need to agree on few
> details.

Would really appreciate your feedback on above mentioned [PATCH 1/4] ->  [1]
as well as the discussion at [2].

Thank you.

---
[1] https://lore.kernel.org/all/20240913132944.1880703-2-beata.michalska@arm.com/
[2] https://lore.kernel.org/all/ZxAl77IYcMO2SfWh@arm.com/
---
> 
> ---
> BR
> Beata
> > Thanks.
> > 
> > -- 
> > Catalin
> 

