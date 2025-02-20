Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042D0C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 09:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=newvC6mADWn49zOT1Dy4tvOHWxXygG9ftbKAicrathQ=; b=i+PpvwecTFzItRQWsdCixTwlw3
	T2ztWE99Me3iu/M0R3YS9KJv691ni0bVgSfma9A2RQcMDg8609UIdAyOQaCgHa/BCF3uTzos0cznK
	msn645DJOaes22EdgFiXrPegXHT5+ZgigJauEubgeZbtrZOOuXnFQBrzbpIY1pb/pIIjVAz9fvCev
	bXcq/oPTEH42nzPPNC4KbGaJTwNyznWZO7IgXfX0jBxv1GLKMsQWsWl0plL/Sx2vlHD4uZDEaJ21P
	wLkvRf9bYFgu7m0zAQO0UbFU+x6/XWqY/nShyx6w/8leZtMRbToESboNqN8xeIuXoGEFYPsUspxMb
	sIEDeIvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2xy-000000003Ts-14yw;
	Thu, 20 Feb 2025 09:35:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2wS-0000000034V-0IM3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 09:34:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9EFC1BB0;
	Thu, 20 Feb 2025 01:34:16 -0800 (PST)
Received: from mazurka.cambridge.arm.com (mazurka.cambridge.arm.com [10.2.80.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 089D03F6A8;
	Thu, 20 Feb 2025 01:33:54 -0800 (PST)
Date: Thu, 20 Feb 2025 09:33:52 +0000
From: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, yang@os.amperecomputing.com,
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com,
	broonie@kernel.org, mark.rutland@arm.com, james.morse@arm.com,
	yangyicong@hisilicon.com, anshuman.khandual@arm.com, maz@kernel.org,
	liaochang1@huawei.com, akpm@linux-foundation.org, david@redhat.com,
	baohua@kernel.org, ioworker0@gmail.com, oliver.upton@linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] arm64: Add BBM Level 2 cpu feature
Message-ID: <20250220093352.GA11745@mazurka.cambridge.arm.com>
References: <20250219143837.44277-3-miko.lenczewski@arm.com>
 <20250219143837.44277-5-miko.lenczewski@arm.com>
 <a6846db8-9efa-46f8-9939-7727c83d1601@arm.com>
 <cbc3f62b-8890-42ca-81ff-66f1e4ea1cf3@arm.com>
 <e0a6308f-5628-4698-95a7-ec1b918358b0@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0a6308f-5628-4698-95a7-ec1b918358b0@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_013400_266771_3F40EFDE 
X-CRM114-Status: GOOD (  16.36  )
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

On Wed, Feb 19, 2025 at 04:25:56PM +0000, Robin Murphy wrote:
> > On 19/02/2025 15:39, Robin Murphy wrote:
> >> ...
> >>
> >> If this may be used for splitting/compacting userspace mappings, then similarly
> >> to 6e192214c6c8 ("iommu/arm-smmu-v3: Document SVA interaction with new pagetable
> >> features"), strictly we'll also want a check in arm_smmu_sva_supported() to make
> >> sure that the SMMU is OK with BBML2 behaviour too, and disallow SVA if not. Note
> >> that the corresponding SMMUv3.2-BBML2 feature is already strict about TLB
> >> conflict aborts, so is comparatively nice and straightforward.
> 
> Yup, it's really more just a theoretical correctness concern - certainly 
> Arm's implementations from MMU-700 onwards do support BBML2, while 
> MMU-600 is now sufficiently old that nobody is likely to pair it with 
> new BBML-capable CPUs anyway - so it's just to cover the gap that in 
> principle there may be 3rd-party implementations which might get confused.
> 
> Cheers,
> Robin.

Hi Robin,

Thank you for taking the time to review these patches. I will add the
check in the next patch series.

-- 
Kind regards,
Mikołaj Lenczewski

