Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982B4EEF30E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 06:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dErXW1Jpzv3QJs1jd2FdC9ztVSxwa/zpnT9DC9MGvBE=; b=fSV4h0JzPSK5MJ46xpUWC63VQz
	UeytavTfgCoRTqwKA/+yl+pFD7enSznTSqg+OGvo+x6dOADwxH1IQ3nOy5ibM00ZG0nkYCFuT7MI+
	/ZFo1E9EdB3CxBvIDRTZFkkpOZ48aAVd+xbICFpejJRJfsV1IFEagUgkoo10kfwZ4aFA/V9NPe7Ls
	onrEZtrxM593rG2Hjh931t6TqHPIl6QrQfsjT+JEngkkYy+4eXcv8CxlJ+JpO6y0wwB6oGx5MsFTy
	9lNyeoEVcEAUm/nhnyERpEGLSJkatpTwFWuBWWPqNGZnyzb5/yLM9wh7pFw8LbMXjdn4+RGo3l6+B
	nkJ86KNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy2bi-0000000135W-3HZf;
	Thu, 05 Mar 2026 06:54:50 +0000
Received: from mail1.manjaro.org ([142.132.176.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy2bf-0000000133w-3k9h;
	Thu, 05 Mar 2026 06:54:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 199BF4211B;
	Thu,  5 Mar 2026 07:54:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1772693683; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dErXW1Jpzv3QJs1jd2FdC9ztVSxwa/zpnT9DC9MGvBE=;
	b=oy5bvIDW2Sp5DqZl+Y6XZL9oslOctdG42e1H2jUw7REGuEZTv5+udzyBMdK1cwkxGtrr8o
	idK5lp2XAr9PCRrOcomg7q33vZxI+XSWPs/IZUEqtAnaFq1S7DFuePb12tNjrhNibroCQ3
	guGgsMgu2CrQfdvJyslI5x84U312jgp9sXpwFNP3NW1qExG8lKtsXmWB0Pv/CS+Y8RsTsB
	WDetmyBplXVUTvH4JYu24g7AVW8e6hMWanoqOTYw5TyNynDQR8c7wMUYGdK4bEb3fIC+Bc
	5t7XFzBqzU+YLDozg635lQuo9cWbqwSCMvElG0x5Pp0L2T4vun3ZTQyf1Saplg==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <aakEQ_qtBbYCaUsA@geday>
Content-Type: text/plain; charset="utf-8"
References: <cover.1772239598.git.geraldogabriel@gmail.com>
 <2a0a4aa97bb8b0cb511cb651c5d66c9ec8bab97a.1772239598.git.geraldogabriel@gmail.com>
 <d2b91260-7666-3606-69ec-0e7cb7a48c02@manjaro.org> <aakEQ_qtBbYCaUsA@geday>
Date: Thu, 05 Mar 2026 07:54:39 +0100
Cc: "Shawn Lin" <shawn.lin@rock-chips.com>, "Lorenzo Pieralisi" <lpieralisi@kernel.org>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Manivannan Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>, "Heiko Stuebner" <heiko@sntech.de>, linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: "Geraldo Nascimento" <geraldogabriel@gmail.com>
MIME-Version: 1.0
Message-ID: <5299c7c8-7593-6b0b-5def-8f0bdaecd8f9@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH v5 3/4] =?utf-8?q?PCI=3A?==?utf-8?q?_rockchip=3A?= 
 drive at =?utf-8?q?2=2E5?==?utf-8?q?_GT/s=2C?= error other speeds
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-Rspamd-Fuzzy: 92c42003f999b2e674c87b253aa06c9cc4c940f5231e4605c1cd9f8098bf9aa98d30a83a9928210ba715e9c0d2880cee688bb95b719aaf896ecda919cea7cf50
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_225448_297779_2D7C8C10 
X-CRM114-Status: GOOD (  38.08  )
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

Hello Geraldo,

On Thursday, March 05, 2026 05:19 CET, Geraldo Nascimento <geraldogabri=
el@gmail.com> wrote:
> On Sat, Feb 28, 2026 at 07:16:41AM +0100, Dragan Simic wrote:
> > On Saturday, February 28, 2026 01:55 CET, Geraldo Nascimento <geral=
dogabriel@gmail.com> wrote:
> > > Configure the core to be driven at 2.5 GT/s Link Speed and ignore
> > > any other speed with a warning. The reason is that Shawn Lin from
> > > Rockchip has reiterated that there may be danger of "catastrophic
> > > failure" in using their PCIe with 5.0 GT/s speeds.
> > >=20
> > > While Rockchip has done so informally without issuing a proper er=
rata,
> > > and the particulars are thus unknown, this may cause data loss or
> > > worse.
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
> > >  drivers/pci/controller/pcie-rockchip.c | 15 +++++++++------
> > >  1 file changed, 9 insertions(+), 6 deletions(-)
> > >=20
> > > diff --git a/drivers/pci/controller/pcie-rockchip.c b/drivers/pci=
/controller/pcie-rockchip.c
> > > index 0f88da378805..2f211d1f4c7c 100644
> > > --- a/drivers/pci/controller/pcie-rockchip.c
> > > +++ b/drivers/pci/controller/pcie-rockchip.c
> > > @@ -66,8 +66,10 @@ int rockchip=5Fpcie=5Fparse=5Fdt(struct rockch=
ip=5Fpcie *rockchip)
> > >  	}
> > > =20
> > >  	rockchip->link=5Fgen =3D of=5Fpci=5Fget=5Fmax=5Flink=5Fspeed(no=
de);
> > > -	if (rockchip->link=5Fgen < 0 || rockchip->link=5Fgen > 2)
> > > -		rockchip->link=5Fgen =3D 2;
> > > +	if (rockchip->link=5Fgen < 0 || rockchip->link=5Fgen >=3D 2) {
> > > +		rockchip->link=5Fgen =3D 1;
> > > +		dev=5Fwarn(dev, "invalid max-link-speed, fix your DT\n");
> > > +	}
> >=20
> > I'd suggest using a bit more formal message here, like the one belo=
w,
> > which would also avoid addressing the user directly:
> >=20
> >   "Invalid max-link-speed found, limited to Gen1 to avoid data corr=
uption"
>=20
> We really should spare on characters here, but I see your point and w=
ill
> try to cook up a better way.

Makes sense, so perhaps just "Limited to Gen1 to avoid data corruption"
should be fine for the purpose, because anyone attempting to get rid
of that warning should search for what emitted it in the kernel source,
which would provide them with further information.

> > >  	for (i =3D 0; i < ROCKCHIP=5FNUM=5FPM=5FRSTS; i++)
> > >  		rockchip->pm=5Frsts[i].id =3D rockchip=5Fpci=5Fpm=5Frsts[i];
> > > @@ -147,12 +149,13 @@ int rockchip=5Fpcie=5Finit=5Fport(struct ro=
ckchip=5Fpcie *rockchip)
> > >  		goto err=5Fexit=5Fphy;
> > >  	}
> > > =20
> > > -	if (rockchip->link=5Fgen =3D=3D 2)
> > > -		rockchip=5Fpcie=5Fwrite(rockchip, PCIE=5FCLIENT=5FGEN=5FSEL=5F=
2,
> > > -				    PCIE=5FCLIENT=5FCONFIG);
> > > -	else
> > > +	if (rockchip->link=5Fgen =3D=3D 2) {
> > > +		/* 5.0 GT/s may cause catastrophic failure for this core */
> > > +		dev=5Fwarn(dev, "5.0 GT/s may cause data loss or worse\n");
> > > +	} else {
> > >  		rockchip=5Fpcie=5Fwrite(rockchip, PCIE=5FCLIENT=5FGEN=5FSEL=5F=
1,
> > >  				    PCIE=5FCLIENT=5FCONFIG);
> > > +	}
> >=20
> > I don't think we need to emit a warning here, because, as we've alr=
eady
> > established through earlier discussions, the rockchip=5Fpcie=5Finit=
=5Fport()
> > function should never receive an invalid speed value.
>=20
> Just as a lame excuse, those messages were everywhere in the mid of m=
y
> development, this is one that escaped deletion, will drop.

Thanks.

> > >  	regs =3D PCIE=5FCLIENT=5FARI=5FENABLE |
> > >  	       PCIE=5FCLIENT=5FCONF=5FLANE=5FNUM(rockchip->lanes);
> >=20
> > It would make most sense to squash all three patches in this series
> > into a single patch, because they all form a single logical unit, w=
hich
> > introduces changes that are just going to be harder to track down l=
ater
> > if it's all scattered into multiple separate patches.
>=20
> I agree, having all drops in one big patch is the better tactic here.
>=20
> > The only possible issue with the squashing comes from the inability=
 to
> > have different patch subject prefixes for different driver changes,=
 but
> > I think that's actually not an issue.  The long-term benefits of ha=
ving
> > everything as a single patch outweighs the benefits of having diffe=
rent
> > patch subjects with separate patches.
>=20
> Sure, will do so for v6.

Thanks, but as Manivannan pointed out, having the changes split across
a couple of patches actually comes with benefits.


