Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EECC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 10:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0SZDMdEL3wailr7iYPimEL4M/TZgd/cJ52z5FbRtbJM=; b=LFCYvvMSa7mDyjOgFHkGZ63djG
	Ai5M5b3+VTcyKME4kqN7t6BmRGWAMxIwbv4/nup4bSKlPHcT6Sh9DfItZSQt6rYQ2LvGXT+31dole
	riItadtLZ6m44rbCLpYuf7nsNxPNx/fUnkR/inc9paanK5u2dqmZWodzqK0vNp3u45N5XyxQyeI1T
	3kwumldUga8VkAqXaYBPS7YfAX0Vx9s47sIE3vLG+aGycJevnVYmByeXHGlVvQmmQS/Z6ggZq6018
	jvpkZHg/n34YD7ae7UJ4ZPQLx1bwPSxqFZas0d+teRI6iymGeJPP3mY30OQgGHzLyo/RzdYs2Q8wC
	AeQTL9MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggfd-0000000CEVo-1IdT;
	Mon, 06 Jul 2026 10:35:25 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggfX-0000000CEV7-1dbk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 10:35:23 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id DD5C0201544;
	Mon, 06 Jul 2026 12:35:14 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wggfS-000OQS-2e;
	Mon, 06 Jul 2026 12:35:14 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wggfS-00000000BL5-32JF;
	Mon, 06 Jul 2026 12:35:14 +0200
Message-ID: <4030fdf119191dfe38618b8057090c710a45880d.camel@pengutronix.de>
Subject: Re: [PATCH v5 2/5] thermal/drivers/sun8i: replace
 devm_reset_control_get to devm_reset_control_get_shared_deasserted
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Mikhail Kalashnikov <iuncuim@gmail.com>, Vasily Khoruzhick	
 <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, "Rafael J .
 Wysocki"	 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Zhang Rui	 <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob
 Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec	 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Mon, 06 Jul 2026 12:35:14 +0200
In-Reply-To: <20260704171411.1413349-3-iuncuim@gmail.com>
References: <20260704171411.1413349-1-iuncuim@gmail.com>
	 <20260704171411.1413349-3-iuncuim@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_033522_312054_AD049532 
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

On So, 2026-07-05 at 01:14 +0800, Mikhail Kalashnikov wrote:
> The A523 processor has two temperature controllers, but they share a
> common reset line. Make it shared with the shared variant of
> devm_reset_control_get(), and also simplify the driver by switching to
> devm_reset_control_get_shared_deasserted().
>=20
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  drivers/thermal/sun8i_thermal.c | 16 +---------------
>  1 file changed, 1 insertion(+), 15 deletions(-)
>=20
> diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_ther=
mal.c
> index 226747906..df0c26970 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c
> @@ -342,11 +342,6 @@ static int sun8i_ths_calibrate(struct ths_device *tm=
dev)
>  	return ret;
>  }
> =20
> -static void sun8i_ths_reset_control_assert(void *data)
> -{
> -	reset_control_assert(data);
> -}
> -
>  static struct regmap *sun8i_ths_get_sram_regmap(struct device_node *node=
)
>  {
>  	struct platform_device *sram_pdev;
> @@ -389,19 +384,10 @@ static int sun8i_ths_resource_init(struct ths_devic=
e *tmdev)
>  		return PTR_ERR(tmdev->regmap);
> =20
>  	if (tmdev->chip->has_bus_clk_reset) {
> -		tmdev->reset =3D devm_reset_control_get(dev, NULL);
> +		tmdev->reset =3D devm_reset_control_get_shared_deasserted(dev, NULL);

Nothing wrong with your patch, but why is this stored on struct
ths_device at all? It's never used. You could turn this into a local
variable while you're at it. Either way,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>


regards
Philipp

