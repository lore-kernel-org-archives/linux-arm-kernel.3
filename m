Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0C6C53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 08:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sVSjfAUIt9PKCQrYkQQ+sZ/X6Y4rdmN3ivPK6kPvsmw=; b=MJ+fq4Pnlv9/oQsAulp6L4Sz1V
	/HNoVzNNJYSHv8W6OHjJYThiRxPLYAliLMGV4B3zqpf1ep6U/3smqaMC7ggAHwzKHeVnZpJhlghR8
	IvMXWfpnUHCbfDDIy8kmhvxjWSFP1PZt0NKrxLerRjIPRv+AMfVSmb1sE4P1l88YtFcEn783emWNG
	YekcgNrYgZ2ClnOpZXQHHUeDnuFD/JlEcUw4qRY3VehhsxLLlIBGeAd9jCXrwGWnxBc/sh9s2ABWW
	68xbhVdz6krAwkXn+7Ba53vmMNnMoqtpCQTEJ8/+JcPvvrh6TNxjMvwCguCkNigj4iufAegSpW3L+
	j3x5gZ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGIS-00000002C6m-2dk5;
	Mon, 27 Jul 2026 08:02:48 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGIO-00000002C6H-3w93;
	Mon, 27 Jul 2026 08:02:46 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 88EAF202055;
	Mon, 27 Jul 2026 10:02:42 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1woGIM-001VP2-1U;
	Mon, 27 Jul 2026 10:02:42 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1woGIM-000000007n2-1U0y;
	Mon, 27 Jul 2026 10:02:42 +0200
Message-ID: <d19b673bba6cfb5c9634510ba742021a7135f6c0.camel@pengutronix.de>
Subject: Re: [PATCH net-next v9 11/12] net: pcs: airoha: add PCS driver for
 Airoha AN7581 SoC
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Christian Marangi <ansuelsmth@gmail.com>, Andrew Lunn	
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet	 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni	 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Simon
 Horman	 <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan	
 <skhan@linuxfoundation.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Heiner
 Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Saravana Kannan	 <saravanak@kernel.org>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,  Maxime Chevallier
 <maxime.chevallier@bootlin.com>
Date: Mon, 27 Jul 2026 10:02:42 +0200
In-Reply-To: <20260717065448.1498335-12-ansuelsmth@gmail.com>
References: <20260717065448.1498335-1-ansuelsmth@gmail.com>
	 <20260717065448.1498335-12-ansuelsmth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_010245_137662_6C2938A1 
X-CRM114-Status: GOOD (  19.25  )
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

On Fr, 2026-07-17 at 08:54 +0200, Christian Marangi wrote:
> Add PCS driver for Airoha AN7581 SoC for Ethernet/PON/PCIe/USB SERDES
> and permit usage of external PHY or connected SFP cage. Supported modes
> are USXGMII, 10G-BASER, 2500BASE-X, 1000BASE-X and SGMII.
>=20
> The driver probe and register the various needed registers and register a=
s
> a PCS provider for fwnode usage.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/net/pcs/Kconfig                    |    2 +
>  drivers/net/pcs/Makefile                   |    2 +
>  drivers/net/pcs/airoha/Kconfig             |   12 +
>  drivers/net/pcs/airoha/Makefile            |    7 +
>  drivers/net/pcs/airoha/pcs-airoha-common.c | 1324 +++++++++++++
>  drivers/net/pcs/airoha/pcs-airoha.h        | 1311 ++++++++++++
>  drivers/net/pcs/airoha/pcs-an7581.c        | 2093 ++++++++++++++++++++
>  7 files changed, 4751 insertions(+)
>  create mode 100644 drivers/net/pcs/airoha/Kconfig
>  create mode 100644 drivers/net/pcs/airoha/Makefile
>  create mode 100644 drivers/net/pcs/airoha/pcs-airoha-common.c
>  create mode 100644 drivers/net/pcs/airoha/pcs-airoha.h
>  create mode 100644 drivers/net/pcs/airoha/pcs-an7581.c
>=20
[...]
> diff --git a/drivers/net/pcs/airoha/pcs-airoha-common.c b/drivers/net/pcs=
/airoha/pcs-airoha-common.c
> new file mode 100644
> index 000000000000..781f89adf3ab
> --- /dev/null
> +++ b/drivers/net/pcs/airoha/pcs-airoha-common.c
> @@ -0,0 +1,1324 @@
[...]
> +static int airoha_pcs_setup_scu(struct airoha_pcs_priv *priv,
> +				int index, phy_interface_t interface)
> +{
> +	const struct airoha_pcs_match_data *data =3D priv->data;
> +	int ret;
> +
> +	switch (data->port_type) {
> +	case AIROHA_PCS_ETH:
> +		airoha_pcs_setup_scu_eth(priv, interface);
> +		break;
> +	case AIROHA_PCS_PON:
> +		airoha_pcs_setup_scu_pon(priv, interface);
> +		break;
> +	case AIROHA_PCS_PCIE:
> +		airoha_pcs_setup_scu_pcie(priv, index, interface);
> +		break;
> +	case AIROHA_PCS_USB:
> +		break;
> +	}
> +
> +	/* TODO better handle reset from MAC */

What does this mean? There's a "mac" and a "phy" control in rsts.
Should the "mac" reset be handled differently? Or is there a separate
reset line that is controlled by the MAC itself?

> +	ret =3D reset_control_bulk_assert(ARRAY_SIZE(priv->rsts),
> +					priv->rsts);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D reset_control_bulk_deassert(ARRAY_SIZE(priv->rsts),
> +					  priv->rsts);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}

regards
Philipp

