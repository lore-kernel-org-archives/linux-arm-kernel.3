Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E57DC35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 18:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/laGpKYx28JmCvUL1A+E0S4lxmqcgA78IXlmv6TYJOc=; b=eYFGLARzaNuOFdX8AKDp1xgFn8
	kyY0eLv6bPruZuQR/tMieFyjofdB+B/dtZy+aGOJTxBN+v0527g94sI3tdI24mNyeFCfs+Z+P5yyl
	b7VLzicZ/C8wCXK9DXPJFgZpYO3H1Yhq6OBZee5xGeg6VAvjPEQgQY6ntb53vmS1NrlkretrAQiT+
	oCawSVoHq+cXCsG2BltBKGkuXTjx7B7I5a/gcVpKgbxYz1b74yTd4jQfylqkGrrN4p/oK1A3dASnk
	bB6nIcja/EkFAvQL3IWQCDMyBPURuGCaTYOvoHeMWnBnPxi/rIWklYU6CXzFza/AjTnyWzzmK2if/
	12P3eMwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsnft-0000000CEZO-0oE3;
	Thu, 13 Mar 2025 18:52:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsn3f-0000000C9w5-03Ar
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 18:13:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BFEEC1477;
	Thu, 13 Mar 2025 11:13:36 -0700 (PDT)
Received: from mazurka.cambridge.arm.com (mazurka.cambridge.arm.com [10.2.80.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FB4C3F694;
	Thu, 13 Mar 2025 11:13:22 -0700 (PDT)
Date: Thu, 13 Mar 2025 18:13:19 +0000
From: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
To: Yang Shi <yang@os.amperecomputing.com>, ryan.roberts@arm.com
Cc: suzuki.poulose@arm.com, corbet@lwn.net, catalin.marinas@arm.com,
	will@kernel.org, jean-philippe@linaro.org, robin.murphy@arm.com,
	joro@8bytes.org, akpm@linux-foundation.org, mark.rutland@arm.com,
	joey.gouly@arm.com, maz@kernel.org, james.morse@arm.com,
	broonie@kernel.org, anshuman.khandual@arm.com,
	oliver.upton@linux.dev, ioworker0@gmail.com, baohua@kernel.org,
	david@redhat.com, jgg@ziepe.ca,
	shameerali.kolothum.thodi@huawei.com, nicolinc@nvidia.com,
	mshavit@google.com, jsnitsel@redhat.com, smostafa@google.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Subject: Re: [PATCH v3 1/3] arm64: Add BBM Level 2 cpu feature
Message-ID: <20250313181319.GB40525@mazurka.cambridge.arm.com>
References: <20250313104111.24196-2-miko.lenczewski@arm.com>
 <20250313104111.24196-3-miko.lenczewski@arm.com>
 <0abe8643-d4ea-4e77-bd77-afe07399eec9@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0abe8643-d4ea-4e77-bd77-afe07399eec9@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_111327_093778_486B0A3B 
X-CRM114-Status: GOOD (  19.48  )
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

On Thu, Mar 13, 2025 at 10:21:51AM -0700, Yang Shi wrote:
> On 3/13/25 3:41 AM, Mikołaj Lenczewski wrote:
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > index fb8752b42ec8..3e4cc917a07e 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -453,6 +453,9 @@
> >   	arm64.no32bit_el0 [ARM64] Unconditionally disable the execution of
> >   			32 bit applications.
> >   
> > +	arm64.nobbml2	[ARM64] Unconditionally disable Break-Before-Make Level
> > +			2 support
> 
> Hi Miko,
> 
> A question about the kernel boot parameter. Can this parameter be used 
> in early boot stage? A quick look at the code shows it should be ok, for 
> example, cpu_has_bti() is called in map_kernel(). But I'd like to double 
> check because my patchset needs to check this parameter in map_mem() to 
> determine whether large block mapping can be used or not.
> 
> And a nit below.

I will need to double check exactly when the arm64 software overrides
are finalised, but as long as those values are finalised in / before (?)
the early boot stage then it should be fine? Will reply again once I
check and have an answer.
   
> > +static inline bool bbml2_possible(void)
> > +{
> > +	return !arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_NOBBML2);
> > +}
> 
> Can this be moved to cpufeature.h? My patch will use this, anyway I can 
> do it in my patchset.
> 
> Thanks,
> Yang

I can do so. In fact, on second thought, I will probably extend this to
also include the `IS_ENABLED(CONFIG_ARM64_BBML2_NOABORT)` check as well,
and then move it to cpufeature.h, instead of folding said check into
has_bbml2_noabort().

-- 
Kind regards,
Mikołaj Lenczewski

