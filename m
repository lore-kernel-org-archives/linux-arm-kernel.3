Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76DDCA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 13:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zIwrdOZ9vUUfMJ0ypGfA9v49+RgdK2nVvpCJNCxINwE=; b=CPCIl3XXHBJGvjH6vd+xD8ohoQ
	uYgU9PIZ+mbpufK1QzNPc4rFeFm/KbPsMHTAP0OrETvcKYebIN2jgHmUWbc79P2vv9pH90/Yw+eui
	eJ2DtlrvNWEsAY7YXtmclWlnNiIMwnGvAtceKJiCXt1hgtHRE6U75Ei/zfQaQ4ccMes0ycSRI5ak1
	lwKuSd37wpeKvZ7l5WZ6l+qyd6xhihGc9Nvff6IhFnrJKcRrrM0Nu87N34NRKFStrDv45WBdE1WUl
	vqYUJ02FGerzLAPbPT5OS0TflhYcDjfz5UDOblG4buI55T22VAwpfa9kR2vMf/rlHwwpzIYLlYXng
	idDzcC/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDMCP-0000000Epqr-08XS;
	Sun, 04 Oct 2026 13:24:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDMCO-0000000EpqP-0B0b
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 13:24:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7CCB960200;
	Sun,  4 Oct 2026 13:24:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC1391F000FF;
	Sun,  4 Oct 2026 13:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791120255;
	bh=zIwrdOZ9vUUfMJ0ypGfA9v49+RgdK2nVvpCJNCxINwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S5LxWNWllFLP54vZtbqa2dRKzwyvhv/wD4MTSCXD7CsPQDAxbtLik6aAdGOrxYl2L
	 Z3YF+85ISjXOBvEbKxq6pcxmwFUZMvOxDsfwFDPhmcDO9QRLo49621Nq/hwViABVC/
	 UE7qRDK02Fzn/n8JJf7pd+BgWcx7BgJH0IHFx94GuRAyXC3TzPFq612h3fVDPaGRyz
	 IN4xD6TcM+pm4T2Mf4WbmKlflnwrdEKVdkCQS2nO9ZtuH1GpOgRpEiItgHuY7Uk5VY
	 6+Iecf21u72bu/dm2NmLouEY7XR9/lN/02JvIz/wctCdx7hJunBeyQb5zShD21Y24d
	 daJkeUX4mGkkA==
Date: Sun, 4 Oct 2026 14:24:10 +0100
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org, praan@google.com,
	kevin.tian@intel.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, jamien@nvidia.com, kas@kernel.org
Subject: Re: [PATCH v10 03/13] iommu/arm-smmu-v3: Add ARM_SMMU_FEAT_EVTQ for
 the event queue
Message-ID: <asJTer4cNh4DAQMY@willie-the-truck>
References: <cover.1788130528.git.nicolinc@nvidia.com>
 <b6493aeece86f44195e8afb6fb8b3497cc237dc2.1788130528.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6493aeece86f44195e8afb6fb8b3497cc237dc2.1788130528.git.nicolinc@nvidia.com>
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

On Sun, Aug 30, 2026 at 04:18:04PM -0700, Nicolin Chen wrote:
> The driver programs and enables the event queue unconditionally, while the
> PRI queue has an ARM_SMMU_FEAT_PRI gating each of its touch points. Yet a
> kdump kernel wants to leave both of the queues alone, which would take an
> is_kdump_kernel() test at every one of those places.
> 
> Add an ARM_SMMU_FEAT_EVTQ that the probe always sets, as the event queue is
> architecturally mandatory, and gate the queue's allocation, its interrupt
> and its CR0 and IRQ_CTRL enables on it, so that a later change can turn the
> queue off in a single place.
> 
> No functional change intended.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  1 +
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 79 +++++++++++++--------
>  2 files changed, 52 insertions(+), 28 deletions(-)

Sashiko has comments about the event queue MSI configuration for this patch.
Please can you have a look?

Will

