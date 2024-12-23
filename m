Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0B4E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 15:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5v/oiowpogDGRlN7aLw9L9PluDLjTqX6GkTr9UAVa8=; b=A+op4iCpk6FD7saRGgMf/Kv4MP
	AljoNvAjaGtR80jM+9GkBriFW2ignsU9mJ7KukmGxFkY0cCQSzORR61X/SROPS+Mup5Pn/6IOVkyO
	HaGgzCBVo64pEWb+S11sr5IzIcY40zpTUVxExHGh4Vks+WaL3FPO0CXvfwhZvNQbMCNtJgRYkaHsu
	ZBeeHB7ssbteoP97kbxaO+9N/G9XrnpKxtoJf22bGf/QJ/+iVFK9uOrr9X8/qs8rqBPiqINwVXPUy
	tt402zy8Y8rPGC14lPwQI3KasOznQVz6q4wQWmGcniw0pnE9lEIuDHFdsXSMpNNAWuJEj4pa38SRe
	ymflS1ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPk0s-0000000AFhc-424b;
	Mon, 23 Dec 2024 15:06:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPjzh-0000000AFYO-1198
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 15:05:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 65E885C5756;
	Mon, 23 Dec 2024 15:04:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44250C4CED3;
	Mon, 23 Dec 2024 15:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734966315;
	bh=ZSFSwUdh17PN8qMjBCNnNMp0UkGdSy9sZ8jzplMgCQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AycW+0EqnqWDzlGESOVYSlQ+ZtaDgzzSFgvuEUFZyg37B4/fZ7MpaJE+gEcLbdqX/
	 2LpYBzxFt/oGXl6tf2BL0eXQHXgcf7GAbcydecaIuyTRO91nYUCsAn2/cjKlYMONPS
	 CX9zioBfB6F7I+rzgxCF4xplmupmq6vfYJGp/PjpO31/27JgPnh80LH0AJcy4phs2D
	 2aMpCl1JdWOzUGYyuQanmKVIg57dmuQpX8Re/ZSs9wAmIz+DRq0nUibpEyLZdKHwfY
	 IMUS1sI+5WsuDA6dgcl/gP02SW2JgICDlBT6x3HJ3R2rkvwGVs3hj0I/U70YGGrR6u
	 jrMjDFrt3hPFg==
Date: Mon, 23 Dec 2024 16:05:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 16/18] dt-bindings: clock: imx8m-clock: support spread
 spectrum clocking
Message-ID: <mne4dgxr2yl2gpzk2mzf7gcqynqupmqa6q6ibb6pa5xtao47sl@ylv2mhwboyzn>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
 <20241222170534.3621453-17-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241222170534.3621453-17-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_070517_373306_CDF3806D 
X-CRM114-Status: GOOD (  24.10  )
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

On Sun, Dec 22, 2024 at 06:04:31PM +0100, Dario Binacchi wrote:
> The addition of DT bindings for enabling and tuning spread spectrum
> clocking generation can be applied specifically to the PLLs.
> 
> The "" value for the fsl,ssc-method property is specifically intended to
> specify a "no SSC" case, as in the example, when you don't want to
> configure spread spectrum for one of the PLLs, thus avoiding the use of
> a method that would only make sense if SSC were being set.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> Changes in v6:
> - Improve the commit message
> - change minItems from 7 to 1 for all the ssc properties added
> - change maxItems from 10 to 4 for alle the ssc properties added
> - update the DTS example
> 
> Changes in v4:
> - Drop "fsl,ssc-clocks" property. The other added properties now refer
>   to the clock list.
> - Updated minItems and maxItems of
>   - clocks
>   - clock-names
>   - fsl,ssc-modfreq-hz
>   - fsl,ssc-modrate-percent
>   - fsl,ssc-modmethod
> - Updated the dts examples
> 
> Changes in v3:
> - Added in v3
> - The dt-bindings have been moved from fsl,imx8m-anatop.yaml to
>   imx8m-clock.yaml. The anatop device (fsl,imx8m-anatop.yaml) is
>   indeed more or less a syscon, so it represents a memory area
>   accessible by ccm (imx8m-clock.yaml) to setup the PLLs.
> 
> Changes in v2:
> - Add "allOf:" and place it after "required:" block, like in the
>   example schema.
> - Move the properties definition to the top-level.
> - Drop unit types as requested by the "make dt_binding_check" command.
> 
>  .../bindings/clock/imx8m-clock.yaml           | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> index 05bc01960045..37cc6a6e89d4 100644
> --- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> @@ -43,6 +43,37 @@ properties:
>        ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8m-clock.h
>        for the full list of i.MX8M clock IDs.
>  
> +  fsl,ssc-modfreq-hz:
> +    description:
> +      The values of modulation frequency (Hz unit) for each clock
> +      supporting spread spectrum (i. e. audio_pll1, audio_pll2,
> +      dram_pll and video_pll).
> +    minItems: 1
> +    maxItems: 4

Please list the items. You rely here on this being in strict order, so
this should be explicit, instead of just "in example" in the
description.

items:
  - description: audio_pll1

> +
> +  fsl,ssc-modrate-percent:
> +    description:
> +      The percentage values of modulation rate for each clock
> +      supporting spread spectrum (i. e. audio_pll1, audio_pll2,
> +      dram_pll and video_pll).
> +    minItems: 1
> +    maxItems: 4

Ditto

> +
> +  fsl,ssc-modmethod:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description:
> +      The modulation techniques for each clock supporting spread
> +      spectrum (i. e. audio_pll1, audio_pll2, dram_pll and
> +      video_pll).

I guess here listing items might not work, so:

  The modulation techniques for each clock supporting spread
  spectrum, in this order: audio_pll1, audio_pll2, dram_pll and video_pll

Everything looks good for me, so with above changes:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


