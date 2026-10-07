Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394A7CA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 21:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sh7OcP05sIODDer+3VldhG3V1dgjHWKL0MSwN6BBMfQ=; b=YxyAoKvRmMId2m9FV5+T70CPR8
	U3MhkBeD1WPH/FDctCgaQeUVJkNt+mgjLdDGV+wup0NaNmNnVDFBR6AZonGlFF+Bae/cx73RGXi3P
	lcL9yITXBmM4ac26Dt82u4n7lum3tiwgBLtEK6aZVk/dIKXTWtpHeKLkU+wPkVu1TllJc+8Bd17bz
	E4Zc9qFl1dnL4wt/lqWjZZH0Vem2CfMdOcdDflN30VexKIUfxseg1f/WATVjOt8JoLtTAnKNJK25f
	FbPIiyA0jJWtn8pOnTdgiDM3r02xJsRIWvuQwQmZkoCeHsy7kdCKuXtcxFTcirRaEztHakrcOAkik
	FvY0/IoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEZ02-00000003B5N-30GW;
	Wed, 07 Oct 2026 21:16:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEZ00-00000003B53-40B5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 21:16:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2418460A53;
	Wed,  7 Oct 2026 21:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D121F000FF;
	Wed,  7 Oct 2026 21:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791407787;
	bh=sh7OcP05sIODDer+3VldhG3V1dgjHWKL0MSwN6BBMfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NKzSOlHPEGa43U7ioH6nGfz0tcwBItsldEnne07IhXL/9ZDKkefYmZR6iM2KBohDN
	 G/cw/u2S4B9aEw1E+ad8XNFqDDsuA0VfUuhTYsd7jhFvmKhEHBj5hO2fSGbxhMFpA6
	 eX6AgdWp5RlcCOUFlrzQvQe5sYedWHBywKPXgsVBNqNXmZnkBnujsaqSrqMJDxswAt
	 FgVDhwKC0cOXSw+QXttsWVEg2AINRsEc6138Scs8oYwgSkJmsOmtsTLYyw0dyAvqz7
	 ecMrXuPsh3PpYXDz9niC7/MWqm/cUCBYBPD2Emcgbdq73SOdg1/JLyV29eij5cXysw
	 utzydwk3OOmuA==
Date: Wed, 7 Oct 2026 16:16:26 -0500
From: Rob Herring <robh@kernel.org>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 03/11] dt-bindings: pinctrl: sun4i-a10: add Allwinner
 B288
Message-ID: <20261007211626.GA338242-robh@kernel.org>
References: <20261005202731.153971-1-pmazzini@gmail.com>
 <20261005202731.153971-4-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005202731.153971-4-pmazzini@gmail.com>
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

On Mon, Oct 05, 2026 at 09:27:23PM +0100, Pablo Mazzini wrote:
> The B288 driver takes its mux values from the DT, so allwinner,pinmux
> becomes an allowed property here, required for this compatible only.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
>  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
> index 45b7a0b6c626..b1f093d218f5 100644
> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
> @@ -39,6 +39,7 @@ properties:
>        - allwinner,sun8i-a33-pinctrl
>        - allwinner,sun8i-a83t-pinctrl
>        - allwinner,sun8i-a83t-r-pinctrl
> +      - allwinner,sun8i-b288-pinctrl
>        - allwinner,sun8i-h3-pinctrl
>        - allwinner,sun8i-h3-r-pinctrl
>        - allwinner,sun8i-r40-pinctrl
> @@ -120,6 +121,15 @@ patternProperties:
>          $ref: /schemas/types.yaml#/definitions/uint32
>          enum: [10, 20, 30, 40]
>  
> +      allwinner,pinmux:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description:
> +          Pinmux selector value, for each pin. Only used by SoCs whose
> +          driver takes the mux values from the DT instead of an in-driver
> +          table. Almost every time this value is the same for all pins, so
> +          any array shorter than the number of pins will repeat the last
> +          value, to allow just specifying a single cell, for all cells.

Perhaps new platforms should move to the common 'pinmux' property?

Rob

