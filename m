Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B06FA0C33
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 06:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ypCQYb5z2PZvIzS0gw2ULN0rjsWR7QSr55MLlXIZUs=; b=lIPcm99wgKe6VHUCHmOVOjlhjG
	py9XU9taWEdAKXCn+wpJE3B5DgIySF2KWxGgE1pZB39Vq74NDF1yk2eI2Sadw5KoSZ84V5Cl65Fo+
	0t2MdUaO9eCGH/Aw3m6fauuqtwFkQ4fGN9hllTlZVuN0rIVA5nR+D1eKZOaFLDU2B+kZLuL39dkBh
	PIbcE47qP5ZiCfM2WUiOoU+o0bR8Fwj/D35aGMHLC3+n+XasAoHNi2LZZgnAsMz7r8/eZ19PxOJzO
	ur0/ROTRw9bQZigPlACS9UqI7c3hwKxxWk793ONGituBSDj0MPw4+9iyEFlR6sAz8Zeq9zY9wMynQ
	mLQsz9Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCtQu-00000000d8K-2Ffl;
	Wed, 15 Apr 2026 06:09:04 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCtQr-00000000d6h-1Fb4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 06:09:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=+ypCQYb5z2PZvIzS0gw2ULN0rjsWR7QSr55MLlXIZUs=; b=U2rZcQR6HMY/i/VBmz284fF8wv
	K7/JWqg2h4tNV4DIHyw1lwN7pzAT0uikIQ+qeybZ4UbJooIKTPttoJQPkhDR2EJr90sl1H8ggF3D2
	b6e/ytUR1FwI1dbx89qnWjjavatDJgcRxV8DVrikX7B/VM9th8tWpyU7MdzJEKJWvvc+Ce3Y2u3o3
	KbWSS70kDPh0wp3YSXvBpu0RHrndvdAn0714vAMMz78KrOoix5Sajz4e+bi+8n8v2xzsv2UY3ar/z
	puTv3aVkWXWdUu6eHr8JFlDXtHToxFLrqZVHjcZBubSH8foYL9ouYFZM6Dt9C7CusqEYqZ2dCxTdV
	bR3S9Awg==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wCtQY-000C07-1D;
	Wed, 15 Apr 2026 08:08:42 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wCtQX-0008Pj-03;
	Wed, 15 Apr 2026 08:08:41 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 5/6] net: stmmac: move PHY handling out of
 __stmmac_open()/release()
Date: Wed, 15 Apr 2026 08:08:40 +0200
Message-ID: <8409022.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <E1v11A3-0000000774G-3PKY@rmk-PC.armlinux.org.uk>
References: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
 <E1v11A3-0000000774G-3PKY@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27971/Tue Apr 14 08:24:44 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_230901_445119_09C3C179 
X-CRM114-Status: GOOD (  20.19  )
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

Hi,

Am Dienstag, 23. September 2025, 13:26:19 CEST schrieb Russell King (Oracle=
):
> Move the PHY attachment/detachment from the network driver out of
> __stmmac_open() and __stmmac_release() into stmmac_open() and
> stmmac_release() where these actions will only happen when the
> interface is administratively brought up or down. It does not make
> sense to detach and re-attach the PHY during a change of MTU.

Sorry for coming up now. But I recently noticed this commit breaks changing
the MTU on i.MX8MP. Once I simply change the MTU I run into some DMA error:
$ ip link set dev end1 mtu 1400
imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-0
imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-1
imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-2
imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-3
imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-4
imx-dwmac 30bf0000.ethernet end1: Link is Down
imx-dwmac 30bf0000.ethernet end1: Failed to reset the dma
imx-dwmac 30bf0000.ethernet end1: stmmac_hw_setup: DMA engine initializatio=
n failed
imx-dwmac 30bf0000.ethernet end1: __stmmac_open: Hw setup failed
imx-dwmac 30bf0000.ethernet end1: failed reopening the interface after MTU =
change

Using the command above bisecting was straight forward.
=46or some reason detach and re-attaching the PHY seems necessary on this p=
latform.
There already too much changes for simply reverting this commit.

Best regards,
Alexander

>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 29 +++++++++++--------
>  1 file changed, 17 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index 4acd180d2da8..4844d563e291 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3937,10 +3937,6 @@ static int __stmmac_open(struct net_device *dev,
>  	u32 chan;
>  	int ret;
> =20
> -	ret =3D stmmac_init_phy(dev);
> -	if (ret)
> -		return ret;
> -
>  	for (int i =3D 0; i < MTL_MAX_TX_QUEUES; i++)
>  		if (priv->dma_conf.tx_queue[i].tbs & STMMAC_TBS_EN)
>  			dma_conf->tx_queue[i].tbs =3D priv->dma_conf.tx_queue[i].tbs;
> @@ -3990,7 +3986,6 @@ static int __stmmac_open(struct net_device *dev,
> =20
>  	stmmac_release_ptp(priv);
>  init_error:
> -	phylink_disconnect_phy(priv->phylink);
>  	return ret;
>  }
> =20
> @@ -4010,18 +4005,28 @@ static int stmmac_open(struct net_device *dev)
> =20
>  	ret =3D pm_runtime_resume_and_get(priv->device);
>  	if (ret < 0)
> -		goto err;
> +		goto err_dma_resources;
> +
> +	ret =3D stmmac_init_phy(dev);
> +	if (ret)
> +		goto err_runtime_pm;
> =20
>  	ret =3D __stmmac_open(dev, dma_conf);
> -	if (ret) {
> -		pm_runtime_put(priv->device);
> -err:
> -		free_dma_desc_resources(priv, dma_conf);
> -	}
> +	if (ret)
> +		goto err_disconnect_phy;
> =20
>  	kfree(dma_conf);
> =20
>  	return ret;
> +
> +err_disconnect_phy:
> +	phylink_disconnect_phy(priv->phylink);
> +err_runtime_pm:
> +	pm_runtime_put(priv->device);
> +err_dma_resources:
> +	free_dma_desc_resources(priv, dma_conf);
> +	kfree(dma_conf);
> +	return ret;
>  }
> =20
>  static void __stmmac_release(struct net_device *dev)
> @@ -4038,7 +4043,6 @@ static void __stmmac_release(struct net_device *dev)
> =20
>  	/* Stop and disconnect the PHY */
>  	phylink_stop(priv->phylink);
> -	phylink_disconnect_phy(priv->phylink);
> =20
>  	stmmac_disable_all_queues(priv);
> =20
> @@ -4078,6 +4082,7 @@ static int stmmac_release(struct net_device *dev)
> =20
>  	__stmmac_release(dev);
> =20
> +	phylink_disconnect_phy(priv->phylink);
>  	pm_runtime_put(priv->device);
> =20
>  	return 0;
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



