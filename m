Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C09D2A547
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 21:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WKxgel+E8bc+TwMillVrJNHI9tIYk82Ca1aMh9ByvQs=; b=XiSp9Lf9QztNTEiV2B9Ygjs6O2
	/bEAwZlqJ4dLuIoZPEI1Us4c6P3U+vkh/oQrkY8VeuImCfBG/dnkijIhuYCyMrsUT1qSr0ifzpLz5
	L0hB0ak/S8XDIsbIFO5yAhEzAhLZQtQqRu7Yk7H5MLtpugF45knw+yi+8TGiM0yNxfP+4HYHOH240
	YFfD8zuxWAFtGGEtB3AjDaGnGyh9apwS5R9B8r2IW1CzGh6cgfwWdq62vq76DI81Sf1gpJKozUuq6
	fJ8UnYvWmtDyqaJXik2IksDbYWxvJOI3pcbqtRiZEtii+IqtbEOmv1w6xjhfqIOFnUBg29rEEtFLi
	R8f2p5PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRGsK-00000008fyk-3zey;
	Thu, 04 Dec 2025 21:28:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRGsJ-00000008fyS-382m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 21:28:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EA72F60202;
	Thu,  4 Dec 2025 21:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71998C4CEFB;
	Thu,  4 Dec 2025 21:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764883708;
	bh=X8tPs9E6uh+VtgXU41XCn/OUQj8VPbapViZgvzXZmqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oL8AMU1H9u/kQnCLhQPiR/4W7X8gevJNJMq9MHRESr5Uh3iMs3dMulOAWxAGbCajN
	 iUrgGj349WZ+JwTd5AoFpVrv17YrLe3K9ObpzkoULntZCzfHVaKCDUNZGD8pZdXj1P
	 CP42WR2GRGoCXpOgI5VX6RlzVkO3eAOZGVEnNhwfy/CkQiNhW7rADRoVbg2fQscMQD
	 JOoF+kqXoHX1Y2jN6+83sUV/tjcJLRpFq/hvgQQRE0jpf0M2x1lbFB8xTdswPc2i3l
	 1Zd2X9E0L6bckUM9WaNeEdkaa1IHMYYKBXtCzue/OWQPIUXTlBBtLuEu/I5r1WdJGP
	 BWf0N7K/D+05Q==
Date: Thu, 4 Dec 2025 15:28:25 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ashish Mhetre <amhetre@nvidia.com>
Cc: nicolinc@nvidia.com, jgg@ziepe.ca, linux-arm-kernel@lists.infradead.org,
	krzk+dt@kernel.org, devicetree@vger.kernel.org,
	jonathanh@nvidia.com, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, will@kernel.org, conor+dt@kernel.org,
	vdumpa@nvidia.com, joro@8bytes.org, robin.murphy@arm.com,
	linux-tegra@vger.kernel.org, thierry.reding@gmail.com
Subject: Re: [PATCH V3 2/3] dt-bindings: iommu: Add NVIDIA Tegra CMDQV support
Message-ID: <176488370517.2196325.5157844880170253515.robh@kernel.org>
References: <20251201163219.3237266-1-amhetre@nvidia.com>
 <20251201163219.3237266-3-amhetre@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201163219.3237266-3-amhetre@nvidia.com>
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


On Mon, 01 Dec 2025 16:32:18 +0000, Ashish Mhetre wrote:
> The Command Queue Virtualization (CMDQV) hardware is part of the
> SMMUv3 implementation on NVIDIA Tegra SoCs. It assists in
> virtualizing the command queue for the SMMU.
> 
> Add a new device tree binding document for nvidia,tegra264-cmdqv.
> 
> Also update the arm,smmu-v3 binding to include an optional nvidia,cmdqv
> property. This property is a phandle to the CMDQV device node, allowing
> the SMMU driver to associate with its corresponding CMDQV instance.
> Restrict this property usage to Nvidia Tegra264 only.
> 
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>  .../bindings/iommu/arm,smmu-v3.yaml           | 30 ++++++++++++-
>  .../bindings/iommu/nvidia,tegra264-cmdqv.yaml | 42 +++++++++++++++++++
>  2 files changed, 70 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/iommu/nvidia,tegra264-cmdqv.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


