Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCB4C18E7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 15:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UueO69TTQA0z4+tqMdzJ6l9TKAB/NpR0XTUnF0IGDG0=; b=3GWTYWspE+taP0R51TyKukpHr5
	I7CbpTc7C3JfszKBeruApTyNZOm6yHyeiWMbPkWFbGKmmmTS4QR0xKJuwkgoGSttwznp+7Hvrx8KN
	Bcv4fP2jcCzLd8238IXE/Dp6D2EEQXDFW3WTPArm26IjxDJb6MyJUkoQOzyouYWPHxps0fQ03s3lm
	zP37j5G+uIPsUMTvuV7ka7/B9jp5iouXxeqJSLEd4sqQIoN2GK/fTxs+Fe7wUAG/3yxi9xHAQ0aUh
	c1YHvZtfmw0GolcT+1aXRLEqPxGAa5ZmW7NWdta4Q2gSWo5s1xZ0Y0br6H9oninh6wxz+67Tp44ng
	Kr3yzwJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJFE-00000004G7f-3y9F;
	Wed, 26 Feb 2025 15:22:44 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIfX-000000049pk-2pTI;
	Wed, 26 Feb 2025 14:45:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 326B9612F6;
	Wed, 26 Feb 2025 14:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9932AC4AF0B;
	Wed, 26 Feb 2025 14:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740581150;
	bh=2e8y34nF3WAvOI36M9xs1+jJDib5lSf6jroS4lJKWRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L7TO8yXxQmiYV0e978xp7cwfIDefmJ7wdXKZEKaEo7couphnmeePegIiWh7rHgAes
	 yi6PFABiCw0C6OnVizzoqwFj1Y+r4yOaPdqWynd0DSSPzQrZQvRC3yOjjyJuTqLWaS
	 X4UNy3p+thTfBpcYIf4iwD14hMFT+Ty9KNpydCaHtMpIzgr3TDoE9kUs66v7opDFWg
	 oplQ8iqVFvQ9CUI6aL7+JfIhPm/vs3pfSN459q0AtlP1xmpXUga85qgQP7CQEBO+2I
	 7Rr1SDzlaQke0cDyIDA8a4JiXHva92wkVVAL7u9MTHNVoT/utxi17F/MZatXawLLWL
	 vEAdgOgR53OLw==
Date: Wed, 26 Feb 2025 08:45:48 -0600
From: Rob Herring <robh@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] dt-bindings: thermal: rockchip: document otp
 thermal trim
Message-ID: <20250226144548.GA2299551-robh@kernel.org>
References: <20250225-rk3576-tsadc-upstream-v2-0-6eb7b00de89c@collabora.com>
 <20250225-rk3576-tsadc-upstream-v2-4-6eb7b00de89c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-rk3576-tsadc-upstream-v2-4-6eb7b00de89c@collabora.com>
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

On Tue, Feb 25, 2025 at 01:56:47PM +0100, Nicolas Frattaroli wrote:
> Several Rockchip SoCs, such as the RK3576, can store calibration trim
> data for thermal sensors in OTP cells. This capability should be
> documented.
> 
> Such a rockchip thermal sensor may reference cell handles that store
> both a chip-wide trim for all the sensors, as well as cell handles
> for each individual sensor channel pointing to that specific sensor's
> trim value.
> 
> Additionally, the thermal sensor may optionally reference cells which
> store the base in terms of degrees celsius and decicelsius that the trim
> is relative to.
> 
> Each SoC that implements this appears to have a slightly different
> combination of chip-wide trim, base, base fractional part and
> per-channel trim, so which ones do which is documented in the bindings.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  .../bindings/thermal/rockchip-thermal.yaml         | 64 ++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
> index 49ceed68c92ce5a32ed8d4f39bd88fd052de0e80..eef8d2620b675fe2f871a03aebdaed13278e0884 100644
> --- a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
> @@ -11,6 +11,23 @@ maintainers:
>  
>  $ref: thermal-sensor.yaml#
>  
> +definitions:

'$defs' is preferred over 'definitions'. However, I don't think you need 
either.

> +  channel:

Just make this a pattern property:

'@[0-5]$'

Really, node names should be generic and the type of thing they are, not 
what instance they are. So something like 'sensor' for all the child 
nodes. IOW, node names is not how you should identify what each sensor 
is associated with.

> +    type: object
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description: sensor ID, a.k.a. channel number
> +      nvmem-cells:
> +        items:
> +          - description: handle of cell containing the calibration data
> +      nvmem-cell-names:
> +        items:
> +          - const: trim
> +    required:
> +      - reg
> +    unevaluatedProperties: false
> +
>  properties:
>    compatible:
>      enum:
> @@ -51,6 +68,12 @@ properties:
>        - const: tsadc
>        - const: tsadc-phy
>  
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
>    "#thermal-sensor-cells":
>      const: 1
>  
> @@ -80,6 +103,47 @@ required:
>    - clock-names
>    - resets
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3568-tsadc
> +    then:
> +      properties:
> +        nvmem-cells:
> +          items:
> +            - description: cell handle to where the trim's base temperature is stored
> +            - description:
> +                cell handle to where the trim's tenths of Celsius base value is stored
> +        nvmem-cell-names:
> +          items:
> +            - const: trim_base
> +            - const: trim_base_frac

Define all properties at the top-level and then restrict their presence 
in the if/then schema.

> +        cpu@0:
> +          $ref: "#/definitions/channel"
> +        gpu@1:
> +          $ref: "#/definitions/channel"
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3576-tsadc
> +    then:
> +      properties:
> +        soc@0:
> +          $ref: "#/definitions/channel"
> +        bigcores@1:
> +          $ref: "#/definitions/channel"
> +        littlecores@2:
> +          $ref: "#/definitions/channel"
> +        ddr@3:
> +          $ref: "#/definitions/channel"
> +        npu@4:
> +          $ref: "#/definitions/channel"
> +        gpu@5:
> +          $ref: "#/definitions/channel"
> +
>  unevaluatedProperties: false
>  
>  examples:
> 
> -- 
> 2.48.1
> 

