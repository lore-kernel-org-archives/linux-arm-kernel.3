Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D133E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 10:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljyxNh9V8BptPsl0mXhQM1r10JcpyThssWua67feXQU=; b=URlWcmeFOFH9qyf/fDNK56GOuD
	wlLSm453lBIoBYP0IxgK3CSXMoNfOcq821q1ktTeHXOAg8U3XF6l+33aqfXTep1KdY4j0lER5qPNA
	7u/LIAXibQucm1IW8NEWB7wVcXlnU3OyoXnUrlT2m/tYKVx41wi2rZsMHhEoYgEgiYFN9waevhwGH
	m/oCAOVgY+37Zr2TWEiSsjf7t0Op7oA12cYF9HwAlPbx6lkzddUKSn9/rdNsgBBOA9/1rXVMvdxQp
	jAfCH7TCDB/lqowONzONlio6MPvd8QdDi6mj/ehZiJ4nTtoua37b68tQiLoywo0nkV2b9uTpWPos3
	4tgdo+eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRqYf-00000003GU4-2J9V;
	Sun, 29 Dec 2024 10:30:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRqXT-00000003GLQ-2JmH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Dec 2024 10:28:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 08DAAA40B66;
	Sun, 29 Dec 2024 10:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90694C4CED1;
	Sun, 29 Dec 2024 10:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735468130;
	bh=ig4iN1Yr9gJWPJqwhCorg9Cn3LvqNba//d1GZVxk2TU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NRReA6gAA8A2Q9nv9sACUKVAbYDprVe5i53s/cPkX6ioODKCFKnGUsuRCpuQAfDaw
	 uVfCj1/fZA9r8vq+2FakhM+ugIS+G7cyEG1DCTysYa01fp4c6r3C544gCmrELe4xku
	 /f1COgf+Hgby3zxI2VbSecF16nwEcaHQ9BKonC5qLaYPUc4uiDetr9lLGsVYETpzC4
	 MnNCy3GiZLWYmRD8UMMF+XA2mKSWhv9gUHpBoyUsSz4SCD61H5UnVJ+qVd1JH0b+Al
	 32Df9qz/AL3KDt6FWWJAUSH+yVMlyNCNk/S4owAdbkDcqNBVXCgeHkGu1RArpSySu2
	 seeHmR8btxPcw==
Date: Sun, 29 Dec 2024 11:28:47 +0100
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
Subject: Re: [PATCH v7 10/23] dt-bindings: clock: imx8m-clock: add phandle to
 the anatop
Message-ID: <rua4s52moqfxxv7qozs2ef4os4huyfsb3knhfzdwxl6rjo4noh@atq6ipuwj7xd>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
 <20241227165719.3902388-11-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241227165719.3902388-11-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_022851_663509_C6213A91 
X-CRM114-Status: GOOD (  21.23  )
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

On Fri, Dec 27, 2024 at 05:56:13PM +0100, Dario Binacchi wrote:
> Adding the phandle to the anatop node will break the ABI but will allow
> for a better description of the clock generation hardware, making the
> dependency of CCM on anatop explicit. Indeed, the CCM receives the PLLs
> generated by anatop as inputs, which, together with the oscillators,
> are used to generate the clocks for the on-chip peripherals.

I don't get this. If this device (CCM?) receives PLLs, then these are
clock inputs, not a phandle.

> 
> By doing this, it will also be possible to generalize the CCM driver
> code, which will no longer require the platform's compatible string to
> retrieve the anatop device node.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> Changes in v7:
> - New
> 
>  .../devicetree/bindings/clock/imx8m-clock.yaml         | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> index c643d4a81478..b23e639e6389 100644
> --- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> @@ -43,12 +43,20 @@ properties:
>        ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8m-clock.h
>        for the full list of i.MX8M clock IDs.
>  
> +  fsl,anatop:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle to the anatop module that outputs the PLLs, which,
> +      along with the oscillators, are used to generate the clocks for
> +      the on-chip peripherals.

Explain how this is used by this device. If the explanation is "PLLs",
then it is wrong: PLLs are clock inputs.

Best regards,
Krzysztof


