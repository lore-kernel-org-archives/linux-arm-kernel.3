Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1832CA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 09:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xTaLGV7hdRR53W/flRFCSJFdyfrUEiBzK8a5bGNYHEc=; b=cgNk/8+2fqSZkMEgH8qARB5ejJ
	lDHDmRyHq1G83cCaXTE63UZHXF7mIxhqVUj2ekmJPPEwT+BKV42Dw3CIwcn7VgC7gk53OdCX0YFmJ
	B1+ad1ETZOuE4XAeUzX82JznjrjsokQpJ2TRZ5tn/ljtzlXfAEDYbPoCxpSA2CQnl36W02KP0zc0j
	nTU8S1plBb0AGWC6b96CYPwFseLAPXmkXFM3/r6RQ9yqLT8iDwpGNVIqPAxw7zWQFzAwuwozwYLBd
	Sr0gKG+x00h5oJIs2QSw1c88Cy+8BuQGftHnh1Aofv3v/SzFLkbzRXsFV9cEM7xZmM37pDVeG85w1
	OyUyImjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoJ6s-0000000A3MO-0AX6;
	Tue, 19 Aug 2025 09:58:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIOs-00000009uQl-2Dkz;
	Tue, 19 Aug 2025 09:13:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755594779;
	bh=nLwgX0rt2w+Inkkf34i/Uun1hxhNuo283Du7mGcFnw0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=dmyJzvwdD2oD2FA+P7Jf0WYb7DiNDMsSsqqC+w3eByrplSvm5P6/JiN4Bnmc9RXZg
	 ZBzFkqlUjidrS5O2k++VziehpoX4z+eoBg/tDFXcfbuaULb5mNpaCDbaHK4qc/OK6P
	 KaKLwfcXifGQyx4e0J9Wnnoco2dFwUx4ZNr63+kEyHp2PFncQGwJNx885D7bLnYWUP
	 wLNMiYKllEWYiYE0nZXQ4R+e2YdR0wmf8bR7VSNN8x7k68F3XpwLdN+VQje1uZISaE
	 2OKFTumwkHm729xNyan5REMukD1yFfBl1w8P9ZmspuNCF/YKVRGPQCCt4RjVPY3HPY
	 SVaDtz8wlAsxA==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892F2d600c8f85cF092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DC5FA17E0154;
	Tue, 19 Aug 2025 11:12:58 +0200 (CEST)
Message-ID: <8be063910b553945da12263818bd05c4e90e27f6.camel@collabora.com>
Subject: Re: [PATCH 8/9] arm64: dts: mediatek: mt8183-kukui: Fix
 pull-down/up-adv values
From: Julien Massot <julien.massot@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Linus Walleij
 <linus.walleij@linaro.org>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Ikjoon Jang <ikjn@chromium.org>,
  Enric Balletbo i Serra	 <eballetbo@kernel.org>, Weiyi Lu
 <weiyi.lu@mediatek.com>, Eugen Hristev	 <eugen.hristev@linaro.org>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown	 <broonie@kernel.org>, Julien
 Massot <jmassot@collabora.com>, Sean Wang	 <sean.wang@kernel.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Date: Tue, 19 Aug 2025 11:12:58 +0200
In-Reply-To: <CAGXv+5FXZ_byK8Ftb9LjfQMkgtLd7mTmWgz_Nsvcv8=jy53T=g@mail.gmail.com>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
	 <20250801-mtk-dtb-warnings-v1-8-6ba4e432427b@collabora.com>
	 <CAGXv+5EHk=f62+KiLo-aWMcd0-q+_59kno+uOW5rdYaq5q+5tQ@mail.gmail.com>
	 <CACRpkdbWctNH0XJfcHfVJM9Etp0WCXpdyhhyaQemH-Xc0LDr0A@mail.gmail.com>
	 <CAGXv+5ECsP7_wbdcaAkWuD=RyJiJpPe4r60bhD5U8xUvEBzmXw@mail.gmail.com>
	 <CAGXv+5FXZ_byK8Ftb9LjfQMkgtLd7mTmWgz_Nsvcv8=jy53T=g@mail.gmail.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_021302_731742_2A85A1E0 
X-CRM114-Status: GOOD (  27.19  )
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
On Tue, 2025-08-19 at 13:29 +0800, Chen-Yu Tsai wrote:
> On Tue, Aug 19, 2025 at 1:27=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >=20
> > On Mon, Aug 18, 2025 at 11:22=E2=80=AFPM Linus Walleij <linus.walleij@l=
inaro.org> wrote:
> > >=20
> > > On Wed, Aug 6, 2025 at 8:38=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.o=
rg> wrote:
> > > > On Fri, Aug 1, 2025 at 7:18=E2=80=AFPM Julien Massot wrote
> > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 pins-clk {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 pinmux =3D <PINMUX_GPIO124__FUNC_MSDC0_CLK>;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 drive-strength =3D <MTK_DRIVE_14mA>;
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media=
tek,pull-down-adv =3D <10>;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media=
tek,pull-down-adv =3D <2>;
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bias-pull-down =3D <MTK_=
PUPD_SET_R1R0_10>;
> > > >=20
> > > > and so on.
> > > >=20
> > > > ChenYu
> > >=20
> > > I agree with ChenYu, the more standardized properties are the better =
it is.
> > >=20
> > > All the custom properties makes sense for an engineer working with ju=
st
> > > that one SoC (like the SoC vendor...) but for field engineers who hav=
e
> > > to use different SoCs every day this is just a big mess for the mind.
> > >=20
> > > The standard properties are clear, concise and tell you exactly what
> > > they are about.
> > >=20
> > > The argument should be in Ohms though, according to the standard
> > > bindings, but maybe the value of MTK_PUPD_SET_R1R0_10 is
> > > something like that?
> >=20
> > For reasons I can't recall clearly these are just placeholder values
> > that the driver then maps to the R1 and R0 settings. But at least they
> > use the standard properties.
> >=20
> > The reason was either one of the following or both:
> >=20
> > =C2=A0 a. not every group of pins had the same resistance values for R1=
 & R0
> > =C2=A0 b. there are no known precise values; the values depend on the p=
rocess
> > =C2=A0=C2=A0=C2=A0=C2=A0 and batch
>=20
> I don't know for (b), but no there is a lot of different values for R1 & =
R0
>=20

From what I saw in the register table
We can have for the pull up resistors
75K / 200K
2K  / 75K
5K  / 20K
50k / 10K=20

And for the pull down ones:

75k/2k
75k/75k
10k/50k

And we can have a combination of both resistors that will give odd values=
=20
(e.g 1948 Ohm for 2k/75K, 545454 Ohm for 75k/200k) to express in the device=
 tree=20


>=20
> Also, their customers seemed more accustomed to dealing with toggling
> R1 & R0 vs setting some actual value. I presume that comes with the
> uncertainty of the actual hardware value, and they just try which
> combination works better.
>=20
> ChenYu

Regards,
Julien

