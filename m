Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA5AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 10:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pylafSGUukz/4i8OoUfzyabnXGXIxcGDOPGtUmbKyoY=; b=Mt3MLaUUcSjx5xmGVkCJwmYe/x
	b2z4q60apY03Wfr/2ptrdeTWz9/hzgV0TkY0rbjTHQQuFhxY/kxgFMwmL0xWXMpVd6RJjggQVkRNY
	HlMqqDpBLmmLpL+q5alKAn2IC0n7y3IJay6HvdfLDrHa0njqc8m/PH8lr4DFonSeAmuLlgwS289he
	ZKjeyyGLD1Q8DMxmJVGHT31H8pyEyBU1jzFxKa+hhAtUepl33nAiKLVC45AJcUljOPXNwy2P93kiO
	2K2v7iAA5ySi7QEdBnLpghYfi4Dq7v2vfoVhHs+wWz4TPJw7eOrPBjeRZveUDqxbtAX468t7iwpBj
	yo83N5eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPmU-0000000GwEV-1Ez5;
	Wed, 08 Jul 2026 10:45:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPmS-0000000GwEH-1ysM;
	Wed, 08 Jul 2026 10:45:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D1D8740A09;
	Wed,  8 Jul 2026 10:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87EC91F000E9;
	Wed,  8 Jul 2026 10:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783507527;
	bh=pylafSGUukz/4i8OoUfzyabnXGXIxcGDOPGtUmbKyoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dUv/aaBr1uN7VfTdA/Mpn68vwcEgIyJQRX0FWY1Hnd1YVyT/5DgM++bpPB/Fkv3JB
	 PEPlD4SXsVhNA0i6/lGqsmoKFDanh5h9znke27buXLwcdmROjizFnqV1wqYVN1ZICD
	 BwxY5YI3FN/c9nHAhaUyB+OzEKjHfnBIDz87A/vsILfDMgCpsw0CaleU2f+90+lD/q
	 2iCWJA2L3hzpwsA/yAy0arwno6Q/qK+B70tp468gmrnv42UXwAQn5naVXsVQCNbvJ1
	 IKLBbq4f4/gyZSDLTRNxOe9+ez0EUCg29p2aEcca3r3V48rKnteNVExLD2xui3c41F
	 olINebbehNM9w==
Date: Wed, 8 Jul 2026 12:45:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, Fabio Estevam <festevam@nabladev.com>, 
	linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jonathan Cameron <jic23@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Rob Herring <robh@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/12] dt-bindings: iio: adc: rockchip-saradc: Add RV1106
 compatible
Message-ID: <20260708-intrepid-piquant-teal-26615d@quoll>
References: <20260706195818.3906949-1-sjg@chromium.org>
 <20260706195818.3906949-10-sjg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260706195818.3906949-10-sjg@chromium.org>
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

On Mon, Jul 06, 2026 at 01:58:05PM -0600, Simon Glass wrote:
> Add the compatible for the SARADC of the Rockchip RV1106, which is
> compatible with the RK3588 variant.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
>  Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
> index 6769d679c907..c3bb03dc4853 100644
> --- a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
> @@ -24,6 +24,9 @@ properties:
>        - items:
>            - const: rockchip,rk3576-saradc
>            - const: rockchip,rk3588-saradc
> +      - items:
> +          - const: rockchip,rv1106-saradc

Why can't this be an enum with 3576?

Best regards,
Krzysztof


