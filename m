Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 433E5D41149
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 09:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=34ePLiQweY9GaVt0+JeMBd4C7K5vjm7UpK2K4R8k86w=; b=NNoXu8nzK5hrbLHVvGinlUgYo+
	fxcamTuK9bKSIPlUVa7728hNlh0wXYYc2lSk9TQUlehzEzaFGG51dBK5z1aqqZ+RStNKe3/lqIEhM
	E6ZqjB/Zdln+ea2Dg517l2+uKnYCrbtZUkJbeACUGKkVv1a1Pke1x4RsibvXWRmEBuCD8oexeEOMh
	2btuDIMQgjyLlIAkepr86juGXS0qgimPxf5ytODoDJ1ABp/YNAApUc4wk8Eqkqu8V6UdA+5tBhmza
	ENbvSeyEklHTQYQpl78R5jrpikK8XZcTm1RwWLAWsv+NPSkuGNJPrbCHjPlOF7UatWLxb+sUJ0fbM
	b0ytGJ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgK2T-0000000C6ty-0wvU;
	Thu, 15 Jan 2026 09:53:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgK2P-0000000C6tD-3xv1;
	Thu, 15 Jan 2026 09:53:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2397B601B9;
	Thu, 15 Jan 2026 09:53:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D54CC116D0;
	Thu, 15 Jan 2026 09:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768470788;
	bh=nQRGCmfmTv/HFL3TGgfPhp5kkEYvJqdN5RCn3LswyN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SEb+448vdOLkMsqGqmm0r51xQieYMuN9whjnOzn4yQXYQueUi2b3wJijiiBXFQKHh
	 vMjUi9ELwJx1NtfnQAWQIaWi5vuNYyaCkeWxCeVBYFb7wlXbuTqB47Pq+yHplO34/p
	 e04Q5DJm4FtFwXf77ev6yugp+uUgJ0OY2we+6CyfBpoWoYF6l4aVtuxEzVsZAg2X/F
	 JrcFBBk9IvPQpz8hqDdObSP6ckWaPhvMxdR9u4/RhPaGNzUyi6lowmf2rBh3F3VVNw
	 AYEVLGihQzQFfc5bO7VjTGroJzZCzRXJV0tErqiv/7JUT0WmF1qXrcJMtAJ7g7gKsf
	 Dhi+Fp29CRTZg==
Date: Thu, 15 Jan 2026 10:53:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] phy: add AST2700 usb3.2 phy driver
Message-ID: <20260115-jaguarundi-of-optimal-fruition-09d32e@quoll>
References: <20260114-upstream_usb3phy-v1-0-2e59590be2d7@aspeedtech.com>
 <20260114-upstream_usb3phy-v1-2-2e59590be2d7@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260114-upstream_usb3phy-v1-2-2e59590be2d7@aspeedtech.com>
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

On Wed, Jan 14, 2026 at 03:13:11PM +0800, Ryan Chen wrote:
> Add AST2700 USB3.2 PHY driver support.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  drivers/phy/aspeed/Kconfig           |  13 ++
>  drivers/phy/aspeed/Makefile          |   2 +
>  drivers/phy/aspeed/phy-aspeed-usb3.c | 236 +++++++++++++++++++++++++++++++++++
>  3 files changed, 251 insertions(+)
> 
> diff --git a/drivers/phy/aspeed/Kconfig b/drivers/phy/aspeed/Kconfig
> new file mode 100644
> index 000000000000..93bb5a913633
> --- /dev/null
> +++ b/drivers/phy/aspeed/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +#
> +# PHY drivers for ASPEED
> +#
> +
> +config PHY_ASPEED_USB3
> +	tristate "ASPEED USB3 PHY driver"
> +	select GENERIC_PHY
> +	depends on ARCH_ASPEED

COMPILE_TEST

> +	default n

It's the default, so maybe you meant 'ARCH_ASPEED'?

Best regards,
Krzysztof


