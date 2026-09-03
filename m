Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5DEC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 15:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bhTCUaiiZ8A0gGUxDFrs3mg1RzINT0VFaxoNylx2xNU=; b=WeHhlvxMni2nYsLB0SEdvreTuA
	NYfjLuedvfsElap8AWN80V9GpnwlfLpbC7n5yAG9/KyHave5ZEar+t4QR2Gch1W1JsEaJ3/FmG6MH
	dWpkGk1bE0mE2U7zl9ek01C1+aC8ye8sEU0G8mHhh2QMmBcIuiM16YIEKD9d6Y00XGkS3ANvRnRVb
	Gterphh1gLIZmSd7FZGp4vPvG92HsxaC74zD/FlGud3QumQkgBF1vSh2GydZzanUSSslkM6CIhz+E
	0imnTGdGpjR4zGS8Gax/0A1aPOVXxP9iteuM8V5dp491Bg9xiMLKDpbbPUQkPQdzjyh1O17AbfgQL
	WlH3rC/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29nm-0000000045m-1Q2J;
	Thu, 03 Sep 2026 15:56:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29nk-0000000045Z-3xfp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 15:56:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 14F0E6053B;
	Thu,  3 Sep 2026 15:56:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DEB31F000E9;
	Thu,  3 Sep 2026 15:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788450991;
	bh=bhTCUaiiZ8A0gGUxDFrs3mg1RzINT0VFaxoNylx2xNU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=bmf/f666i5KsF1D9J1jgfnJU5WzmYmsn2GVaC3M2Bjo0mBeMEaA7qjVs6ba7A1YWM
	 6inYhBqR5dLgfnB9e+1pczT7b/NF3WOKNrYCvBQaDWQ0lN/fl+auPqqf8aNEfXPqWQ
	 EBvrdKsKPZyfkQi/irV9bdklW2sd+g/z9MUlLUKuw+JXefX6vrmsCmKDyL/124Xgbr
	 50l/wSM2zy+gBOAgej7u/2WKtPLmni+cNVY5aExVPUHZoOKK/jwjGDhfKU9e2M0lHp
	 BPqjbV8hWgjnFyXVbwFUi7/+ps26a90QVw+Pm8WEQAOdTZfgh+3zFA/GjjjM4a/j9C
	 kjOZl7FA9VeTQ==
Date: Thu, 03 Sep 2026 10:56:31 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, 
 devicetree@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-clk@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>
To: Frank.Li@oss.nxp.com
In-Reply-To: <20260901193720.1066686-1-Frank.Li@oss.nxp.com>
References: <20260901193720.1066686-1-Frank.Li@oss.nxp.com>
Message-Id: <178845094493.3613943.7561968637437394338.robh@kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: clock: imx5: add assigned-clock*
 properties
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


On Tue, 01 Sep 2026 15:37:19 -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> The i.MX5 CCM is a pure clock provider with no 'clocks' consumer
> property in its binding. The dtschema framework only merges the
> clocks.yaml meta-schema properties (which include assigned-clocks,
> assigned-clock-parents, and assigned-clock-rates) into a binding
> when the binding itself declares 'clocks:'.
> 
> For example, imx53-m53menlo.dts configures the CKO1 output clock
> by setting assigned-clocks on the &clks node:
> 
>   &clks {
>     assigned-clocks = <&clks IMX5_CLK_CKO1_SEL>, ...;
>     assigned-clock-parents = <&clks IMX5_CLK_AHB>;
>     assigned-clock-rates = <133333334>, <33333334>, <33333334>;
>   };
> 
> Without explicit declarations this triggers a dtbs_check error:
>   arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dtb: ccm@53fd4000 (fsl,imx53-ccm): 'assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
> 
> Assisted-by: Claude:claude-sonnet-4.6
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/clock/imx5-clock.yaml        | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/imx5-clock.yaml: properties: 'clocks' is a dependency of 'assigned-clocks'
	from schema $id: http://devicetree.org/meta-schemas/clocks.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260901193720.1066686-1-Frank.Li@oss.nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


