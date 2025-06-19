Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40540C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 09:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=reeKxYF2SvD7JaTZcaM39h5mBamu60GEi2OU2ofM0yE=; b=4RIsgN5+QfoNgWBcb9ssddZ3QT
	8o9QiE8CAc5SaTQmEvOVbPWcDKtlBvWhTKYLj7gu35ZubS2Kv1qcFkPeVfliHp9LFjDEp5A8MeQtZ
	iv2/inkdSU8aJO5SSSXrfXtmI5RHq11cH+8r3/kLXaZ3CwO3EhByVaZ+jqBES8L3Lfs8FruzDpBJV
	eBws4RmSnrIJw/oWWLvAx/OnvAUHv15rjhBdW/qqTTvJYk+JZBeVrRrXdKhyKu9tTTAF48JDYpcJq
	Fj3/HKxyQxxKljbqfiFCQFgctix63IVDFLXbLj9/KBxm4S8FiaCNArTpgadAdLYnAa0VZSxgqeDR9
	Mwf0xz/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSC18-0000000Cgay-1Fxi;
	Thu, 19 Jun 2025 09:57:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSB57-0000000CVyC-2tLb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 08:57:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D6A5113E;
	Thu, 19 Jun 2025 01:56:50 -0700 (PDT)
Received: from e133081.arm.com (e133081.arm.com [10.1.32.60])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43C523F58B;
	Thu, 19 Jun 2025 01:57:05 -0700 (PDT)
Date: Thu, 19 Jun 2025 09:57:01 +0100
From: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: yang@os.amperecomputing.com, catalin.marinas@arm.com, will@kernel.org,
	jean-philippe@linaro.org, robin.murphy@arm.com, joro@8bytes.org,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	james.morse@arm.com, broonie@kernel.org, ardb@kernel.org,
	baohua@kernel.org, suzuki.poulose@arm.com, david@redhat.com,
	jgg@ziepe.ca, nicolinc@nvidia.com, jsnitsel@redhat.com,
	mshavit@google.com, kevin.tian@intel.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH v7 2/4] arm64: Add BBM Level 2 cpu feature
Message-ID: <20250619085701.GA10805@e133081.arm.com>
References: <20250617095104.6772-1-miko.lenczewski@arm.com>
 <20250617095104.6772-3-miko.lenczewski@arm.com>
 <e40989e9-9521-4915-9bae-eb7be1d4e056@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e40989e9-9521-4915-9bae-eb7be1d4e056@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_015713_767318_B321B88D 
X-CRM114-Status: GOOD (  15.58  )
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

On Wed, Jun 18, 2025 at 03:07:41PM +0100, Ryan Roberts wrote:
> On 17/06/2025 10:51, Mikołaj Lenczewski wrote:
> >  #ifdef CONFIG_ARM64_PAN
> >  static void cpu_enable_pan(const struct arm64_cpu_capabilities *__unused)
> >  {
> > @@ -2980,6 +3015,11 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
> >  		.matches = has_cpuid_feature,
> >  		ARM64_CPUID_FIELDS(ID_AA64MMFR2_EL1, EVT, IMP)
> >  	},
> > +	{
> > +		.capability = ARM64_HAS_BBML2_NOABORT,
> > +		.type = ARM64_CPUCAP_EARLY_LOCAL_CPU_FEATURE,
> > +		.matches = has_bbml2_noabort,
> 
> Is there a reason you have removed the .desc from this? Without it, the kernel
> won't print a "detected" line when it enables the feature. Previously you had:
> 
> 		.desc = "BBM Level 2 without conflict abort",
> 
> > +	},
> >  	{
> >  		.desc = "52-bit Virtual Addressing for KVM (LPA2)",
> >  		.capability = ARM64_HAS_LPA2, 
>

Damn it! I completely forgot to birng that back. Yet another remenant of
the NO_BBML2_NOABORT version we had discussed in v6, because a
description field would have been confusing due to the double negation:

https://lore.kernel.org/all/83d1f7af-3dc7-45f9-94f3-8a0917c051d2@arm.com/

Thank you very much for spotting this Ryan! Ill return the description,
and respin on Monday (unless it is possible to do this as a RESEND or
similar, but I doubt it since this is technically a functional change) :/

-- 
Kind regards,
Mikołaj Lenczewski

