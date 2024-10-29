Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C45DD2AB1C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 10:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUH/rpUCPGOSk8YLeW4XbiRH5XfXa3Tcsoj64v3K+ko=; b=2OrAfEitSMvhldR6f59nctdypE
	ismqAI2lEGj/QtXtKYRMnGi9mTyWqB6miuxfqKRrA9n0H8XrY2+PZt19tsQJyI6fyX4aE2Xqvu3UU
	WYo0MiHkQ/S7+lSMthOO8187kbfBzs/Jbjt3wa2qFFXk5SNegklYfCNXiI4mLCqt9Pz0AkpBsfEQy
	1jgDmOEWGvOY+/zrpyCWTPVSSbQrbSrzsekqQEDHn5TJYpCeQc5OP0zktfRqLjeijEV4p7SkKmfZ1
	MPMo8AYZ5g9W4I4ng3yUoVFKttd8DxssRR21OVte3aEIuquM9q91k2nO4ThsBN4VZFxnAGXVICsIK
	auBOIDSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jfS-0000000E4fr-2CdD;
	Tue, 29 Oct 2024 10:41:42 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jPp-0000000E1h9-2v7Y;
	Tue, 29 Oct 2024 10:25:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB8794000A;
	Tue, 29 Oct 2024 10:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730197527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eUH/rpUCPGOSk8YLeW4XbiRH5XfXa3Tcsoj64v3K+ko=;
	b=l7ztNarw6Olae9y03XSNGT6NuOTvnLXgSjsvasgyAVvwdLNliuiwu7cI+mDPhDiqK/9nzd
	XH5pUsIItxtEdoSzaSOswy8lej4ARU3m1bmjE0z3oObD9TTG4CPEbz4P8bRIrEmMkQsA+D
	J8FFye+ETWgxJEqMWBTHtguSoRFdTADi7DpisIBivWERpRDKLasuV5tn7MteFzCzQbE7Tc
	vpdcKL8MseN+lSqtLFZIoUD89wTaFt1WFVsLRZxYQahGPEqJDBiG1q0n6aPXcU97BFm33h
	QtVPsR9lCJRy4jEihJyst+Zsp9QteKZxqhvqlZ3PBXR9s9vODELGkJvfhTQw3w==
Date: Tue, 29 Oct 2024 11:25:25 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Yashin <dmt.yashin@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: rockchip,rk3308-codec: add port
 property
Message-ID: <20241029112525.50c15b60@booty>
In-Reply-To: <20241028213314.476776-2-dmt.yashin@gmail.com>
References: <20241028213314.476776-1-dmt.yashin@gmail.com>
	<20241028213314.476776-2-dmt.yashin@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_032534_041388_A6F9E47C 
X-CRM114-Status: GOOD (  16.46  )
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

Hello Dmitry,

On Tue, 29 Oct 2024 02:33:12 +0500
Dmitry Yashin <dmt.yashin@gmail.com> wrote:

> Fix DTB warnings when rk3308-codec used with audio-graph-card by
> documenting port property:
> 
> codec@ff560000: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
> ---
>  .../devicetree/bindings/sound/rockchip,rk3308-codec.yaml      | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml b/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
> index ecf3d7d968c8..2cf229a076f0 100644
> --- a/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
> +++ b/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
> @@ -48,6 +48,10 @@ properties:
>        - const: mclk_rx
>        - const: hclk
>  
> +  port:
> +    $ref: audio-graph-port.yaml#
> +    unevaluatedProperties: false

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Also, why not adding a 'port' node to the example below? Can be done in
v2 in case you send one.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

