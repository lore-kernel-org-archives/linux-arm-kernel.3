Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDCFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 07:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ego/7LbmgWSlrLqYIjxRn2UqzB3UfTmZ5YmdwHmyy0Y=; b=ha7um5NJSi8TZ4WjN+rnqSTrBI
	fpIdp5P1sM7gxr8qJGBV1vo1nxvCHBztUuzXt3dS9rGR2Qw62nGRvrU8cYJZdaC9gIjA2W49XDx4M
	bP0KTSfj6kQdkMQEOZya2l+bf8Vn0wfSLCmCzAfHDETdtuhT7Q8mF2fqs7ma/6J8fNz7PKVk85cb/
	bIfachHOvZz152HrZR89b6y1W5bu9WdjJrasfIs9yQb1Ce0AZ6QPh4tcxweDxevc7nL1TxvZqqu79
	eu16ptfq8g7w4okzuvarj92NyAtoTOnssw1jluxu/9YC2C6RCmKTpk4xJBYgVAUb5sdTYTZLEL9QT
	A5fKV6tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUhdc-00000000Pr3-2E5C;
	Mon, 06 Jan 2025 07:35:00 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUhcQ-00000000Phn-1GZm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 07:33:47 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tUhcH-0003uU-Dy; Mon, 06 Jan 2025 08:33:37 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tUhcF-0077qE-2M;
	Mon, 06 Jan 2025 08:33:36 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tUhcG-00060I-1P;
	Mon, 06 Jan 2025 08:33:36 +0100
Message-ID: <2b04ca7fa5135c1194c39a9fbf2d6ab5630d6ef3.camel@pengutronix.de>
Subject: Re: [PATCH 1/1] phy: rockchip: naneng-combphy: compatible with old
 DT for RK3568
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Chukun Pan <amadeus@jmu.edu.cn>, Vinod Koul <vkoul@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Kishon Vijay Abraham I
 <kishon@kernel.org>,  Jianfeng Liu <liujianfeng1994@gmail.com>,
 linux-arm-kernel@lists.infradead.org,  linux-rockchip@lists.infradead.org,
 linux-phy@lists.infradead.org,  linux-kernel@vger.kernel.org
Date: Mon, 06 Jan 2025 08:33:36 +0100
In-Reply-To: <20250106070000.605284-1-amadeus@jmu.edu.cn>
References: <20250106070000.605284-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_233346_355287_E9EA8FD1 
X-CRM114-Status: GOOD (  14.89  )
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

On Mo, 2025-01-06 at 15:00 +0800, Chukun Pan wrote:
> The device tree of RK3568 did not specify reset-names before.
> So add fallback to old behaviour to be compatible with old DT.
>=20
> Fixes: fbcbffbac994 ("phy: rockchip: naneng-combphy: fix phy reset")
> Cc: Jianfeng Liu <liujianfeng1994@gmail.com>
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers=
/phy/rockchip/phy-rockchip-naneng-combphy.c
> index a1532ef8bbe9..372f5c07b5bd 100644
> --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> @@ -325,6 +325,10 @@ static int rockchip_combphy_parse_dt(struct device *=
dev, struct rockchip_combphy
>  	priv->ext_refclk =3D device_property_present(dev, "rockchip,ext-refclk"=
);
> =20
>  	priv->phy_rst =3D devm_reset_control_get(dev, "phy");

This should be devm_reset_control_get_exclusive().

> +	/* fallback to old behaviour */
> +	if (IS_ERR(ERR_PTR(priv->phy_rst)))

Drop superfluous ERR_PTR().

> +		priv->phy_rst =3D devm_reset_control_array_get_exclusive(dev);
> +

I'd drop the empty line, keep error handling close.

>  	if (IS_ERR(priv->phy_rst))
>  		return dev_err_probe(dev, PTR_ERR(priv->phy_rst), "failed to get phy r=
eset\n");
> =20

regards
Philipp

