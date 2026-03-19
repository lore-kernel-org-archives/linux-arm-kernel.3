Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A405107527A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 08:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cy4910z4yKJ6chHebZmM0+S0xkDCsGUvQzxCGdWrqlo=; b=LtZSFjRx/yk3tD4nVx+eTCayYa
	0rYzqDGxOXkRp3RCHm+3kyiD6LjKjOAdgvRFnrZo3bF9tSIOc+g7OrHd1YLoZiBKRhEhsNrqGlwwq
	KgCP1EPtb5IFlRLoCt7EqqLzoD4ZzW+Tgb8nktcbOH15vKjBh3Q7qCDedIP/68T3j1F8eAJTqy5FB
	SyiVbKH81uFxEP52jKRYIX/h6Tyh3rT4M5aHdEE3N24neZ6svoaMlo4p4nrPMV1GYrWM6v23twRSL
	VI9A1waHnut33JqhT1YIZrN14Xd4HimslFr0ioS7GczJzOsVDGC9zlXsRkvqmzc93YdHqzmYqsp9x
	2goaIwQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w397t-0000000AGqY-0Jwp;
	Thu, 19 Mar 2026 08:53:09 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w397q-0000000AGpw-1RLy;
	Thu, 19 Mar 2026 08:53:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Cy4910z4yKJ6chHebZmM0+S0xkDCsGUvQzxCGdWrqlo=; b=W3qBLApMiwlOSyK7y9elQXdTFi
	Ic0InLtfkfyj1C62uw3fTiOnT+O35+LH4qoEWpSFVLiOJKHcuyrOPj4cl7gOUKW2yyZ3LXWl6Pbyn
	mMBFpnsXxRWDN7EWDUM50FKvaIWP4C01mMX7o9WTRt8SPK18qccGeHVvbxm96fvqq0T/NHc0Xf4Va
	toG7EHiV0OA9zZTf6fIByGYVeqh2CJGFC+ybWqLlGa7pqlNAx8t+x7wKFe1i3oyQRmMd3DGzG96N0
	ZYJdmolg1BIT0yEwkQGihJQYjVxe5nAuGmedBO4Fv4wW1hcWpByAFscuGxTyukKWCbOf6lmBdmSuB
	ZuBfNjzg==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w397i-000Gux-1c;
	Thu, 19 Mar 2026 09:52:58 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w397h-000NT9-1X;
	Thu, 19 Mar 2026 09:52:57 +0100
Message-ID: <4cd1dc92490b7e441378c85da3a0e14010ba74d0.camel@ew.tq-group.com>
Subject: Re: [PATCH 6/7] net: ethernet: ti: am65-cpsw: add support for J722S
 SoC family
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,  Nishanth Menon
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo
 <kristo@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,  netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux@ew.tq-group.com
Date: Thu, 19 Mar 2026 09:52:56 +0100
In-Reply-To: <4cc3dd9fab460d35215c8f97496b9ae16c5bcb22.1773751309.git.nora.schiffer@ew.tq-group.com>
References: <cover.1773751309.git.nora.schiffer@ew.tq-group.com>
	 <4cc3dd9fab460d35215c8f97496b9ae16c5bcb22.1773751309.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.4.3/27945/Thu Mar 19 07:24:38 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_015306_505038_8844F567 
X-CRM114-Status: GOOD (  14.36  )
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

On Wed, 2026-03-18 at 15:05 +0100, Nora Schiffer wrote:
> The J722S CPSW3G is mostly identical to the AM64's, but additionally
> supports SGMII.
>=20
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> ---
>  drivers/net/ethernet/ti/am65-cpsw-nuss.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ether=
net/ti/am65-cpsw-nuss.c
> index d9400599e80a4..fc57d5e6edf4c 100644
> --- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> +++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> @@ -3468,6 +3468,13 @@ static const struct am65_cpsw_pdata am64x_cpswxg_p=
data =3D {
>  	.fdqring_mode =3D K3_RINGACC_RING_MODE_RING,
>  };
> =20
> +static const struct am65_cpsw_pdata j722s_cpswxg_pdata =3D {
> +	.quirks =3D AM64_CPSW_QUIRK_DMA_RX_TDOWN_IRQ | AM64_CPSW_QUIRK_CUT_THRU=
,

Ah, I just realized that I sent the wrong version of this patch,
AM64_CPSW_QUIRK_CUT_THRU only exists in the TI vendor kernel... sorry about
this, will fix in v2.

Can someone from TI answer if AM64_CPSW_QUIRK_DMA_RX_TDOWN_IRQ is needed fo=
r the
J722S?

Best,
Nora



> +	.ale_dev_id =3D "am64-cpswxg",
> +	.fdqring_mode =3D K3_RINGACC_RING_MODE_RING,
> +	.extra_modes =3D BIT(PHY_INTERFACE_MODE_SGMII),
> +};
> +
>  static const struct am65_cpsw_pdata j7200_cpswxg_pdata =3D {
>  	.quirks =3D 0,
>  	.ale_dev_id =3D "am64-cpswxg",
> @@ -3495,6 +3502,7 @@ static const struct of_device_id am65_cpsw_nuss_of_=
mtable[] =3D {
>  	{ .compatible =3D "ti,am654-cpsw-nuss", .data =3D &am65x_sr1_0},
>  	{ .compatible =3D "ti,j721e-cpsw-nuss", .data =3D &j721e_pdata},
>  	{ .compatible =3D "ti,am642-cpsw-nuss", .data =3D &am64x_cpswxg_pdata},
> +	{ .compatible =3D "ti,j722s-cpsw-nuss", .data =3D &j722s_cpswxg_pdata},
>  	{ .compatible =3D "ti,j7200-cpswxg-nuss", .data =3D &j7200_cpswxg_pdata=
},
>  	{ .compatible =3D "ti,j721e-cpswxg-nuss", .data =3D &j721e_cpswxg_pdata=
},
>  	{ .compatible =3D "ti,j784s4-cpswxg-nuss", .data =3D &j784s4_cpswxg_pda=
ta},

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

