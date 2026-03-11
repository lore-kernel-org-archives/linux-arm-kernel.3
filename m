Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7938F1062899
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 13:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIZG191APasILs1Y5M7WIm/3oR6nVEKFysavOb1UHB8=; b=mR+wh0NtXn48GlfX5E5dBBjWn4
	03c0/ZFtN/aKaIsDKVPlo4Grk72s3jKC+AphARLwzyy1S2weLprVbj6E2+JiJsFT/3UAdud+z2Gzp
	GC0LvR6beSoHBd56mrL1i0+q12PDB89bTetjzcz2MO/3rJzIZ5TNpuKZDCQc3szrXWi0U6dFWF6k9
	1w51uNSvW5Q8fdPWf+qG71b2RY2aB50A5NegJiIRKVdGvORWUbataTcYRI0IgejGHQF0vQgHBILhs
	lmx0ZEAd6xScrMP1El6DFQM/a8MnCQBmGgU2MtN9wWLYxgc9UUZy23VWoFIey9YYCW4ytL0Uz5Faz
	0DN084BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0JC2-0000000BbqC-2ruM;
	Wed, 11 Mar 2026 13:01:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0JC1-0000000BbpX-0YuS;
	Wed, 11 Mar 2026 13:01:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F1EB60122;
	Wed, 11 Mar 2026 13:01:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F67C19425;
	Wed, 11 Mar 2026 13:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773234099;
	bh=a0mm90LqBByU8JcPQHFkpu2cDYMi5t5OFUYWl2t0HkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ST66fgt7ntOC5LHkAIPMu8+1KnAUD76BPOoky9SpC47p9wwx6mGS0rTaJjr+ilYAd
	 cwEsxjJ5iFGzt+XX41jPOD7+O9zSKZN0cBPIIlqBqEfxKo+c8DYTD/f0WUcWaY5dVG
	 J+BQSvu+R2K0Cv/400wgamTZmSSgvQUCvxN3XfhV1tgeIjakMCuxhV32Q2JKaoyPOt
	 0HJv0Ym1e7nHk4mkOZgda9TT70dZ5UxAIAxTl84+O55Bje7WXBNgwqfZXTF9uPLB5E
	 wLCxp+uyhOzx+EJmtQ/CIi0OraUXUnLzc0Q5kD8HASwz2ffpZRJkosays2dfvnLWkH
	 M666zV4XpaoWA==
Date: Wed, 11 Mar 2026 14:01:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	nicolas.frattaroli@collabora.com, alchark@gmail.com, cristian.ciocaltea@collabora.com, 
	sebastian.reichel@collabora.com, kever.yang@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com, 
	luca.ceresoli@bootlin.com, dianders@chromium.org, m.szyprowski@samsung.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/4] dt-bindings: display: rockchip: analogix-dp: Add
 support for RK3576
Message-ID: <20260311-toucanet-of-imaginary-authority-c9f0db@quoll>
References: <20260310105307.309765-1-damon.ding@rock-chips.com>
 <20260310105307.309765-2-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310105307.309765-2-damon.ding@rock-chips.com>
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

On Tue, Mar 10, 2026 at 06:53:04PM +0800, Damon Ding wrote:
> The eDP TX controller on RK3576 is the same as that on RK3588.
> 
> The newly added clock 'hclk' is the video datapath clock.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../bindings/display/rockchip/rockchip,analogix-dp.yaml     | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> index d99b23b88cc5..4496a43881f9 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> @@ -15,6 +15,7 @@ properties:
>      enum:
>        - rockchip,rk3288-dp
>        - rockchip,rk3399-edp
> +      - rockchip,rk3576-edp
>        - rockchip,rk3588-edp
>  
>    clocks:
> @@ -26,7 +27,9 @@ properties:
>      items:
>        - const: dp
>        - const: pclk
> -      - const: grf
> +      - enum:
> +          - grf
> +          - hclk

And why it is not the same clock? Nothing in commit msg explains why
this clock input (not output!) is different.

Best regards,
Krzysztof


