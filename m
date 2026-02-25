Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F78AFD45E7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 20:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gG32QezSPmvNiifOmlk3UNWlKCkfpONTm9OEYsqWNT8=; b=AKfZzBmki0k6Pq6Aec7PN77oZ4
	O2t2EMjUE7/XbO+Q9wZ/5koDfApaIcgocsiqvdRngJ/+DpBTsU+49niPicZSJ4KKxKL1XW4pXkQZv
	ZltsUb98S+eUJRPlm3ozpviUlxFp5xNsOFm00Fn1Yktp+4yTf2P/7BMVN4HcpSfxM65Uz8yP/Q2NJ
	k+ulP2PJl1n/V8PL5jOQcgjJCy2dW+fUrO5pWyhaoKYuYo7BOIZLQfxSuUXcDq7enPYGf/CzAnzvq
	58KVN8RBkJSltDByQraMH/k26Las4JiV5ZvVgz2YC0EdRqd6SeYkGIBVkQ8dAC6u20TjDIeUc+MMU
	R3Oydhjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvL7l-00000004pAt-0KS3;
	Wed, 25 Feb 2026 20:04:45 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvL7i-00000004pAI-0LIY;
	Wed, 25 Feb 2026 20:04:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1772049853; x=1772654653; i=frank-w@public-files.de;
	bh=gG32QezSPmvNiifOmlk3UNWlKCkfpONTm9OEYsqWNT8=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=AeeZB5hfIlBef29wS0xZ+xYQBwvlJkspdXind8lEvQFZBhCQpMsxNCswTC58YI1b
	 qhj5GBFYVPptD0RQuUiY0ig2tGCbu9eH82nuTNBMaHbUmZXfZvss/zZ6SVVyz5A2I
	 cE5vya6poceVh/efQVk6S3WY64pmdVqmlOq8tZkJXROi1oJ2wMeauxSunf8Bnw3RW
	 bUhDy/GVchGWxYJJ6ZxmkW1wlTp6Nn5fxLEspGH2onYWxSP7T3hNZ2ybpRc+/YqZA
	 /j0UQRN0gB73cCMqASNyxXGCXfbk4fv36g15ngsMleuOSx+iQ//5BkmC8aSZ/HZTi
	 YklIWORUA9nrzcx5TA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [80.245.74.92] ([80.245.74.92]) by
 trinity-msg-rest-gmx-gmx-live-8d9bc96fb-9hfbf (via HTTP); Wed, 25 Feb 2026
 20:04:13 +0000
MIME-Version: 1.0
Message-ID: <trinity-983c3017-9988-4ea9-b704-0dddd89a1e20-1772049853446@trinity-msg-rest-gmx-gmx-live-8d9bc96fb-9hfbf>
From: Frank Wunderlich <frank-w@public-files.de>
To: frank-w@public-files.de, linux@fw-web.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Aw: Re: [PATCH] arm64: dts: mediatek: mt7988a-bpi-r4pro: fix model
 string
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Feb 2026 20:04:13 +0000
In-Reply-To: <1665fa1f-67da-4688-89db-d864b5bb0509@public-files.de>
References: <20251215074609.4100-1-linux@fw-web.de>
 <1665fa1f-67da-4688-89db-d864b5bb0509@public-files.de>
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:MTa4HafF8wMtqwitPqKwnJiblV59jVORNj6NeHLkfbucTFZAfloke+uyhbk01SYWtm5DE
 2vWHliuKBDxPZOE00E9cQ3vgWSx2nQStFkX5OG7UjYcS74aq4Ab8dMo80Ktvn1VQQBFhzDMM38lw
 y8uM79rKMXlwf0Nzzy3Xw4sLJxGg5IML0m3QgkG9gX0JgitbFBMkdCvcM/vR6PLQ57zzZqQCMNgi
 sefmb6mwe2pvnVSx3NIMK2yFJo7FNtQrux7WGtSF6SraLyQirav5ZqviHQyW68ZfJEQh6A7is0+H
 3KkY8GtqYj3pfRN1GRqVvDibZwdz6vZouWE4w8XpZFGiq9RiJ6F3jdGq2JBDJIN3aw=
UI-OutboundReport: notjunk:1;M01:P0:qsc6YkO+Gdg=;WzTLxP4LvGDDcM7IEBb/jL7SGHk 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 RQ/qLhA4I7MaQJuhmjttOdw==
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_120442_677967_2F80BAC7 
X-CRM114-Status: GOOD (  14.94  )
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

Hi Angelo

can you please add this fix?

regards Frank

> Gesendet: Freitag, 16. Januar 2026 um 14:38
> Von: "Frank Wunderlich" <frank-w@public-files.de>
> An: "Frank Wunderlich" <linux@fw-web.de>, "Rob Herring" <robh@kernel.org=
>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@ke=
rnel.org>, "Matthias Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino =
Del Regno" <angelogioacchino.delregno@collabora.com>
> CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-=
kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
> Betreff: Re: [PATCH] arm64: dts: mediatek: mt7988a-bpi-r4pro: fix model =
string
>
> Hi,
>=20
> just a gentle ping
>=20
> regards Frank
>=20
> Am 15.12.25 um 08:46 schrieb Frank Wunderlich:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >
> > Fix incorrect model string in Devicetree for BPI-R4-Pro.
> >
> > Fixes: f397471a6a8c ("arm64: dts: mediatek: mt7988: Add devicetree for=
 BananaPi R4 Pro")
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dts | 2 =
+-
> >   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts | 2 =
+-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-=
4e.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dts
> > index c7ea6e88c4f4..621d01e3cd89 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dts
> > @@ -9,7 +9,7 @@
> >   #include "mt7988a-bananapi-bpi-r4-pro.dtsi"
> >  =20
> >   / {
> > -	model =3D "Bananapi BPI-R4";
> > +	model =3D "Bananapi BPI-R4 Pro 4E";
> >   	compatible =3D "bananapi,bpi-r4-pro-4e",
> >   		     "bananapi,bpi-r4-pro",
> >   		     "mediatek,mt7988a";
> > diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-=
8x.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts
> > index c9a0e69e9dd5..bb15bfa5e6ae 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts
> > @@ -9,7 +9,7 @@
> >   #include "mt7988a-bananapi-bpi-r4-pro.dtsi"
> >  =20
> >   / {
> > -	model =3D "Bananapi BPI-R4";
> > +	model =3D "Bananapi BPI-R4 Pro 8X";
> >   	compatible =3D "bananapi,bpi-r4-pro-8x",
> >   		     "bananapi,bpi-r4-pro",
> >   		     "mediatek,mt7988a";</frank-w@public-files.de></frank-w@public=
-files.de>

