Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074C7C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 07:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N6wfNyULHSveGJJbDGWknpYRmwF3TaciMBgJgGPPpmM=; b=E20bwSJPxfv3JNwBqnnwwy1U5Z
	RMcDsht1RWlQncahQe1Yc4Vbl1zvthXEhQMbDpwsT/fVhMF+4iAyKCLsjuR92BeEh9+VNT10J6arI
	n2ZXmFpU4/w1ZjkH/Iy0Xs8GvDuYZ53hVB/I9roeRsRK0hOUNIVbbM5p5Q1ytfxXtDfNQ2J0yXo3N
	tS2nFy4EqItlzwUYaUU6UYp+OuemCV4+pYrDICaG91vxcr1gX6yjIRIQrWbEabS5R9png5Y4aSlNa
	ZsJlMFSAAdYP2KyJQKEarDueoHZ7MwffCLSXVpd+ljYdRwTpdSIglj2fK4QsU19bEyWEgjH+SFDJr
	TyFxV08g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqSMV-0000000DSeb-2IXB;
	Fri, 07 Mar 2025 07:43:15 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqSKs-0000000DSXE-1Dno;
	Fri, 07 Mar 2025 07:41:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C5E79A45523;
	Fri,  7 Mar 2025 07:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA816C4CEE3;
	Fri,  7 Mar 2025 07:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741333293;
	bh=bF4mHFm8U4if18/YMhPJOe0mEyH61C7WCg62Scl77Zk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L9uZgIlXLqnJo2uw3DIO3ns8wZj+4j/ii84D6nl2S4GBYtIj4MjIDSFEwm5O7CU/r
	 GEGSe/s3pDrwVduFkj/QQ3lFydgrpCtm8GSqsjp6PNy53ePPAU7y9ry5fPdsJ0lR/v
	 CuEVEUS4OinFeaEbljbYWAEUy98q3CkdeBrRAJQjk2FIVcHUoJ5tZOVo0BvV00il0e
	 CH1RC/W7l9I2/MJJp0dxSy/roJKTfUdkyhCh3RxA90u7dEZiIUvVYZv5OQ+ewwAXgl
	 kgIjafzCTI4Q6D95Y6qVSryy3dHrcYCj7JzljY73jYIKPKfIlWGe5bgSQtN4mjwmM4
	 hrY4G743ZdEiw==
Date: Fri, 7 Mar 2025 08:41:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guangjie Song <guangjie.song@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 12/13] dt-bindings: power: mediatek: Add new MT8196 power
 domain
Message-ID: <20250307-groovy-opalescent-spoonbill-cb569e@krzk-bin>
References: <20250307034454.12243-1-guangjie.song@mediatek.com>
 <20250307034454.12243-13-guangjie.song@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250307034454.12243-13-guangjie.song@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_234134_499261_0C9542C4 
X-CRM114-Status: GOOD (  20.29  )
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

On Fri, Mar 07, 2025 at 11:44:36AM +0800, Guangjie Song wrote:
> Add the binding documentation for power domain on MediaTek MT8196.
> 
> Signed-off-by: Guangjie Song <guangjie.song@mediatek.com>
> ---
>  .../mediatek,mt8196-power-controller.yaml     | 74 +++++++++++++++++++
>  include/dt-bindings/power/mt8196-power.h      | 57 ++++++++++++++


You keep sending multiple patchsets and none of them are tested.


>  2 files changed, 131 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/mediatek,mt8196-power-controller.yaml
>  create mode 100644 include/dt-bindings/power/mt8196-power.h

Comments from other patches apply.

> 
> diff --git a/Documentation/devicetree/bindings/power/mediatek,mt8196-power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,mt8196-power-controller.yaml
> new file mode 100644
> index 000000000000..6c2867b25967
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/mediatek,mt8196-power-controller.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/mediatek,mt8196-power-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT8196 Power Domains Controller
> +
> +maintainers:
> +  - Guangjie Song <guangjie.song@mediatek.com>
> +
> +description: |
> +  Mediatek processors include support for multiple power domains which can be
> +  powered up/down by software based on different application scenes to save power.
> +
> +properties:
> +  $nodename:
> +    pattern: '^power-controller(@[0-9a-f]+)?$'


How unit address can be optional?

> +
> +  compatible:
> +    enum:
> +      - mediatek,mt8196-scpsys
> +      - mediatek,mt8196-hfrpsys
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +  reg:
> +    description: Address range of the power controller.

No, look how other bindings do it.

> +
> +  clocks:
> +    description: |

Look at other bindings.

> +      A number of phandles to clocks that need to be enabled during domain
> +      power-up sequencing.

Look at other bindings.

> +
> +  clock-names:
> +    description: |
> +      List of names of clock.
> +
> +  domain-supply:
> +    description: domain regulator supply.
> +
> +  spm:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to the device containing the spm register range.
> +
> +  mmpc:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to the device containing the mmpc register range.
> +
> +  vote-regmap:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to the device containing the vote register range.
> +
> +  mm-vote-regmap:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to the device containing the mm-vote register range.

None of these are correct.

> +
> +required:
> +  - compatible

That's just incomplete.

This binding is really incomplete and with multiple issues. Considering
this was never tested, please first consult some internal folks to do
proper internal review.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/power/mt8196-power.h>
> +
> +    scpsys: power-controller@1c004000 {
> +      compatible = "mediatek,mt8196-scpsys", "syscon";
> +      reg = <0 0x1c004000 0 0x1000>;
> +      #power-domain-cells = <1>;
> +      spm = <&scpsys_bus>;
> +      vote-regmap = <&vote>;
> +    };
> diff --git a/include/dt-bindings/power/mt8196-power.h b/include/dt-bindings/power/mt8196-power.h
> new file mode 100644
> index 000000000000..b0db89cc435d
> --- /dev/null
> +++ b/include/dt-bindings/power/mt8196-power.h
> @@ -0,0 +1,57 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Copyright (c) 2023 MediaTek Inc.

We have 2025.

Best regards,
Krzysztof


