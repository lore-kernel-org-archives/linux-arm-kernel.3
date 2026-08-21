Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F4EC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 07:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUdIZCjzGdQCUoVnSmJ5ekBkqW8+FEP5GNixuQZzy7A=; b=3ldJAxezboXbTKFcVjqH+aSzIe
	gSvzxe02lChETW7c6YTRqiAPWvgA9E+jxWYk4YwJLtKG07b8IyVJ8T7xEMBQVakUjENwUGqV2j4KK
	SxyggXCtaJeyIYv/q81DwzHGpU/3hmWxONCG1HblUZQI7zzESc969txefcMLqqrfNexkCgmL24YDT
	ZezBvRjKunn6GJ+ig3kIMydgX9oCbFfuxQ+X/Z2Oizti9HnaYfeBvCCfq7deUI3GHDyyg7JyndXmK
	XYJ0vW35hjhaucKuN9pCHVhTi8H/NER+E+dU+Y+ed0rdm8xK6WHBQGMoo7o9WPMn2wyLF/MtwdTb+
	Emrqp8Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJef-0000000ChTE-2lzA;
	Fri, 21 Aug 2026 07:27:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJed-0000000ChSx-0u6d;
	Fri, 21 Aug 2026 07:27:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2687060A7E;
	Fri, 21 Aug 2026 07:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D60B11F000E9;
	Fri, 21 Aug 2026 07:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787297225;
	bh=yUdIZCjzGdQCUoVnSmJ5ekBkqW8+FEP5GNixuQZzy7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eWVtrVHsQR9xJOfNnb79lgmzA0sUhKpRNHGY2f51sjp4udKyWjKXlkTW6M4yD784i
	 4fzySkyox3pzR3qkj09hvX/UMSGfaQhO+NnLtFYuYj2biw/YiXqtJ16LxxAYumygx1
	 oQxziV5j0xAu5d6vXYCiIt0aE93BY6yMNjFPmnY93XRyO45otuwH/rZSipA4jUqdF0
	 /xNQBbpMutPguzUXjU6b/gA3kHFQ8VhlKIU7ir+3kE+YRMCfNn4t2xGYnEruQLmkRX
	 bNHVw4LKQNwWbWjEJXAcAFc/ZKfoFQIhaZbOVfPGV/ohRvserZFOreUY6H85vqH2w+
	 0IxoniNoLH2tw==
Date: Fri, 21 Aug 2026 09:27:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vladislav Leonov <vlad@zlab.su>
Cc: Jonathan Cameron <jic23@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Andy Shevchenko <andy@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Rob Herring <robh@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Simon Glass <sjg@chromium.org>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: iio: adc: rockchip-saradc: Fix RV1106
 compatible
Message-ID: <20260821-bouncy-sticky-dalmatian-4f72c2@quoll>
References: <20260816113636.33635-1-vlad@zlab.su>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260816113636.33635-1-vlad@zlab.su>
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

On Sun, Aug 16, 2026 at 02:36:36PM +0300, Vladislav Leonov wrote:
> rockchip,rv1106-saradc was folded into the fallback enum together
> with rockchip,rk3576-saradc, falling back to rockchip,rk3588-saradc.
> The two IP blocks are not equivalent, though: per the RV1106 TRM v0.3,
> chapter 20 (SAR-ADC), RV1106 only has 2 channels at 10-bit resolution,
> versus 8 channels at 12-bit on RK3588. Documenting it as falling back
> to rk3588-saradc allows device trees that would bind against the wrong
> channel table and report an incorrect voltage scale.
> 
> Remove rockchip,rv1106-saradc from the RK3588 fallback enum and give
> it its own standalone compatible entry, matching the dedicated match
> table entry added by the driver patch.
> 
> Fixes: bdba14f6122c ("dt-bindings: iio: adc: rockchip-saradc: Add RV1106 compatible")
> Link: https://lore.kernel.org/all/20260810090826.146758-1-vlad@zlab.su
> Signed-off-by: Vladislav Leonov <vlad@zlab.su>
> ---
>  .../devicetree/bindings/iio/adc/rockchip-saradc.yaml         | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
> index f0551d665916..dc56855527b8 100644
> --- a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
> @@ -22,9 +22,7 @@ properties:
>        - const: rockchip,rk3562-saradc
>        - const: rockchip,rk3588-saradc
>        - items:
> -          - enum:
> -              - rockchip,rk3576-saradc
> -              - rockchip,rv1106-saradc
> +          - const: rockchip,rk3576-saradc
>            - const: rockchip,rk3588-saradc
>        - items:
>            - enum:
> @@ -35,6 +33,7 @@ properties:
>                - rockchip,rv1108-saradc
>                - rockchip,rv1126-saradc
>            - const: rockchip,rk3399-saradc
> +      - const: rockchip,rv1106-saradc

So this goes to an enum with all the other single-entries.

Anyway, where is a driver binding to above compatible (see DT submitting
patches). git grep on a week old next gave me nothing.

Best regards,
Krzysztof


