Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B28CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 10:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H3CjLLH85iQJGxGgHqRUtdoGPPO5Yc3bo2qVuuDrPS8=; b=XwKMSZ9PeaIBSWNCS1qOI28+mr
	LPIMHw2+3FmpSddGFzPapK8KY/ubrVQESELZxk6XrV3tf65HnkxmqZsz/cNUG24eJgv+okGIQcs//
	GcU0imTUW0LJ68U7AxhNBMzhp94LBLaUla0zLmhCBfHrbwQ6m1k03jy2Z0VOakZA/uH7diZwMQkE6
	wR6wT4OqVJ/1mgBLq6nU/THeQXTGDG96dthAWWzl7TiVAAqSELkQyTaDGRaNi2wHRKAijfEUREaJY
	ayyiCONODbS7UlZL20b/MCsSq2Ix4c8xJiK+VnG+VLniePZCilOyuF3FOCndODmk6CvLcSyoVb9Vj
	IyUgyblg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrRW-00000009Yo9-2uHt;
	Mon, 03 Nov 2025 10:05:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrRV-00000009Yo0-2rij
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 10:05:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B8E0760010;
	Mon,  3 Nov 2025 10:05:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E9E4C4CEE7;
	Mon,  3 Nov 2025 10:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762164340;
	bh=r5ZAahRc6Rn7ZJ6STU/KlsskUpNdQLHqPWsUeMUM35M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eL2lC8rmaq3O60XkiGTmkNNrnvk5bW+DcBQt4+I+zrOPAFhoS9KuvvFe2U7Rxbmn4
	 34oXI5MPb3x8rohfCg0fSGKA7G2RwdqwlK7vDJ3Fj5q7Dg5ycOSitET8XcMlPC0tCH
	 ktUcd/T3lYGGWtvNqqsZDuu1G/fyFOs3pbPGd8TRKAltwkPECc5arOxFvLHJjWrNIv
	 JeUXSLJ5IqVO7RQK2LOSg2Sas+Z/wvGF7Cbwc14NSDYVoi00vhBmzMEKOxHPyc7od/
	 oXSWLvQV7hFFGw4R8IwigjbdH/Roobxvjvc/K/c4v6mMuXeKOqSHxrIgBfHzN985d1
	 QKnj0fWt/Z9tw==
Date: Mon, 3 Nov 2025 11:05:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, semen.protsenko@linaro.org, willmcvicker@google.com, 
	kernel-team@android.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/11] soc: samsung: exynos-chipid: refer to match->data
 as data
Message-ID: <20251103-spoonbill-of-incredible-resistance-d5befc@kuoka>
References: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
 <20251031-gs101-chipid-v1-4-d78d1076b210@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251031-gs101-chipid-v1-4-d78d1076b210@linaro.org>
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

On Fri, Oct 31, 2025 at 12:56:03PM +0000, Tudor Ambarus wrote:
> Be consistent across the driver and refer to match->data as data.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/soc/samsung/exynos-chipid.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
> index f5107b8b339e8884d6a67a80650a95441510c66c..ab6bdf24a754a0faf974190c1fa1f99735cbef8e 100644
> --- a/drivers/soc/samsung/exynos-chipid.c
> +++ b/drivers/soc/samsung/exynos-chipid.c
> @@ -106,7 +106,7 @@ static int exynos_chipid_get_chipid_info(struct regmap *regmap,
>  
>  static int exynos_chipid_probe(struct platform_device *pdev)
>  {
> -	const struct exynos_chipid_variant *drv_data;
> +	const struct exynos_chipid_variant *data;

I would prefer name drv_data, to mark clearly this is driver data.
Sometimes driver state container is called "data".

Best regards,
Krzysztof


