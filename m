Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B3FCA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 13:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S8JfRD9GH3BjKxXE7cm8G7Z8e3QaQRCrAiAXcY8gZC8=; b=KAwohjO38uTFG2K48Kj6Z6ZK7V
	W3DhHQ26sr6m2v92A8JwGDftVo6+T0frAtsWtNzSfwikSDKrA3a2FkdN6H2PwnbOZpWOH8zVpRTWk
	Qge/nxHaEixPMxNG/+vuGZcExb6QsxHLXKhAIahIeFyvTr4812ClNctCimLFIOpDbwp1Ja+gdhm7P
	IkuJKos9grDevhRbQUY0WODoGC+12yvPbzWauRrXmzkHlHNXNwGNnfm7N2P36X3QsZ84svjSKSGsz
	yn+OC/MslHVEDJiVQ933Z43/6q8CGuDdBZ/2FQH9XwS4nvJtKOyCRRGzEJXw0HzQ/qhrnwzPnpTaZ
	stv6sU4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDMDL-0000000Eq9L-1tSp;
	Sun, 04 Oct 2026 13:25:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDMDJ-0000000Eq91-3rvm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 13:25:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 14B39601F7;
	Sun,  4 Oct 2026 13:25:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC3E1F000FF;
	Sun,  4 Oct 2026 13:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791120312;
	bh=S8JfRD9GH3BjKxXE7cm8G7Z8e3QaQRCrAiAXcY8gZC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SLs041OMqUBDLcrFW9c/GkDb/XulJnQ6qacHbf76qKFlynOEgOOY0oK/kN8xMGO8C
	 FlHjvUabzVxWFcmsl4TwHKIe8DklPjc+NakROBRwVA+1sarDYZEztNAUiKiXnvIk5Q
	 I1n8sXStb0r4oyTPNkrdjhGe6ei+eoYA2bYkhJojIpOr0uvQ9036Mf256RxlzuaCu5
	 QSzFAUX3O99Yr+tMe+CyP6OK2NKh4nzIj/iicbXYHL6XfqRRn2TeZvLtWzUKhdIayF
	 bsDhpSh6Zdumc8KVkI6YtZDviz2PK9sJS0bqkWovnWkK+tK8AXEYSAxgEj1uisxX6u
	 EaUBzQ/eVrJkA==
Date: Sun, 4 Oct 2026 14:25:07 +0100
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org, praan@google.com,
	kevin.tian@intel.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, jamien@nvidia.com, kas@kernel.org
Subject: Re: [PATCH v10 06/13] iommu/arm-smmu-v3: Add
 ARM_SMMU_OPT_KDUMP_ADOPT for kdump kernel
Message-ID: <asJTsw-oWDlSqNa3@willie-the-truck>
References: <cover.1788130528.git.nicolinc@nvidia.com>
 <d661395d986d3aa78af200f55e43740996ee8a0f.1788130528.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d661395d986d3aa78af200f55e43740996ee8a0f.1788130528.git.nicolinc@nvidia.com>
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

On Sun, Aug 30, 2026 at 04:18:07PM -0700, Nicolin Chen wrote:
> When transitioning to a kdump kernel, the primary kernel might have crashed
> while endpoint devices were actively bus-mastering DMA. Currently, the SMMU
> driver aggressively resets the hardware during probe by clearing CR0_SMMUEN
> and setting the Global Bypass Attribute (GBPA) to ABORT.
> 
> In a kdump scenario, this aggressive reset is highly destructive:
> a) If GBPA is set to ABORT, in-flight DMA will be aborted, generating fatal
>    PCIe AER or SErrors that may panic the kdump kernel
> b) If GBPA is set to BYPASS, in-flight DMA targeting some IOVAs will bypass
>    the SMMU and corrupt the physical memory at those 1:1 mapped IOVAs.
> 
> To safely absorb in-flight DMAs, a kdump kernel will have to leave SMMUEN=1
> intact and avoid modifying STRTAB_BASE, allowing HW to continue translating
> in-flight DMAs reusing the crashed kernel's page tables until the endpoint
> device drivers probe and quiesce their respective hardware.
> 
> However, the ARM SMMUv3 architecture specification states that updating the
> SMMU_STRTAB_BASE register while SMMUEN == 1 is UNPREDICTABLE or ignored.
> 
> This leaves a kdump kernel no choice but to adopt the stream table from the
> crashed kernel.
> 
> Introduce ARM_SMMU_OPT_KDUMP_ADOPT and adopt functions memremapping all the
> stream tables extracted from STRTAB_BASE and STRTAB_BASE_CFG. Add them in
> a new arm-smmu-v3-kdump.c, which is only built when CONFIG_CRASH_DUMP=y.
> 
> Note that the adoption of the crashed kernel's stream table follows certain
> strict rules, since the old stream table might be compromised. Thus, apply
> some basic validations against the values read from the registers. If tests
> fail, it means the stream table cannot be trusted, so toss it entirely. To
> avoid OOM due to a potentially corrupted stream table, the memremap for l2
> tables is done lazily on the kdump kernel's demand.
> 
> The new option will be set in a following change, once the device reset and
> the RMR setup are reworked not to overwrite the adopted stream table, and
> the crashed kernel's in-use ASIDs and VMIDs are reserved.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/Makefile        |   1 +
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  21 ++
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kdump.c | 229 ++++++++++++++++++

Please don't put this here. The live update / handover stuff is going to
need very similar logic (see the RFC from Pranjal) and I don't fancy
having to rename or resplit this file when that comes along.

Maybe just stick all of arm-smmu-v3-kexec.c and arm-smmu-v3-kdump.c into
arm-smmu-v3-handover.c or something?

> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kdump.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kdump.c
> new file mode 100644
> index 0000000000000..a074d59ce3445
> --- /dev/null
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kdump.c
> @@ -0,0 +1,229 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Implementation of the kdump stream table adoption for ARM SMMUv3
> + *
> + * When the crashed kernel left the SMMU enabled with in-flight DMAs, the kdump
> + * kernel adopts the crashed kernel's stream tables, instead of doing a regular
> + * reset, to keep in-flight DMAs translating until the endpoint device drivers
> + * re-probe and quiesce their devices.
> + *
> + * Note:
> + *  - Adoption only starts on an SMMU that the crashed kernel left enabled, as a
> + *    disabled SMMU (CR0_SMMUEN=0) could hold meaningless register values.
> + *  - Values read from the crashed kernel's registers get structural validation
> + *    only (format, size, span, alignment, and ID range); the physical addresses
> + *    are not vetted, as the kdump kernel has no record of which pages held the
> + *    tables.

Can we at least check that they don't point at the kdump region?

> + *  - A structural inconsistency at adoption time tosses the entire adoption and
> + *    makes the SMMU fall back to a full reset blocking in-flight DMAs.
> + *  - L2 stream tables are adopted lazily at master-inserting time, to bound the
> + *    peak memory use against a corrupted L1 table; any lazy L2 adoption failure
> + *    rejects that device alone, as its blast radius is bounded to the bus.
> + *  - Only a coherent SMMU (ARM_SMMU_FEAT_COHERENCY) is supported, as the stream
> + *    table adoption is done by memremap with MEMREMAP_WB, which is verified on
> + *    the real hardware. Callers of these functions are responsible for gating
> + *    ARM_SMMU_FEAT_COHERENCY once during the probe.

This is an artificial restriction and not one that I'm wild about for kdump:
we should be able to support this for non-coherent SMMUs as well. Is there
anything more to it than using MEMREMAP_WC in that case?

Will

