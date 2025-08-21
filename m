Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F65CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 03:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tb8e0CR/ydJrs1t/dJf2jgHph7OREPV6Ltpy5bUBXXY=; b=X8TuN05FaU5Eh5RtCF0QItg9Ry
	mnFW4fEkELKDbYu03MDLTAjzFE2BV+dWSIE+3pYDs0vSCirgNtLdi9St75sUMpmKBQcVXY5NiEiTj
	YGrYPQT5B9P55CcK81QvIo/MkwTWxTb1wTktMIV2u6bpttGFQ0WC8sCBzZrLaj5eijd0BCutwxUTD
	afBU8vXP01TGMIZyFwMoB+Zt/9KLCyDtAfnsZ1GIhLHbYUeGO7L9Lr/V9eLqgH3t+bPzjhATNDJc8
	neOIjkATMoyl/jl5Qk95bC4s16QAx+PRRqfSLDtSDUc5KGrK8l7dfcQiiFj5WcSRbF25EbMnWmy6f
	Z01nhRMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow7V-0000000FdVC-0sj1;
	Thu, 21 Aug 2025 03:37:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uosnq-0000000FGYf-33gc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 00:05:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B875961446;
	Thu, 21 Aug 2025 00:05:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FAADC4CEE7;
	Thu, 21 Aug 2025 00:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755734713;
	bh=kY59dBGs2b/EU/KUmv+t2CeakTULFTJdXbGvcFE56w0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cnZj5otKrJ1oWJNP2HqcplhNg3fAJgUN6Xf5vVWSCewVBUlryPq/qvhU0os4PPYF1
	 xaTLOuQ7sGjYliC+9MxZwygs2bZvWrAhDUsYhOfbbsaOvODYfWsl5WXNhZV4bnKK1D
	 VOiFhhgefyJzkBJciEj9hstQcso2ldHodQVuFG+iVMzk41bo4Nxzh6hna/ktAUbFf8
	 A8AtuTYoYKYjuLC8Q2OdlGS//MoSyUhCflhQg5Q6264gUprlqbndV6Szhg6nbh+UxD
	 0Yyh5qEFFUvxd3M6l7WDmYQCnV0it9qTjr1rtwlNod1Bi/nF6VI6p/mEmGWz+pBOjb
	 O3Oy2chgxezXw==
Date: Wed, 20 Aug 2025 19:05:12 -0500
From: Rob Herring <robh@kernel.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: geert+renesas@glider.be, magnus.damm@gmail.com, mturquette@baylibre.com,
	sboyd@kernel.org, rafael@kernel.org, daniel.lezcano@linaro.org,
	rui.zhang@intel.com, lukasz.luba@arm.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, p.zabel@pengutronix.de,
	catalin.marinas@arm.com, will@kernel.org, john.madieu@gmail.com,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	biju.das.jz@bp.renesas.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 2/6] dt-bindings: thermal: r9a09g047-tsu: Document the
 TSU unit
Message-ID: <20250821000512.GA1748772-robh@kernel.org>
References: <20250818162859.9661-1-john.madieu.xa@bp.renesas.com>
 <20250818162859.9661-3-john.madieu.xa@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818162859.9661-3-john.madieu.xa@bp.renesas.com>
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

On Mon, Aug 18, 2025 at 06:28:48PM +0200, John Madieu wrote:
> The Renesas RZ/G3E SoC includes a Thermal Sensor Unit (TSU) block designed
> to measure the junction temperature. The device provides real-time
> temperature measurements for thermal management, utilizing a single
> dedicated channel (channel 1) for temperature sensing.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
> 
> Changes:
> 
> v1 -> v2:
>  * Fixes reg property specifier to get rid of yamlint warnings
>  * Fixes IRQ name to reflect TSU expectations
> 
> v2 -> v3:
>  * Removees useless 'renesas,tsu-operating-mode' property 
> 
> v3 -> v4:
>  * Fixes commit message
>  * Fixes interrupt description
>  * Removes trip point definition
> 
> v5: no changes
> v6: no changes
> v7: Adds documentation for 'renesas,tsu-trim' and removes Rb tag from Krzysztof
>     due to this change
> 
>  .../thermal/renesas,r9a09g047-tsu.yaml        | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml b/Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
> new file mode 100644
> index 000000000000..70d2af6fcd78
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/renesas,r9a09g047-tsu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/G3E Temperature Sensor Unit (TSU)
> +
> +maintainers:
> +  - John Madieu <john.madieu.xa@bp.renesas.com>
> +
> +description:
> +  The Temperature Sensor Unit (TSU) is an integrated thermal sensor that
> +  monitors the chip temperature on the Renesas RZ/G3E SoC. The TSU provides
> +  real-time temperature measurements for thermal management.
> +
> +properties:
> +  compatible:
> +    const: renesas,r9a09g047-tsu
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Conversion complete interrupt signal (pulse)
> +      - description: Comparison result interrupt signal (level)
> +
> +  interrupt-names:
> +    items:
> +      - const: adi
> +      - const: adcmpi
> +
> +  "#thermal-sensor-cells":
> +    const: 0
> +
> +  renesas,tsu-trim:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to system controller
> +          - description: offset of trim registers
> +    description: |

Don't need '|' and wrap at 80 char.

> +      Phandle and offset to the system controller containing the TSU
> +      calibration trim values. The offset points to the first trim
> +      register (OTPTSU1TRMVAL0), with the second trim register
> +      (OTPTSU1TRMVAL1) located at offset + 4.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets
> +  - power-domains
> +  - interrupts
> +  - interrupt-names
> +  - "#thermal-sensor-cells"
> +  - renesas,tsu-trim
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/renesas,r9a09g047-cpg.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    tsu: thermal@14002000 {

Drop unused labels.

The prefered node name is 'thermal-sensor'.

With those,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

