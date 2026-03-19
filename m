Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946251090234
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 14:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ow2XY1pf8yVX6zUEuZgf+1Ud3ht9EyUSJM6My0Gu4l4=; b=Y76K94/c30iriGkc3a3xJEId33
	Pu0xlZfD/3xJgbpeWNXVSIPQe5YSR8nbdZuN2iaHssDvWbtGpYNu1pHhwX5HZcb9PtIsX01PVuNpw
	VH5vscxfaP6nDvrf5392PVUrvRfngvbZjTI6n9aB20clbW/njOXbWkZW3Lu0UdUtPX+IXxfO9PLXk
	XZxLd0K70tGQs/JcZYNIExjQM0Pl7ASvV0HPlsU+4svKJz2hsAfnGp4dxkKnboBN8cEflAFLk1OCM
	3z29N3SvfLNsgLKaNZ5SNdFWEJR9zlI7uywIhpDpp+NRSNT/6h9tEROXJ+J5fz3VwGe3cnE0iOuQ+
	35B6aRGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Eef-0000000ApQ2-3SBQ;
	Thu, 19 Mar 2026 14:47:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Eee-0000000ApPu-0IoC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 14:47:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2EF2D60054;
	Thu, 19 Mar 2026 14:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC0FAC19424;
	Thu, 19 Mar 2026 14:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773931638;
	bh=EicLv+Pp2VYPHfrLT5jJbVaFs0nelxml4j5+LlQ6DOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JBLyQ84ZNZ2zURLv4YQlg87S6ASd2taCZrsWvtxvgxLR2ZNShIS020jbPJdywWktN
	 S2sir5HUtz85SNypHesWkffqX7qqXBqDkhtMkoIHMQPzk/SDH3U2BMkmoWe7MG50YJ
	 IWVW5ItH2N+9YdkYJmFJaK9dTLb9NswVvUzzZ5TuSIGdTIopfKcU/Z3roSLVcAuCSD
	 HcLk154JdE1ni9T1oC/429iAKzMxooKFYM1fFJ4D/6+mmkz9KVSsmsTykb9nwN1WNA
	 2AYUJPT/qkSO5tCp8m6rW8UfEw1iFOQLUoUa2mZn4dEbyeuiKos7gGqCp1HYNMZmw9
	 Qv4b46VZNE6cA==
Date: Thu, 19 Mar 2026 14:47:13 +0000
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: robin.murphy@arm.com, jgg@nvidia.com, kevin.tian@intel.com,
	joro@8bytes.org, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, eric.auger@redhat.com,
	skolothumtho@nvidia.com
Subject: Re: [PATCH 2/2] iommu/tegra241-cmdqv: Update uAPI to clarify HYP_OWN
 requirement
Message-ID: <abwMcZZHtEuaMEdZ@willie-the-truck>
References: <cover.1773361875.git.nicolinc@nvidia.com>
 <9ef47d0db2d7b8207fef1ef4437de6efa08565b6.1773361875.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ef47d0db2d7b8207fef1ef4437de6efa08565b6.1773361875.git.nicolinc@nvidia.com>
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

On Thu, Mar 12, 2026 at 05:36:35PM -0700, Nicolin Chen wrote:
> From hardware implementation perspective, a guest tegra241-cmdqv hardware
> is different than the host hardware:
>  - Host HW is backed by a VINTF (HYP_OWN=1)
>  - Guest HW is backed by a VINTF (HYP_OWN=0)
> 
> The kernel driver has an implementation requirement of the HYP_OWN bit in
> the VM. So, VMM must follow that to allow the same copy of Linux to work.
> 
> Add this requirement to the uAPI, which is currently missing.
> 
> Fixes: 4dc0d12474f9 ("iommu/tegra241-cmdqv: Add user-space use support")
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  include/uapi/linux/iommufd.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
> index 1dafbc552d37d..f63edbe71d542 100644
> --- a/include/uapi/linux/iommufd.h
> +++ b/include/uapi/linux/iommufd.h
> @@ -1052,6 +1052,11 @@ struct iommu_fault_alloc {
>  enum iommu_viommu_type {
>  	IOMMU_VIOMMU_TYPE_DEFAULT = 0,
>  	IOMMU_VIOMMU_TYPE_ARM_SMMUV3 = 1,
> +	/*
> +	 * TEGRA241_CMDQV requirements (otherwise, VCMDQs will not work)
> +	 * - Kernel will allocate a VINTF (HYP_OWN=0) to back this VIOMMU. So,
> +	 *   VMM must wire the HYP_OWN bit to 0 in guest VINTF_CONFIG register
> +	 */
>  	IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV = 2,
>  };

Jason, are you happy with this one?

Will

