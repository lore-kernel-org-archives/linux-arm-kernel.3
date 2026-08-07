Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006DFC5AD2B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 22:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rMkepXodHcjAHv4k3kbfASgmHhaapX67FkS7mzBnl8g=; b=HoIUcllP53Lp8BIexsgAuQk681
	OsIkaoibzterGW7g4POOoQu4ta2nlr1Wqq/7YoRXuc1CucPnAklgQ9lenUKF1vEdWhezBbMRwKmNm
	N/7ny+CgY3ElQ2SUTdJ6jZApHpbL4TQOsL8QsSu5Id82XQbFedReyyUrIdaTGaPD8NVACccckPIko
	KoGfbLyTLIIo8VuDt1i9gRGky9MO3TnYbOLXG77q5FpbJsvGFxKeXO7i2nJx0LSxyEgfpjU2U/oj7
	sEW5h6/EjMw0evGi0H2M/KPnZVlY5Tj/iFQ3Vou0ukHcJeb7Q/ZzghyhW3kFPQQ5QjzHDRl1URS/h
	DK8rxlYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsT6C-00000008oha-28PE;
	Fri, 07 Aug 2026 22:31:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsT6B-00000008ohN-2Ghx;
	Fri, 07 Aug 2026 22:31:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D943E41B02;
	Fri,  7 Aug 2026 22:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C7E1F000E9;
	Fri,  7 Aug 2026 22:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786141890;
	bh=rMkepXodHcjAHv4k3kbfASgmHhaapX67FkS7mzBnl8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QI+TQ0g2XiM91hMCmbqBLOuz5d62beq2cXgCahE6l3Xg2tJozP0wTTWLGBb5AsyhB
	 Wet35EPPofdYWtnrnexJYL5+eUn1Ma4lcpUWRzy+2yXEohPltSyzwpMZzXE9RDyOih
	 h+ol+8tq0T+CV7qFz81POsJcicjvyeJIi29PBVD1dcUDLwK3EyXsyX/Vve3o8Fnx3X
	 C+ylr+EESJeJnHNDqh6XDVdzv/OwbQXaclqt2PDM7mGgVZ8b1wiZMk1Nmu5icUg1MG
	 IcwULv+ahLRIoPj7YG1baa8RyP2CZkIQpOj/YQiiwYY0/lGnpF3kxcq9HUYMI7Kwcl
	 +AfXq2tYrsbUQ==
Date: Fri, 7 Aug 2026 17:31:29 -0500
From: Rob Herring <robh@kernel.org>
To: Rok Markovic <rok@kanardia.eu>
Cc: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alibek Omarov <a1ba.omarov@gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: display: rockchip,lvds: add RK3568
Message-ID: <20260807223129.GA2151152-robh@kernel.org>
References: <20260724080824.115260-1-rok@kanardia.eu>
 <20260724080824.115260-3-rok@kanardia.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724080824.115260-3-rok@kanardia.eu>
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

On Fri, Jul 24, 2026 at 10:08:22AM +0200, Rok Markovic wrote:
> The RK3568 LVDS transmitter has no register block of its own: it is
> programmed entirely through the GRF and re-uses the MIPI DSI0 D-PHY
> (rockchip,rk3568-dsi-dphy) in LVDS mode. It therefore takes the same
> shape as px30: phys/phy-names, no reg, and no clock of its own.
> 
> Since the block exposes no MMIO, nothing in the LVDS path is clocked
> from the DSI controller's APB clock; that gate is held off while LVDS
> scans out. It has no analog supplies of its own and no pinctrl either:
> the lanes are dedicated D-PHY pins, not muxable GPIOs.
> 
> Signed-off-by: Rok Markovic <rok@kanardia.eu>
> Assisted-by: Claude:claude-opus-4-8
> ---
> Changes in v2:
>   - RK3568 now takes no clock (clocks/clock-names disabled, as for
>     px30): the block has no register space, so nothing consumes the
>     DSI controller's APB clock.
> 
>  .../display/rockchip/rockchip,lvds.yaml       | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,lvds.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,lvds.yaml
> index 03b002a..b77d4fa 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,lvds.yaml
> @@ -15,6 +15,7 @@ properties:
>      enum:
>        - rockchip,px30-lvds
>        - rockchip,rk3288-lvds
> +      - rockchip,rk3568-lvds
>  
>    reg:
>      maxItems: 1
> @@ -121,6 +122,27 @@ allOf:
>          - avdd1v8-supply
>          - avdd3v3-supply
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3568-lvds
> +
> +    then:
> +      properties:
> +        reg: false
> +        clocks: false
> +        clock-names: false
> +        avdd1v0-supply: false
> +        avdd1v8-supply: false
> +        avdd3v3-supply: false
> +        pinctrl-names: false
> +        pinctrl-0: false

Other than pinctrl props, this is the same as the existing px30 if/then 
schema, so just add the compatible there. pinctrl properties are 
implicitly always allowed.

Really, I think this and px30 and this should be its own schema. There's 
not a lot of common parts.

Finally, if the only interface is the GRF, then this should be a child 
of the GRF node.

Rob

