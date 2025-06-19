Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4CDC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=INJ7YE+sMXUovBiDne1gZU/pJLwS+cilgzCkVNvnvmg=; b=MsKXWN1PQn4i+281bm1K852Rp4
	ySKaAMqXhvA3yg+d1wd3lrTL9mRxLAgJgx2XElZvUnaBQZ3m1T/mGynbZe8bXdxgO+1EAwxbRBnxW
	o6u3uNeuf7ibBc9BU6qPpd1lgqXxe071XfNI23s5A/Ve+Xws5Rf25mv0fUMEYqWhNQ1K/aPHxHRYK
	FCXbpI59boPqr6f1QUu+u9TKHxgMWBy/jv6zXlc+Vh3/CRslnxWLgszG1G4oQF4sr3LqFYm7UM603
	rYJByfu29eI1OZwrFbSjxCc6sGSHkoz8OdWRInFQLfOdae9mPVVHvcjRGwhWvZmw18t4pij19E4+H
	VV0RShcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHT1-0000000DTv1-09Mr;
	Thu, 19 Jun 2025 15:46:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDoJ-0000000CxHD-1BPi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 11:52:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51AE312FC;
	Thu, 19 Jun 2025 04:51:42 -0700 (PDT)
Received: from e133081.arm.com (unknown [10.1.28.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22C1A3F66E;
	Thu, 19 Jun 2025 04:51:57 -0700 (PDT)
Date: Thu, 19 Jun 2025 12:51:55 +0100
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
Message-ID: <20250619115155.GB20673@e133081.arm.com>
References: <20250617095104.6772-1-miko.lenczewski@arm.com>
 <20250617095104.6772-3-miko.lenczewski@arm.com>
 <e40989e9-9521-4915-9bae-eb7be1d4e056@arm.com>
 <20250619085701.GA10805@e133081.arm.com>
 <8c6f1c91-176c-4382-b631-79948e8de16f@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c6f1c91-176c-4382-b631-79948e8de16f@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_045203_518934_365E689B 
X-CRM114-Status: GOOD (  20.37  )
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

On Thu, Jun 19, 2025 at 10:20:14AM +0100, Ryan Roberts wrote:
> On 19/06/2025 09:57, Mikołaj Lenczewski wrote:
> > On Wed, Jun 18, 2025 at 03:07:41PM +0100, Ryan Roberts wrote:
> >> On 17/06/2025 10:51, Mikołaj Lenczewski wrote:
> >>>  #ifdef CONFIG_ARM64_PAN
> >>>  static void cpu_enable_pan(const struct arm64_cpu_capabilities *__unused)
> >>>  {
> >>> @@ -2980,6 +3015,11 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
> >>>  		.matches = has_cpuid_feature,
> >>>  		ARM64_CPUID_FIELDS(ID_AA64MMFR2_EL1, EVT, IMP)
> >>>  	},
> >>> +	{
> >>> +		.capability = ARM64_HAS_BBML2_NOABORT,
> >>> +		.type = ARM64_CPUCAP_EARLY_LOCAL_CPU_FEATURE,
> >>> +		.matches = has_bbml2_noabort,
> >>
> >> Is there a reason you have removed the .desc from this? Without it, the kernel
> >> won't print a "detected" line when it enables the feature. Previously you had:
> >>
> >> 		.desc = "BBM Level 2 without conflict abort",
> >>
> >>> +	},
> >>>  	{
> >>>  		.desc = "52-bit Virtual Addressing for KVM (LPA2)",
> >>>  		.capability = ARM64_HAS_LPA2, 
> >>
> > 
> > Damn it! I completely forgot to birng that back. Yet another remenant of
> > the NO_BBML2_NOABORT version we had discussed in v6, because a
> > description field would have been confusing due to the double negation:
> > 
> > https://lore.kernel.org/all/83d1f7af-3dc7-45f9-94f3-8a0917c051d2@arm.com/
> > 
> > Thank you very much for spotting this Ryan! Ill return the description,
> > and respin on Monday (unless it is possible to do this as a RESEND or
> > similar, but I doubt it since this is technically a functional change) :/
> > 
> 
> I think probably just send out a new version.
> 

ACK

-- 
Kind regards,
Mikołaj Lenczewski

