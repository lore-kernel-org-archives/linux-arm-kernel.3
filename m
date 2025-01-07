Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7772E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 10:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0snWdHDwer8Q7HICGIujVxvtp8NgPbDkvlKPXjwUr+Q=; b=Do+AXKf387f4eQ5dgv9FwdckuY
	Ijk57LriT41JB1pIy9hIqg84zCUjno8LoUKupBfsA/qDuXzi7iUVhjptux9CANwTYUAb5zaZAxch2
	qLcANBj1Tf2BbTcrAHs3R6bHQlL0lvD2JdIcRGUI+PTRnfmaYifOlhwyW1j3yjBptt2Ye5CLo1Jy0
	pUWUJu48fDqoIYu2YEwfqT9E09BOs68VWtz+ctZNDk6LTc1k72wZHHkC8xYIfMkRjOz8YJrRyrumV
	ilYbTvjPGljHBrGvZyxnKxN3Z5a6IH4WbTPSbJlXz0fEowh8s1K+4xkRLJXSmqo5EErhZlNEULT/G
	rYV7iWwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6pM-00000004Lc0-13oZ;
	Tue, 07 Jan 2025 10:28:48 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6UY-00000004GdS-3Lae
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 10:07:24 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DAEF6675;
	Tue,  7 Jan 2025 11:06:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736244384;
	bh=yDZqAaJ6tTqJ5WB2IdGR/NNDcObNkuXn8z62tq8KHWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nzFenzmLO0QhV30CV4bZymvJf4wGW3VZOyUYl0kFLqUMGsSv64cBCB2Ir9xm61Z6n
	 +ZnnBrUKt9JX7dkYpDDZlyvVxE/mEWKz3hC8CM4+OgyxH0h+pkLElWT9BA8Ll8yTkW
	 RFswXKo7UiQ5kcqyjvmmauo4uShA/DcKUaSttO0s=
Date: Tue, 7 Jan 2025 12:07:13 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Inki Dae <inki.dae@samsung.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] dt-bindings: samsung,mipi-dsim: Add imx7d specific
 compatible
Message-ID: <20250107100713.GD23309@pendragon.ideasonboard.com>
References: <20250107094943.518474-1-alexander.stein@ew.tq-group.com>
 <20250107094943.518474-3-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250107094943.518474-3-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_020718_970322_54CBD332 
X-CRM114-Status: GOOD (  16.61  )
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

Hi Alexander,

Thank you for the patch.

On Tue, Jan 07, 2025 at 10:49:42AM +0100, Alexander Stein wrote:
> This add a imx7(d) specific compatible which is compatible to imx8mm.
> This silences the dtbs_check warning:
> arch/arm/boot/dts/nxp/imx/imx7s-mba7.dtb: dsi@30760000: compatible: 'oneOf' conditional failed, one must be fixed:
>  ['fsl,imx7d-mipi-dsim', 'fsl,imx8mm-mipi-dsim'] is too long
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> index 4ed7a799ba26b..e43fec5609417 100644
> --- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> @@ -27,7 +27,9 @@ properties:
>            - fsl,imx8mm-mipi-dsim
>            - fsl,imx8mp-mipi-dsim
>        - items:
> -          - const: fsl,imx8mn-mipi-dsim
> +          - enum:
> +              - fsl,imx7d-mipi-dsim
> +              - fsl,imx8mn-mipi-dsim
>            - const: fsl,imx8mm-mipi-dsim
>  
>    reg:

-- 
Regards,

Laurent Pinchart

