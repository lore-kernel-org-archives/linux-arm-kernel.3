Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C805C35FF7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 18:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=swmYT6xkFK4vHGwvPJgLRw5zOvFrSALNRVhA9GAQH88=; b=d/Zl1lkXMozmvG1rchx2wk+nVv
	Zq5scxZ2wFlleJ5i3xpK3qj84bScXNTjeZxG87e3TBAMHTIErq9dt9mkaBsLyXzEx+JFsDWd+YXL6
	uCsIXCUJLM9/5jD2Im/Kx2hs0Tcwyw9NwpmevopcETBkf3RYfcu/bXbXrnl0XNcOrbp3+a1lrxHeF
	N6gHVIfwnAf1Sx9TF84D9QFc1ex/5DqM9mNoqx0XDWcp+zN7ZgFRtDeIB2W2NRi+Le9lWZIRoVqHr
	D/SGdke76j5i/qBeE7kz6qf8LTvDY5bcTgh818m3Hr6HlarRswdYEmJx8B7byiky4tqsW7P2GMhJX
	OUrh04bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsnfu-0000000CEaX-2AU5;
	Thu, 13 Mar 2025 18:52:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsnAX-0000000CBDx-2lep
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 18:20:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E97E1477;
	Thu, 13 Mar 2025 11:20:43 -0700 (PDT)
Received: from mazurka.cambridge.arm.com (mazurka.cambridge.arm.com [10.2.80.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E6463F694;
	Thu, 13 Mar 2025 11:20:28 -0700 (PDT)
Date: Thu, 13 Mar 2025 18:20:26 +0000
From: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: ryan.roberts@arm.com, suzuki.poulose@arm.com,
	yang@os.amperecomputing.com, corbet@lwn.net,
	catalin.marinas@arm.com, will@kernel.org, jean-philippe@linaro.org,
	robin.murphy@arm.com, joro@8bytes.org, akpm@linux-foundation.org,
	mark.rutland@arm.com, joey.gouly@arm.com, james.morse@arm.com,
	broonie@kernel.org, anshuman.khandual@arm.com,
	oliver.upton@linux.dev, ioworker0@gmail.com, baohua@kernel.org,
	david@redhat.com, jgg@ziepe.ca,
	shameerali.kolothum.thodi@huawei.com, nicolinc@nvidia.com,
	mshavit@google.com, jsnitsel@redhat.com, smostafa@google.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Subject: Re: [PATCH v3 1/3] arm64: Add BBM Level 2 cpu feature
Message-ID: <20250313182026.GC40525@mazurka.cambridge.arm.com>
References: <20250313104111.24196-2-miko.lenczewski@arm.com>
 <20250313104111.24196-3-miko.lenczewski@arm.com>
 <86ikocomvd.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86ikocomvd.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_112033_790626_11761B29 
X-CRM114-Status: GOOD (  18.64  )
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

On Thu, Mar 13, 2025 at 05:34:46PM +0000, Marc Zyngier wrote:
> On Thu, 13 Mar 2025 10:41:10 +0000,
> Mikołaj Lenczewski <miko.lenczewski@arm.com> wrote:
> > 
> > diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
> > index c6b185b885f7..9728faa10390 100644
> > --- a/arch/arm64/kernel/pi/idreg-override.c
> > +++ b/arch/arm64/kernel/pi/idreg-override.c
> > @@ -209,6 +209,7 @@ static const struct ftr_set_desc sw_features __prel64_initconst = {
> >  		FIELD("nokaslr", ARM64_SW_FEATURE_OVERRIDE_NOKASLR, NULL),
> >  		FIELD("hvhe", ARM64_SW_FEATURE_OVERRIDE_HVHE, hvhe_filter),
> >  		FIELD("rodataoff", ARM64_SW_FEATURE_OVERRIDE_RODATA_OFF, NULL),
> > +		FIELD("nobbml2", ARM64_SW_FEATURE_OVERRIDE_NOBBML2, NULL),
> >  		{}
> >  	},
> >  };
> > @@ -246,6 +247,7 @@ static const struct {
> >  	{ "rodata=off",			"arm64_sw.rodataoff=1" },
> >  	{ "arm64.nolva",		"id_aa64mmfr2.varange=0" },
> >  	{ "arm64.no32bit_el0",		"id_aa64pfr0.el0=1" },
> > +	{ "arm64.nobbml2",		"arm64_sw.nobbml2=1" },
> 
> Why is that a SW feature? This looks very much like a HW feature to
> me, and you should instead mask out ID_AA64MMFR2_EL1.BBM, and be done
> with it. Something like:
> 
> diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
> index c6b185b885f70..803a0c99f7b46 100644
> --- a/arch/arm64/kernel/pi/idreg-override.c
> +++ b/arch/arm64/kernel/pi/idreg-override.c
> @@ -102,6 +102,7 @@ static const struct ftr_set_desc mmfr2 __prel64_initconst = {
>  	.override	= &id_aa64mmfr2_override,
>  	.fields		= {
>  		FIELD("varange", ID_AA64MMFR2_EL1_VARange_SHIFT, mmfr2_varange_filter),
> +		FIELD("bbm", ID_AA64MMFR2_EL1_BBM_SHIFT, NULL),
>  		{}
>  	},
>  };
> @@ -246,6 +247,7 @@ static const struct {
>  	{ "rodata=off",			"arm64_sw.rodataoff=1" },
>  	{ "arm64.nolva",		"id_aa64mmfr2.varange=0" },
>  	{ "arm64.no32bit_el0",		"id_aa64pfr0.el0=1" },
> +	{ "arm64.nobbml2",		"id_aa64mmfr2.bbm=0" },
>  };
>  
>  static int __init parse_hexdigit(const char *p, u64 *v)
> 
> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

Thanks for the review.

I think part of this confusion is due to me not including a changelog
(definitely something for the next respin!), but the discussion this
change is based on is found here:

https://lore.kernel.org/all/b46dc626-edc9-4d20-99d2-6cd08a01346c@os.amperecomputing.com/

Essentially, this is a SW feature because we do not check the
id_aa64mmfr2.bbm register as part of the has_bbml2_noabort() cpucap
matches filter. This is because certain hardware implementations
do not actually declare bbml2 via the hardware feature register, despite
implementing our bbml2_noabort feature, and certain hypervisor setups
might result in issues so we want to have an override to allow
potentially disabling the feature for generic kernels.

-- 
Kind regards,
Mikołaj Lenczewski

