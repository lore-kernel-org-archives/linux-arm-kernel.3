Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C104C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 17:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLj4V6qZC8O8XI4Sgpit3DyRs1A98AgLx06IOzKHPlU=; b=zdnslgB4fDClz5PC5mbRPu3sWh
	2uQxP0CG9RwWp/TrIRDY1kk5BlnnpWJsp3y5tT3gEL6H4twAeHKVWsqQdRWdw3ImAC9lLnyJjnz8x
	WaRQg45hUS6E2HNBrC6TTpewrHs9vRzJn3hSXUPel5jZXOmeQs2Vsu+7zYtKxfq5vEEcwLVL8PJpI
	rv+rUCWc0eu11rV8lFdhgsEzlLYj1pEtVGRGKra722xCaitRhGLW82kZKwrYiimVPR7G0h8PuZfH0
	NNgTFMGQkdo0GC7iGFXWT39Hgm6YBgq8i+xLH0wlG0BomTFhQgj54Xc+eABZM41GAnj/jyj0KZXXu
	MAZn8Iig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI9QV-00000001htz-0FV4;
	Thu, 22 May 2025 17:09:51 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI9OT-00000001hgq-19LB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 17:07:46 +0000
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 55C8D8FA;
	Thu, 22 May 2025 19:07:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747933641;
	bh=xGm4gGN4zrT0UXQUtb8Q82nSx7dmZ58S0QFDxN4SRrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g8lItOQaLgm7Hr4+9r7MBGx6km1W6nU55kF0PGEVDDq7BS/91knDhvLOw3WmjQh0S
	 M7PAn4PuoXTBqct/GknMEqaTbt46Jb138ErEkgfghTcFGyf7j3K5VHNj9zHk4h9m1S
	 cMm+emLnjaWu0PwBwKc7K30tig8XFZN1ta+IW/sk=
Date: Thu, 22 May 2025 19:07:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: git@apitzsch.eu
Cc: Ricardo Ribalda <ribalda@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 4/5] media: dt-bindings: sony,imx214: Deprecate
 property clock-frequency
Message-ID: <20250522170736.GW12514@pendragon.ideasonboard.com>
References: <20250521-imx214_ccs_pll-v3-0-bfb4a2b53d14@apitzsch.eu>
 <20250521-imx214_ccs_pll-v3-4-bfb4a2b53d14@apitzsch.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250521-imx214_ccs_pll-v3-4-bfb4a2b53d14@apitzsch.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_100745_448294_2A1FE424 
X-CRM114-Status: GOOD (  15.76  )
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

Hi André,

Thank you for the patch.

On Wed, May 21, 2025 at 09:34:27PM +0200, André Apitzsch via B4 Relay wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> Deprecate the clock-frequency property in favor of assigned-clock-rates.
> 
> While at it, re-order properties according to coding style and fix the
> link-frequency in the example.  See commit acc294519f17 ("media: i2c:
> imx214: Fix link frequency validation").
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../devicetree/bindings/media/i2c/sony,imx214.yaml | 29 ++++++++++++----------
>  1 file changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
> index 0162eec8ca993a7614d29908f89fa9fe6d4b545d..aea99ebf8e9ed15f8066841228d9fdecc822b553 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
> @@ -33,20 +33,21 @@ properties:
>  
>    clock-frequency:
>      description: Frequency of the xclk clock in Hz.
> +    deprecated: true
>  
>    enable-gpios:
>      description: GPIO descriptor for the enable pin.
>      maxItems: 1
>  
> -  vdddo-supply:
> -    description: Chip digital IO regulator (1.8V).
> -
>    vdda-supply:
>      description: Chip analog regulator (2.7V).
>  
>    vddd-supply:
>      description: Chip digital core regulator (1.12V).
>  
> +  vdddo-supply:
> +    description: Chip digital IO regulator (1.8V).
> +
>    flash-leds: true
>    lens-focus: true
>  
> @@ -84,11 +85,10 @@ required:
>    - compatible
>    - reg
>    - clocks
> -  - clock-frequency
>    - enable-gpios
> -  - vdddo-supply
>    - vdda-supply
>    - vddd-supply
> +  - vdddo-supply
>    - port
>  
>  unevaluatedProperties: false
> @@ -104,22 +104,25 @@ examples:
>          camera-sensor@1a {
>              compatible = "sony,imx214";
>              reg = <0x1a>;
> -            vdddo-supply = <&pm8994_lvs1>;
> -            vddd-supply = <&camera_vddd_1v12>;
> +
> +            clocks = <&camera_clk>;
> +            assigned-clocks = <&camera_clk>;
> +            assigned-clock-rates = <24000000>;
> +
> +            enable-gpios = <&msmgpio 25 GPIO_ACTIVE_HIGH>;
> +
>              vdda-supply = <&pm8994_l17>;
> +            vddd-supply = <&camera_vddd_1v12>;
> +            vdddo-supply = <&pm8994_lvs1>;
> +
>              lens-focus = <&ad5820>;
> -            enable-gpios = <&msmgpio 25 GPIO_ACTIVE_HIGH>;
> -            clocks = <&camera_clk>;
> -            clock-frequency = <24000000>;
>  
>              port {
>                  imx214_ep: endpoint {
>                      data-lanes = <1 2 3 4>;
> -                    link-frequencies = /bits/ 64 <480000000>;
> +                    link-frequencies = /bits/ 64 <600000000>;
>                      remote-endpoint = <&csiphy0_ep>;
>                  };
>              };
>          };
>      };
> -
> -...

-- 
Regards,

Laurent Pinchart

