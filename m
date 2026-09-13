Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AABC88E40
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 08:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1iYZQpYj6ALduOuqAJTduI2u3Vut2aTKr0l8zVHBH5A=; b=kB6tV82fkIvdtRGDXPnddW/ntQ
	SI3MnuZw/JqRdaTRIsTNtN3kBgIDdvM97wgLQPNcRIKTdm3IW5uxqtmhla+jGqjVrpcpR5E4xyNYk
	/hCv8qVNXM1nK/3rjJSNJche9eLE4qK+jqGeL4JCfRcRdXzkRBCjKpDfB/I8lXqVGpI0KcrBzyATR
	/R9roh2QCdvmQdkDhKpO8JH1JymzkFy93SCRUTfRZHtKhH9YvZ+7B9sWCaiU8OJqIYpF2xZRSGzvq
	wHxx7c9vm2Skoo8htPleMnnLgY782rv78NBICWIG9B/1yg78x2A93rgSiCXJBuGtPPmih6haur/UH
	bsxI/+8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5g1R-00000001WzO-34Js;
	Sun, 13 Sep 2026 08:57:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5g1Q-00000001WzI-1Wr5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 08:57:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C4DAC4076B;
	Sun, 13 Sep 2026 08:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A41C1F000FF;
	Sun, 13 Sep 2026 08:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789289831;
	bh=1iYZQpYj6ALduOuqAJTduI2u3Vut2aTKr0l8zVHBH5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bivupdBC/Edl3m1mbbY+hVxRNnNcnTlgJ4eWTlfD1lwJ7BTntcLdzAyBpJfuu2nwT
	 JceUeVFmzjxa59nn+e9EveKjbuZyIIEYYnX52VHShNeaVxA39fdNG19+PMM7eqh/BD
	 qayzvYe8noiW+ZrlGaGRjUiSkk0OvwV/B63m30Cq0J+S1UqgnWvLhRTGhQGCB/bX/l
	 HyZPMJhmufEWAQ6EV7IjH6jl/IEI/fEUqeN5Lwj1jxAkg+X0bOPQ7bPVZllq9YIR5Y
	 wsqj3J4lgA/Op+2iEO1zZpb+PORuVgNK7kZgcln/1lkF2W4T60LFCwgqO+lsL9NdYv
	 JSjVOx/EtRJbQ==
Date: Sun, 13 Sep 2026 10:57:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Judith Mendez <jm@ti.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] nvmem: uniphier-efuse: Add ti,am62p-efuse
 compatible
Message-ID: <20260913-cocky-angelic-cougar-1961db@quoll>
References: <20260910155509.1425682-1-jm@ti.com>
 <20260910155509.1425682-4-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260910155509.1425682-4-jm@ti.com>
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

On Thu, Sep 10, 2026 at 10:55:09AM -0500, Judith Mendez wrote:
> Add ti,am62p-efuse compatible to uniphier-efuse. Leverage the
> nvmem provider to supply silicon revision information from GP_SW
> efuse registers on AM62p device.
> 
> Signed-off-by: Judith Mendez <jm@ti.com>
> Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---
> Changes since v2:
> - Add Kunihiko's review tag
> ---
>  drivers/nvmem/uniphier-efuse.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/nvmem/uniphier-efuse.c b/drivers/nvmem/uniphier-efuse.c
> index 85f9372fb97ca..d0953b99d7e18 100644
> --- a/drivers/nvmem/uniphier-efuse.c
> +++ b/drivers/nvmem/uniphier-efuse.c
> @@ -59,6 +59,7 @@ static int uniphier_efuse_probe(struct platform_device *pdev)
>  
>  static const struct of_device_id uniphier_efuse_of_match[] = {
>  	{ .compatible = "socionext,uniphier-efuse",},
> +	{ .compatible = "ti,am62p-efuse",},

Why do you need this change?

Best regards,
Krzysztof


