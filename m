Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EDDC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 20:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=waUFlfYDtLCh3fV2xvfAcHAmgXoHDAkkSyJ3iUBp8s8=; b=lu/KawD9wZ7JlD55BWqwI3udxA
	NKx9elwa89XidLKQtaTKHzTcmnR9pAz8hXLTitKpZyS7sIoxnJbU0WVEZKGVhKvsqhbUJMKgoPStL
	waKMGJcxzTFG38E8vezRyHf65F0Vbzb5d0JvpWZ/yk9hMpHhEX+RKOkNuG00/3xXQclC4+7CvLCMh
	rRlQkOiiieEI2J6uV91Y15xXZwUjF46vuWD4rVWog9j+KgJQ4DGnbh9cMprx43ELqgEwndSIaocP9
	BCGhxkJ5V3h97+ln/QqfrjSg1+w5FVIFzdpF/O8Q3KZWgjDXfB3hgaQXh440Ew1L7xeP5uNwgkgF7
	+BgCR+5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEXQ-00000006SGE-18w5;
	Tue, 08 Jul 2025 20:03:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZDu9-00000006LLm-1LBo;
	Tue, 08 Jul 2025 19:23:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BAF3D5C5B60;
	Tue,  8 Jul 2025 19:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245F0C4CEED;
	Tue,  8 Jul 2025 19:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752002580;
	bh=dOvW17x+dbsJQLzVMph+iJfeu3y0qwjWlfWvz5ioVxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pMaeHI47SnTWqGnpKHGmbNN6znyP6Ax23KY3vl/Qu1DBOx8SV8IU1i8NTMGUw5vaA
	 Oebj2IzjRfYKbJAZQ2H86HLCOBfrELJlu4Br04w4LpBYFKXJh/4yMkBmZhZmnnpHOP
	 IEnVLAc+/MecRNYxWXeZa8zFq2L8DD/bVaPTakdYpB0eFLqxH3OkjxfQk/+Ja6vFfv
	 lkA+hlxxYV12N4q0Q6APjc6SnWVpMPB+BW4pOcaqrMTBlWIL/HYyNKV+WfghB7iSQo
	 Fe/JJzX+YL4dKW29fKD38ahN+21b5EFlsedZkLpejpzU4AwYnKCt06TdFf5jBrZKrE
	 emQ3+UnADOKvg==
Date: Tue, 8 Jul 2025 14:22:59 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
	broonie@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH v2 1/8] dt-bindings: regulator: Document MediaTek MT6316
 PMIC Regulators
Message-ID: <20250708192259.GA797072-robh@kernel.org>
References: <20250707134451.154346-1-angelogioacchino.delregno@collabora.com>
 <20250707134451.154346-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707134451.154346-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_122301_437257_44C536F1 
X-CRM114-Status: GOOD (  16.81  )
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

On Mon, Jul 07, 2025 at 03:44:44PM +0200, AngeloGioacchino Del Regno wrote:
> Add bindings for the regulators found in the MediaTek MT6316 PMIC,
> usually found in board designs using the MT6991 Dimensity 9400 and
> on MT8196 Kompanio SoC for Chromebooks.
> 
> This chip is fully controlled by SPMI and has multiple variants
> providing different phase configurations.
> 
> Link: https://lore.kernel.org/r/20250624073548.29732-2-angelogioacchino.delregno@collabora.com
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../regulator/mediatek,mt6316b-regulator.yaml | 46 +++++++++++++++++++
>  .../regulator/mediatek,mt6316c-regulator.yaml | 46 +++++++++++++++++++
>  .../regulator/mediatek,mt6316d-regulator.yaml | 41 +++++++++++++++++
>  3 files changed, 133 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316c-regulator.yaml
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316d-regulator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
> new file mode 100644
> index 000000000000..e7a6b70cdab2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
> @@ -0,0 +1,46 @@
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
> +  vbuck12:
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +
> +  vbuck34:
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pmic {

Can we have exactly 1 complete example of the PMIC rather than this 
piecemeal example.

> +      regulators {
> +        compatible = "mediatek,mt6316b-regulator";
> +
> +        vbuck12 {
> +          regulator-min-microvolt = <450000>;
> +          regulator-max-microvolt = <965000>;
> +          regulator-always-on;
> +        };
> +      };
> +    };
> +...

