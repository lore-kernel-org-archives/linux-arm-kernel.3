Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DFFC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 02:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8o+3awIb8vPK4YsxA02n0PlQRtaXr9ob49IQPz4fhu8=; b=cmBpvuOMOiN1+h2fiLjT0pS2w0
	EaZ7ntPCFKSd95v0sNiLHHyGSaVWJcQublDRwW+fWuuVwm8nlxTUI9szH/XL0rsnQCwXKagr5EsgS
	xxPCgRHyjWyJbaZ9e+ByMQCa0uCLGP03HL2ytjKQKJu2YxWgi1RQRLnMmnl1e8g9/RzeP0FsC3r2R
	QVzY6IUyeXsm4Jc7t3GTtKoo6vf+GXleUqifU/6fHdIBUxE8b+QuNeOPUqsVYo5G99/9RpF10ecWT
	mP7EVRR8whRWJx0JiZGO+ybjMkfl94SF//+vk90no911WX1ZOcSjsy9PktMLVzolc5l8Grit1xdFD
	X7g+cdvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtyIL-0000000FF3A-2jE4;
	Wed, 12 Aug 2026 02:02:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtyHw-0000000FEqh-2fTD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 02:01:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B48A400DC;
	Wed, 12 Aug 2026 02:01:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1731F000E9;
	Wed, 12 Aug 2026 02:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786500109;
	bh=8o+3awIb8vPK4YsxA02n0PlQRtaXr9ob49IQPz4fhu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Um5xyhFzti7Ii9ra7/q9+bb+A966CsiQId/BnnMXMYhKqrc+xw9JnHRqLeE/hsZrN
	 GMrZM8KUu8QMecR5G/mDIFM6ff6Fd8ZbcVskaNczH39vASZCLmASLwy0QgO0F7IZcg
	 9369YgFRD5nPoErCEwoy7SFXN2s+L0QlExycrmvobCNCW2522hipu/yP8f7sv1Rr8x
	 kD7iEqy4ZbiFRTDrKqWy/7MwLzg8xP3sUUlEujgQLpIt+uuANXDSaSAJJ5SjPkupZi
	 2rT6qpal31wE5BF/TiXtBnkFqYUw3zBn1ss3S6a30IO5dfuO8X7zD0WhjnFxmd3jpB
	 a47JJ1Q7KiEUg==
Date: Tue, 11 Aug 2026 21:01:48 -0500
From: Rob Herring <robh@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: dt-bindings: sun6i: Add compatibles for A733's SPI
 controllers
Message-ID: <20260812020148.GA515168-robh@kernel.org>
References: <20260805-allwinner-a733-spi-support-v1-1-7bfd1141ebc9@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805-allwinner-a733-spi-support-v1-1-7bfd1141ebc9@baylibre.com>
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

On Wed, Aug 05, 2026 at 03:53:26PM +0200, Jerome Brunet wrote:
> The A733 has six SPI controllers with the same IP as the A523.
> Like the A523, one of them (spi1) also supports DBI mode.
> 
> Add SoC specific compatible strings, falling back to the A523 ones.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> index 6af4ff233158..be47c6e00409 100644
> --- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> @@ -36,6 +36,13 @@ properties:
>        - items:
>            - const: allwinner,sun55i-a523-spi-dbi
>            - const: allwinner,sun55i-a523-spi
> +      - items:
> +          - const: allwinner,sun60i-a733-spi

Combine this with the one above.

> +          - const: allwinner,sun55i-a523-spi
> +      - items:
> +          - const: allwinner,sun60i-a733-spi-dbi
> +          - const: allwinner,sun55i-a523-spi-dbi
> +          - const: allwinner,sun55i-a523-spi
>  
>    reg:
>      maxItems: 1
> 
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260805-allwinner-a733-spi-support-e30a9ac057a3
> 
> Best regards,
> --  
> Jerome
> 

