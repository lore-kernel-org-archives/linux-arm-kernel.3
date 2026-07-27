Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE38C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 09:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aKrDYlhR6SDQbCTlfl2xuP5WP5hDrGYStieG9YKwsXQ=; b=279h3X5w7uv3KlOg8wTvyo8+Rs
	CjReNYCNugV3cYaiBzFHfeeb478vGqpSvdnAGVkLb7z+CcyF9zw+BpnQrhx6RDjtBgffMT3gCARf7
	Lnz5bHpeAcr5y8Cp+fFgsKmtv7YlYTHjK4rgctYdlZBZGkG1PouJElnPw7xsUB+DtXp0As+xAnVOU
	/fLRtM5E72CMfx06J7kYvplLXpcFicycCVbpjipLeLr+ezuAM0DPAehYmVLLOPgfPRY/EpABn4JJa
	Yx+pdpcMxLfIJPrvaYMDf00V3lkSPWmaDUcOllQ0/jtaVGmQGTZsSyAQUC77Y6kj0rITvtHMvoBYC
	/Oec/eyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHvP-00000002Mx8-1CLf;
	Mon, 27 Jul 2026 09:47:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHvO-00000002Mwm-0Jjx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 09:47:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 878A0601DE;
	Mon, 27 Jul 2026 09:47:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C56B1F000E9;
	Mon, 27 Jul 2026 09:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785145625;
	bh=aKrDYlhR6SDQbCTlfl2xuP5WP5hDrGYStieG9YKwsXQ=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To;
	b=Tutd9l/SYstDt45jLYidI4LJML/z/7DIWAk99X3pJcu+O0UnOCF4SoDQ6ezkAvQs/
	 Yz+6bJOUYb0qF04ohMj++b5DGLUoYRRKlg1ri/2JyqCWvVwkLDNcRHN7LAyZvpm82o
	 Z3DHu8DRRX+TcIX68HrlYmYeuk16df7uyoXA2U+NcU163UQNJZdr2ajRGJHCmx1TXi
	 uBlYesK8lRnZdXAxKyfXPqDFoo2lSbwyGmCfeO5VnjuaaER15HKl9bwspIFmf4vq3o
	 inmk7F/7ZKrhcNblqZYB7tci4WC4fYFqdS/WYM8l+/2WGnFGNH8raUo/F86+pDwivf
	 t8RHW+hVGCoNg==
Message-ID: <877f0d7a-6eb9-4305-be24-20e97bb3edcb@kernel.org>
Date: Mon, 27 Jul 2026 11:47:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: fsl: dpio: Remove redundant dev_err()
To: Pan Chuang <panchuang@vivo.com>, Ioana Ciornei <ioana.ciornei@nxp.com>
References: <20260723024748.30105-1-panchuang@vivo.com>
Content-Language: fr-FR
Cc: Roy Pledge <Roy.Pledge@nxp.com>,
 "open list:FREESCALE SOC DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
 "open list:DPAA2 DATAPATH I/O (DPIO) DRIVER" <linux-kernel@vger.kernel.org>,
 "moderated list:FREESCALE SOC DRIVERS" <linux-arm-kernel@lists.infradead.org>
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260723024748.30105-1-panchuang@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Ioana,

Le 23/07/2026 à 04:47, Pan Chuang a écrit :
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() calls.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>

I plan to take this patch for v7.3, do you agree with this change ?

Thanks
Christophe

> ---
>   drivers/soc/fsl/dpio/dpio-driver.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/soc/fsl/dpio/dpio-driver.c b/drivers/soc/fsl/dpio/dpio-driver.c
> index 9e3fddd8f5a9..d5198ffc4455 100644
> --- a/drivers/soc/fsl/dpio/dpio-driver.c
> +++ b/drivers/soc/fsl/dpio/dpio-driver.c
> @@ -102,12 +102,8 @@ static int register_dpio_irq_handlers(struct fsl_mc_device *dpio_dev, int cpu)
>   				 0,
>   				 dev_name(&dpio_dev->dev),
>   				 &dpio_dev->dev);
> -	if (error < 0) {
> -		dev_err(&dpio_dev->dev,
> -			"devm_request_irq() failed: %d\n",
> -			error);
> +	if (error < 0)
>   		return error;
> -	}
>   
>   	/* set the affinity hint */
>   	if (irq_set_affinity_hint(irq->virq, cpumask_of(cpu)))


