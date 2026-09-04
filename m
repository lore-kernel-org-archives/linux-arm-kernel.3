Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2CDC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 14:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NLEFODUwUBfJQO7Bd/vsMIMorLr0ppUQg6Fq2awBDR8=; b=i1fHE6+drp4x9d7H3USeK0u8OL
	XrYIS6qU7FLddtnFK1xOb03r43N7nDCUtjVo+PuibfoDZReXs5nN9HtnaDGSlhS6BQElezNs2JZVG
	KOnvEjcR5uqPS7inTpc0q4mP5GcOGZ7nreTNRDyAkKxLYo82Cgi8/ES3ScwxSQGttwnwrvGS1oeGu
	Jb8agXJhIGNUNDGdwHK8Ef53M2fhFtXjN9cfzrSYYT7LEP3hg4V2wL7gsiQhAxLxZfe8y3zCAc2DG
	6noIOwZj7ybsjLKKlW57RZhdY1mDI4wCoeGgk2RUQqpYH/0tQLhi18rJBsLQEmJWjCsFnwKSjS1LI
	flYf4i+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2UuX-00000002NuB-2udE;
	Fri, 04 Sep 2026 14:28:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2UuW-00000002Ntc-0dyN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 14:28:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 874754041F;
	Fri,  4 Sep 2026 14:28:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EACFD1F00A3E;
	Fri,  4 Sep 2026 14:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788532135;
	bh=NLEFODUwUBfJQO7Bd/vsMIMorLr0ppUQg6Fq2awBDR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TJZX/12ffCJ50vp7+QhS8YFeL9SgjJo5QchjcSOHU2XU64hsKjZIlnq9EBf94UZoI
	 xkJvBD3sMIrJpcI2rN0teM9Fs1iK3mcZEpyiwMFhmhAF0nGOJpACvmFtW/amOJXaSd
	 40kJMl4HJnxEVJyNLPTJapcgwaFtU0h87luLIPDN2CznZlC9mv2lg0otptey3Jq5D4
	 8/ezmQo9n+jzyI1DMlJyIht4FacKHGZ86Ot8xicAl6qK1QKD8XKbQ4V8QUe9sHK/m7
	 gnKcVebvAFKjPGmWe4BYRUNKC24cVs0e9olhaM34ln6x7h8M22tuoRG2pGuQ4+2plJ
	 TVyNRAwB3fDsg==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.ams.internal (Postfix) with ESMTP id A3505198003A;
	Fri,  4 Sep 2026 10:28:49 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 04 Sep 2026 10:28:52 -0400
X-ME-Sender: <xms:odWaapNSEQ-G-0TcsARK7cXK7oNOiTgZlzm3-mB8hD9Gb5wDP1YtZg>
    <xme:odWaarPbEPM1vS6MwXLSegErlLyh-2lQY0ubYV3yXqP8wy4tkji5YA7IGhcdiHeRH
    bUxcpGwwwvF8sFr9vvadDHg2RrCuZwd26Th7r8_pst65Sb0aZphWXzM>
X-ME-Received: <xmr:odWaakfy9KQsmKfHX0ttenZA80rYp5ru4g_BJmKN5PzONa19y4VwGcSyUoI>
X-ME-Proxy-Cause: dmFkZTEbzP5C75qSSNyFWsCoMZ0dLuj2B5LNrXHLD6OHdyNy1GWXodF7g9M/ipkYbP+JZS
    haFZodY1i86dLB35wwWDVpkFALS48B8BKG1UTVK/po8O0WYyhoHs7d5m5K6dbyth0u6uxB
    t3JsHT5Tw/i2nhALa5IzwHvm8q+WaNTAfriWw/2g0uiyoa/PbzbaSgkSKl1YBykK9wpb7Y
    Vd3LJbBVSm7+e6N/RRMw2FZxIm3joVNZFTtNO8i3QRb6+KzRdZf+2QOIsX7dGZR9KmWJOn
    xkLK3veBz5e1aX87MRy6sousg0QNYEANoIBMuHojt2lGjwXyFdy1UqlgxCfb5YAPc03zmD
    f7o7Q0a3uTUYqApeTvV3IYGNpMcsWv8n3VBCzB2R9ZctBP4qDAOBp467NyOjlUUXaikvVn
    fqRv02Ec+wx0d3ZlkmXbnVUyKdlahhH0m/pY1XMiQp/MzQc36PmfxSzSag5Rb08+bNBzzy
    Ype+H7n7HEpX6lIsWxtKyZzPMBntXd5HjczJS01SOhLla7+pLTySWjAsi7V5Wb0ieFxqIF
    JgZajoTQjrri9dbmWa90hYRpwsFgVALh7jtfzDLrvqP+PUcinztMku2QVnFUYXw9g5Ypjn
    xASbTUjB8GVIdc6VhI1V2OGXWUQ+HkZQMMkscIFYLENEAvHm6yVyBlnBVI6g
X-ME-Proxy: <xmx:odWaagcrXNVnL9sxSWXRGLzRgZCWOrtmWr1YLRQBB6_TF5MCrzqCrQ>
    <xmx:odWaakdIn2AUoc5ByfKy2rLkut9R9_uBqR2tsphmjuaJIWL8V4shtw>
    <xmx:odWaahmvdJCPXbECUv958ulsQzuLGc7OlAUyuqpp2vBgmbc-3XYufQ>
    <xmx:odWaau4JvJxEI6CMm3Xkt--lMY4lU7Ok2B4lHIsA3kENGLqaYTJMoA>
    <xmx:odWaahtWz6vOpN4OOsjTeSzLgx_6p065ojXS1hRxIU1Q-wciKAIOsx6I>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Sep 2026 10:28:48 -0400 (EDT)
Date: Fri, 4 Sep 2026 15:28:47 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Pranjal Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Krishna Reddy <vdumpa@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Breno Leitao <leitao@debian.org>, Kyle McMartin <jkkm@meta.com>, 
	Usama Arif <usama.arif@linux.dev>, kernel-team@meta.com, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] iommu/arm-smmu-v3: Add a cmdq_entries module
 parameter
Message-ID: <aprVfyn0BFoL1rx8@thinkstation>
References: <20260902121724.3494954-1-kas@kernel.org>
 <20260902121724.3494954-2-kas@kernel.org>
 <aphbV1FSoop1YGOQ@nvidia.com>
 <aplvJIuarj_ZrAx9@thinkstation>
 <apmNw4hMrkYqyD3j@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apmNw4hMrkYqyD3j@nvidia.com>
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

On Thu, Sep 03, 2026 at 08:09:55AM -0700, Nicolin Chen wrote:
> On Thu, Sep 03, 2026 at 03:15:27PM +0100, Kiryl Shutsemau wrote:
> > On Wed, Sep 02, 2026 at 10:22:31AM -0700, Nicolin Chen wrote:
> > > On Wed, Sep 02, 2026 at 01:17:23PM +0100, Kiryl Shutsemau (Meta) wrote:
> > > > +/**
> > > > + * arm_smmu_queue_max_n_shift() - pick the log2 depth of a queue
> > > > + * @hw_shift: log2 depth the hardware allows, capped for natural alignment
> > > > + * @ent_sz_shift: log2 of the queue entry size in bytes
> > > > + * @want: number of entries asked for, or zero to use @hw_shift
> > > > + *
> > > > + * @want is rounded down to a power of two. It never sizes a queue below one
> > > > + * page, because coherent DMA is page granular: a shallower queue occupies the
> > > > + * same memory as one that fills the page, and arm_smmu_init_one_queue() stops
> > > > + * shrinking at a page too.
> > > 
> > > Well, since we want the cmdq depth, why not name the parameter
> > > "max_cmdq_depth"? Then, no rounding and more straightforward.
> > 
> > The max_ prefix is better, thanks. cmdq_entries does not say it is a
> > ceiling.
> > 
> > On the units, the page floor has to stay whatever we call the parameter.
> > 
> > Ask for 8 entries and max_n_shift comes out as 3, which the
> > CMDQ_BATCH_ENTRIES check in arm_smmu_device_hw_probe() rejects with
> > -ENXIO. The floor gives you 256 entries on a 4K kernel instead of a failed
> > probe.
> > 
> > So log2 removes the rounding but not the flooring, and the number asked for
> > still is not always the number you get. I would rather keep entries than
> > make people convert.
> > 
> > The rounding is not silent, either: arm_smmu_init_one_queue() already
> > prints "allocated %u entries for cmdq", so the effective depth lands in
> > dmesg whichever unit the parameter takes.
> > 
> > On the name itself, "depth" reads to me as a number of entries rather than
> > its log2, so max_cmdq_depth=8 meaning 256 seems more surprising than the
> > rounding it replaces.
> 
> Well, maybe "cmdq_max_n_shift" is a better one over "depth".
> 
> Given CMDQ_BATCH_ENTRIES is used, I think cmdq_max_entries works.

cmdq_max_entries it is. Renamed for the next version.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

