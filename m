Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D234C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 07:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:From:Cc:Message-Id:Date:Content-Type:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k0se/tDOdWUTqvpFUMmktvqAE45vAW0mamwV4o2KQ/Y=; b=s+/W6PeS1wiHb7OH2lDILch0jj
	BpZ9T53+67PRCbZhgmdtf04xR50bYnAACzcLzbEl1W2Ob2JtFrGLa0ORMdStjc2HY4FGFbiNzpcuk
	SnE6/65EEZfU67bY8xtybATZmRMwEjf1WoPIFT8z/k696t2XKDZnQjP7HrjypQ1S97RohQ4w64o3x
	BVRYeIq4RwwJDlbVtD+hwNwe/LsiM9vucQOiroeRAwxN17tjAdDBvA20Ebqsn4icizQiVjP+3Yqfd
	x1gPCi3sHOROfsircEm0cgvHDz009dkYKhJFq41JxOvXbCBXJhapd8utN+SK7f9v8BJp2fVtwdBe2
	FhpamA4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubDSY-00000001S3f-274G;
	Mon, 14 Jul 2025 07:18:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCnJ-00000001N9k-37Q0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 06:36:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8456FA53384;
	Mon, 14 Jul 2025 06:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A7EC4CEED;
	Mon, 14 Jul 2025 06:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752474968;
	bh=COauMq+Zx3uq569P2RZsqh2PKi46abFL9EqFFIlngoY=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=MNjvyRYw7yHD9P+QQydki15ecx2DgosCaUdFKTxhS4R9/uKCYx6aAJHX5vdqsTaRi
	 CuZ8A/4wNDMmM56Mccrox6PBjtg88wiyvLCnVQRYq1hDXA2ViQ+5d6kpvlV6QkoW4B
	 QDEyRVnWiSQ542TK0kX0miTfj5lG/00suwBTogExssr8nExAKRIbkvT0AQGicPH5CV
	 2nuuguTQkpxgV/Icg7tVXi3DLoLjphI9Qki4f0GIRJOB7SSvK8fToKxV3bAbm+DtqG
	 NwZddqh8XzKgz9qSN0f/7NxwK6QbSV0KzBVYdraCMoYwhOHVkTk/KczVbryo+38IfT
	 gcc58bp2+1mCA==
Content-Type: multipart/signed;
 boundary=f4bf19f601e8d4e8c8230525d2e6b92647bd8f296438ae8780d8e32759dd;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 14 Jul 2025 08:36:03 +0200
Message-Id: <DBBKJ05VNSDG.30MNWDWT9JAEC@kernel.org>
Cc: "Ioana Ciornei" <ioana.ciornei@nxp.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Bartosz Golaszewski" <brgl@bgdev.pl>, "Shawn Guo"
 <shawnguo@kernel.org>, "Lee Jones" <lee@kernel.org>, "Frank Li"
 <Frank.Li@nxp.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Linus Walleij" <linus.walleij@linaro.org>, "Andrew Lunn"
 <andrew@lunn.ch>
Subject: Re: [PATCH 4/9] gpio: regmap: add the .get_direction() callback
X-Mailer: aerc 0.16.0
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
 <20250709112658.1987608-5-ioana.ciornei@nxp.com>
 <0d0e9cee-2aaa-402d-a811-8c4704aadd74@lunn.ch>
 <CACRpkdYDTXA7+YN2zRCsQxu2AKEAwbDVq8-m27ah5XTw9iRNPw@mail.gmail.com>
 <55e7aeb5-565f-4452-bc11-55968dcc0a9e@lunn.ch>
 <CACRpkda+=A5R4vZZQZKmF3LnGd6xMYbNomahgTW+j9aX9swBFA@mail.gmail.com>
In-Reply-To: <CACRpkda+=A5R4vZZQZKmF3LnGd6xMYbNomahgTW+j9aX9swBFA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_233609_913990_1B3E949B 
X-CRM114-Status: GOOD (  27.63  )
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

--f4bf19f601e8d4e8c8230525d2e6b92647bd8f296438ae8780d8e32759dd
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Jul 11, 2025 at 8:06 PM CEST, Linus Walleij wrote:
> On Fri, Jul 11, 2025 at 7:45=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrot=
e:
> > On Fri, Jul 11, 2025 at 07:43:13PM +0200, Linus Walleij wrote:
> > > On Wed, Jul 9, 2025 at 5:09=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> w=
rote:
> > >
> > > > This is not my area, so i will deffer to the GPIO
> > > > Maintainers. However, it is not clear to me what get_direction()
> > > > should return.
> > >
> > > This callback should return the current direction as set up
> > > in the hardware.
> > >
> > > A major usecase is that this is called when the gpiochip is
> > > registered to read out all the current directions of the GPIO
> > > lines, so the kernel has a clear idea of the state of the
> > > hardware.
> > >
> > > Calling this should ideally result in a read of the status from
> > > a hardware register.
> >
> > O.K, so completely different to what is proposed in this patch.
> >
> > Maybe you can suggest a better name.
>
> If the hardware only supports one direction, then .get_direction()
> should return that direction.
>
> What the patch does is to
> read the direction from the hardware and use that in the
> set_direction() callback, as if all regmapped hardware in the
> world had fixed direction, that's wrong.
>
> I'd just add something custom in gpio-regmap if this is
> something reoccuring in regmapped GPIO drivers.
>
> bool is_fixed_direction(struct gpio_regmap *gpio, unsigned int offset)
>
> or so?
>
> Then the core can use is_fixed_direction() together
> with gpio_get_direction() to check if it can do
> a certain set_direction().
>
> Pseudocode:
>
> mydir =3D get_direction(line)
> if (is_fixed_direction(line) && (mydir !=3D requested_dir)
>   return -ERROR;

You don't need a .is_fixed_direction(). You can deduce that if only
.get_direction() is set in the gpio-regmap config.

mydir =3D get_direction(line)
if (!config->set_direction && mydir !=3D requested_dir)
  return -ERROR;

That or either Andrew's idea of setting a bitmap within the
gpio-regmap config which already tells the gpio-regmap core and then
amend gpio_regmap_get_direction() to return that fixed direction if
that bitmap is not NULL.

I'm fine with both.

-michael

--f4bf19f601e8d4e8c8230525d2e6b92647bd8f296438ae8780d8e32759dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaHSlVBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jQ+QF/Sh9YipYQ+NuecbEAX6M3aMt220c2QO/i
BcZFdXjO9B54HMg0xV402FYHoqqVUzMBAXwPLqgnOoKN+UW5OzisXT/wp8tx42vH
5YcYBv+I9kZuCMxqUDqGJQrewv4OJdbajA4=
=oUeW
-----END PGP SIGNATURE-----

--f4bf19f601e8d4e8c8230525d2e6b92647bd8f296438ae8780d8e32759dd--

