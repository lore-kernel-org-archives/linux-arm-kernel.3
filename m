Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332C1C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 16:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vuzxknl7Q3ojpRqDkCAGL35k+wTQkMrTGshMIzQKC3c=; b=ALxekkbDQOSK/q6Gcb0mkEQU50
	uZGv91/BO9wdB2CvyRl6m3Xpi2DzvNQ5Qtgy1EENffkQHkJ2kQ1vfwUZjNuRu1Tw2YWzveSQQC0Jg
	xZOqB0tgR3Bt/1n3sSmX/kXL5teG0B066o/LqPZPLSP45FJNgaYcm1Gy+G2PaqrY4jLcGDrOWzX9T
	Cw8Fluf7p2OEbIq8L5T0TIGjE7PyMovaivEZKZ+u96gQFcenOSU5Yp8sxWpXmuLTWU7O+9Qr1M9qt
	BI0Hut/HSzWGWwkcq7OmRoDMKV084jhhSJsVYhuIQ/YRn7yuKNRAt6vppnBvs1YHLPHZVUZEkDVHJ
	cWNMq4tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucRCr-0000000AbT8-3qyf;
	Thu, 17 Jul 2025 16:11:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQYP-0000000AVbI-3g0U;
	Thu, 17 Jul 2025 15:29:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 002E560201;
	Thu, 17 Jul 2025 15:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F58CC4CEE3;
	Thu, 17 Jul 2025 15:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752766188;
	bh=zra0mOPsZoxJH/aMEjjq48Y9Yq8G2HsxK8xmBukRV7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W+vpCkoJt8fqn63OMfp5hFCSoYtWsyejVyxEVKshkUtNxvZVhVWs8xsRMSJlC3r+N
	 eN3QRHhja0DYIjjcM1XLP1iZwqfZhdiZZ/GZCe2uSl/SITUL9L6xmSJpRqfZ2cMRML
	 RCsONJGlK4FBNl/2idXjX8kq4ImPXqF/Vyr6OEWegvH5H9rktaokTJkxPp86nFgRlz
	 ofoo3pJeT5gkjfRJmaqc19pElU3nqmvpcPkgl+VfQs/qroQV0iIdy/xAryjcWhZizi
	 1hunkUiKgU44RH/puTSRtP+7sqvbPyiAquKXwcys3NwSn/mwitUDTs6zFelQfSo845
	 0SV7/3j6Oh/Aw==
Date: Thu, 17 Jul 2025 10:29:47 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
	broonie@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, wenst@chromium.org
Subject: Re: [PATCH v5 3/8] dt-bindings: regulator: Document MediaTek MT6363
 PMIC Regulators
Message-ID: <20250717152947.GA3411864-robh@kernel.org>
References: <20250715140224.206329-1-angelogioacchino.delregno@collabora.com>
 <20250715140224.206329-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715140224.206329-4-angelogioacchino.delregno@collabora.com>
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

On Tue, Jul 15, 2025 at 04:02:19PM +0200, AngeloGioacchino Del Regno wrote:
> Add bindings for the regulators found in the MediaTek MT6363 PMIC,
> usually found in board designs using the MT6991 Dimensity 9400 and
> on MT8196 Kompanio SoC for Chromebooks, along with the MT6316 and
> MT6373 PMICs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../regulator/mediatek,mt6363-regulator.yaml  | 193 ++++++++++++++++++
>  1 file changed, 193 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml
> new file mode 100644
> index 000000000000..ea1f6c92cffc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml
> @@ -0,0 +1,193 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6363-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6363 PMIC Regulators
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description:
> +  The MT6363 SPMI PMIC provides 10 BUCK and 25 LDO (Low DropOut) regulators
> +  and can optionally provide overcurrent warnings with one ocp interrupt
> +  for each voltage regulator.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6363-regulator
> +
> +  reg:
> +    maxItems: 1
> +
> +  vsys-vbuck1-supply:
> +    description: Input supply for vbuck1

blank line

> +  vsys-vbuck2-supply:
> +    description: Input supply for vbuck2

blank line, and so on...

> +  vsys-vbuck3-supply:
> +    description: Input supply for vbuck3
> +  vsys-vbuck4-supply:
> +    description: Input supply for vbuck4
> +  vsys-vbuck5-supply:
> +    description: Input supply for vbuck5
> +  vsys-vbuck6-supply:
> +    description: Input supply for vbuck6
> +  vsys-vbuck7-supply:
> +    description: Input supply for vbuck7
> +  vsys-vs1-supply:
> +    description: Input supply for vs1
> +  vsys-vs2-supply:
> +    description: Input supply for vs2
> +  vsys-vs3-supply:
> +    description: Input supply for vs3
> +  vs1-ldo1-supply:
> +    description: Input supply for va15, vio0p75, vm18, vrf18, vrf-io18
> +  vs1-ldo2-supply:
> +    description: Input supply for vcn15, vio18, vufs18
> +  vs2-ldo1-supply:
> +    description: Input supply for vsram-cpub, vsram-cpum, vrf12, vrf13, vufs12
> +  vs2-ldo2-supply:
> +    description: Input supply for va12-1, va12-2, vcn13, vsram-cpul
> +  vs3-ldo1-supply:
> +    description: Input supply for vsram-apu, vsram-digrf, vsram-mdfe
> +  vs3-ldo2-supply:
> +    description: Input supply for vsram-modem, vrf0p9
> +  vsys-ldo1-supply:
> +    description: Input supply for vaux18, vemc, vtref18
> +
> +patternProperties:
> +  "^v(buck[1-7]|s[1-3])$":
> +    description: Buck regulators
> +    type: object
> +    $ref: regulator.yaml#
> +    properties:
> +      regulator-allowed-modes:
> +        description: |
> +          Allowed Buck regulator operating modes allowed. Valid values below.
> +            0 - Normal mode with automatic power saving, reducing the switching
> +                frequency when light load conditions are detected
> +            1 - Forced Continuous Conduction mode (FCCM) for improved voltage
> +                regulation accuracy with constant switching frequency but lower
> +                regulator efficiency
> +            2 - Forced Low Power mode for improved regulator efficiency, used
> +                when no heavy load is expected, does not limit the maximum out
> +                current but unless only a light load is applied, there will be
> +                regulation accuracy and efficiency losses.
> +            3 - Forced Ultra Low Power mode for ultra low load, this greatly
> +                reduces the maximum output power, makes the regulator to be
> +                efficient only for ultra light load, and greatly reduces the
> +                quiescent current (Iq) of the buck.
> +        maxItems: 3
> +        items:
> +          enum: [ 0, 1, 2, 3 ]
> +    unevaluatedProperties: false

Move this after $ref.

> +
> +  "^va(12-1|12-2|15)$":
> +    type: object
> +    $ref: regulator.yaml#
> +    properties:
> +      regulator-allowed-modes:
> +        description: |
> +          Allowed LDO regulator operating modes allowed. Valid values below.
> +            0 - Normal mode with automatic power saving, reducing the switching
> +                frequency when light load conditions are detected
> +            2 - Forced Low Power mode for improved regulator efficiency, used
> +                when no heavy load is expected, does not limit the maximum out
> +                current but unless only a light load is applied, there will be
> +                regulation accuracy and efficiency losses.
> +        maxItems: 2
> +        items:
> +          enum: [ 0, 2 ]
> +    unevaluatedProperties: false
> +
> +  "^v(aux|m|rf-io|tref)18$":
> +    type: object
> +    $ref: regulator.yaml#
> +    properties:
> +      regulator-allowed-modes:
> +        maxItems: 2
> +        items:
> +          enum: [ 0, 2 ]
> +    unevaluatedProperties: false
> +
> +  "^v(cn13|cn15|emc)$":
> +    type: object
> +    $ref: regulator.yaml#
> +    properties:
> +      regulator-allowed-modes:
> +        maxItems: 2
> +        items:
> +          enum: [ 0, 2 ]
> +    unevaluatedProperties: false
> +
> +  "^vio(0p75|18)$":
> +    type: object
> +    $ref: regulator.yaml#
> +    properties:
> +      regulator-allowed-modes:
> +        maxItems: 2
> +        items:
> +          enum: [ 0, 2 ]
> +    unevaluatedProperties: false
> +
> +  "^vrf(0p9|12|13|18)$":
> +    type: object
> +    $ref: regulator.yaml#
> +    properties:
> +      regulator-allowed-modes:
> +        maxItems: 2
> +        items:
> +          enum: [ 0, 2 ]
> +    unevaluatedProperties: false
> +
> +  "^vsram-(apu|cpub|cpum|cpul|digrf|mdfe|modem)$":
> +    type: object
> +    $ref: regulator.yaml#
> +    properties:
> +      regulator-allowed-modes:
> +        maxItems: 2
> +        items:
> +          enum: [ 0, 2 ]
> +    unevaluatedProperties: false
> +
> +  "^vufs(12|18)$":
> +    type: object
> +    $ref: regulator.yaml#
> +    properties:
> +      regulator-allowed-modes:
> +        maxItems: 2
> +        items:
> +          enum: [ 0, 2 ]
> +    unevaluatedProperties: false

A lot of duplication here. Either combine the regex's to 1 entry or add 
a $defs entry and make all of these a 1 line $ref.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>

I thought I said this already, but drop the example here. 1 complete 
example in the mfd schema only.

> +
> +    pmic {
> +      interrupt-controller;
> +      #address-cells = <1>;
> +      #interrupt-cells = <3>;
> +
> +      regulators@30 {
> +        compatible = "mediatek,mt6363-regulator";
> +        reg = <0x
> +
> +        vio18 {
> +          regulator-name = "pp1800-vio18-s3";
> +          regulator-min-microvolt = <1800000>;
> +          regulator-max-microvolt = <1800000>;
> +          regulator-allowed-modes = <0 2>;
> +          regulator-allow-set-load;
> +          regulator-over-current-protection;
> +        };
> +      };
> +    };
> +...
> -- 
> 2.50.1
> 

