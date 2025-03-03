Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28210C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 10:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dDQ1ok+pLNFCFykQXYObII88w9/ZkmaD4eT5NpBptwY=; b=WoGmrBx1Oi0geY2wOntzvq1IEY
	g6jDkJJp40ZYGXxSD9neqZkp0gLz4lHIZOy1Rfs1vrUn05g9hONoJgo8M51xXUxu5TGcZCQ4U/0BC
	jUQUxoCHEpAtC7qQwW14JGZgjWn9DFKoNY2uurrSyPdsrv+0XGDir/Hn53ZEaPVUvT8ZApQP+VA7+
	GmNNNFh5kZNz12M/Zez8TqzrvYyi/rn0llfa0WwV2487ciu/SDkSU2dzWI/tvDCIjDq/nvE/wP5Oe
	O/sKWUmq0VEbrcYYi6jsCLXOtCUzMRKoKYP+rH/NzqOhmvDbzzL8sRFAgmpZmO+zhq4UYvmkKIDo1
	XUXGRhjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3IL-00000000NWE-1dQc;
	Mon, 03 Mar 2025 10:45:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp34n-00000000KmN-1Qhh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 10:31:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6621C113E;
	Mon,  3 Mar 2025 02:31:22 -0800 (PST)
Received: from e133081.arm.com (unknown [10.57.37.136])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3C423F66E;
	Mon,  3 Mar 2025 02:31:04 -0800 (PST)
Date: Mon, 3 Mar 2025 10:31:02 +0000
From: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Cc: "ryan.roberts@arm.com" <ryan.roberts@arm.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"yang@os.amperecomputing.com" <yang@os.amperecomputing.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"joey.gouly@arm.com" <joey.gouly@arm.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"maz@kernel.org" <maz@kernel.org>,
	"david@redhat.com" <david@redhat.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>,
	"mshavit@google.com" <mshavit@google.com>,
	"jsnitsel@redhat.com" <jsnitsel@redhat.com>,
	"smostafa@google.com" <smostafa@google.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>
Subject: Re: [PATCH v2 4/4] iommu/arm: Add BBM Level 2 smmu feature
Message-ID: <20250303103102.GC13345@e133081.arm.com>
References: <20250228182403.6269-2-miko.lenczewski@arm.com>
 <20250228182403.6269-6-miko.lenczewski@arm.com>
 <20250228193221.GM5011@ziepe.ca>
 <b23aa37f8e864dea82a6143bece912d6@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b23aa37f8e864dea82a6143bece912d6@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_023109_465554_D5112E54 
X-CRM114-Status: GOOD (  38.52  )
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

Hi Both,

Thanks for review and for checking other implementations for this
discrepancy.

On Mon, Mar 03, 2025 at 08:49:02AM +0000, Shameerali Kolothum Thodi wrote:
> 
> 
> > -----Original Message-----
> > From: Jason Gunthorpe <jgg@ziepe.ca>
> > Sent: Friday, February 28, 2025 7:32 PM
> > To: Mikołaj Lenczewski <miko.lenczewski@arm.com>; Shameerali Kolothum
> > Thodi <shameerali.kolothum.thodi@huawei.com>
> > Cc: ryan.roberts@arm.com; suzuki.poulose@arm.com;
> > yang@os.amperecomputing.com; catalin.marinas@arm.com;
> > will@kernel.org; joro@8bytes.org; jean-philippe@linaro.org;
> > mark.rutland@arm.com; joey.gouly@arm.com; oliver.upton@linux.dev;
> > james.morse@arm.com; broonie@kernel.org; maz@kernel.org;
> > david@redhat.com; akpm@linux-foundation.org; nicolinc@nvidia.com;
> > mshavit@google.com; jsnitsel@redhat.com; smostafa@google.com; linux-
> > arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> > iommu@lists.linux.dev
> > Subject: Re: [PATCH v2 4/4] iommu/arm: Add BBM Level 2 smmu feature
> > 
> > On Fri, Feb 28, 2025 at 06:24:04PM +0000, Mikołaj Lenczewski wrote:
> > > For supporting BBM Level 2 for userspace mappings, we want to ensure
> > > that the smmu also supports its own version of BBM Level 2. Luckily, the
> > > smmu spec (IHI 0070G 3.21.1.3) is stricter than the aarch64 spec (DDI
> > > 0487K.a D8.16.2), so already guarantees that no aborts are raised when
> > > BBM level 2 is claimed.
> > >
> > > Add the feature and testing for it under arm_smmu_sva_supported().
> > >
> > > Signed-off-by: Mikołaj Lenczewski <miko.lenczewski@arm.com>
> > > ---
> > >  arch/arm64/kernel/cpufeature.c                  | 7 +++----
> > >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 3 +++
> > >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c     | 3 +++
> > >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h     | 4 ++++
> > >  4 files changed, 13 insertions(+), 4 deletions(-)
> > 
> > This patch looks good, for what it does. However for bisection safety
> > it should be earlier, before the patches that change the page table
> > algorithms to be unsafe for the SMMU.

Right, I should have noticed this earlier. Will reorder the patch.

> > However, I've heard people talking about shipping chips that have CPUs
> > with BBML2 but SMMUs without.
> > 
> > On such a system it seems like your series would break previously
> > working SVA support because this patch will end up disabling it?

Perhaps my understanding is flawed here, but I was under the impression
that with SVA both the core and smmu MUST support BBML2 to use it safely
for core translations? Otherwise the smmu might experience page faults
when it touches pages from the core that use BBML2, if it does not
support BBML2 itself? Again, I could very well be wrong, will double
check with the reference manuals.

> > Though I see your MIDR_REV list is limited, so perhaps that worry
> > doesn't effect any real chips made with those families? I am trying to
> > check some NVIDIA products against this list..

Hopefully, as you say, the MIDR list restricts the breakage to a limited
(ideally, zero-size) set of implementations which advertise BBML2
without conflict aborts, but which do not support BBML2 on the smmu.

However, if my understanding of the BBML2 feature and how it interacts
with SVA is flawed, this will obviously be something for me to fix.

> We do have implementations that support CPUs with BBLM2 with TLB
> conflict aborts and SMMUv3 with BBML2.  So don't think those platforms
> be affected by this.  Will check with our hardware folks if there is
> anything that will be affected by this.
> 
> Also we  have plans to try to use SMMUv3 BBML2 during VM live migration
> to split block pages to 4K. I guess, in that case we can enable SMMU BBML2
> independent of CPU side.
> 
> Thanks,
> Shameer

On independently enabling BBML2 on the smmu but not the CPU, this should
be possible. My check was intended to catch the case where the CPU is on
the MIDR allowlist, but the smmu does not support the feature. Whilst
this might still be bad logic, if it is correct, then as long as the CPU
is not in the allowlist sva should not be affected. And bbml2 itself on
the smmu should be safe regardless, as it is stricted than the
corresponding cpu-side feature.

-- 
Kind regards,
Mikołaj Lenczewski

