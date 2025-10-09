Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969B0CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 19:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M0PevNd+i/F2JzdzuKBJN1LmRxCIMUNzLKwnB5HEkAY=; b=49bzN6dNfBZ3mZMJ0YjYKZiWWx
	Lh/mAQYQVEebgq8ol0Mj59wvrz2P1/+i/gt9Zvjo7doDOxWsd+5tvP+JzoGPF1wHRuYFtXEoBIR9S
	Xb69SeQ30DdSNBIL7bwk3ELWJ2oEhmuo3i83ffNY07XNp78SP5q9j76DU1MUOvRVK6BDni8/YFSyI
	+APREn9abNPGZfN+oX/uJ8Wb+7G57fwFGfcr9UD5PaidGk2tihFS9G+TbaKa8lQ4cNFa2Rovy+BN7
	DQxwNu3MpLPHoTDpxuw2cCQgLdKs59NpqA1FwTGpFYUJ4IrRWoKNcqETKfALO+iIUcCpVKCYriats
	X7e+3veA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6wAD-00000006zUt-0t8E;
	Thu, 09 Oct 2025 19:18:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6wAB-00000006zUT-0jRJ;
	Thu, 09 Oct 2025 19:18:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 92F4349095;
	Thu,  9 Oct 2025 19:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27AFAC4CEE7;
	Thu,  9 Oct 2025 19:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760037534;
	bh=5S9bfphoMzasXEdo67ITA1E1OFoYoV5XGiFc7X8hHRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tZ42X+3CMN5xZgb0bDD5sfwrOZeVa8UyF2X74qLIO838v6Og6q2vK7y5NXz3Lmut1
	 y2RC21Ev//5o+8rU5eI1iN13QysE+6ZMywpO9GgBIepEcz2vT+kttcAPvvoMANFOYU
	 b1NO+l67TZkgJG+LYDnO9VhJvf7ib8AZYlGKNq31IfBwAjcSvacU3UB7oXno8kiLkC
	 WRQX2V5fFPxLUlCzGZKicibhlbiHGzzryREn/UCxsWRWf+PgLctcx/TgmD44S4VMo5
	 1CAt/V1z//wvdGfxAc1p4SvWZ6+z5UwE9Y7o+KxNH1r0SMxKHbZmEGor1ystI4kTOF
	 zDPhIo0XRPN2A==
Date: Thu, 9 Oct 2025 14:18:52 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
	broonie@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, wenst@chromium.org,
	igor.belwon@mentallysanemainliners.org
Subject: Re: [PATCH v8 1/9] dt-bindings: regulator: Document MediaTek MT6316
 PMIC Regulators
Message-ID: <20251009191852.GA2947598-robh@kernel.org>
References: <20251003091158.26748-1-angelogioacchino.delregno@collabora.com>
 <20251003091158.26748-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003091158.26748-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_121855_275920_00CFB6CA 
X-CRM114-Status: GOOD (  19.84  )
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

On Fri, Oct 03, 2025 at 11:11:50AM +0200, AngeloGioacchino Del Regno wrote:
> Add bindings for the regulators found in the MediaTek MT6316 PMIC,
> usually found in board designs using the MT6991 Dimensity 9400 and
> on MT8196 Kompanio SoC for Chromebooks.
> 
> This chip is fully controlled by SPMI and has multiple variants
> providing different phase configurations.
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../regulator/mediatek,mt6316b-regulator.yaml | 80 +++++++++++++++++++
>  .../regulator/mediatek,mt6316c-regulator.yaml | 80 +++++++++++++++++++
>  .../regulator/mediatek,mt6316d-regulator.yaml | 79 ++++++++++++++++++
>  3 files changed, 239 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316c-regulator.yaml
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316d-regulator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
> new file mode 100644
> index 000000000000..53d2c9913e55
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6316b-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6316 BP/VP SPMI PMIC Regulators
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description:
> +  The MediaTek MT6316BP/VP PMICs are fully controlled by SPMI interface, both
> +  feature four step-down DC/DC (buck) converters, and provides 2+2 Phases,
> +  joining Buck 1+2 for the first phase, and Buck 3+4 for the second phase.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6316b-regulator
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 0

You don't have any child nodes with addresses. Drop.

> +
> +patternProperties:
> +  "^vbuck(12|34)$":
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
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
> +                when no heavy load is expected, will shut down unnecessary IP
> +                blocks and secondary phases to reduce quiescent current.
> +                This mode does not limit the maximum output current but unless
> +                only a light load is applied, there will be regulation accuracy
> +                and efficiency losses.
> +        maxItems: 3

If you can only specify all the modes, why do you need it? Perhaps you 
want 'minItems: 1' as well?

> +        items:
> +          enum: [ 0, 1, 2 ]
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#address-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/spmi/spmi.h>
> +
> +    spmi {
> +      #address-cells = <2>;
> +      #size-cells = <0>;
> +
> +      pmic@8 {
> +        compatible = "mediatek,mt6316b-regulator";
> +        reg = <0x8 SPMI_USID>;
> +        #address-cells = <0>;
> +
> +        vbuck12 {
> +          regulator-name = "dvdd_core";
> +          regulator-min-microvolt = <450000>;
> +          regulator-max-microvolt = <965000>;
> +          regulator-allowed-modes = <0 1 2>;
> +          regulator-enable-ramp-delay = <256>;
> +        };
> +      };
> +    };
> +...

