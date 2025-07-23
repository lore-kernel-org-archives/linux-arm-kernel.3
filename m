Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697B2C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 14:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZlV9rLMS+m6cSWh+Dn0/WPmoMhwq987guplhp1MndGc=; b=QfRksEpnxTgwMWMmCmpYNDgdD0
	nvVePoc6+JC7YngG1X8i+tMSldiuMoJu5ZvLaa/l4pIo0FFnhF1ahO3WnSz45bM1CfWsE3da4KeiI
	7ObH3Enm0vK4AqQnDGfN4dv4Be0iOhEsxW7gTWGyxZRoBO32Lp4dKYiwP8Kz6URzVFywlNwse4SQl
	XwA+2ugB9EV0sOhuZFwlndZaIpAaTPgefs3RZgQS2lqJyaKn3O9B84k+nKkowNS7064xVAP4eomVS
	aVIvOQnrQwl69aNB5pEnnHGAikbOx2WrMLEgMwZbwehSw9NpPGncwabAqh+Bx/VgymoqGeAvCb/yc
	VK+TttUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueaZC-00000005DWR-1m6I;
	Wed, 23 Jul 2025 14:35:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueZoJ-0000000567J-2fk2;
	Wed, 23 Jul 2025 13:47:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A8A93601D7;
	Wed, 23 Jul 2025 13:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A99C4CEF1;
	Wed, 23 Jul 2025 13:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753278426;
	bh=Px8gBix96tpJXZzdaFnoa/DdcC+iaCFv0QakGJFoD4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JwamNn4BoaqZcQV4LZoAtTCdgd5OPftSTu2rR5gNkOGdFAdazCFAgmaZfxl6+Jxv6
	 VYWmsNhSJtG56LNFRz3TCG/19X+dJk0aSwN3fr4jUFL0qqx+EhN1G/RYBBOrd11N1C
	 DSJ9pSzZoseMtHdTzFGzgHo30nyO65+6UyPEpgaflDwHFyTlDcOpi9CcJjvNmajc+T
	 6JGc2OdvDG1Y/3Ma7536Ke6KLNXQuqXnkuRzfdeZbjFoE478L2gmCtdbGsEXcHNe1l
	 xvRZECH4gaaf7SNbTi/RtIcpos463/CzivhfAikaRiaFauEP3Gma4JoKbwNGp/VJXz
	 u1Qx2NtfDr0BQ==
Date: Wed, 23 Jul 2025 08:47:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Yao Zi <ziyao@disroot.org>, Chukun Pan <amadeus@jmu.edu.cn>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-gpio@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: gpio: rockchip: Allow use of a
 power-domain
Message-ID: <175327842469.2144459.7995862129200440475.robh@kernel.org>
References: <20250723085654.2273324-1-jonas@kwiboo.se>
 <20250723085654.2273324-2-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723085654.2273324-2-jonas@kwiboo.se>
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


On Wed, 23 Jul 2025 08:56:43 +0000, Jonas Karlman wrote:
> The GPIO controllers in most Rockchip SoCs are part of power domains
> that are always powered on, i.e. PD_BUS or PD_PMU. These always powered
> on power domains have typically not been described in the device tree.
> 
> Because these power domains have been left out of the device tree there
> has not been any real need to properly describe the GPIO controllers
> power domain.
> 
> On RK3528 the GPIO controllers are spread out among the described
> PD_RKVENC, PD_VO and PD_VPU power domains. However, one GPIO controller
> belong to an undescribed always powered on power domain.
> 
> Add support to describe an optional power-domains for the GPIO
> controllers in Rockchip SoCs.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> v2: Update commit message
> ---
>  Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


