Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A25606FCFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 15:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yhpzlgh0;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ka8mU0zm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=04sRIO3MjeYbz6CJp5GZCOCBS65b5l82fPhVgQ5j8Ig=; b=yhpzlgh0mRnj+oQ1uJOoco42o4
	jFej6ZRIA/rSe9gIncyxHaaKG/Dk7mfUbRhAuscb1+zDHq3qDUOxCAr+j+GGfi8nov/4nJa0RcDsr
	pgbzpZ7nHZB1UAvBsEP9n1M6R1NmK+qXhqPn8eyQmQPkRSJJubtIPVjzisELhMpEo9TZfO0ueyFGG
	gNuSbrvGBc5kGAy1KP6sdYrM+De5ZX/vVdeE+karjJ4ZO746ZpaAuocizcNKvjKrVGi7FxrmdRp1r
	ubFCY9uwgYw6fv4gpz+YS/jItXhKtAh1hix37GvL7YbAh7LiDQmfViBhLweGeW0OWNVH+zjZQPazz
	ZZoIldHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOG8T-00000002r6x-2RsP;
	Tue, 03 Nov 2026 15:09:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOG8S-00000002r6N-0ibx;
	Tue, 03 Nov 2026 15:09:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B2BBD436A3;
	Tue,  3 Nov 2026 15:09:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 351961F000C1;
	Tue,  3 Nov 2026 15:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793718555;
	bh=04sRIO3MjeYbz6CJp5GZCOCBS65b5l82fPhVgQ5j8Ig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ka8mU0zmAxKLwL2fFpD9CSalT3tGxn8R2vJaJEvx62sO5knzmnr8o+jvl3A4PXUYQ
	 Dxf4yVxdNUJRaSMFUbZXUszVhxd0knfdDWS6zjzIFpMB5n4bUVioUR8MiiThYK+RXG
	 oLntR6Y938oN1l2HEEGZwVORgG5aTsGwv/MxrYlWW+xz+HzsxFHbe8bsiksmJN+Eeg
	 st24vgn2YKrHIvg0UlZHV1ThyeHHuIY6Xm64crEiMYg8cxKwttwDLZNXlk3pCT3Gzq
	 wy9AdFSWAhMox5u4djhZqr3O3sxbk/vCdfLhvYIRh52/cce/Q/j73nK2lIrQ1r3h0O
	 ape4Kv2DAzHkg==
Date: Tue, 3 Nov 2026 15:09:07 +0000
From: Lee Jones <lee@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v11 4/9] mfd: mt6397: Use MFD_CELL_* to describe
 sub-devices
Message-ID: <179310028255.2808517.13933580516140278450@kernel.org>
References: <20261021105109.199886-1-l.scorcia@gmail.com>
 <20261021105109.199886-5-l.scorcia@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021105109.199886-5-l.scorcia@gmail.com>
X-AI-Review-Draft: <20261021105109.199886-5-l.scorcia@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 21 Oct 2026, Luca Leonardo Scorcia wrote:

> Use the MFD_CELL_* macros to describe sub-devices. No functional changes.
>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/mfd/mt6397-core.c | 207 ++++++++++++--------------------------
>  1 file changed, 67 insertions(+), 140 deletions(-)
>
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index 9ec951996588..3e08179002fa 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -124,165 +124,92 @@ static const struct resource mt6323_pwrc_resources[] = {
>  };
>
>  static const struct mfd_cell mt6323_devs[] = {
> -	{
> -		.name = "mt6323-auxadc",
> -		.of_compatible = "mediatek,mt6323-auxadc",
> -	}, {
> -		.name = "mt6323-efuse",
> -		.of_compatible = "mediatek,mt6323-efuse",
> -	}, {
> -		.name = "mt6323-rtc",
> -		.num_resources = ARRAY_SIZE(mt6323_rtc_resources),
> -		.resources = mt6323_rtc_resources,
> -		.of_compatible = "mediatek,mt6323-rtc",
> -	}, {
> -		.name = "mt6323-regulator",
> -		.of_compatible = "mediatek,mt6323-regulator"
> -	}, {
> -		.name = "mt6323-led",
> -		.of_compatible = "mediatek,mt6323-led"
> -	}, {
> -		.name = "mt6323-keys",
> -		.num_resources = ARRAY_SIZE(mt6323_keys_resources),
> -		.resources = mt6323_keys_resources,
> -		.of_compatible = "mediatek,mt6323-keys"
> -	}, {
> -		.name = "mt6323-pwrc",
> -		.num_resources = ARRAY_SIZE(mt6323_pwrc_resources),
> -		.resources = mt6323_pwrc_resources,
> -		.of_compatible = "mediatek,mt6323-pwrc"
> -	},
> +	MFD_CELL_OF("mt6323-auxadc", NULL, NULL, 0, 0,
> +		    "mediatek,mt6323-auxadc"),
> +	MFD_CELL_OF("mt6323-efuse", NULL, NULL, 0, 0,
> +		    "mediatek,mt6323-efuse"),
> +	MFD_CELL_OF("mt6323-rtc", mt6323_rtc_resources, NULL, 0, 0,
> +		    "mediatek,mt6323-rtc"),
> +	MFD_CELL_OF("mt6323-regulator", NULL, NULL, 0, 0,
> +		    "mediatek,mt6323-regulator"),
> +	MFD_CELL_OF("mt6323-led", NULL, NULL, 0, 0,
> +		    "mediatek,mt6323-led"),
> +	MFD_CELL_OF("mt6323-keys", mt6323_keys_resources, NULL, 0, 0,
> +		    "mediatek,mt6323-keys"),
> +	MFD_CELL_OF("mt6323-pwrc", mt6323_pwrc_resources, NULL, 0, 0,

Nit: This is non-blocking, but if you have to respin, please use the
100-char limit to keep these on single lines where possible. Same for
all the others below.

> +		    "mediatek,mt6323-pwrc"),
>  };
>
>  static const struct mfd_cell mt6328_devs[] = {
> -	{
> -		.name = "mt6328-regulator",
> -		.of_compatible = "mediatek,mt6328-regulator"
> -	}, {
> -		.name = "mt6328-keys",
> -		.num_resources = ARRAY_SIZE(mt6328_keys_resources),
> -		.resources = mt6328_keys_resources,
> -		.of_compatible = "mediatek,mt6328-keys"
> -	},
> +	MFD_CELL_OF("mt6328-regulator", NULL, NULL, 0, 0,
> +		    "mediatek,mt6328-regulator"),
> +	MFD_CELL_OF("mt6328-keys", mt6328_keys_resources, NULL, 0, 0,
> +		    "mediatek,mt6328-keys"),
>  };
>
>  static const struct mfd_cell mt6357_devs[] = {
> -	{
> -		.name = "mt6359-auxadc",
> -		.of_compatible = "mediatek,mt6357-auxadc"
> -	}, {
> -		.name = "mt6357-regulator",
> -	}, {
> -		.name = "mt6357-rtc",
> -		.num_resources = ARRAY_SIZE(mt6357_rtc_resources),
> -		.resources = mt6357_rtc_resources,
> -		.of_compatible = "mediatek,mt6357-rtc",
> -	}, {
> -		.name = "mt6357-sound",
> -		.of_compatible = "mediatek,mt6357-sound"
> -	}, {
> -		.name = "mt6357-keys",
> -		.num_resources = ARRAY_SIZE(mt6357_keys_resources),
> -		.resources = mt6357_keys_resources,
> -		.of_compatible = "mediatek,mt6357-keys"
> -	},
> +	MFD_CELL_OF("mt6359-auxadc", NULL, NULL, 0, 0,
> +		    "mediatek,mt6357-auxadc"),
> +	MFD_CELL_NAME("mt6357-regulator"),
> +	MFD_CELL_OF("mt6357-rtc", mt6357_rtc_resources, NULL, 0, 0,
> +		    "mediatek,mt6357-rtc"),
> +	MFD_CELL_OF("mt6357-sound", NULL, NULL, 0, 0,
> +		    "mediatek,mt6357-sound"),
> +	MFD_CELL_OF("mt6357-keys", mt6357_keys_resources, NULL, 0, 0,
> +		    "mediatek,mt6357-keys"),
>  };
>
>  /* MT6331 is always used in combination with MT6332 */
>  static const struct mfd_cell mt6331_mt6332_devs[] = {
> -	{
> -		.name = "mt6331-rtc",
> -		.num_resources = ARRAY_SIZE(mt6331_rtc_resources),
> -		.resources = mt6331_rtc_resources,
> -		.of_compatible = "mediatek,mt6331-rtc",
> -	}, {
> -		.name = "mt6331-regulator",
> -		.of_compatible = "mediatek,mt6331-regulator"
> -	}, {
> -		.name = "mt6332-regulator",
> -		.of_compatible = "mediatek,mt6332-regulator"
> -	}, {
> -		.name = "mt6331-keys",
> -		.num_resources = ARRAY_SIZE(mt6331_keys_resources),
> -		.resources = mt6331_keys_resources,
> -		.of_compatible = "mediatek,mt6331-keys"
> -	},
> +	MFD_CELL_OF("mt6331-rtc", mt6331_rtc_resources, NULL, 0, 0,
> +		    "mediatek,mt6331-rtc"),
> +	MFD_CELL_OF("mt6331-regulator", NULL, NULL, 0, 0,
> +		    "mediatek,mt6331-regulator"),
> +	MFD_CELL_OF("mt6332-regulator", NULL, NULL, 0, 0,
> +		    "mediatek,mt6332-regulator"),
> +	MFD_CELL_OF("mt6331-keys", mt6331_keys_resources, NULL, 0, 0,
> +		    "mediatek,mt6331-keys"),
>  };
>
>  static const struct mfd_cell mt6358_devs[] = {
> -	{
> -		.name = "mt6359-auxadc",
> -		.of_compatible = "mediatek,mt6358-auxadc"
> -	}, {
> -		.name = "mt6358-regulator",
> -		.of_compatible = "mediatek,mt6358-regulator"
> -	}, {
> -		.name = "mt6358-rtc",
> -		.num_resources = ARRAY_SIZE(mt6358_rtc_resources),
> -		.resources = mt6358_rtc_resources,
> -		.of_compatible = "mediatek,mt6358-rtc",
> -	}, {
> -		.name = "mt6358-sound",
> -		.of_compatible = "mediatek,mt6358-sound"
> -	}, {
> -		.name = "mt6358-keys",
> -		.num_resources = ARRAY_SIZE(mt6358_keys_resources),
> -		.resources = mt6358_keys_resources,
> -		.of_compatible = "mediatek,mt6358-keys"
> -	},
> +	MFD_CELL_OF("mt6359-auxadc", NULL, NULL, 0, 0,
> +		    "mediatek,mt6358-auxadc"),
> +	MFD_CELL_OF("mt6358-regulator", NULL, NULL, 0, 0,
> +		    "mediatek,mt6358-regulator"),
> +	MFD_CELL_OF("mt6358-rtc", mt6358_rtc_resources, NULL, 0, 0,
> +		    "mediatek,mt6358-rtc"),
> +	MFD_CELL_OF("mt6358-sound", NULL, NULL, 0, 0,
> +		    "mediatek,mt6358-sound"),
> +	MFD_CELL_OF("mt6358-keys", mt6358_keys_resources, NULL, 0, 0,
> +		    "mediatek,mt6358-keys"),
>  };
>
>  static const struct mfd_cell mt6359_devs[] = {
> -	{
> -		.name = "mt6359-auxadc",
> -		.of_compatible = "mediatek,mt6359-auxadc"
> -	},
> -	{ .name = "mt6359-regulator", },
> -	{
> -		.name = "mt6359-rtc",
> -		.num_resources = ARRAY_SIZE(mt6358_rtc_resources),
> -		.resources = mt6358_rtc_resources,
> -		.of_compatible = "mediatek,mt6358-rtc",
> -	},
> -	{ .name = "mt6359-sound", },
> -	{
> -		.name = "mt6359-keys",
> -		.num_resources = ARRAY_SIZE(mt6359_keys_resources),
> -		.resources = mt6359_keys_resources,
> -		.of_compatible = "mediatek,mt6359-keys"
> -	},
> -	{
> -		.name = "mt6359-accdet",
> -		.of_compatible = "mediatek,mt6359-accdet",
> -		.num_resources = ARRAY_SIZE(mt6359_accdet_resources),
> -		.resources = mt6359_accdet_resources,
> -	},
> +	MFD_CELL_OF("mt6359-auxadc", NULL, NULL, 0, 0,
> +		    "mediatek,mt6359-auxadc"),
> +	MFD_CELL_NAME("mt6359-regulator"),
> +	MFD_CELL_OF("mt6359-rtc", mt6358_rtc_resources, NULL, 0, 0,
> +		    "mediatek,mt6358-rtc"),
> +	MFD_CELL_NAME("mt6359-sound"),
> +	MFD_CELL_OF("mt6359-keys", mt6359_keys_resources, NULL, 0, 0,
> +		    "mediatek,mt6359-keys"),
> +	MFD_CELL_OF("mt6359-accdet", mt6359_accdet_resources, NULL, 0, 0,
> +		    "mediatek,mt6359-accdet"),
>  };
>
>  static const struct mfd_cell mt6397_devs[] = {
> -	{
> -		.name = "mt6397-rtc",
> -		.num_resources = ARRAY_SIZE(mt6397_rtc_resources),
> -		.resources = mt6397_rtc_resources,
> -		.of_compatible = "mediatek,mt6397-rtc",
> -	}, {
> -		.name = "mt6397-regulator",
> -		.of_compatible = "mediatek,mt6397-regulator",
> -	}, {
> -		.name = "mt6397-codec",
> -		.of_compatible = "mediatek,mt6397-codec",
> -	}, {
> -		.name = "mt6397-clk",
> -		.of_compatible = "mediatek,mt6397-clk",
> -	}, {
> -		.name = "mt6397-pinctrl",
> -		.of_compatible = "mediatek,mt6397-pinctrl",
> -	}, {
> -		.name = "mt6397-keys",
> -		.num_resources = ARRAY_SIZE(mt6397_keys_resources),
> -		.resources = mt6397_keys_resources,
> -		.of_compatible = "mediatek,mt6397-keys"
> -	}
> +	MFD_CELL_OF("mt6397-rtc", mt6397_rtc_resources, NULL, 0, 0,
> +		    "mediatek,mt6397-rtc"),
> +	MFD_CELL_OF("mt6397-regulator", NULL, NULL, 0, 0,
> +		    "mediatek,mt6397-regulator"),
> +	MFD_CELL_OF("mt6397-codec", NULL, NULL, 0, 0,
> +		    "mediatek,mt6397-codec"),
> +	MFD_CELL_OF("mt6397-clk", NULL, NULL, 0, 0,
> +		    "mediatek,mt6397-clk"),
> +	MFD_CELL_OF("mt6397-pinctrl", NULL, NULL, 0, 0,
> +		    "mediatek,mt6397-pinctrl"),
> +	MFD_CELL_OF("mt6397-keys", mt6397_keys_resources, NULL, 0, 0,
> +		    "mediatek,mt6397-keys"),
>  };
>
>  struct chip_data {
> -- 
> 2.43.0
>

-- 
Lee Jones

