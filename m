Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2CDC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 08:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9CfMRY6C+btqHlTiWd8OIUdZwnsYHsyWiOk41SLPto4=; b=ZcQZwdfcGq9S20mWNj7VHUbfBo
	kUkn4ltSZmmuvsf5EwR2UYIU9y3wlmKcq1Jtsf2f5pdUmOWCmAtvPnl5DhVu4c6GUx2ICM8rHOsvM
	uoX1fsI+n/a5um6n9/43hSZPK+AvBzK1s5IfIOh3h/PGlbX/ZMMjBdC5BmPxU3TI78R399JSQchxs
	Lg6lj8n/KFogNR2BerWN4VREsQ8evK5tOf3IX71sSZG+4IQWrsbgdUVD+mW2SzzCzQsYBQ88kp1Hu
	Zss6lRobaNzBY+LsR8enTEyC4qr1VwhUqxPkWDxSEJcw5vDHdMNR8DINrUep9sma/MbVDNh8q1Vxy
	KamQVehA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Uyr-00000006IuP-2Ent;
	Mon, 07 Sep 2026 08:45:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Uyp-00000006Iu0-3aaS;
	Mon, 07 Sep 2026 08:45:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D308E60052;
	Mon,  7 Sep 2026 08:45:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9101A1F00A3A;
	Mon,  7 Sep 2026 08:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788770730;
	bh=9CfMRY6C+btqHlTiWd8OIUdZwnsYHsyWiOk41SLPto4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aWB61ri4ehlda/B8fFIjk1Hhvy6YOBKytcCVKJtzdcYF9KZU4wgPy0FohmFQhXbB9
	 AF7/YNHVNx9cJ2R4EutlG1zfQ0rg7OfCP1X4AxDpKDiGrjTtqB1COXbbZLG65dAc1D
	 tKFf2QisYr4UEpp0n7n+HFb3PVTepaBorQG/duRx25C+9hySII7MpiIHtwdlX9Fa03
	 d9Km+UGTfesTFLTRefDFUkAZaokSTVlRPrEsRFff1ry8RkfVgjnP3W2eiSnhxu4r7G
	 /dsZ/FZH9lkmC2+OQ/NDsGhz0BF+5Yvk4lI6E9v+NGG1N7Mqlz1d5NjexbZ+b20K0t
	 ZI7X635dRgYgg==
Date: Mon, 7 Sep 2026 10:45:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Frank Li <Frank.Li@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Aswath Govindraju <a-govindraju@ti.com>, 
	Christoph Stoidner <c.stoidner@phytec.de>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-can@vger.kernel.org, linux-phy@lists.infradead.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, sashiko-bot@kernel.org
Subject: Re: [PATCH V4 1/4] dt-bindings: phy: ti,tcan104x-can: Fix property
 constrains
Message-ID: <20260907-debonair-whispering-mule-8eee51@quoll>
References: <20260903080427.6103-1-wahrenst@gmx.net>
 <20260903080427.6103-2-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260903080427.6103-2-wahrenst@gmx.net>
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

On Thu, Sep 03, 2026 at 10:04:24AM +0200, Stefan Wahren wrote:
> Microchip ATA6561 is compatible to TI TCAN1042, so the same property
> constrains should apply. But they use a strict scalar enum match, which
> makes Microchip ATA6561 fallthrough. So add a "contains" to cover also all
> compatibles ones.
> 
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/linux-devicetree/20260902133525.E22DE1F000E9@smtp.kernel.org/
> Fixes: 05ace63d0bcf ("dt-bindings: phy: ti,tcan104x-can: Document NXP TJA105X/1048")
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  .../devicetree/bindings/phy/ti,tcan104x-can.yaml         | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


