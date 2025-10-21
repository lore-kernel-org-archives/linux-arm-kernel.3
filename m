Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7505ACCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 15:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KlVX1cT1lwYoeRpfVYs1rHfmeOIpFYZOGpu4O+KbX0I=; b=uZJEg5W6W4b2DwpC6e+mQPvqq8
	PLIIXPVNcwxdPU3knQwMMa5kYx/K0AOUwq6iz6BPK7n4alkIPGGvuq63cA8y28kxNERj56Cznwv6o
	G3KaqCXR1X1cwW1i3YJSxjx3w1c1Adjdyip1Es8sAgUYZDI93zAVY5eiywwJC4NvZl7fDBKCWnQlV
	2YR6TK3himMJrMfJpvgnABhJ+HN1+7HhOCPwClWHG+jzL+jP8WnLCd1VvpMIj5rt+Du9XCudwtRx9
	ceCNoLIlC+mPKLRJHC03ECIlEVRJdOqO1bEFSrBWDe42xPCG3T9idgXsIfhJ3+g5qYJZ6KYoQpiu6
	iSxjbw2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBDzZ-0000000HSDh-34YJ;
	Tue, 21 Oct 2025 15:09:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBDzY-0000000HSDY-2GTF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 15:09:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A0CBF60435;
	Tue, 21 Oct 2025 15:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E163FC4CEF1;
	Tue, 21 Oct 2025 15:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761059379;
	bh=5U/hwM6oStRUswmzcr0DDq1CXsslSOAL1jIHn7nowgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Eh//w81L8H2VOFwI5+wCMVxu86xgZmHHchIe0BoP7Qj4b8T8SYrBd9l4+nwEoD9/9
	 rmQk/iKuEFuAyr5mRHu6wqkmlsCbeDN47I8ecFm2NO52P6q3rQ7dLGRb+ysdb+gOF7
	 R7De5rLMSD54lnrvpVAp2/vn9y36UzILxllaTC5ubJovJFtDkdpT5Z5ebBwTlTWkhE
	 GA/JmcE/o7YXcoeXVapxbAmwvREpTaezrIhEi4U7g+8/7Q7C1Sig1I4YFoCLN58mSe
	 nViY5HoQTRpxjHgMKI7VDV4YjRJXkGElbRK8Hu1fEF0cvfERBOOoxYjAX71Z65dAAm
	 BL71bz6rUn72w==
Date: Tue, 21 Oct 2025 16:09:35 +0100
From: Lee Jones <lee@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: macsmc: Initialize mutex
Message-ID: <20251021150935.GK475031@google.com>
References: <20250925-macsmc-mutex_init-v1-1-416e9e644735@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250925-macsmc-mutex_init-v1-1-416e9e644735@jannau.net>
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

On Thu, 25 Sep 2025, Janne Grunau wrote:

> Struct apple_smc's mutex was not initialized before use. Surprisingly
> this only resulted in occasional NULL pointer dereferences in
> apple_smc_read() calls from the probe() functions of sub devices.
> 
> Fixes: e038d985c9823 ("mfd: Add Apple Silicon System Management Controller")

You need to Cc: Stable as well.  Please submit a [RESEND] with that done.

> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  drivers/mfd/macsmc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
> index 870c8b2028a8fc0e905c8934c2636824cbe5d527..3a117cf19145e86b642f40dc165b542b8df69070 100644
> --- a/drivers/mfd/macsmc.c
> +++ b/drivers/mfd/macsmc.c
> @@ -413,6 +413,7 @@ static int apple_smc_probe(struct platform_device *pdev)
>  	if (!smc)
>  		return -ENOMEM;
>  
> +	mutex_init(&smc->mutex);
>  	smc->dev = &pdev->dev;
>  	smc->sram_base = devm_platform_get_and_ioremap_resource(pdev, 1, &smc->sram);
>  	if (IS_ERR(smc->sram_base))
> 
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250925-macsmc-mutex_init-80d7cb2aacfa
> 
> Best regards,
> -- 
> Janne Grunau <j@jannau.net>
> 

-- 
Lee Jones [李琼斯]

