Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D87C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 23:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OG4idGKQbVwHgpQyz+J8/2wpglVxoP2qx8x2Rw+fukA=; b=F4c0ea7njBeVWuNYJhbAIlSjRf
	b5cjh8AYEHeXPSCSNw0piBAcshuK3GXSgONC6gRWBZUV+8xP2KcsLO2a57ieuMdPES1ndv2XGJx3o
	uZR5iGapBjGVDuebhzba0x7FvErOASspEuHeO3z6WdfQmkcCpHxKAu8J1nzu7kRO5aDHOjsdlAFGN
	d3J0fhgyhLNEuMwt21IUFv2/oX2MA2fO6Bnz28ShMrXqDiMYL0aJPiG2Xs+wVUusrt0FagvSuNW1w
	hfPKPBWr+k7JH7+euP7QrdrFo5Emai+spfvYRuKaDDEbgESm13kD1dHNMd3uiuadZerWfKjHq1ojh
	3nssCOGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tktHg-0000000FdnC-3qwu;
	Wed, 19 Feb 2025 23:15:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tktDC-0000000FcUP-2Fi4;
	Wed, 19 Feb 2025 23:10:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D35161147;
	Wed, 19 Feb 2025 23:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EA85C4CED1;
	Wed, 19 Feb 2025 23:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740006637;
	bh=CYLczoHD6qvbYSNlRY5igolvyzZvd2e9ewBvJXOSbIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ssGYmnJ9qxwuROAsGnBlSTwZir7tTkewQhMyWzapIUf0BfmMOI2Ju3oj8Vr49jREA
	 lUF4QK8E0rZiO07qAKQLe0etXjkWtMS5tNUHq8pqqbknRdEIOnVI8XmdBSfze0riaJ
	 QmWNOZmUeyzjZtAbiLv7WJLTu+X/breMLqPTt1Z563RcmmbjqUJMTPzpZcTuICsr13
	 gyJYadZesKuK9+AnT7OrceSijZnMd92ubLhHUpUhSN+5jkVVB0NW1sZeFsyqGDr2Qb
	 IxULEIJhGfskmfeCtB9KknZYkDsKvA6jpYULrSeRQ3CnTcVFr4P9ETmWiUq39Zt9+b
	 AU2rl7Sggwogw==
Date: Wed, 19 Feb 2025 17:10:36 -0600
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
Subject: Re: [PATCH 4/6] dt-bindings: thermal: rockchip: document otp thermal
 trim
Message-ID: <20250219231036.GA3137058-robh@kernel.org>
References: <20250216-rk3576-tsadc-upstream-v1-0-6ec969322a14@collabora.com>
 <20250216-rk3576-tsadc-upstream-v1-4-6ec969322a14@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250216-rk3576-tsadc-upstream-v1-4-6ec969322a14@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_151038_687306_7A2846CD 
X-CRM114-Status: GOOD (  17.87  )
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

On Sun, Feb 16, 2025 at 12:34:53AM +0100, Nicolas Frattaroli wrote:
> Several Rockchip SoCs, such as the RK3576, can store calibration trim
> data for thermal sensors in OTP cells. This capability should be
> documented.

Is several most or a minority as this change is enabled for everyone.

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
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  .../bindings/thermal/rockchip-thermal.yaml         | 44 ++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
> index 49ceed68c92ce5a32ed8d4f39bd88fd052de0e80..8d27ddefcc64e29f0faab059888805802c948b41 100644
> --- a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
> @@ -40,6 +40,21 @@ properties:
>        - const: tsadc
>        - const: apb_pclk
>  
> +  nvmem-cells:
> +    items:
> +      - description: cell handle of the low byte of the chip fallback trim value
> +      - description: cell handle of the high byte of the chip fallback trim value
> +      - description: cell handle to where the trim's base temperature is stored
> +      - description:
> +          cell handle to where the trim's tenths of Celsius base value is stored
> +
> +  nvmem-cell-names:
> +    enum:
> +      - trim_l
> +      - trim_h
> +      - trim_base
> +      - trim_base_frac
> +
>    resets:
>      minItems: 1
>      maxItems: 3
> @@ -51,6 +66,12 @@ properties:
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
> @@ -72,6 +93,29 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      enum: [0, 1]
>  
> +patternProperties:
> +  "^([a-z]+)@[0-9]+$":

If each node is a sensor or channel, then make that the node name.

> +    type: object
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description: sensor ID, a.k.a. channel number
> +
> +      nvmem-cells:
> +        items:
> +          - description: handle of cell containing low byte of calibration data
> +          - description: handle of cell containing high byte of calibration data
> +
> +      nvmem-cell-names:
> +        items:
> +          - const: trim_l
> +          - const: trim_h
> +
> +    required:
> +      - reg
> +
> +    unevaluatedProperties: false
> +
>  required:
>    - compatible
>    - reg
> 
> -- 
> 2.48.1
> 

