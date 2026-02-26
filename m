Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C42FD4616
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 04:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ng3zv82xhOSBFnbYUmWaLkKZuWzEHGZYyz7mquCv+AY=; b=ZpiifjfwiEG/FBsyCShTipkNgB
	S7B1ANiISOWOJ5jFjWxdwPS3gc1jqsYQU6EMdFNjeWxL0obyAHQg2An2xjDNs5cffHIi7jfouIH3x
	owSXxZCdv4xCkYt7y92TFzuCETBCm1JP148lY4uDRU7XuTSLFCMIbztsA6spkagkjY4nnW7pnU1iL
	MXi2qi9uOswqrxhw/IiYgfwuYboi9qMDkp6mVvwWoxqoZp+BsCyRN0aE9103I7U8TMgj1B3dkyEx4
	ijipfdckJbYGgVABKI8894cJNbBcHt0an5ilaM8sYAajV4/nPoyB8hr4bGIWb0bybTapr7s7h1+U7
	yyCXq+vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvTNE-00000005Nko-1kjA;
	Thu, 26 Feb 2026 04:53:16 +0000
Received: from mail1.manjaro.org ([2a01:4f8:c010:b6e8::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvTN7-00000005Nht-0hhl;
	Thu, 26 Feb 2026 04:53:11 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 294C442053;
	Thu, 26 Feb 2026 05:52:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1772081582; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ng3zv82xhOSBFnbYUmWaLkKZuWzEHGZYyz7mquCv+AY=;
	b=B60mAHbtY4h0REVywWQLt6HGshTl3/zo3YgAro3ysEruPLY9H7lIb8U2NVryz2wE2dzR/9
	T1Qu6DTp2lsD6toPJyDidLVlTY5LetXqJYgEhlDFEk/yPhfGmQCoAmf7GiEuJWPYek0ZsG
	6XWvCrcMHg7167k+pqJg5YeqyyqM43uruT4Pyc4WDo9e1lDAfMx5gg+wV7Ef0HBM3b5Ysj
	1Cq//twsLcMFzuRWBToe56EBHOFS1xu32VTDqkTiU8qoLxIaldz3+zJnKhArfzsQlEXC9T
	rr21LusDOw+xLVtUs0LwDW+ZYaZK4VT2Ht/s4kzfqatJsGLSmFasXlOT61AjeA==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <aZ-RaBLVfEZA_FxU@geday>
Content-Type: text/plain; charset="utf-8"
References: <8db835ffe384db63ee598a203751b298ad1cc267.1772057799.git.geraldogabriel@gmail.com>
 <20260226001229.GA3794668@bhelgaas> <aZ-RaBLVfEZA_FxU@geday>
Date: Thu, 26 Feb 2026 05:52:58 +0100
Cc: "Bjorn Helgaas" <helgaas@kernel.org>, "Shawn Lin" <shawn.lin@rock-chips.com>, "Lorenzo Pieralisi" <lpieralisi@kernel.org>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Manivannan Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>, "Heiko Stuebner" <heiko@sntech.de>, linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: "Geraldo Nascimento" <geraldogabriel@gmail.com>
MIME-Version: 1.0
Message-ID: <e0aa10e5-ec0a-4d0d-6f71-6797286221cc@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH v3 2/2] =?utf-8?q?PCI=3A?=
 =?utf-8?q?_rockchip-host=3A?= comment danger of =?utf-8?q?5=2E0?= GT/s 
 speed
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_205309_426085_5F18A74C 
X-CRM114-Status: GOOD (  25.54  )
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

Hello Geraldo and Bjorn,

On Thursday, February 26, 2026 01:18 CET, Geraldo Nascimento <geraldoga=
briel@gmail.com> wrote:
> On Wed, Feb 25, 2026 at 06:12:29PM -0600, Bjorn Helgaas wrote:
> > On Wed, Feb 25, 2026 at 07:27:44PM -0300, Geraldo Nascimento wrote:
> > > According to Rockchip sources, there is grave danger in enabling =
5.0
> > > GT/s speed for this core. Add a comment documenting this risk of
> > > "catastrophic failure" and discouraging end-users from forcing
> > > higher speed.
> >=20
> > A comment in the code might be useful but doesn't discourage end
> > users.
>=20
> Hi Bjorn, thanks for the quick review.
>=20
> > > Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b=
4c21b@rock-chips.com/
> > > Cc: stable@vger.kernel.org
> > > Reported-by: Dragan Simic <dsimic@manjaro.org>
> > > Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
> > > Reviewed-by: Dragan Simic <dsimic@manjaro.org>
> > > Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> > > ---
> > >  drivers/pci/controller/pcie-rockchip-host.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >=20
> > > diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/driver=
s/pci/controller/pcie-rockchip-host.c
> > > index ee1822ca01db..4faf3e29b7d5 100644
> > > --- a/drivers/pci/controller/pcie-rockchip-host.c
> > > +++ b/drivers/pci/controller/pcie-rockchip-host.c
> > > @@ -332,6 +332,10 @@ static int rockchip=5Fpcie=5Fhost=5Finit=5Fp=
ort(struct rockchip=5Fpcie *rockchip)
> > >  		/*
> > >  		 * Enable retrain for gen2. This should be configured only aft=
er
> > >  		 * gen1 finished.
> > > +		 *
> > > +		 * Dangerous and may lead to "catastrophic failure", with data=
 loss
> > > +		 * or worse!
> > > +		 *
> >=20
> > Wrap comment to fit in 80 columns like the rest of the file.
> >=20
> > Remove spurious blank line at end.
> >=20
> > This should probably be squashed with the first patch; I don't see =
the
> > benefit of having them separate.
> >=20
> > Why don't we just remove this whole "link=5Fgen =3D=3D 2" block?  I=
f we
> > don't want to use it, there's no point in keeping the code.
>=20
> Yes, I think I'll go with this second option and remove the code
> block outright.

I agree about removing the effectively unused code block that handles
the "link=5Fgen =3D=3D 2" case from pcie-rockchip-host.c, but then plea=
se
remove the PCIE=5FCLIENT=5FGEN=5FSEL=5F2 define from pcie-rockchip.h an=
d its
single "link=5Fgen =3D=3D 2" use from pcie-rockchip.c as well.

As part of that additional removal, an early check for "link=5Fgen =3D=3D=
 1"
should be added to function rockchip=5Fpcie=5Finit=5Fport() in pcie-roc=
kchip.c,
because that will become the only "link=5Fgen" value it supports.

> >=20
> > >  		 */
> > >  		status =3D rockchip=5Fpcie=5Fread(rockchip, PCIE=5FRC=5FCONFIG=
=5FCR + PCI=5FEXP=5FLNKCTL2);
> > >  		status &=3D ~PCI=5FEXP=5FLNKCTL2=5FTLS;


