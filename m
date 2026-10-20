Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D75606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 11:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sTWa3qG+;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=mjWSc639
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ssC6O5op5kxsykPYGF90zu0HggsOhAnuDsh96PbOQGs=; b=sTWa3qG+Q85rj4CexDM9ze5A5e
	qqLjZwuaaUHIySvqOdo4p28MfNHCBNnSK+W/abWb/+tnT34MPzB8DS1bykB3JST5Z5M/79+uj3VED
	5uk+uS90J0NzA2EnzucKlcvYk9RuK+YrEsAFvxaLuOzXjntPJWGqvQeZTkAffkWjRDlIRHXhDlc0P
	BVlWNv/BhwMWdLxEtAZcm8rjbOOVwSTCto8nkryKPWaW5HfQdiUmj53+x+L2Hdi9og45aWSp0VVyF
	0LO7KaKZHwynavqsY2mR/eftIfaDhLoKWgdpl7DDZ9J+b9+aoQopyt0EbqinOKMTvbvroQ2paDsFx
	h2aMk4DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ7mz-00000009Vub-0Axu;
	Tue, 20 Oct 2026 11:13:55 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ7mx-00000009Vtv-1MhU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 11:13:52 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a021c28046so31555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 04:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792494828; x=1793099628; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ssC6O5op5kxsykPYGF90zu0HggsOhAnuDsh96PbOQGs=;
        b=mjWSc639VXfbyd0bosJck0hgMYQx4cTxXYwDJoq6V2rVa6jOvNFbQt1k/QNrF08qjX
         1vLlvoKdR61tz4XUNh2TemtOw/l11DUrcwKBRPPTymGtS8irGM+MN6CgEky4rGbptBZX
         L2wNDGSLZYudtJ3rPI8K3yB0++ZAwRQgANTjos5BVHndxF3d+eY5y1f5USqHvAAYyXHA
         hpNfIJ527Kqfk7UUOJ+EIX7p2sZyIFDbQiFb6E9/IgORA5qnZurJG9CFvY3SRbIXY9Bv
         e4bXaSetqzWyGn8eVGNyVEwFPJs+LLjs4JSyHui16OmrGk4rBW3eBfdjp3cClKgOXTfJ
         smdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792494828; x=1793099628;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssC6O5op5kxsykPYGF90zu0HggsOhAnuDsh96PbOQGs=;
        b=Y07S15on13XFIPHFJUve1gcCLmQYyUtstdggYH9/TkWLluzZKtOwW3oDC8FtAM2HZj
         rs+LNXH7jOTLme3bSlqw9xj6XhfbPxZGnfG+wuAKncjuRfxmprqlPeX/FZQCdhcQLZV2
         QJC3Y8KmxvFNvXfamfoGnErcs7DxH64mI1jvF8nFilOyx3BPTGQ+KRbt7HdMxFxHdfPl
         OiCbIf3g35UtGMB+bZI7HFdcLj1IhEy8kQUk2tNAB0VRVi4+Xbz1mN6NEvi416UOaGvt
         TCZTu8g7q7UMv2wXEeojQ6pkq/rgGLOu0Yp4wWJPYt0zSLm3tmo+tnOEGlifPnlnvCGf
         J4cg==
X-Forwarded-Encrypted: i=1; AKwUvBz1VNWN1c6oXm5SV+naUcKwcC8CSoMRdUKWe2Btt9Hh2wk1w7hs7FOjvc8066xNthd7JjeSgoVMIoA56jwzyvtQ@lists.infradead.org
X-Gm-Message-State: AFq9FYLatp4U5nkUI/MdXacDj0ruM6zW9ZXvcBWau/OIeBv2KlfVb4XC
	M8dFa8/xXPjyHBzGm+dx+U3wuKfhyzmgEMkgbSguGfxEYbXyZ84Td7fWV4JRvvBxqg==
X-Gm-Gg: AYBFou0VDMtZuFTVH1gcbwcEURJgszmR5KntVjmmvv1n3yVWi9KqEJsEe9GDxsBuJZi
	ecr+s97tMiViYlURzo2MxRML6VJuKWAYff4SaEQaR9Uul4mnfKGI0ISj/3RVkLAaA0aPeesdIsF
	JW29X+oYOjZCSkDRV365vKy3Lnnvxd2/Dlewuw5RPeAZIBo8cwBZ2IqSUn5u5H+D4RaukUNhTOS
	XFLntN3RYrtUtZsyOXQ5uJ73cxtQchpZTwBDqIPYPs5spLxP2SN4u6pOyk5MyKqDk+Ho+4aHMdI
	JwrhY0i29B9EM2CIEcBREB3Di8W52t6iogHtL/8QMlTlWQFQ3+nUgmiAPLJCUpJbwx3udCu7m4Y
	98uUsdg/dvT6FdIcLhiJh3ICf0WRz+46UwN2j+kMjNFSANUXvKshcr70NxemM5LE36T6kewYWra
	DPCrDVjDQzM2ukKFnTTU5DoSVmcnNrY8rg/r9Q9YBRxTAVTkm+ROrFhDvKb/eScNPEiaVQqtTk7
	NJLqmYhko7wolMQQZtIiXirST+wvztOhBD/VgY4
X-Received: by 2002:a05:600d:4447:10b0:4a1:7af1:5386 with SMTP id 5b1f17b1804b1-4a1f37a469emr748285e9.1.1792494827956;
        Tue, 20 Oct 2026 04:13:47 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d41c8asm64987465e9.8.2026.10.20.04.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:13:46 -0700 (PDT)
Date: Tue, 20 Oct 2026 11:13:43 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@nvidia.com,
	praan@google.com, kevin.tian@intel.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, jamien@nvidia.com, kas@kernel.org,
	Cristian Prundeanu <cpru@amazon.com>,
	Breno Leitao <leitao@kernel.org>
Subject: Re: [PATCH v11 01/11] iommu/arm-smmu-v3: Init the vmid_map ida
 before the stream table setup
Message-ID: <atdM52CxWJTZxOIz@google.com>
References: <cover.1791226953.git.nicolinc@nvidia.com>
 <058aeb235a458c5b48d918d947608c76dde0d845.1791226953.git.nicolinc@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <058aeb235a458c5b48d918d947608c76dde0d845.1791226953.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_041351_386658_F34CB3D6 
X-CRM114-Status: GOOD (  21.07  )
X-Spam-Score: -17.6 (-----------------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-23.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 05, 2026 at 12:30:44PM -0700, Nicolin Chen wrote:
> The vmid_map ida is initialized after the stream table setup, along with
> the devres action that destroys it.
> 
> An upcoming change will reserve the crashed kernel's in-use VMIDs in this
> ida, from a kdump kernel's stream table adoption that runs in place of the
> regular setup and returns early.
> 
> Move the ida_init() and its devres registration to the entry of the whole
> function, so that the ida is ready by the time the adoption path runs.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Breno Leitao <leitao@kernel.org>
> Tested-by: Cristian Prundeanu <cpru@amazon.com>
> Assisted-by: LLM
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 34e916ea339ff..792627e1c790e 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -4842,17 +4842,17 @@ static int arm_smmu_init_strtab(struct arm_smmu_device *smmu)
>  {
>  	int ret;
>  
> +	ida_init(&smmu->vmid_map);
> +	ret = devm_add_action_or_reset(smmu->dev, arm_smmu_destroy_vmid_map,
> +				       &smmu->vmid_map);
> +	if (ret)
> +		return ret;
> +
>  	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)
>  		ret = arm_smmu_init_strtab_2lvl(smmu);
>  	else
>  		ret = arm_smmu_init_strtab_linear(smmu);
> -	if (ret)
> -		return ret;
> -
> -	ida_init(&smmu->vmid_map);
> -
> -	return devm_add_action_or_reset(smmu->dev, arm_smmu_destroy_vmid_map,
> -					&smmu->vmid_map);
> +	return ret;
>  }
>  
>  static int arm_smmu_init_structures(struct arm_smmu_device *smmu)
> -- 
> 2.43.0
> 

