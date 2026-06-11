Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8513CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 16:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ef0nR/F/3mauVtjPQKNzv0MDN5cCbO2Pdn8BUSaOyxI=; b=37/sDrqVw8OPmQLQsbMHYxvB9S
	/v4yMyoJgBZAFRlUQBJG5ZRlMYdmXDPRNJRgN3+1Dk3S0FrV8B9AVMAsefxIIgTq4A6lzf8SsHTIt
	7gmCQU41xsR250zVQ7lZh0PHI3OkvNiDUsQGP9xsl75tqeUX6LUn9tW/1cvgcKVdCdOBZtdzgsQNH
	CtWcy7/+Xa1wtZYDyWgOzVTlwwB2iiz/WQ+jt4gsx9HFB1fTJE8Mxet4zxMf1AMK504cslwk+0++W
	Q5BmfhuhbfIj7MS6Jm8Ohb9lGhRzpWB0vMAYiEYumcwRAxh2isaX+EGcY3KtPClSvJ53JBVpfh+y+
	5tzPankg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXiPj-00000009m2M-1in4;
	Thu, 11 Jun 2026 16:37:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXiPi-00000009m2D-3fI2;
	Thu, 11 Jun 2026 16:37:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F03240294;
	Thu, 11 Jun 2026 16:37:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 070CD1F00893;
	Thu, 11 Jun 2026 16:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781195874;
	bh=ef0nR/F/3mauVtjPQKNzv0MDN5cCbO2Pdn8BUSaOyxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=okaG9bdiR0+20Z2ZlUm2AZfM/nYhVULe6RDzWHnaRvEBHroTojrpfwlptOET66ZiA
	 LHiZgcVYzwnzyRk7IENhOSxWu8MFc6lvQeqxwcqqq/VVgOEKSOzw5AEsBzgNt13C3X
	 QyVc7Ru+IsBM7hgT1nA7hTZT19XrWi9VYnbH/vAFXguoHRl+Zd4s+yy3BwyPd4RnKb
	 OTjF+LleVIyGNWhC+5Xg5iyP/YkPGPpr36JlFVI5NP0lfNw+UF9oAkTMj6+6LGcT1+
	 ObsNTmr8+Q5r5sXFbOSMuj9eR5x8NImDfijzM6x7FzU8jmoqZHoGG7Xr7/NOKUXMTz
	 jnHBSoHogBd3A==
Date: Thu, 11 Jun 2026 17:37:48 +0100
From: Lee Jones <lee@kernel.org>
To: rva333@protonmail.com
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH 3/4] mfd: mt6397-core: add mt6323 AUXADC support
Message-ID: <20260611163748.GB1212816@google.com>
References: <20260602-mt6323-adc-v1-0-68ec737508ee@protonmail.com>
 <20260602-mt6323-adc-v1-3-68ec737508ee@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-mt6323-adc-v1-3-68ec737508ee@protonmail.com>
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

Interesting.  Has this been considered?

/* Sashiko Automation: Issues Found (1 Findings) */

On Tue, 02 Jun 2026, Roman Vivchar via B4 Relay wrote:

> From: Roman Vivchar <rva333@protonmail.com>
> 
> The mt6323 PMIC includes an AUXADC. Register the AUXADC in the mt6323
> devices array to allow the corresponding driver to probe using compatible
> string.
> 
> Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>  drivers/mfd/mt6397-core.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index 3e58d0764c7e..013b0857fb54 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -125,6 +125,9 @@ static const struct resource mt6323_pwrc_resources[] = {
>  
>  static const struct mfd_cell mt6323_devs[] = {
>  	{
> +		.name = "mt6323-auxadc",
> +		.of_compatible = "mediatek,mt6323-auxadc",

[Severity: High]
Does adding this compatible string expose an unhandled edge case in the
auxadc driver?

If this device is instantiated directly from a Device Tree without an MFD
parent (e.g., at the DT root), dev->parent could be the platform bus
(which has a NULL parent) or NULL itself.

Looking at mt6323_auxadc_probe() in drivers/iio/adc/mt6323-auxadc.c:

    regmap = dev_get_regmap(dev->parent->parent, NULL);

Could blindly dereferencing dev->parent->parent here, or passing a NULL
device to dev_get_regmap() (which calls devres_find()), result in a
kernel oops if probed as a root node?


> +	}, {
>  		.name = "mt6323-rtc",
>  		.num_resources = ARRAY_SIZE(mt6323_rtc_resources),
>  		.resources = mt6323_rtc_resources,
> 
> -- 
> 2.54.0
> 
> 

-- 
Lee Jones

