Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BAD2C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 09:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aIsC5st1aUnuMyMsnRRd3Mcw6WZOSNtqmxj27d0O7A4=; b=oel1tTrwVwyMvbVE8K6ZKKLWks
	5MXMaGhJ4yIOsiHxGvMHaHYPNSXh2p2M+7nDaYaOzEGUxOoctBpZeMjEdXB1UEPlMjQdZ+IqbG8nj
	0ZOAJza6vYp/vwlpkKC6Za1CoLMZe6X6uuiBkPgXSbPesu6NXkdyQJ9f5jy+C7TDeYojvhefrNPKM
	ghvKHdNah0JF43WPt3sO2kgNw8Xd1urcI3bWCS5gzCXp0jnQw7KdQkLMzq5ELHfW1yljILFwJ4di0
	z1gIhjdFgAXyJvTHyNQSSbzU3gb4UhfSMtMjScL4SdsczOFE3EfdMpshAy+z4WHvqEMoIKDPkjx2A
	OmeiEE/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl30x-000000004Qa-2Tg3;
	Thu, 20 Feb 2025 09:38:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2zT-0000000040Z-0Dpu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 09:37:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F93D1BB0;
	Thu, 20 Feb 2025 01:37:24 -0800 (PST)
Received: from mazurka.cambridge.arm.com (mazurka.cambridge.arm.com [10.2.80.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BA813F6A8;
	Thu, 20 Feb 2025 01:37:03 -0800 (PST)
Date: Thu, 20 Feb 2025 09:37:00 +0000
From: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: ryan.roberts@arm.com, yang@os.amperecomputing.com,
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com,
	broonie@kernel.org, mark.rutland@arm.com, james.morse@arm.com,
	yangyicong@hisilicon.com, robin.murphy@arm.com,
	anshuman.khandual@arm.com, maz@kernel.org, liaochang1@huawei.com,
	akpm@linux-foundation.org, david@redhat.com, baohua@kernel.org,
	ioworker0@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] arm64: Add BBM Level 2 cpu feature
Message-ID: <20250220093700.GB11745@mazurka.cambridge.arm.com>
References: <20250219143837.44277-3-miko.lenczewski@arm.com>
 <20250219143837.44277-5-miko.lenczewski@arm.com>
 <Z7ZqbLdlbmeVX5a0@linux.dev>
 <Z7Zv90i0DyvxFUcv@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z7Zv90i0DyvxFUcv@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_013707_218425_4C438354 
X-CRM114-Status: GOOD (  29.21  )
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

Hi Oliver,

Thank you for taking the time to review this patch series.

On Wed, Feb 19, 2025 at 03:57:43PM -0800, Oliver Upton wrote:
> On Wed, Feb 19, 2025 at 03:34:12PM -0800, Oliver Upton wrote:
> > Hi Miko,
> > 
> > On Wed, Feb 19, 2025 at 02:38:38PM +0000, Mikołaj Lenczewski wrote:
> > > +config ARM64_ENABLE_BBML2
> > 
> > nit: consider calling this ARM64_BBML2_NOABORT or similar, since this
> > assumes behavior that exceeds the BBML2 baseline.
> > 

That is a better phrasing, will change this.

> > > +	bool "Enable support for Break-Before-Make Level 2 detection and usage"
> > > +	default y
> > > +	help
> > > +	  FEAT_BBM provides detection of support levels for break-before-make
> > > +	  sequences. If BBM level 2 is supported, some TLB maintenance requirements
> > > +	  can be relaxed to improve performance. Selecting N causes the kernel to
> > > +	  fallback to BBM level 0 behaviour even if the system supports BBM level 2.
> > > +
> > 
> > [...]
> > 

I will assume you mean to add the comment about this technically
exceeding the BBML2 baseline to the docs here as well? Or am I
misunderstanding?

> > > +static bool has_bbml2_noconflict(const struct arm64_cpu_capabilities *entry,
> > > +				 int scope)
> > > +{
> > > +	if (!IS_ENABLED(CONFIG_ARM64_ENABLE_BBML2))
> > > +		return false;
> > > +
> > > +	/* We want to allow usage of bbml2 in as wide a range of kernel contexts
> > > +	 * as possible. This list is therefore an allow-list of known-good
> > > +	 * implementations that both support bbml2 and additionally, fulfil the
> > 
> > typo: fullfill
> 
> I can't spell either ;-)

Spelling is hard, will fix :)

> > > +	 * extra constraint of never generating TLB conflict aborts when using
> > > +	 * the relaxed bbml2 semantics (such aborts make use of bbml2 in certain
> > > +	 * kernel contexts difficult to prove safe against recursive aborts).
> > > +	 */
> > 
> > We should be *very* specific of what qualifies a 'known-good'
> > implementation here. Implementations shouldn't be added to this list
> > based on the observed behavior, only if *the implementer* states their
> > design will not generate conflict aborts for BBML2 mapping granularity
> > changes.
> > 

Understood, will clarify.

> > > diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
> > > index 1e65f2fb45bd..8d67bb4448c5 100644
> > > --- a/arch/arm64/tools/cpucaps
> > > +++ b/arch/arm64/tools/cpucaps
> > > @@ -26,6 +26,7 @@ HAS_ECV
> > >  HAS_ECV_CNTPOFF
> > >  HAS_EPAN
> > >  HAS_EVT
> > > +HAS_BBML2_NOCONFLICT
> > 
> > Please add this cap to cpucap_is_possible() test for the config option.
> > 

Sure, will do so.

-- 
Kind regards,
Mikołaj Lenczewski

