Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84F3CA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 07:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLHGBhvDV8qZHfsFbqepqUNO/3HZNejgQir9vBHeCG0=; b=w83ilrkbixPAc0y01MYOlhk5m9
	6ihqOgzMK/+kk5vrXvtz7urLnyMOAiM90e3ZGewCr2jZEmbf7sx94d5g6V4SSdXn6h6YpHNwNglKP
	YgR9cyf6u6H3vnioUv/pb//3TNTHWHgry6Qt8tmrx/vBJJmzi2b1OTKhH4iAKrx/E6zYMqOfO9KRW
	/yMmSUJzJCtr0Bhr4NxtM2S82OsxfMVfrEpVfn9h1W4owmAbac9gIofqk9iD0ewds7PZbSpUPiqU1
	L90Rgr1Z8HdjYc97XdrF8WjJTiEoTpW3hTDlf3HCJsowyf36kNaSpyBTZlOW3tMTm9jRetk22cQrm
	9Yg13ioA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiVM-00000003jtI-3HtF;
	Thu, 08 Oct 2026 07:25:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiVK-00000003jtC-42Tl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 07:25:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 74E1A401F7;
	Thu,  8 Oct 2026 07:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF441F000FF;
	Thu,  8 Oct 2026 07:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791444326;
	bh=aLHGBhvDV8qZHfsFbqepqUNO/3HZNejgQir9vBHeCG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q7ZHmSIxEFOoAXcgQz5DBH5VsanvHmmKRNfpcwCFoVrn6rpPU/Bf/WR/oIdQ2FwoT
	 F66OuDSPmmLN4ZhJZ8zfnhd0b0r8bPF4KW8ZU+VJxT8FuFbbHjzp1OBfav6FArpWCi
	 yssI65aEy7mooJQHzhkDVRYF9KOPdM/UM063jm7sV0VC7i5EixlJkifRsvr9CmtYY0
	 FZuOkacVN39UKq7YEMmEPHxqY+QgIyhjVLK/oOYiwGr0LzJb4Ajct/h7h0qwuSDee/
	 JtnyjPt9axmgDoPflJJCH9cXZ0ez5MXoSrqGsWv5LuGgmVw58z+zNRSots9KJSLoy4
	 9ogywKa0sheDA==
Date: Thu, 8 Oct 2026 08:25:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Pufan Jin <2254650260@qq.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, andrew@lunn.ch
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add ALINX vendor
 prefix
Message-ID: <20261008-ca435fedee2986fd4ae35087@squawk>
References: <20261005173308.710986-1-2254650260@qq.com>
 <tencent_0512BDFB22810AB03126E3189320800AF607@qq.com>
 <20261007-92e855de534df44fbf665e4f@squawk>
 <tencent_67DE4800018C924922E62488AF02AF24E405@qq.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7NoPOEN9tB3HHmhZ"
Content-Disposition: inline
In-Reply-To: <tencent_67DE4800018C924922E62488AF02AF24E405@qq.com>
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

--7NoPOEN9tB3HHmhZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 08, 2026 at 01:36:35AM +0800, Pufan Jin wrote:
>=20
> On 2026/10/7 18:35, Conor Dooley wrote:
> > On Tue, Oct 06, 2026 at 01:33:06AM +0800, Pufan Jin wrote:
> > > Add vendor prefix for ALINX (Shanghai Xin'yi Electronics Technology
> > > Co., Ltd.).
> > Where does this ALINX come from? Website url?
> >=20
> > > Signed-off-by: Pufan Jin <2254650260@qq.com>
> > > ---
> > >   Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> > >   1 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b=
/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > index ba2002969..97e7ef340 100644
> > > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > @@ -90,6 +90,8 @@ patternProperties:
> > >       description: AlgolTek, Inc.
> > >     "^alientek,.*":
> > >       description: Guangzhou Xingyi Intelligent Technology Co., Ltd.
> > > +  "^alinx,.*":
> > > +    description: Shanghai Xin'yi Electronics Technology Co., Ltd. (A=
LINX)
> > >     "^allegro,.*":
> > >       description: Allegro DVT
> > >     "^allegromicro,.*":
> > > --=20
> > > 2.55.0
>=20
> Hi Conor,
>=20
> ALINX is the brand of Xinyi Electronic Technology (Shanghai) Co., Ltd.
> (=E8=8A=AF=E9=A9=BF=E7=94=B5=E5=AD=90=E7=A7=91=E6=8A=80=EF=BC=88=E4=B8=8A=
=E6=B5=B7=EF=BC=89=E6=9C=89=E9=99=90=E5=85=AC=E5=8F=B8), https://www.alinx.=
com/ - an FPGA/SoC
> company and official partner of AMD Xilinx, Unisoc and Baidu.

In that case,
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable
Link: https://www.alinx.com/

Thanks,
Conor.

>=20
> The board is not in the alinx.com shop because ALINX describes EdgeBoard
> as a customisation done for Baidu: Baidu owns the EdgeBoard brand and the
> sales channel, while ALINX designs and manufactures the hardware. From
> ALINX's own product documentation [1]:
>=20
> "...as a Baidu AI partner, it has customized the Edgeboard series edge
> =C2=A0devices of the domestic AI flying paddle system for Baidu."
>=20
> The FZ3A hardware manual and the schematics are authored by ALINX - the
> manual cover carries the ALINX logo, www.alinx.com and the legal name
> above, and every schematic sheet has the same ALINX title block.
>=20
> Since ALINX is the hardware designer, I used "alinx" as the prefix
> instead of "baidu". Happy to switch if you prefer the marketing brand.
>=20
> [1] https://vd100-20232-v101.readthedocs.io/zh-cn/en/VD100_S1_RSTdocument=
_EN/00_aboutALINX_EN.html
>=20
> For v3:
> =C2=A0 - Fix the v2 description mistransliteration of the legal name:
> =C2=A0 =C2=A0 =C2=A0 "^alinx,.*":
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 description: Xinyi Electronic Technology (Sha=
nghai) Co., Ltd.
> (ALINX)
> =C2=A0 - Put the website URL in the commit message.
>=20
> Thanks for the ack on patch 2/3, I will carry it into v3.
>=20
> Best regards,
> Pufan Jin
>=20
>=20

--7NoPOEN9tB3HHmhZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasdFYgAKCRB4tDGHoIJi
0lxeAQCLYZVyUowY42l+9LTBvHVoIUXZ+KnaWz+tHxxqNQxBOgEAoMvdJwCLWqgC
QFh0byuhggVNSNWwcj0pVi5+LoWXfgI=
=pEKw
-----END PGP SIGNATURE-----

--7NoPOEN9tB3HHmhZ--

