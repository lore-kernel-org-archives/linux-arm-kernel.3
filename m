Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6C1D44D78
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 14:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CA2vIBemzjnd2BMiveFteBT32BnqzsjYQDCA9tW3z/s=; b=f1HFtjtciG/tWk0p/mnkDEZV4g
	UAsh0Zs1jmL7uMlYMgSDXRrrwkW7GZDjKjKXNrdmLmxvnuN8CQX+mxHMijBB6gmyyIoPNFBojwSnQ
	+3BmKGeo2g5XIKbOqQ57NGj5z1VZeQLMALDMbNHkthWEr+dccYJN/Cq1OMwMsbA+gwSRgXKuTzyeb
	OKfVPkUsmuS0l74DkjgDaWjxPUWvNSO0vZ8LFBSan5C4tIGr20NTtrROxMYw9r42h3tGCKNwV/l3w
	eRVQDxRkRU3Bnir0CjUBpwIkOeYQWRudiaexCciG5qP3NWlXp/VkIuyYQE8h5nTPizF03vib55MrL
	QHEdN7RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gw4-00000003aRb-0y5v;
	Wed, 06 Nov 2024 14:23:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gk6-00000003Y1l-2YpL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 14:10:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4B48B5C580B;
	Wed,  6 Nov 2024 14:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09C0AC4CEC6;
	Wed,  6 Nov 2024 14:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730902241;
	bh=hR+M/12mz686XDw6qw79yyMcaey3EbYKRvazPCDOwQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oxK/9pf0bxWdLwkJ0XFrOHc/8z9aGFghLqiMYid+PmJ4KUJHrrf9hchG0UZuKR5sS
	 JTk4Vhwpmmz2AcIrmkWeogxx/hS1lMNYA5JUMklzJnjthm016pojlcdRNdL66S9W4C
	 WI0+4LoX0k54++97cUt9QpSVWeHEVHV4EsxZ4Cxr8iikxOv326+hzoeNoX8VsJl+nK
	 uI4Ex2g18XPIbmhCvqt+R7VmC9DB3+Ms07DkgrDg7lIqG3k2bgaY8VLMDWj3/d4S4s
	 36j9fSScrodXntyF7oIqtADJOkp26IMc2WYrgHaPQKNvbYgA3Z7spI2wV0j0abOVe/
	 yKJ9lMPNwvqaA==
Date: Wed, 6 Nov 2024 15:10:38 +0100
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
Subject: Re: [PATCH v3 1/8] dt-bindings: clock: imx8m-clock: support spread
 spectrum clocking
Message-ID: <4bix7me5vaoyhcuffyp4btajmhy7no6ltczoesopaz2fqupyaw@fensx4nn472u>
References: <20241106090549.3684963-1-dario.binacchi@amarulasolutions.com>
 <20241106090549.3684963-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241106090549.3684963-2-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_061042_758804_2E049DAE 
X-CRM114-Status: GOOD (  20.76  )
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

On Wed, Nov 06, 2024 at 09:57:57AM +0100, Dario Binacchi wrote:
> The patch adds the DT bindings for enabling and tuning spread spectrum
> clocking generation.

We had long talks about this but nothing of it got reflected in commit
msg. Sorry, I don't remember what I was talking in some particular patch
month ago, so you will get the same questions over and over...

> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> Changes in v3:
> - Added in v3
> - The dt-bindings have been moved from fsl,imx8m-anatop.yaml to
>   imx8m-clock.yaml. The anatop device (fsl,imx8m-anatop.yaml) is
>   indeed more or less a syscon, so it represents a memory area
>   accessible by ccm (imx8m-clock.yaml) to setup the PLLs.
> 
>  .../bindings/clock/imx8m-clock.yaml           | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> index c643d4a81478..7920393e518e 100644
> --- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> @@ -43,6 +43,40 @@ properties:
>        ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8m-clock.h
>        for the full list of i.MX8M clock IDs.
>  
> +  fsl,ssc-clocks:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      Phandles of the PLL with spread spectrum generation hardware capability.
> +    minItems: 1
> +    maxItems: 4

1. How is it possible that you change spread spectrum of some clocks from
main Clock Controller, while this device is not a consumer of them?
Basically this means that this device does not have these clocks but yet
you claim that it needs to configure spread for them! It's contradictory
to me and nohing got explained in commit msg about it. I am pretty sure
I asked about this alrady.

2. Why is this array flexible in size?

Best regards,
Krzysztof


