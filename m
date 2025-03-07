Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44AEC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 15:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G/pss6Ts/AltbDPOKG7yn++cg50XjUxZFa20rR9a5/A=; b=mBoflf+hfJ6gTtcjX/7MSG/p06
	bHghAFx3nkgHZvjb0TxKrDlIWuZO31WTyW8uCmJG0/EZrMCon2gt5r55E4YnTOYxPEnwXxgWhMcLQ
	1eyRc6sDVV7MHLQOrgP3dXFIuqviSOmI5X0UdZNNfGSB4quCidKTwyNJmjeeQA3YoDtZUAc+J4IXk
	GPv/JNIyVFsJSKbgci4JwhAvTmNKl1CdHE21s+UKY3Two3nhsSviWtiv4cJ5q7BMWJCZqgoKE/W1f
	RpIntI5wefiL+aZoL9Q0Oqx0Tlo4lyYtoD6nyD5Ss9Q0TkC1y3w+ep87aQRDYJrbHDR6SfgWW+gCJ
	VY+6sXSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqa2B-0000000Em5x-1QyC;
	Fri, 07 Mar 2025 15:54:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZwQ-0000000El9h-2uuC;
	Fri, 07 Mar 2025 15:48:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 321215C5BD2;
	Fri,  7 Mar 2025 15:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 314C7C4CED1;
	Fri,  7 Mar 2025 15:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741362529;
	bh=cbQpumLmb4zRxxzXeh/NJGWOgnbL/WBEsGAddfW0Fcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N65vVkRX2qnTNsHI/Mryj3yrgzuscpAKf0NbItOKxb932B9Tb+1GNpcL+r80CVzSs
	 /ueBhWKSiB3bJ7bGUc1946kLvdkvQc9PnKTvdKitZbw9VWvnl/A3JS+AA/JzYA5dXE
	 PQvQPLjOSpKbNoA4Fyit4SuXtAyX6VeAKycEphJyepBR1hmKfg8MLhwIxbE9HWbtSq
	 4vjrXvxpZSuGt7YkqB1uZskUNPLxeruSW3me2Zop8Z7Aaf0Yex6KHzNVSCuwlEY9BH
	 1cJRbxta4F2xG52gXmzZVKXk2/Uk6IOiTaL8dO0oBKAcEDBjcHYQsuPnC9OdxUwiWE
	 EJq3Hj/sTn2hg==
Date: Fri, 7 Mar 2025 15:48:44 +0000
From: Conor Dooley <conor@kernel.org>
To: Axe Yang =?utf-8?B?KOadqOejiik=?= <Axe.Yang@mediatek.com>
Cc: Wenbin Mei =?utf-8?B?KOaiheaWh+W9rCk=?= <Wenbin.Mei@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	Chaotian Jing =?utf-8?B?KOS6leacneWkqSk=?= <Chaotian.Jing@mediatek.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	Andy-ld Lu =?utf-8?B?KOWNouS4nCk=?= <Andy-ld.Lu@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Yong Mao =?utf-8?B?KOavm+WLhyk=?= <yong.mao@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Qingliang Li =?utf-8?B?KOm7juaZtOS6rik=?= <Qingliang.Li@mediatek.com>
Subject: Re: [PATCH 1/2] dt-bindings: mmc: mtk-sd: add single burst switch
Message-ID: <20250307-bust-diving-a57644a51543@spud>
References: <20250306085028.5024-1-axe.yang@mediatek.com>
 <20250306085028.5024-2-axe.yang@mediatek.com>
 <3e84fda8-2566-4f18-8ef9-850c84789c34@collabora.com>
 <f84800fac589429157cd84034ef2f4541d3486a7.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JvgKecrTkt2V/rEI"
Content-Disposition: inline
In-Reply-To: <f84800fac589429157cd84034ef2f4541d3486a7.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_074850_845629_CC231EFD 
X-CRM114-Status: GOOD (  36.36  )
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


--JvgKecrTkt2V/rEI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 07, 2025 at 06:59:03AM +0000, Axe Yang (=E6=9D=A8=E7=A3=8A) wro=
te:
> On Thu, 2025-03-06 at 10:19 +0100, AngeloGioacchino Del Regno wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >=20
> >=20
> > Il 06/03/25 09:48, Axe Yang ha scritto:
> > > Add 'mediatek,disable-single-burst' setting. This property can be
> > > used to switch bus burst type, from single burst to INCR, which is
> > > determined by the bus type within the IP. Some versions of the IP
> > > are using AXI bus, thus this switch is necessary as 'single' is not
> > > the burst type supported by the bus.
> > >=20
> > > Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> >=20
> > I am mostly sure that this is not something to put in devicetree, but
> > as
> > platform data for specific SoC(s), as much as I'm mostly sure that
> > all of
> > the instances of the MSDC IP in one SoC will be *all* using either
> > single
> > or INCR.
>=20
> No, actually MSDC IPs in one SoC are using different versions.
> Usually MSDC1 (index from 1) is used as eMMC host, the left hosts are
> used as SD/SDIO hosts. They have similar designs, but there are still
> difference.
>=20
> >=20
> > So, I think I know the answer but I'll still ask just to be extremely
> > sure:
> >=20
> > is there any MediaTek SoC that has different IP versions for
> > different MSDC
> > instances, and that hence require single burst on one instance and
> > INCR on
> > another instance?
>=20
> Yes. Actually every SoC has different IP versions for eMMC and SD/SDIO
> host as I said.
> e.g. For MT8168, signel burst bit should be set to 1 for eMMC Host, but
> 0 for SD/SDIO Host.
>=20

Sounds like two different IPs that really should have different
compatibles to me...

> >=20
> > And if there is - is there a pattern? Is it always SDIO requiring
> > INCR or
> > always eMMC/SD requiring it?
> >=20
> >=20
>=20
> No, there is no pattern. Both eMMC and SD/SDIO hosts need to be
> configured base on IP version. There is no binding relationship between
> eMMC/SD/SDIO and the burst type. eMMC burst type might be INCR or
> single, same as SD/SDIO.
>=20
>=20
> Regards,
> Axe
>=20
>=20
> >=20
> > > ---
> > >   Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 8 ++++++++
> > >   1 file changed, 8 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > > b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > > index 0debccbd6519..6076aff0a689 100644
> > > --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > > +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > > @@ -100,6 +100,14 @@ properties:
> > >       minimum: 0
> > >       maximum: 0xffffffff
> > >=20
> > > +  mediatek,disable-single-burst:
> > > +    $ref: /schemas/types.yaml#/definitions/flag
> > > +    description:
> > > +      Burst type setting. For some versions of the IP that do not
> > > use
> > > +      AHB bus, the burst type need to be switched to INCR.
> > > +      If present, use INCR burst type.
> > > +      If not present, use single burst type.
> > > +
> > >     mediatek,hs200-cmd-int-delay:
> > >       $ref: /schemas/types.yaml#/definitions/uint32
> > >       description:
> >=20
> >=20
> >=20

--JvgKecrTkt2V/rEI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8sVWwAKCRB4tDGHoIJi
0hRVAP9JFaU0LfHys70qFKw8YsFg94BJakg2ezMs8dUwmp2z1QD/cUINRP2md0VA
qLxlWwCzLY6tY2JS7ftifR6/W+OfwQg=
=ZH2G
-----END PGP SIGNATURE-----

--JvgKecrTkt2V/rEI--

