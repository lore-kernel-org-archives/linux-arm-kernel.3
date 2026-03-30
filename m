Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C9CFF4959
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 08:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vIKSOf3iwlefSeFtxh1vGjimtiwXBVMrRZlUPI0lqe4=; b=2XUcjx8WvCT7hdC3Aon3mYrAO2
	3CTgYklE+r6jCTUGSp71Qf8RxgSjY0DDyTg9CAy2gMq35OE7TQyV4ELddLGQzAan55YcAa1VPin4i
	swNd1d390UmlAKeJaCd70KyLYs9e0zcmRmhYa2KZ8lsNbvRhZwnSvvg2mA4muy/FK2ovdSm3mMO82
	VCOWFQbBOP40tRNPMOdGhbhlzs4bCLxT9c5fb6RfRqlfJdkibxnyWocgVa95qDDS3gx4W6JtbI+Ll
	IMvZh9pXfOZltzGytBkzm07uPniNw1IEcv+bUYlnSyfd2+k3cc2LB31FKDOLzUcUI7Z7+Pn0GPcHo
	S+AMQ9hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77f5-0000000AoWv-2ZkI;
	Mon, 30 Mar 2026 08:07:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77f4-0000000AoWh-2X2j;
	Mon, 30 Mar 2026 08:07:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 58DCD600AC;
	Mon, 30 Mar 2026 08:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 875BCC4CEF7;
	Mon, 30 Mar 2026 08:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774858069;
	bh=YhNcAxwi7k4UThTvxQ3mLuHi5PSHDChCgtFuITbLbxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ocr8hkDAXhQiBAHS4RwFz7yPOX50Khybw4gy4m2Tvv6g54XAgLfTroOxeOOUAagmK
	 KuGvlMRF5zgVqt5c8jPuXNaTG+9Mmoz/lZ+YgWlIrJGLK4ENxAGo/V1tgwAyDh4jBZ
	 3d/SN8TWYdM5qOUqpF/ojAf8qwsiTT7Uub2IK0PzsV0+iQBLF4NefjfN3mk4wC9lUw
	 sphCkssq4RwBuOqfkwlB4fA704W/eMm5C2JxpKieDIF4I40Y+ymJYQ/ZxtIoVabL+2
	 enWEde+7ek9RyhJeW9wVMpKG3d1DJg5gRI1b1CLvoD1fwvgme1QNfhmweHLz7jqjby
	 9GoYF9e0vDhHg==
Date: Mon, 30 Mar 2026 10:07:46 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, Xuegang Lu <xuegang.lu@airoha.com>
Subject: Re: [PATCH net-next 00/10] net: airoha: Support multiple net_devices
 connected to the same GDM port
Message-ID: <acovUgndujK08H-4@lore-desk>
References: <20260329-airoha-eth-multi-serdes-v1-0-00f52dc360ca@kernel.org>
 <a64e0f7e-7073-4355-a3de-e8d93e2c795c@genexis.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2FhnmY9eF5tpPTJI"
Content-Disposition: inline
In-Reply-To: <a64e0f7e-7073-4355-a3de-e8d93e2c795c@genexis.eu>
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


--2FhnmY9eF5tpPTJI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi.

Hi Ben,

>=20
> On 29/03/2026 15:07, Lorenzo Bianconi wrote:
> > EN7581 or AN7583 SoCs support connecting multiple external SerDes (e.g.
> > Ethernet or USB SerDes) to GDM3 or GDM4 ports via a hw multiplexer that
> > manages the traffic in a TDM manner.
>=20
> I think the word for this is arbiter. I think the common use of mux is as=
 a
> more fixed data path selector.


ack, I will fix it in v2.

Regards,
Lorenzo

>=20
> > As a result multiple net_devices can
> > connect to the same GDM{3,4} port and there is a theoretical "1:n"
> > relation between GDM ports and net_devices.
> >
> >             =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=90
> >             =E2=94=82                                 =E2=94=82    =E2=
=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
> >             =E2=94=82                         P1 GDM1 =E2=94=9C=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=96=BAMT7530=E2=94=82
> >             =E2=94=82                                 =E2=94=82    =E2=
=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
> >             =E2=94=82                                 =E2=94=82      ET=
H0 (DSA conduit)
> >             =E2=94=82                                 =E2=94=82
> >             =E2=94=82              PSE/FE             =E2=94=82
> >             =E2=94=82                                 =E2=94=82
> >             =E2=94=82                                 =E2=94=82
> >             =E2=94=82                                 =E2=94=82    =E2=
=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
> >             =E2=94=82                         P0 CDM1 =E2=94=9C=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=96=BAQDMA0=E2=94=82
> >             =E2=94=82  P4                     P9 GDM4 =E2=94=82    =E2=
=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
> >             =E2=94=94=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=98
> >                =E2=94=82                         =E2=94=82
> >             =E2=94=8C=E2=94=80=E2=94=80=E2=96=BC=E2=94=80=E2=94=80=E2=
=94=90                 =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=96=
=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
> >             =E2=94=82 PPE =E2=94=82                 =E2=94=82   MUX   =
=E2=94=82
> >             =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=98                 =E2=94=94=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=98
> >                                       =E2=94=82     =E2=94=82
> >                                    =E2=94=8C=E2=94=80=E2=94=80=E2=96=BC=
=E2=94=80=E2=94=80=E2=94=90=E2=94=8C=E2=94=80=E2=96=BC=E2=94=80=E2=94=80=E2=
=94=80=E2=94=90
> >                                    =E2=94=82 ETH =E2=94=82=E2=94=82 USB=
 =E2=94=82
> >                                    =E2=94=94=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=98=E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=98
> >                                     ETH1   ETH2
>=20
> A more representative picture is like the following and in the GDM2 path
> there is a real mux present(not relevant for this patch series though). T=
hus
> I think it is important to have the distinction between mux and arbiter.
> (Feel free to reuse the following illustration freely).
>=20
>                 =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=90
>                 =E2=94=82                                 =E2=94=82    =
=E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
>    =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=90  =E2=94=82                         P1 GDM1 =
=E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=96=BAMT7530=E2=94=82
>    =E2=94=82   MUX   =E2=94=9C=E2=94=80=E2=94=80=E2=94=82 P2 GDM2        =
                 =E2=94=82    =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=98
>    =E2=94=94=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=AC=E2=94=80=E2=94=98  =E2=94=82                                 =
=E2=94=82      ETH0 (DSA conduit)
>      =E2=94=82     =E2=94=82    =E2=94=82                                =
 =E2=94=82
>   =E2=94=8C=E2=94=80=E2=94=80=E2=96=BC=E2=94=80=E2=94=80=E2=94=90=E2=94=
=8C=E2=94=80=E2=96=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=90=E2=94=82         =
     PSE/FE             =E2=94=82
>   =E2=94=82 PON =E2=94=82=E2=94=82 PON =E2=94=82=E2=94=82                =
                 =E2=94=82
>   =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98=E2=94=
=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98=E2=94=82         =
                        =E2=94=82
>    ETH5   XPON  =E2=94=82                                 =E2=94=82    =
=E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
>                 =E2=94=82                         P0 CDM1 =E2=94=9C=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=96=BAQDMA0=E2=94=82
>                 =E2=94=82  P4      P3 GDM3        P9 GDM4 =E2=94=82    =
=E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
>                 =E2=94=94=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=AC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=98
>                    =E2=94=82          =E2=94=82              =E2=94=82
>                 =E2=94=8C=E2=94=80=E2=94=80=E2=96=BC=E2=94=80=E2=94=80=E2=
=94=90  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=96=BC=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=90    =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=96=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
>                 =E2=94=82 PPE =E2=94=82  =E2=94=82   ARB   =E2=94=82    =
=E2=94=82   ARB   =E2=94=82
>                 =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=98  =E2=94=94=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=AC=E2=94=80=E2=94=98    =E2=94=94=E2=94=80=E2=94=AC=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=98
>                            =E2=94=82     =E2=94=82        =E2=94=82     =
=E2=94=82
>                         =E2=94=8C=E2=94=80=E2=94=80=E2=96=BC=E2=94=80=E2=
=94=80=E2=94=90=E2=94=8C=E2=94=80=E2=96=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=
=90 =E2=94=8C=E2=94=80=E2=94=80=E2=96=BC=E2=94=80=E2=94=80=E2=94=90=E2=94=
=8C=E2=94=80=E2=96=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=90
>                         =E2=94=82PCIE0=E2=94=82=E2=94=82PCIE1=E2=94=82 =
=E2=94=82 ETH =E2=94=82=E2=94=82 USB =E2=94=82
>                         =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=98=E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=98 =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98=E2=94=
=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
>                           ETH3   ETH4    ETH1   ETH2
>=20
> MvH
> Benjamin Larsson

--2FhnmY9eF5tpPTJI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCacovUgAKCRA6cBh0uS2t
rIc2AP4wwRA1B4MtxFvfeaVVQ3m/NwmSTe6UHrO8PddiwUqlPgEAt83FeDeOn8S4
2P1sF5r1gm8DzYCyZnJKsEyMVQAGBgo=
=4iqG
-----END PGP SIGNATURE-----

--2FhnmY9eF5tpPTJI--

