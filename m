Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D919CC61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 06:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=90mMDivmYLVIhr+/B44twx1FX2pVghFNM7BHpRHGf1o=; b=4wMmMRRR4JGw994MKgZV6dt2j1
	J6tNVmgvln8sJ5vxNUSpBohnFo/kp47NPRClzdpUvtcPN6cTSNZCG8yohvBXLhWU1czpgKPd0wSsp
	Yb/fM64ZF37zguey58SW/5YjF59nXMbauQz7o77uz2qO+wspF0m2QUWcP1T+QhtHhoOe89boIjtpF
	p2IQzfM6NPHl2t1jyPfwhChBEpExLn6vl0cg3m/j5WXry9PJfF776T+DbN2EmAnNQIVgNB7VYL+IW
	Y94kdbdbgZsCVYPwa85eWtmPp5U6e65lUNpNm4CDKV/+jqlK7pLLgB4tjcUjaEnJEJEqwNyCGUry0
	8vAZzHZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1eFI-0000000DqJl-2Zv1;
	Wed, 02 Sep 2026 06:14:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1eFH-0000000DqJf-054Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 06:14:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 67549414D6;
	Wed,  2 Sep 2026 06:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C7A81F000E9;
	Wed,  2 Sep 2026 06:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788329690;
	bh=90mMDivmYLVIhr+/B44twx1FX2pVghFNM7BHpRHGf1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K3oALGCueE9NBlx2SKSN0VucF44Mm7ljVbXvTVDEZUOUOyOJU2GE/yBOMNRNBzh07
	 kEgzSsWyRLs0TI78Ofun4nHMROXzDhyAzcSMkD54PHd3G/JZYjvu/tFUmZ5EFSE+Bc
	 LzhiDDM6+M7daSZc++dHU8ikKCpBB6Q0yUzKDKm7fd8OwgMYrd2/L3YB/mrqUfe3ly
	 Wi4MwITnir7pPF0kJFmKB2lGo28bKl+SX7npxhmVt08BOCgnQfqafu1GIyJcN0Oj5M
	 oLua04+sYbUIlrNkY3JoqQt+aawM12jdfUvp4lEqMYoelUH8vBviYCdQ9fdJdJ7eUr
	 XPs1x3MzQ9sDA==
Date: Wed, 2 Sep 2026 08:14:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, "open list:NXP i.MX CLOCK DRIVERS" <linux-clk@vger.kernel.org>, 
	"open list:NXP i.MX CLOCK DRIVERS" <imx@lists.linux.dev>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT..." <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: clock: imx5: add assigned-clock*
 properties
Message-ID: <20260902-wonderful-tangible-warthog-d927f3@quoll>
References: <20260901193720.1066686-1-Frank.Li@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260901193720.1066686-1-Frank.Li@oss.nxp.com>
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

On Tue, Sep 01, 2026 at 03:37:19PM -0400, Frank.Li@oss.nxp.com wrote:
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

Then the DTS is wrong. If this device does not have a parent clock
input, then assigning clock parents is wrong because it is either
contradictory (you said no parents) or misplaced (clock consumer should
set it).

Best regards,
Krzysztof


