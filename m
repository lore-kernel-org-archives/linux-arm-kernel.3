Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99CCC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 19:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ziDFG35Sno4dz4bfMqWfTsxlaUMSbm5rWsYhhxlJcSM=; b=IBcBRCiCW+8T30YtbnlwmCMJHu
	XcHVP64WbXpVMCZgM/qGDEZmEtj99DmOvywJkfMeEPHHrbQLQEcJiqZXzp89vLZ7GTTaoJlvMrT8n
	UQke0tqHeJwI+1jiAXxupmgF5otspobs/GXhlNMWrXu6H1/U41JlAoaujUgmyCdToMPH4siEoh0Lv
	8nf5jSVv8mEiexOsDaSezq1o+saNQ3x+Xh1i1G1ZtFuaIfTHEW2PDSl+r8i9kKU0zhMiCSI6WmBPC
	tVQbU5vEo0C+l4A7vRLGDhAVA5vaveybAb1EehO7gpgoNz+mX0tBk1IHepBMm3DMN1GxQ2w31T3Ot
	CJL+3kLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpB6i-0000000213O-1LAr;
	Mon, 03 Mar 2025 19:05:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpB58-000000020qA-15iO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 19:04:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13E62106F;
	Mon,  3 Mar 2025 11:04:15 -0800 (PST)
Received: from e133081.arm.com (unknown [10.57.37.154])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A72623F5A1;
	Mon,  3 Mar 2025 11:03:55 -0800 (PST)
Date: Mon, 3 Mar 2025 19:03:42 +0000
From: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>,
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
Message-ID: <20250303190330.GA426248@e133081.arm.com>
References: <20250228182403.6269-2-miko.lenczewski@arm.com>
 <20250228182403.6269-6-miko.lenczewski@arm.com>
 <20250228193221.GM5011@ziepe.ca>
 <b23aa37f8e864dea82a6143bece912d6@huawei.com>
 <20250303103102.GC13345@e133081.arm.com>
 <20250303165255.GS5011@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250303165255.GS5011@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_110402_396156_DB1306AD 
X-CRM114-Status: GOOD (  32.94  )
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

On Mon, Mar 03, 2025 at 12:52:55PM -0400, Jason Gunthorpe wrote:
> On Mon, Mar 03, 2025 at 10:31:02AM +0000, Mikołaj Lenczewski wrote:
> 
> > > > On such a system it seems like your series would break previously
> > > > working SVA support because this patch will end up disabling it?
> > 
> > Perhaps my understanding is flawed here, but I was under the impression
> > that with SVA both the core and smmu MUST support BBML2 to use it safely
> > for core translations? 
> 
> Yes
> 
> But today's kernel does not use BBML2 in the CPU or the SMMU so it is
> compatible with everything.
> 
> So it is an upgrade issue, going from today's kernel without any BBML2
> support to tomorrow's kernel that does then you loose SVA on
> previously working HW.

I see what you mean.

If you have hardware that supports cpu BBML2 but doesn't support smmu
BBML2, either by virtue of having a pre-SMMUv3.2 smmu, or by only
implementing BBML1, the simplest option I see is then to disable BBML2
globally in the kernel. A bad klude, but would at least leave current
SVA working.

> > Hopefully, as you say, the MIDR list restricts the breakage to a limited
> > (ideally, zero-size) set of implementations which advertise BBML2
> > without conflict aborts, but which do not support BBML2 on the smmu.
> > 
> > However, if my understanding of the BBML2 feature and how it interacts
> > with SVA is flawed, this will obviously be something for me to fix.
> 
> Lets hope, I was not able to discover any NVIDIA platforms that have
> an issue with this series as is.
> 
> But every addition to the MIDR list will require some consideration :\

Yes, I agree. I believe that for larger cores, this is a guarantee that
implementors will be able to make when adding themselves to the list.
They know what smmu their core uses, and that tends to be
performance-focused (hence more likely to use an smmu that support
BBML2).

For smaller cores, i.e. mobile cores, this becomes a larger issue as you
may have a higher likelyhood of pairing such a core with an
older/insufficient smmu version. So, careful consideration is required.

> > On independently enabling BBML2 on the smmu but not the CPU, this should
> > be possible.
> 
> What about the reverse? Could we disable BBML2 on the CPU side on a
> per-mm basis? Ie when an old SMMU attaches with disable the
> incompatible feature? Not something for this series, but if we get
> into trouble down the road

I agree in principle with having, as you point out, some mechanism
to disable BBML2 when an smmu without BBML2 is used. However, I think
that the complexity of such a mechanism depends on how the BBML2 feature
is used by future patches.

For example, if we use BBML2 for kernel mappings, does that require us
to repaint all kernel mappings when disabling BBML2 on smmu attach? I
am not sure, but definitely something to be worked out.

-- 
Kind regards,
Mikołaj Lenczewski

