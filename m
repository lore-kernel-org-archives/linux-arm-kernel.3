Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3663CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 15:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+PYVMPyYtKSb9TDUfot2Xu0Vmuv7MKO3dRzcBLskl30=; b=xjxnWd0i963ofxucez5PbW84oY
	2FhR4Gcasc7EKqNu36dk82yNjru/RoN2UWf7xLPgx+RxDziV14lRuaxjhfI0Qirz/B0uMtIgv/hlV
	AlFK7u/WJx6LQVPaKPzpcwy2luqEYdyiivnT0g1u1fN0/GZolAXOu989wFcYClJfEH9brfLCYBXSr
	3ZuJE3Wed76pT8pwA8Qyw7dAPvPg88O2ZqsbRoXaH19pelfEfpvQ/zaVv8GREKu15BMpQCP9WD+Er
	liCjxPNpl2Woxh97ixQ9ggEDsWMVVy2BfM+QQBHtA9yTRIAjXuDrXolpTojYjaLcQf6n1Tjhes5bl
	2RuhCTlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3zBs-00000008Sok-0ADU;
	Wed, 01 Oct 2025 15:56:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3zBr-00000008SoZ-1Knn;
	Wed, 01 Oct 2025 15:56:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B9C6C60376;
	Wed,  1 Oct 2025 15:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F883C4CEF1;
	Wed,  1 Oct 2025 15:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759334186;
	bh=dpDxbJEa9xHDq32Iw4dhO02Kxs37V/TEEB8swDIuAXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DDnGZVRSsuogS4Rz0rpmzlM5UBo6GlPks/QrPDVktYTRkHIlNBDcuEgF5G/HQaTFG
	 LJNoyXC0SKBmi9hhUjpPUhAKR6Z78s0oZIbynz+7PgGZG81tpqFFXRS70J5NS530vo
	 GDs7SZEicBivPJu/feQHSOFqIN+LYCgMq8O7FqvC2t5Fb5/BMdnDaxFTFcJeT5kt0k
	 WBWij5+tglL96vr3PohqhG6CjjW+iVAgZ45C3JJeBOrh+ZUIV2z0cQkMj8rYvsRMlZ
	 qo/TUbqtuHTg8OoyaKGOPJf/2I6hp+xtoWTG4H+xY5W9ADS220IgM0yYzviJ3cgz95
	 aZHMgHOmeV7Rw==
Date: Wed, 1 Oct 2025 10:56:25 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
	broonie@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, wenst@chromium.org,
	igor.belwon@mentallysanemainliners.org,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH v6 8/9] dt-bindings: mfd: Add binding for MediaTek MT6363
 series SPMI PMIC
Message-ID: <20251001155625.GE1833526-robh@kernel.org>
References: <20251001111316.31828-1-angelogioacchino.delregno@collabora.com>
 <20251001111316.31828-9-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251001111316.31828-9-angelogioacchino.delregno@collabora.com>
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

On Wed, Oct 01, 2025 at 01:13:15PM +0200, AngeloGioacchino Del Regno wrote:
> Add a binding for the MediaTek MT6363/6373 (and similar) multi
> function PMICs connected over SPMI.
> 
> These PMICs are found on board designs using newer MediaTek SoCs,
> such as the Dimensity 9400 Smartphone chip, or the Chromebook
> MT8196 chip.
> 
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Link: https://lore.kernel.org/r/20250715140224.206329-8-angelogioacchino.delregno@collabora.com
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/mfd/mediatek,mt6363.yaml         | 115 ++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml
> new file mode 100644
> index 000000000000..6f477186a9c6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/mediatek,mt6363.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6363 series SPMI PMICs multi-function device
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description: |
> +  Some MediaTek Power Management ICs (PMICs) found in board designs with
> +  the Helio, Dimensity and/or Kompanio series of SoCs are interfaced to
> +  the chip via the System Power Management Interface (SPMI) bus.
> +
> +  These PMICs are multi-function devices with various sub modules.
> +  For example, those may include one, or more of the following:
> +  - Auxiliary ADC Controller
> +  - Clock Controller
> +  - eFuses
> +  - GPIO Controller
> +  - Interrupt Controller
> +  - Keys
> +  - LEDs Controller
> +  - Regulators
> +  - RTC
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt6363
> +      - mediatek,mt6373
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 3
> +
> +patternProperties:
> +  "^adc@[0-9a-f]+$":
> +    type: object
> +    $ref: /schemas/iio/adc/mediatek,mt6359-auxadc.yaml#
> +
> +  "^regulators@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      compatible:
> +        contains:
> +          enum:
> +            - mediatek,mt6363-regulator
> +            - mediatek,mt6373-regulator
> +    oneOf:
> +      - $ref: /schemas/regulator/mediatek,mt6363-regulator.yaml#
> +      - $ref: /schemas/regulator/mediatek,mt6373-regulator.yaml#
> +    additionalProperties: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#address-cells'

#size-cells should be required too. With that fixed,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

