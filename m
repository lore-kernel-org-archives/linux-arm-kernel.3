Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68748C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 21:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkJStVQQrBUVTUaskhv5zoU/YZtR/Z//KEgb+Nu4U5Q=; b=1GI4YS1uZvIDoP7L6NINS23PCP
	+8xJTpXBPRiGFYmy0oR8yLlp+uEmB+IrmyD3l5/ZjVgwhXEo0i6XPNZfUregX7eI1SnMlMLWzUxgc
	BYAx1P2qf7ezMGK8x7LSr2/nyaqizIcpl0Ti056Nqsa1DXxkfYDpVQBTu06z/i9hxW/C5vAOTdUHA
	KScz+/OgOX9gH2rK96ab8Sz6ItE0eQadzvRC1qtcCAeP32SqspDMzjcru20E9y/ghtxTI84hglxSf
	OGzCLlOVSTizR+4TAYbmCv156ynyFBbsb4Yk2Rzmn0upy+ps8UHyKZAOCnUT6+oT3eW10q0xDDJdw
	j2GzFynA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whZXs-00000000QF3-3NTU;
	Wed, 08 Jul 2026 21:11:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whZXq-00000000QEa-0zrS;
	Wed, 08 Jul 2026 21:11:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A555140267;
	Wed,  8 Jul 2026 21:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DEF91F000E9;
	Wed,  8 Jul 2026 21:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783545061;
	bh=tkJStVQQrBUVTUaskhv5zoU/YZtR/Z//KEgb+Nu4U5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dekQRjgjNEfXhlQmyfoUDHiLn7BOa1vrUXPYlOF7nZT0gYD6oWWmhiYaf1OQ34y31
	 qbk2C0vFSHkKFrQSQrGyMQWPiMLPaKBRt7Q/Cdoyk8W3jGRGBtPQN07cQm6DaL94DJ
	 liYCCyfJECEuEN9RP9GTZpUqVsh1vA7E2jpW+il+Afq+NyvgBUWpXE49gsa6njMmm5
	 pIBI2zhomAjp6hSuqoOZ2DwGWQG5OW+HXEZUMS38cM2HFh2pYITcTKOdCkkNECtRbu
	 XDVCXFhBzOP0+TcbgG3tosHfbUe70o7c/6ZnxShy8QP07T6fDX/4V0IvI5rLU5VoEn
	 Nmh0+1GaRps4Q==
Date: Wed, 8 Jul 2026 22:10:56 +0100
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
Subject: Re: [PATCH v4 3/4] mfd: mt6397-core: add mt6323 AUXADC support
Message-ID: <20260708211056.GB1727174@google.com>
References: <20260623-mt6323-adc-v4-0-299680ad3194@protonmail.com>
 <20260623-mt6323-adc-v4-3-299680ad3194@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623-mt6323-adc-v4-3-299680ad3194@protonmail.com>
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

On Tue, 23 Jun 2026, Roman Vivchar via B4 Relay wrote:

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

Doesn't apply.  Please rebase and resent with my:

Acked-by: Lee Jones <lee@kernel.org>

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

