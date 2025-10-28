Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0BFCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 13:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9e2Er2fy/G5NzyJgTaYmGPZ2va1I8Mb5X/jRKlfhI/0=; b=lg0LyrdfMmhGnlDK3KbbR/j5xP
	2ua5O8HBYQnMtccQkN9XX77XBdF+7Whimbvz/iV6qrwqeSwHBLqdYADIOZdGqSoanFiM1WaKqR19m
	VqB2F8uZZ7wcgBuy0hCxyasFNSbEbfzHZ7oMbTpWWqtXXGB+pmjuc7AQoyDU0NMXLGGcOwCvy6MKR
	Rak4Pj3Yma1YjMLYamDcQuw/gDHO3koi38QY0vcehdwdqMW1nbgeE7v4Ozf0D6CeRmeNzvr2pb4oU
	H6M045TvbQ3+lqDjgTXNcRgjJM5G6/MGq3nxu5QcEYNwB7POrGXYqFwELo6YoHRGB7NqPo5ZBlebT
	gSppqVDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDk3q-0000000G26y-1T9o;
	Tue, 28 Oct 2025 13:48:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDk3n-0000000G25L-0lK6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 13:48:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C7A6744D1F;
	Tue, 28 Oct 2025 13:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7DEC4CEE7;
	Tue, 28 Oct 2025 13:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761659306;
	bh=G7qi5rvC9Ca8mwYeyrUYcrHvUOWw2LAZZygmude9OI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EtFqslrTEIwU0Bu0hONlK7yuekEuZM+xv00UqPmQdRWjZ1EK6TlynFwreSv0L1GoO
	 V0US9D1AmPSzNhGs5Gdv8892rgR6FN+elyOEqQaO5Mbqg6whyNHJI3BuG7g5mbFitS
	 ZJVcHv3R9vUpWbKclpdXLC/R1c5RGa5HOtCGw9vR0NCewZj/2pl9cW8FgBzAfc2tON
	 5xfAdA1jFKli4j99BR++D+E9FySLkEfNbUEv4QjjCPByUe9AKDFtdk7y/kOQS0KgyB
	 5qbn4fRvbJROvh3OUIlEbc2/Nd9eSu9uK87avljtC3c7H4Dt2Yw4hG/UIj1c+sXJjK
	 WL2PrEGWOq9+A==
Date: Tue, 28 Oct 2025 08:51:24 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Add Glymur MDSS compatible
Message-ID: <mnq4muqhkssqmvbjb6upkqhoag5r4dpfx5vmfgydcarffh6usf@kzyi7xikttpg>
References: <20251028-iommu-arm-smmu-qcom-add-glymur-v1-1-73f8f884c9b4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028-iommu-arm-smmu-qcom-add-glymur-v1-1-73f8f884c9b4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_064827_788938_84558767 
X-CRM114-Status: GOOD (  16.62  )
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

On Tue, Oct 28, 2025 at 02:38:19PM +0200, Abel Vesa wrote:
> Add the Glymur DPU compatible to clients compatible list, as it needs
> the workarounds.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
> The compatible is documented here:
> https://lore.kernel.org/r/20251027-glymur-display-v3-1-aa13055818ac@linaro.org
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 57c097e87613084ffdfbe685d4406a236d3b4b74..c21a401c71ebe768115364bf282dd324f8222109 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -367,6 +367,7 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>  static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
>  	{ .compatible = "qcom,adreno" },
>  	{ .compatible = "qcom,adreno-gmu" },
> +	{ .compatible = "qcom,glymur-mdss" },
>  	{ .compatible = "qcom,mdp4" },
>  	{ .compatible = "qcom,mdss" },
>  	{ .compatible = "qcom,qcm2290-mdss" },
> 
> ---
> base-commit: f7d2388eeec24966fc4d5cf32d706f0514f29ac5
> change-id: 20251028-iommu-arm-smmu-qcom-add-glymur-7e953cd459a9
> 
> Best regards,
> -- 
> Abel Vesa <abel.vesa@linaro.org>
> 
> 

