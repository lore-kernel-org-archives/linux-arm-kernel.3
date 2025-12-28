Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01ACCD3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 10:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgfhrrFCEJ6q8elvpHXRghwp4fkafsuxD06v/o0woyM=; b=uJ2xdzcohkuiuUR/Z988N4jujE
	rJ6Y5Ri8TDtYCJqf/v5jYxjQ/aF+LNazMc0bvp4jKx1U995E8pYSJem5nlWQkLsyFE8aAay3pkjT6
	NO6IP4FbHut/hiQtaDQ9uVuSZA6WMjU/Szr0fPcmIc86hvPCqHtplS28IcIJX4w2ZHnuI/Gp/R5tk
	PmYRi9HV2BfkRaWdny8wSeUb/2EkEu7+qIdXHMlQsaAQam3F41MwgVLiWKszyrcG7MpnbKUnX/d/f
	m73zzJpTuilEAz4ZGrmNZT6KqlG3bh/b9KshxOr03WJ9HECOLmx1Ry2dhrjQ8ZQLTRX6UtEYRZRDb
	KCckFO8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZo9j-00000002dyG-2isY;
	Sun, 28 Dec 2025 10:37:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZo9g-00000002dwm-1Fsb;
	Sun, 28 Dec 2025 10:37:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CD4942DAC;
	Sun, 28 Dec 2025 10:37:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB159C4CEFB;
	Sun, 28 Dec 2025 10:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766918262;
	bh=IZT39N4Nv/NcZl793zfqFVhRqayBAaHRRDrNfXkU8Xc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T9iUW4t5Y9TMeGA02WBnFIlx3vNDP1da+gnKOnaQ9hdQzqrmmA0pAfpWC+ImDfPPq
	 Yg4Jtc5XjOVSTntp0+oZXBitOsOyLNsGxInImg3wvqrH8r7g08B6GQ37kP1B1hdDwo
	 E7/U+j6CKsUQnWTwBCkdkH3FgUaaYuPa5SCg3S67gACEVlE8DB8k/2dUr5D0Xrgiqq
	 iks++SF2JFOkyle9urQXg93ir1yshfblZrMtTbOMkIddqiohxvKbBLDdIZL3km+5r/
	 Y4CPj1I3xJzm5rYQY/NtJ4CB5ZVbp2tx9009nwlFqXdaIrWIt1FQRsbJGpD5VqvoF3
	 sX0qm4Lrap/1A==
Date: Sun, 28 Dec 2025 11:37:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tao.huang@rock-chips.com
Subject: Re: [PATCH v4 5/7] dt-bindings: pinctrl: rockchip: Add rk3506 rmio
 support
Message-ID: <20251228-olive-termite-of-painting-1bee5b@quoll>
References: <20251227114957.3287944-1-ye.zhang@rock-chips.com>
 <20251227114957.3287944-6-ye.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251227114957.3287944-6-ye.zhang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_023744_389018_F2E14A8F 
X-CRM114-Status: GOOD (  23.07  )
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

On Sat, Dec 27, 2025 at 07:49:55PM +0800, Ye Zhang wrote:
> The RK3506 SoC introduces a secondary block-level pinmux controller called
> RMIO (Rockchip Matrix I/O). When the primary IOMUX is selected to a
> specific function, the pin signal is routed to the RMIO block, where a
> secondary selection determines the final function.
> 
> This patch adds the necessary properties to support RMIO:
> - rockchip,rmio: phandle to the RMIO syscon node.
> - rockchip,rmio-pins: a matrix to configure the RMIO block.
> 
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
> ---
>  .../bindings/pinctrl/rockchip,pinctrl.yaml    | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> index 97960245676d..887bec22b172 100644
> --- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> @@ -66,6 +66,13 @@ properties:
>        Required for at least rk3188 and rk3288. On the rk3368 this should
>        point to the PMUGRF syscon.
>  
> +  rockchip,rmio:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle of the syscon node for the RMIO registers, used by
> +      some SoCs (e.g. rk3506) to configure the secondary block-level
> +      pinmux functions.
> +

You need to disallow it for other variants in if:then: block.

>    "#address-cells":
>      enum: [1, 2]
>  
> @@ -144,6 +151,23 @@ additionalProperties:
>                  The phandle of a node contains the generic pinconfig options
>                  to use as described in pinctrl-bindings.txt.
>  
> +      rockchip,rmio-pins:
> +        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +        minItems: 1
> +        items:
> +          items:
> +            - minimum: 0

That's redundant. 0 is already minimum.

> +              description: RMIO ID (Controller index)

Why do you need this? Is this pin controller having multiple RMIO IDs?
Nothing like that was expressed in previous DTS. No other IDs are
present in this DTS, either...

> +            - minimum: 0
> +              description: Pin index within the RMIO controller
> +            - minimum: 0
> +              description: Function Mux ID
> +        description:
> +          Configuration for the Rockchip Matrix I/O (RMIO) block. The format
> +          is <rmio_id pin_id function_id>. This acts as a secondary muxing
> +          layer when the primary 'rockchip,pins' mux is set to the RMIO
> +          function.
> +
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> -- 
> 2.34.1
> 

