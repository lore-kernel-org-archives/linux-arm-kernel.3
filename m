Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD88C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 17:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uS0J5Q0NpGK/8Ej+Is4EIeu1td4p5rakpsaoLc9CZ6k=; b=0n3gXn3plspePbdpLWC98yMeOP
	qwbe9bnuFLxJbXN5pttG74Rx4TQrRj3ieF8d9snD7sj5AahMG6U05lO2h8gMdvjzMSUIDZou2uDn1
	ZHfKPtYj5U7MATzX2L4jMYgKHK+tgxUvF+p+Jg2gSRWAsevFgDIzDFAXvOVLFEVQ2J1n/5aFcX3vf
	PMrNZmedys/YW1kUfwqia6409AedKnUC8O1Pu6+QuyymCof1YoCgUeXZSRwZjj9Ss4ggbM/oIJVlr
	APbE43pn8CvSXwLz3++T8e2fCirdbZ/9nvJqcKdBuEydWQF89WE/M9pTNq7I1Dbq6OlSg3YfYxpYK
	24nDmJbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJUb-0000000Cm1Y-31t9;
	Thu, 20 Mar 2025 17:15:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJSt-0000000Clnf-3HDX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 17:13:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06E6A113E;
	Thu, 20 Mar 2025 10:14:03 -0700 (PDT)
Received: from e133081.arm.com (unknown [10.57.15.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 91C333F673;
	Thu, 20 Mar 2025 10:13:50 -0700 (PDT)
Date: Thu, 20 Mar 2025 17:13:47 +0000
From: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: ryan.roberts@arm.com, yang@os.amperecomputing.com, corbet@lwn.net,
	catalin.marinas@arm.com, will@kernel.org, jean-philippe@linaro.org,
	robin.murphy@arm.com, joro@8bytes.org, akpm@linux-foundation.org,
	ardb@kernel.org, mark.rutland@arm.com, joey.gouly@arm.com,
	maz@kernel.org, james.morse@arm.com, broonie@kernel.org,
	oliver.upton@linux.dev, baohua@kernel.org, david@redhat.com,
	ioworker0@gmail.com, jgg@ziepe.ca, nicolinc@nvidia.com,
	mshavit@google.com, jsnitsel@redhat.com, smostafa@google.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Subject: Re: [PATCH v4 1/3] arm64: Add BBM Level 2 cpu feature
Message-ID: <20250320171347.GA494995@e133081.arm.com>
References: <20250319150533.37440-2-miko.lenczewski@arm.com>
 <20250319150533.37440-3-miko.lenczewski@arm.com>
 <f9c5839e-5d55-497e-9df3-ab778c4eae72@arm.com>
 <20250320170936.GB487465@e133081.arm.com>
 <952cc3ea-ca11-43a3-a8f4-36e3bbb1fa84@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <952cc3ea-ca11-43a3-a8f4-36e3bbb1fa84@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_101355_859792_C2AD4BC1 
X-CRM114-Status: GOOD (  22.60  )
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

On Thu, Mar 20, 2025 at 05:11:25PM +0000, Suzuki K Poulose wrote:
> On 20/03/2025 17:09, Mikołaj Lenczewski wrote:
> > On Thu, Mar 20, 2025 at 01:24:25PM +0000, Suzuki K Poulose wrote:
> > > On 19/03/2025 15:05, Mikołaj Lenczewski wrote:
> > > > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > > > index fb8752b42ec8..3e4cc917a07e 100644
> > > > --- a/Documentation/admin-guide/kernel-parameters.txt
> > > > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > > > @@ -453,6 +453,9 @@
> > > >    	arm64.no32bit_el0 [ARM64] Unconditionally disable the execution of
> > > >    			32 bit applications.
> > > > +	arm64.nobbml2	[ARM64] Unconditionally disable Break-Before-Make Level
> > > > +			2 support
> > > > +
> > > >    	arm64.nobti	[ARM64] Unconditionally disable Branch Target
> > > >    			Identification support
> > > > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > > > index 940343beb3d4..49deda2b22ae 100644
> > > > --- a/arch/arm64/Kconfig
> > > > +++ b/arch/arm64/Kconfig
> > > > @@ -2057,6 +2057,17 @@ config ARM64_TLB_RANGE
> > > >    	  The feature introduces new assembly instructions, and they were
> > > >    	  support when binutils >= 2.30.
> > > > +config ARM64_BBML2_NOABORT
> > > > +	bool "Enable support for Break-Before-Make Level 2 detection and usage"
> > > > +	default y
> > > > +	help
> > > > +	  FEAT_BBM provides detection of support levels for break-before-make
> > > > +	  sequences. If BBM level 2 is supported, some TLB maintenance requirements
> > > > +	  can be relaxed to improve performance. We additonally require the
> > > > +	  property that the implementation cannot ever raise TLB Conflict Aborts.
> > > > +	  Selecting N causes the kernel to fallback to BBM level 0 behaviour
> > > > +	  even if the system supports BBM level 2.
> > > 
> > > minor nit: Should we mention that the feature can be disabled at runtime
> > > using a kernel parameter ?
> > 
> > Yes, this sounds very reasonable, I should have thought of that. Will
> > mention the commandline parameter in the kconfig option documentation.
> 
> And also may be mention this in the patch description and may be also
> add the rationale for providing this tunable.
> 
> Cheers
> Suzuki
> 

Will do! :)

-- 
Kind regards,
Mikołaj Lenczewski

