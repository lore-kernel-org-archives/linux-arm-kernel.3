Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C57FD3EE8A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 16:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fLUE8mIMTmh7qtKAc4chYUNSdEbOKjMUJH6lfYTEADA=; b=w5VbDrx6PrG1ECiwrB4dlWJp/x
	/3dOwLM/EzFBA4ao5xOstwBXpw/0mi2eZeyzKA68jBt6W6aadzb1x307jzVEtxpIGJ6C1UqvDxaFe
	iXn7IPJB1glrCu1Jbvh0mg9LU7HAiGpXyx1za8WYisHnVen0sZk7kayU3g/GXdVsX0iLC5Kms8LlL
	Igbig/NcStgwpi4/MsKFS1yEkL7q96w7jSjNDcSrJ/zXSw7xMcfVnqI/7Y3rETQf9f7wEe9aFdDVN
	owYMPmwOmCUUWRCPpCrSmbz/Ih8ccg/dvIjLfRMmLt4RwSzEahsh5VlyWyUWESqBhuLCRv9VKUxUt
	rkJ5GqoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixOO-00000007PkP-2vY2;
	Thu, 22 Jan 2026 16:18:44 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixOM-00000007PjM-2wts
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 16:18:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=fLUE8mIMTmh7qtKAc4chYUNSdEbOKjMUJH6lfYTEADA=; b=YB1QiQ00RGaI9TdOPXEV2dWZSp
	DTWvjsTCIaYVMmb+bl+HqYf9lP60HS1CG3aubFiUrulYlxZRxNDFgRerfXLT88pohYSfPEJt/oEF4
	caiVcaTLxALk/Qunc/OTCAYCLfgheLZKvapOlC8goWnE1Zg77ZkjjfTyAXp30PNS4wqY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vixOD-003zvE-2A; Thu, 22 Jan 2026 17:18:33 +0100
Date: Thu, 22 Jan 2026 17:18:33 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: abdurrahman@nexthop.ai
Cc: Mark Brown <broonie@kernel.org>, Michal Simek <michal.simek@amd.com>,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] spi: xilinx: use device property accessors.
Message-ID: <d6c5547b-0426-40d0-85b9-b64f183d37b6@lunn.ch>
References: <20260122-spi-xilinx-v3-1-8cea20e82f0b@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122-spi-xilinx-v3-1-8cea20e82f0b@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_081842_738218_C8F5FE00 
X-CRM114-Status: GOOD (  19.02  )
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

On Thu, Jan 22, 2026 at 09:00:29AM +0000, Abdurrahman Hussain via B4 Relay wrote:
> From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> 
> Switch to device property accessors.
> 
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> ---
> Switch to generic device property accessors.
> 
> Changed from v3:
> 
> Removed the patches to make irq optional from the series
> 
> 2.52.0
> 
> base-commit: 944aacb68baf7624ab8d277d0ebf07f025ca137c
> ---
>  drivers/spi/spi-xilinx.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/spi/spi-xilinx.c b/drivers/spi/spi-xilinx.c
> index c86dc56f38b4..c4b70e95b695 100644
> --- a/drivers/spi/spi-xilinx.c
> +++ b/drivers/spi/spi-xilinx.c
> @@ -405,11 +405,11 @@ static int xilinx_spi_probe(struct platform_device *pdev)
>  		bits_per_word = pdata->bits_per_word;
>  		force_irq = pdata->force_irq;
>  	} else {
> -		of_property_read_u32(pdev->dev.of_node, "xlnx,num-ss-bits",
> -					  &num_cs);
> -		ret = of_property_read_u32(pdev->dev.of_node,
> -					   "xlnx,num-transfer-bits",
> -					   &bits_per_word);
> +		device_property_read_u32(&pdev->dev, "xlnx,num-ss-bits",
> +					 &num_cs);
> +		ret = device_property_read_u32(&pdev->dev,
> +					       "xlnx,num-transfer-bits",
> +					       &bits_per_word);

It could be my grep foo is broken, but there does not appear to be any
users of xlnx,num-transfer-bits and xlnx,num-ss-bits. So it would be
better to just remove them. There is no point Maintaining an API
nobody uses. And it would be silly to spread that API to ACPI if
nobody it going to use it.

	Andrew

