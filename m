Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CE0C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 13:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V+faS1Z2PFh/Xojg07F3de26IhJQRIGQ2NAZT9ipYNE=; b=JIxW6Z4hRcyBMavC6Ivm60TDQy
	uJhftpcrbH6FeexbRks0w2/Zm5PYOejiU9UqlvYP43Mcl8IO1rtTbeT/3lGxbkIxpx7ORMuFTov8X
	y3FW5pHBXiJ9j3gYTQlw7vOGJ8yhwVtg4wTbGj52/LnycK5MrtjGMG6RZowBDNhuqjj+HegRJWb0W
	0Hb+EPjqNdMzeBdDdsvrQJl214lezfVkpe2yTM2uDCHfuIeKrT8d66imUk6KEiy8Y2gA9qK1Iz+xE
	Z4o1vsqaIPkEeomuHFzG3P5cEEIqjSiWSlGsYzQC8F34ta0defetbLrH7kNRATNHRm5iu+81Z/xvv
	UFvS+7uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhpwj-000000067mN-3SpC;
	Fri, 01 Aug 2025 13:37:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhpu9-000000067RA-181X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 13:34:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7FFD36112D;
	Fri,  1 Aug 2025 13:34:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 134B7C4CEE7;
	Fri,  1 Aug 2025 13:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754055276;
	bh=N/x7XAFTjXtfUPb0qJUtTXRvmOGAsMR5K5uMplm4A70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jsM27rDaQLXAjtU5Vfms10gU7akFQ5pIehCS5bt+fKEKoZ1u7Vf5CiK0LOmE0Unf2
	 tHVHlkKsBG/MfTc0d2rJf8oZ+oHG4KniX21M2hI1Zn1yMKex+Q/Ih/Dur9xp3J6gHw
	 Y2pU9mQmM1V4OH+VOk/nGr7iyIrj9MZYXJ1ntBCkIakICEtNbNMN5L13vy6Hd+nnN/
	 AFn/GASyQ6s4LOf2sbqdDz0avR1CBC6Mrk7plRMTJKJqSoI4QWT5QIF2F+zHGR89o6
	 v5A0waIArdK/1qoGCeDVXIGkL6deyN2XwGitCAhn7QT1OZIzgXMHonj4zjdWBNELSw
	 eP8KrN5aC4sww==
Date: Fri, 1 Aug 2025 08:34:35 -0500
From: Rob Herring <robh@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] dt-binding: thermal: Convert
 marvell,armada-ap806-thermal to DT schema
Message-ID: <20250801133435.GA3024231-robh@kernel.org>
References: <20250702230030.2892116-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702230030.2892116-1-robh@kernel.org>
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

On Wed, Jul 02, 2025 at 06:00:29PM -0500, Rob Herring (Arm) wrote:
> Convert the Marvell Armada AP80x/CP110 thermal binding to schema. It is
> a straight forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../arm/marvell/ap80x-system-controller.txt   | 39 ----------------
>  .../arm/marvell/cp110-system-controller.txt   | 43 ------------------
>  .../thermal/marvell,armada-ap806-thermal.yaml | 44 +++++++++++++++++++
>  3 files changed, 44 insertions(+), 82 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/thermal/marvell,armada-ap806-thermal.yaml

Ping!

> 
> diff --git a/Documentation/devicetree/bindings/arm/marvell/ap80x-system-controller.txt b/Documentation/devicetree/bindings/arm/marvell/ap80x-system-controller.txt
> index c83245065d44..72de11bd2ef0 100644
> --- a/Documentation/devicetree/bindings/arm/marvell/ap80x-system-controller.txt
> +++ b/Documentation/devicetree/bindings/arm/marvell/ap80x-system-controller.txt
> @@ -115,45 +115,6 @@ ap_syscon: system-controller@6f4000 {
>  SYSTEM CONTROLLER 1
>  ===================
>  
> -Thermal:
> ---------
> -
> -For common binding part and usage, refer to
> -Documentation/devicetree/bindings/thermal/thermal*.yaml
> -
> -The thermal IP can probe the temperature all around the processor. It
> -may feature several channels, each of them wired to one sensor.
> -
> -It is possible to setup an overheat interrupt by giving at least one
> -critical point to any subnode of the thermal-zone node.
> -
> -Required properties:
> -- compatible: must be one of:
> -  * marvell,armada-ap806-thermal
> -- reg: register range associated with the thermal functions.
> -
> -Optional properties:
> -- interrupts: overheat interrupt handle. Should point to line 18 of the
> -  SEI irqchip. See interrupt-controller/interrupts.txt
> -- #thermal-sensor-cells: shall be <1> when thermal-zones subnodes refer
> -  to this IP and represents the channel ID. There is one sensor per
> -  channel. O refers to the thermal IP internal channel, while positive
> -  IDs refer to each CPU.
> -
> -Example:
> -ap_syscon1: system-controller@6f8000 {
> -	compatible = "syscon", "simple-mfd";
> -	reg = <0x6f8000 0x1000>;
> -
> -	ap_thermal: thermal-sensor@80 {
> -		compatible = "marvell,armada-ap806-thermal";
> -		reg = <0x80 0x10>;
> -		interrupt-parent = <&sei>;
> -		interrupts = <18>;
> -		#thermal-sensor-cells = <1>;
> -	};
> -};
> -
>  Cluster clocks:
>  ---------------
>  
> diff --git a/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt b/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt
> index 9d5d70c98058..54ff9f218328 100644
> --- a/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt
> +++ b/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt
> @@ -189,46 +189,3 @@ CP110_LABEL(syscon0): system-controller@440000 {
>  	};
>  
>  };
> -
> -SYSTEM CONTROLLER 1
> -===================
> -
> -Thermal:
> ---------
> -
> -The thermal IP can probe the temperature all around the processor. It
> -may feature several channels, each of them wired to one sensor.
> -
> -It is possible to setup an overheat interrupt by giving at least one
> -critical point to any subnode of the thermal-zone node.
> -
> -For common binding part and usage, refer to
> -Documentation/devicetree/bindings/thermal/thermal*.yaml
> -
> -Required properties:
> -- compatible: must be one of:
> -  * marvell,armada-cp110-thermal
> -- reg: register range associated with the thermal functions.
> -
> -Optional properties:
> -- interrupts-extended: overheat interrupt handle. Should point to
> -  a line of the ICU-SEI irqchip (116 is what is usually used by the
> -  firmware). The ICU-SEI will redirect towards interrupt line #37 of the
> -  AP SEI which is shared across all CPs.
> -  See interrupt-controller/interrupts.txt
> -- #thermal-sensor-cells: shall be <1> when thermal-zones subnodes refer
> -  to this IP and represents the channel ID. There is one sensor per
> -  channel. O refers to the thermal IP internal channel.
> -
> -Example:
> -CP110_LABEL(syscon1): system-controller@6f8000 {
> -	compatible = "syscon", "simple-mfd";
> -	reg = <0x6f8000 0x1000>;
> -
> -	CP110_LABEL(thermal): thermal-sensor@70 {
> -		compatible = "marvell,armada-cp110-thermal";
> -		reg = <0x70 0x10>;
> -		interrupts-extended = <&CP110_LABEL(icu_sei) 116 IRQ_TYPE_LEVEL_HIGH>;
> -		#thermal-sensor-cells = <1>;
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/thermal/marvell,armada-ap806-thermal.yaml b/Documentation/devicetree/bindings/thermal/marvell,armada-ap806-thermal.yaml
> new file mode 100644
> index 000000000000..fdbdf3c1273a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/marvell,armada-ap806-thermal.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/marvell,armada-ap806-thermal.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell Armada AP80x/CP110 thermal management
> +
> +maintainers:
> +  - Miquel Raynal <miquel.raynal@bootlin.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - marvell,armada-ap806-thermal
> +      - marvell,armada-ap807-thermal
> +      - marvell,armada-cp110-thermal
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description: overheat interrupt
> +    maxItems: 1
> +
> +  '#thermal-sensor-cells':
> +    description: Cell represents the channel ID. There is one sensor per
> +      channel. O refers to the thermal IP internal channel.
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    thermal-sensor@80 {
> +        compatible = "marvell,armada-ap806-thermal";
> +        reg = <0x80 0x10>;
> +        interrupts = <18>;
> +        #thermal-sensor-cells = <1>;
> +    };
> -- 
> 2.47.2
> 

