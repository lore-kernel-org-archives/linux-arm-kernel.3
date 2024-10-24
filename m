Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B15ED0BB6A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 07:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NmQatCFF0Cmmv+loMBW6k36p02qu5kMzjwwsFbjx5+o=; b=s8QNMYbLtq4w/F3ZOq0+yOL1j9
	y7dI5xy7ybnQSFg9Se/EmWCOb/epvq0y7WqDVjLRehoSKJGoQ9lHsFfP0P2sQYoCtNLcoV9D2UTwy
	sMv952ps3Nww7fwwYb/xw4zonmhChr2FxvWx3GaZCStCqKulew13cvzpNJ6i1SQbq1SxCsLh8b8Hr
	kUgSEF3cF89cub0NCKw8tT0EN9II2F2n5sN2CDM6gK7GqKPE4TwHwe3mVefAZ9MkIgV/0lu3HG/UP
	U7zinD4h71zoX4wYggc2dUngZ9g3Bs//Uw89dD0FHg5hefW/Po80fW94axbSFLlcF1543s690SPEj
	7krGBqqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3s7i-0000000H4FA-1FM2;
	Thu, 24 Oct 2024 07:19:10 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3s4e-0000000H3mS-32O3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 07:16:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 84F9DA45185;
	Thu, 24 Oct 2024 07:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D103CC4CECC;
	Thu, 24 Oct 2024 07:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729754159;
	bh=LtkRyFa+ptwpI3BjcDqChmf25+0CofX0xNDvVdF3tjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e21QQXKbd//X8OwJs3bVISaxQiWtu3fneFc3BZayNh/BwxO89zUaGZauxCeoJ5kao
	 UbI4PvEouuSFfPGfZISFvMCLF0ryd0boaYZp0yfXDsWsg3KSaV8Qr3phweel8nE9En
	 GYpqdARDfy3VXLRQRACLv4Rbc1f8Luk6TiG1DlgOQrpLQ4OZUZ9GMnQR/vYXWzD0fz
	 gyRNFNfwLyHayyBlY6I5XAeFFhhXl7k3GvPmGQiyj93xhLEPKdETZL1WQvsHl8URJg
	 9LY4wIQ3Ibz2IzUkJlf2vEsT+rJiAOukekGxobroD7ehkBs1KrothEAKQGQ3rLXKHD
	 X02d11SX0X52w==
Date: Thu, 24 Oct 2024 09:15:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Chris Morgan <macroalpha82@gmail.com>, Philippe Simons <simons.philippe@gmail.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 2/7] dt-bindings: allwinner: add H616 sun4i audio
 codec binding
Message-ID: <6sj56amrx3dtnznafzsycgq6r6do65uq3z3v3pwbcgwdktqqgo@qbrfpmx22b4s>
References: <20241023075917.186835-1-ryan@testtoast.com>
 <20241023075917.186835-3-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241023075917.186835-3-ryan@testtoast.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_001600_859074_5F01BA80 
X-CRM114-Status: GOOD (  20.30  )
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

On Wed, Oct 23, 2024 at 08:56:58PM +1300, Ryan Walklin wrote:
> The H616 has an audio codec compatible with the sun4i-a10 driver.
> 
> The codec is relatively cut down compared to some of the other Allwinner
> SoCs and only has a single line-out route (relying on a separate digital
> microphone IP block for input). HDMI and SPDIF audio are handled
> separately by an audio hub IP block, which is not currently implemented
> in mainline kernels. This requires some additional flexibility in the
> DMA bindings.
> 
> Add compatible string and routing for the H616 audio codec, and update
> the required DMA descriptions.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> 
> ---
> Changelog v1..v2:
> - Remove PLL_AUDIO_4X clock from definition (defined internally but
>   not used by driver and so not required in DTSI)
> - Restrict TX-only DMA definition to H616
> 
> Changelog v2..v3:
> 
> - Fix missing - in H616 conditional binding reported by dt_binding_check.
> ---
>  .../sound/allwinner,sun4i-a10-codec.yaml      | 53 ++++++++++++++++---
>  1 file changed, 47 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
> index 78273647f7665..ebc9097f936ad 100644
> --- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
> +++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
> @@ -22,6 +22,7 @@ properties:
>        - allwinner,sun8i-a23-codec
>        - allwinner,sun8i-h3-codec
>        - allwinner,sun8i-v3s-codec
> +      - allwinner,sun50i-h616-codec

Are you keeping preferred ordering of entries? Usually it is
alphanumerical, but you introduce now by model number.

>  
>    reg:
>      maxItems: 1
> @@ -40,14 +41,20 @@ properties:
>        - const: codec

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


