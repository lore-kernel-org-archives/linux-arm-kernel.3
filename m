Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C57C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 07:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZU+qEp31INqVDPacGnXWWEFCo7yA2+DUjsY1iwZJ0o=; b=fPU42OKVqqNeqym6aotN90gUl/
	7/n+i9vR/2gg6HKI16V8kbBf8AmnPMtT1yG2Ll4k2RSrmY2sODGr6qCdRQChfn+e9QFzOPeYb/n9+
	cZTH5b0FUYl7p0H0Wiove2wJ0UoWQ6KFPu4ZuiuOElgJwzPz+M67dDRko/t9c/jcQJgUY7zAtBcUq
	pAiabIdp21NJOIIdZDrejla4G8s2NGO6cLV/7XV9lDmelP3eDH1ZGU4uao6qCoyxu7iCOIKA1sBAM
	+guNnyR1leLbxhQpjGTtEsbFnTAFcokh1CwfV115luR8zzxFlQ16Y7MTIi/WicXe5+tdJHQDHjAjl
	eDOPxejw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujBuX-0000000C0HM-1DPY;
	Tue, 05 Aug 2025 07:16:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujBi4-0000000ByuT-2i1X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 07:03:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CFECDA55BFF;
	Tue,  5 Aug 2025 07:03:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D7C0C4CEF6;
	Tue,  5 Aug 2025 07:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754377423;
	bh=yXD8h9EgHiHTH4CdVRohSkHvzdSIIfetCc8/xZomUnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cLZgX9wSoU3mzbpD35QgvO/nbft/KXCcOOBwcItVpEgiNKmsu0tMBCnTBThyOcmQY
	 SAcLH1FpcB/x/hucxJRD9W8j0tMQQvMrKUIsgNgKCc25sMEnIU/i90EcSA069ZQEiY
	 T1oohSzDMmYoK+D8qnuccfHDBOaIj7ZTobX8tQ2U6jndSnp+SbxEnvxh/nwz5JqcSc
	 SK9N6dLnROh1I4BY6o0CIBS45FEEOaO8jNndXRGi5Q9y5C16bxUBNbI3szKvSLQVzF
	 7q11K9L3JHihrF7IDCHyrXCOuVcw90RMhHbjwRWqfuBKQx3fkzRCmYlaW6c8EjNN+x
	 +8vacZuT3nMIA==
Date: Tue, 5 Aug 2025 09:03:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 3/7] dt-bindings: clock: document 8ULP's SIM LPAV
Message-ID: <20250805-stereotyped-precise-vicugna-1c78ff@kuoka>
References: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
 <20250804155407.285353-4-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250804155407.285353-4-laurentiumihalcea111@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_000344_852850_96A0FB75 
X-CRM114-Status: GOOD (  17.48  )
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

On Mon, Aug 04, 2025 at 11:54:03AM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add documentation for i.MX8ULP's SIM LPAV module.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  .../bindings/clock/fsl,imx8ulp-sim-lpav.yaml  | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml b/Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
> new file mode 100644
> index 000000000000..ef44f50921f8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/fsl,imx8ulp-sim-lpav.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX8ULP LPAV System Integration Module (SIM)
> +
> +maintainers:
> +  - Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> +
> +description:
> +  The i.MX8ULP LPAV subsystem contains a block control module known as
> +  SIM LPAV, which offers functionalities such as clock gating or reset
> +  line assertion/de-assertion.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,imx8ulp-sim-lpav
> +      - const: syscon

Why is this syscon?

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: lpav_bus
> +      - const: hifi_core
> +      - const: hifi_plat
> +
> +  '#clock-cells':
> +    const: 1
> +    description: clock ID

Drop description, redundant. Look how other bindings write this.

> +
> +  '#reset-cells':
> +    const: 1
> +    description: reset ID

Ditto

> +
> +  mux-controller:
> +    $ref: /schemas/mux/reg-mux.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'

reset cells and mux controller.



> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8ulp-clock.h>
> +
> +    clock-controller@2da50000 {
> +        compatible = "fsl,imx8ulp-sim-lpav", "syscon";
> +        reg = <0x2da50000 0x10000>;
> +        clocks = <&cgc2 IMX8ULP_CLK_LPAV_BUS_DIV>,
> +                 <&cgc2 IMX8ULP_CLK_HIFI_DIVCORE>,
> +                 <&cgc2 IMX8ULP_CLK_HIFI_DIVPLAT>;
> +        clock-names = "lpav_bus", "hifi_core", "hifi_plat";
> +        #clock-cells = <1>;
> +        #reset-cells = <1>;

Incomplete node - missing properties/child. Post complete binding and
complete example.

Best regards,
Krzysztof


