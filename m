Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2427104891E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 23:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwL1lpCJXvEsckT0YMwwF9aQUK+teQcD0rUfuW0oUko=; b=JA1et41FjP9WSAOj58jUEVLyj9
	Q5V0dU1jdCmoOqeGtrH7VEObG30u6bOjs5q/wlbLHl61w6JuEVZLNGuGZGCbBnGzD4Ozj9ogxTXN+
	y7umJkkNDpbqYcVMn/9y5M8zDqfvYl22rTBTR3KZO3Dei8afdmBhE+heh+nbLSTTSOUZP7VJ/hnP7
	Dgaq93U3eesiigUOtay6SQ+MbVTECeWrAN9EiWhQbTv5gxabz40VHuP7gZEUFx83SQCaz/7HvsH9S
	07hTSJ3sLeLrXSjuxHxN12R29k3PG8Bk7CtYWyuADxStbcg0vl2+l383JEoimH48K1E9v7V/Y1Bvs
	EGt6HOag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw6sg-00000009FaF-1Rtw;
	Fri, 27 Feb 2026 23:04:22 +0000
Received: from mail1.manjaro.org ([2a01:4f8:c010:b6e8::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw6sd-00000009FZg-1n6k;
	Fri, 27 Feb 2026 23:04:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 3B3F9409ED;
	Sat, 28 Feb 2026 00:04:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1772233455; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uwL1lpCJXvEsckT0YMwwF9aQUK+teQcD0rUfuW0oUko=;
	b=TboDlJLC4U3LzKEmCG1Tsv+qhQdrGDFhH8Mcka7eQUc4FjUmhtaDcWnlb2+geE1feD17qq
	M4EJLOdR/MRsIkkfgo8JY8jh1h8BD7pys8+O/zKgCOmBied0y3uYKbMU7z9D7DQwROMAYm
	W5+XsTYM4ratxmwYPHRmSGprI58DXvAE+Aad2rcMF3SKgQhAYEyAdSzjjz9V1lLzcMjBLR
	TGVnnTpog835xaQZaBPniKnnKXKBgfJKQ6omjf1Y5G6bk0skc0fQMyLXFb9+AOEXknicS+
	YJDulXphvELDPp2HPPPig0xU1AiSDr4KfQRq3/leK4h5VykseoHReGJiRcCBJQ==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <aaIe-_WCD7s6Cd5j@geday>
Content-Type: text/plain; charset="utf-8"
References: <cover.1772169998.git.geraldogabriel@gmail.com>
 <9e3754ee0d1f5bc8051e28e1a5b8c046440456f5.1772169998.git.geraldogabriel@gmail.com>
 <b44e454e-f98b-4505-5603-bfc4455d11b9@manjaro.org> <aaIe-_WCD7s6Cd5j@geday>
Date: Sat, 28 Feb 2026 00:04:12 +0100
Cc: "Shawn Lin" <shawn.lin@rock-chips.com>, "Lorenzo Pieralisi" <lpieralisi@kernel.org>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Manivannan Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>, "Heiko Stuebner" <heiko@sntech.de>, linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: "Geraldo Nascimento" <geraldogabriel@gmail.com>
MIME-Version: 1.0
Message-ID: <e8819dd6-822f-1909-4e45-8b5058de7b14@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH v4 2/4] =?utf-8?q?PCI=3A?==?utf-8?q?_rockchip=3A?= 
 drive at =?utf-8?q?2=2E5?= GT/s only and error out other speeds
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_150419_852255_785F26B8 
X-CRM114-Status: GOOD (  37.78  )
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

On Friday, February 27, 2026 23:47 CET, Geraldo Nascimento <geraldogabr=
iel@gmail.com> wrote:
> On Fri, Feb 27, 2026 at 06:33:34PM +0100, Dragan Simic wrote:
> > On Friday, February 27, 2026 06:36 CET, Geraldo Nascimento <geraldo=
gabriel@gmail.com> wrote:
> > > Configure the core to be driven at 2.5 GT/s Link Speed and error
> > > out on any other speed. The reason is that Shawn Lin from Rockchi=
p
> > > has reiterated that there may be danger of "catastrophic failure"
> > > in using their PCIe with 5.0 GT/s speeds.
> > >=20
> > > While Rockchip has done so informally without issuing a proper
> > > errata, and the particulars are thus unknown, this may cause
> > > data loss or worse.
> > >=20
> > > This change is corroborated by RK3399 official datasheet [1], whi=
ch
> > > states maximum link speed for this platform is 2.5 GT/s.
> > >=20
> > > [1] https://opensource.rock-chips.com/images/d/d7/Rockchip=5FRK33=
99=5FDatasheet=5FV2.1-20200323.pdf
> > >=20
> > > Fixes: 956cd99b35a8 ("PCI: rockchip: Separate common code from RC=
 driver")
> > > Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b=
4c21b@rock-chips.com/
> > > Cc: stable@vger.kernel.org
> > > Reported-by: Dragan Simic <dsimic@manjaro.org>
> > > Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
> > > Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> > > ---
> > >  drivers/pci/controller/pcie-rockchip.c | 13 +++++--------
> > >  1 file changed, 5 insertions(+), 8 deletions(-)
> > >=20
> > > diff --git a/drivers/pci/controller/pcie-rockchip.c b/drivers/pci=
/controller/pcie-rockchip.c
> > > index 0f88da378805..26fc350a66c1 100644
> > > --- a/drivers/pci/controller/pcie-rockchip.c
> > > +++ b/drivers/pci/controller/pcie-rockchip.c
> > > @@ -66,8 +66,9 @@ int rockchip=5Fpcie=5Fparse=5Fdt(struct rockchi=
p=5Fpcie *rockchip)
> > >  	}
> > > =20
> > >  	rockchip->link=5Fgen =3D of=5Fpci=5Fget=5Fmax=5Flink=5Fspeed(no=
de);
> > > -	if (rockchip->link=5Fgen < 0 || rockchip->link=5Fgen > 2)
> > > -		rockchip->link=5Fgen =3D 2;
> > > +	if (rockchip->link=5Fgen < 0 || rockchip->link=5Fgen >=3D 2)
> > > +		return dev=5Ferr=5Fprobe(dev, rockchip->link=5Fgen,
> > > +				     "Invalid Link Speed\n");
> >=20
> > I'm quite surprised to see what happened here in the v4?  The chang=
es
> > introduced in this diff block in the v3 were perfectly fine, i.e. w=
e need
> > to correct any runtime occurrences of Gen2 speed setting in the roc=
kchip=5F
> > pcie=5Fparse=5Fdt() function, together with emitting a warning that=
 urges
> > the users and the board dtb maintainer to fix the board dtb.  I'll =
get
> > back to this below.
>=20
> I see what you mean now. Sure, this could be incorporated for v5 with=
out
> a problem and is the more proper way to solve it.

Actually, we need to do it the way I suggested above, i.e. the v3 way,
because doing it like in the v4 diff chunk above could break PCIe on so=
me
boards that currently have Gen2 configured in their dtb files, which ma=
y
get their kernels updated without updating their dtb files as well, for
whatever reason.  Basically, we need to avoid such breakage scenarios.

> > >  	for (i =3D 0; i < ROCKCHIP=5FNUM=5FPM=5FRSTS; i++)
> > >  		rockchip->pm=5Frsts[i].id =3D rockchip=5Fpci=5Fpm=5Frsts[i];
> > > @@ -147,12 +148,8 @@ int rockchip=5Fpcie=5Finit=5Fport(struct roc=
kchip=5Fpcie *rockchip)
> > >  		goto err=5Fexit=5Fphy;
> > >  	}
> > > =20
> > > -	if (rockchip->link=5Fgen =3D=3D 2)
> > > -		rockchip=5Fpcie=5Fwrite(rockchip, PCIE=5FCLIENT=5FGEN=5FSEL=5F=
2,
> > > -				    PCIE=5FCLIENT=5FCONFIG);
> > > -	else
> > > -		rockchip=5Fpcie=5Fwrite(rockchip, PCIE=5FCLIENT=5FGEN=5FSEL=5F=
1,
> > > -				    PCIE=5FCLIENT=5FCONFIG);
> > > +	rockchip=5Fpcie=5Fwrite(rockchip, PCIE=5FCLIENT=5FGEN=5FSEL=5F1=
,
> > > +			    PCIE=5FCLIENT=5FCONFIG);
> > > =20
> > >  	regs =3D PCIE=5FCLIENT=5FARI=5FENABLE |
> > >  	       PCIE=5FCLIENT=5FCONF=5FLANE=5FNUM(rockchip->lanes);
> >=20
> > At this point we need to check and bail out if no longer supported =
Gen2
> > speed setting is received, which also applies to the appropriate sp=
ot in
> > the PCIe endpoint driver.
>=20
> Right, it is a bit of a double-check I think but it can't hurt.
>=20
> > To clarify, it's the responsibility of the rockchip=5Fpcie=5Fparse=5F=
dt()
> > function to validate and possibly correct the speed setting, becaus=
e it
> > is what receives that setting as a value from the board dtb, while =
the
> > consumers of that validated speed setting should check it, to make =
sure
> > the speed is right because they no longer can handle requests for G=
en2
> > speed, and simply bail out if the received speed isn't right, i.e. =
if
> > it differs from Gen1.
>=20
> Like I said, it ends being a double-check, because we can't let probe
> progress if link=5Fgen ends up being different than 1. Either we forc=
e
> 2.5 GT/s with a fair warning or we error out on the probe already.

Ah, sorry, I somehow missed that both rockchip=5Fpcie=5Fhost=5Finit=5Fp=
ort() and
rockchip=5Fpcie=5Fep=5Flink=5Ftraining() are defined as static function=
s, so you're
right that checking for "link=5Fgen =3D=3D 1" in them again would be re=
dundant.


