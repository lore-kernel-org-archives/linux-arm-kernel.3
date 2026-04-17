Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E9DF436B7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 15:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6+DK1UmeIswFbsgqvCxobY1iypq/44Q4fqG3hVrciwM=; b=B5GH+eEyYya7W++3+xZbSJRunk
	bISQuUjFCuLW7XDo1O2y3v71i1eWzPizEFof0sTCrhAjPx0X7sfBE1oQl+ml4VclaVZI7o8dJGUBP
	5XXcztcK/qRm/IDLL1jkeYyYH4PIasyl0N9HYwF9gky+zUgP8KRiSEYaaeXBZB7vaFf3TIv1vEziu
	2vVdzmyYshuAy9iUG0SNQmX6YolLj/KijqMCfxZKDLc1zCZeVbJ4hx+YYrXaP9c47FWosW2mGGH2p
	NW32D9ZBSRmTBr/wYEXv6dl21iWkgRHPB4zhfAl5HgeCOAO9xHMK8vVyyHMOW3G9kmBpcRiJGa0Q6
	uRcZoSrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDl8X-00000004DJv-01Y9;
	Fri, 17 Apr 2026 15:29:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDl8U-00000004DJR-1E6K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 15:29:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46F1C1C25;
	Fri, 17 Apr 2026 08:29:30 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A4B83F7D8;
	Fri, 17 Apr 2026 08:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776439775; bh=wcGMZozAsLV99EU8C+5KOdPZvcpUqDFWXQ1NY3TqZQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cVkeV0iLONQ1/hrMFbrkQKa53f8amGrFR7rdEwPeNI7WmfoAQsZ9+4AZCq1xvwO71
	 4Whf/irnYBxohsiJRawXc0MGDFWo/UL2oTNA71wewXAUeSDZY2kNU3T+TAeCvGb3/2
	 YLJ+MoiCS9ob9LxtsVQue9erNzJwVbGyQHhcscU0=
Date: Fri, 17 Apr 2026 16:29:31 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: Re: [PATCH 15/18] Documentation: KVM: Fix typos in VGICv5
 documentation
Message-ID: <20260417152931.GB3311048@e124191.cambridge.arm.com>
References: <20260415115559.2227718-1-maz@kernel.org>
 <20260415115559.2227718-16-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415115559.2227718-16-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_082938_367252_7D5157E1 
X-CRM114-Status: GOOD (  18.09  )
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

On Wed, Apr 15, 2026 at 12:55:56PM +0100, Marc Zyngier wrote:
> From: Sascha Bischoff <sascha.bischoff@arm.com>
> 
> Fix two typos in the VGICv5 documentation.
> 
> Fixes: d51c978b7d3e ("KVM: arm64: gic-v5: Communicate userspace-driveable PPIs via a UAPI")
> Fixes: eb3c4d2c9a4d ("Documentation: KVM: Introduce documentation for VGICv5")
> Link: https://sashiko.dev/#/patchset/20260319154937.3619520-1-sascha.bischoff%40arm.com
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  Documentation/virt/kvm/devices/arm-vgic-v5.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/virt/kvm/devices/arm-vgic-v5.rst b/Documentation/virt/kvm/devices/arm-vgic-v5.rst
> index 29335ea823fc5..1985b2d880322 100644
> --- a/Documentation/virt/kvm/devices/arm-vgic-v5.rst
> +++ b/Documentation/virt/kvm/devices/arm-vgic-v5.rst
> @@ -12,8 +12,8 @@ Only one VGIC instance may be instantiated through this API.  The created VGIC
>  will act as the VM interrupt controller, requiring emulated user-space devices
>  to inject interrupts to the VGIC instead of directly to CPUs.
>  
> -Creating a guest GICv5 device requires a host GICv5 host.  The current VGICv5
> -device only supports PPI interrupts.  These can either be injected from emulated
> +Creating a guest GICv5 device requires a GICv5 host.  The current VGICv5 device
> +only supports PPI interrupts.  These can either be injected from emulated
>  in-kernel devices (such as the Arch Timer, or PMU), or via the KVM_IRQ_LINE
>  ioctl.
>  
> @@ -25,7 +25,7 @@ Groups:
>        request the initialization of the VGIC, no additional parameter in
>        kvm_device_attr.addr. Must be called after all VCPUs have been created.
>  
> -   KVM_DEV_ARM_VGIC_USERPSPACE_PPIs
> +   KVM_DEV_ARM_VGIC_USERPSPACE_PPIS

This still has a typo! There's a P lurking between USER and SPACE!

>        request the mask of userspace-drivable PPIs. Only a subset of the PPIs can
>        be directly driven from userspace with GICv5, and the returned mask
>        informs userspace of which it is allowed to drive via KVM_IRQ_LINE.
> -- 
> 2.47.3
> 

Thanks,
Joey

