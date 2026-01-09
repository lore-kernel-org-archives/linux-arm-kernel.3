Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75679D1681B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 11:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WXuwAQZl4FGpvlJp5X4mWtNp0SS3dohUpiqPkjHtRww=; b=DEyMAaGGuPuLTjefhME7Tq0QVF
	j60BhJBLbi2zamiC44bae1lIIjO8uMHV1XrxhQ+e1GAgPQJHRYbyHjFHQpXYlfbkhSw3usOf2OyJo
	c5TxeEiltPEPKxpFtqMa8Gg+ojoDoayxoo6vYtlxXoKJB5udYqbc/5i9djI6+AfzOQAc7KmoUmpwH
	SFlnRdgf74B9TWDispQTqUm6AlLmqLTSL1G1YPKdPgJedp3dkk7pU9S6SJC7RU+OeY/1GoMX6VKCg
	MNI/sWlqmiTZSvTCgZFwR36KHZiUp6xQUCwI+K+rqYnUwBwyIvKP5eoY6sSwQYud3B0UVJixIBlVo
	Cl5xshzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veB38-00000002GNC-21NV;
	Fri, 09 Jan 2026 11:53:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veB36-00000002GMj-0q1r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 11:53:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DF60C418C0;
	Fri,  9 Jan 2026 11:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 456E8C4CEF1;
	Fri,  9 Jan 2026 11:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767959579;
	bh=5Z6K6b1yM72R3LASDW2ZKPjr20pV1qeRdu+728KuN+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oVjGcQkHcjIDYK23XM3rCa18GyKj04XSU4+1RCtCFA+d5j5Dhs1w5PfAuoNUNj2rO
	 yYOBPNQjFMEuiBpuAC069DzFnrIxytAVI/vBT5NkDhyI4Kl5JjHhUtZtyL3QPZzr8T
	 DTZbUMo5Hb4Vf58OA7J1PeDZgMFS+3c8ZnmgbVsOIKeGmS8ICOUKU+VyV0LnF+/kAW
	 vLbQaxpO5Qwyrstrih+Uxqho+YNmMeRUD2OXXG1ttpj8+RoIGKzB1mEZdnzMTfGGrU
	 iNijSxt1bbKCNVqE/o5w3GuD6QxXqjb7kKM/MGb1Ylhf6DfMN9ZQGTbSNBA7L0zIro
	 UQ6VspIBgAfEg==
Date: Fri, 9 Jan 2026 11:52:54 +0000
From: Will Deacon <will@kernel.org>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com, robin.murphy@arm.com,
	joro@8bytes.org, catalin.marinas@arm.com, kernel-team@android.com,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v5] iommu/arm-smmu-qcom: add actlr settings for mdss on
 Qualcomm platforms
Message-ID: <aWDsFoEe7PHQaL9F@willie-the-truck>
References: <20251209052323.1133495-1-bibek.patro@oss.qualcomm.com>
 <176764799410.1451727.17568755330994660848.b4-ty@kernel.org>
 <b0a39971-5616-4768-b08f-b359cabd2f6e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0a39971-5616-4768-b08f-b359cabd2f6e@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_035300_298925_003DC157 
X-CRM114-Status: GOOD (  23.39  )
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

On Fri, Jan 09, 2026 at 04:59:13PM +0530, Bibek Kumar Patro wrote:
> 
> 
> On 1/6/2026 4:28 AM, Will Deacon wrote:
> > On Tue, 09 Dec 2025 10:53:23 +0530, bibek.patro@oss.qualcomm.com wrote:
> > > Add ACTLR settings for missing MDSS devices on Qualcomm platforms.
> > > 
> > > These are QoS settings and are specific to per SoC thus different
> > > settings, eg: some have shallow prefetch while others have no
> > > prefetch.
> > > 
> > > Aswell, this prefetch feature is not implemented for all the
> > > platforms, capturing to those are implemented to the best of my
> > > knowledge.
> > > 
> > > [...]
> > 
> > Applied to iommu (arm/smmu/updates), thanks!
> > 
> 
> Hi Will,
> 
> While reviewing the applied patch, I noticed that during the transition from
> v2 [1] to v3 [2], one of the SoC entries (sa8775p) appears to have been
> dropped while addressing the review comments.
> 
> Sorry for not catching this earlier.
> 
> Would it be acceptable at this stage to send a v6 including the diff below?
> Alternatively, if it’s easier on your side, please feel free to squash this
> into the existing patch currently applied in your tree.
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 456d5146831e..718d102356d9 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -43,6 +43,8 @@ static const struct of_device_id
> qcom_smmu_actlr_client_of_match[] = {
>                         .data = (const void *) (PREFETCH_DEEP | CPRE |
> CMTLB) },
>         { .compatible = "qcom,qcm2290-mdss",
>                         .data = (const void *) (PREFETCH_SHALLOW | CPRE |
> CMTLB) },
> +       { .compatible = "qcom,sa8775p-mdss",
> +                       .data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
>         { .compatible = "qcom,sc7280-mdss",
>                         .data = (const void *) (PREFETCH_SHALLOW | CPRE |
> CMTLB) },
>         { .compatible = "qcom,sc7280-venus",
> 
> If neither approach looks suitable, I can send a standalone follow‑up patch,
> either on top of your tree[3] or on tip.

No worries, but please just send a patch on top so that we have an
explanation in the commit message and we won't have to rebase the
branch.

Cheers,

Will

