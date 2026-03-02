Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE54EA4E2B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+cEZMdIbkTNuc8V0+2/U1K0zQ+pBrPYJlsUByy01QU=; b=s6nJ49LZyvOVthGHqJBfxuMSCK
	jAFCC4Ixgvj8XUwMT57wzGM02tEx8w/4dfzdkH9Q3eosdcBzce90kqVgxvklXiXABwcmbpZpiSa1X
	9TUuiNutIIIxrWydMOTfVd023Nf8yHZ8w7O5hhrPaiitrfTnnY6Sp/POeU1fT0hSmvXci80017eM3
	waNO8YY4f+Gg16Ny35Ze69SQjTCsS8TLUZuMLxCjoBYhCldSEysjbqh/Ljbiu+wdXQmg0ElHiSWhC
	H+eD9n5zOxUbCOjE0VMPKzbBhoeY69bOqVCH8DYZcs+hn+PRFJjw/vzkmPiCSjGn6BTwoWUZBnHK5
	PJp7yETw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5gK-0000000DR78-3sD0;
	Mon, 02 Mar 2026 15:59:40 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5gI-0000000DR5z-1XW2;
	Mon, 02 Mar 2026 15:59:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=m+cEZMdIbkTNuc8V0+2/U1K0zQ+pBrPYJlsUByy01QU=; b=U4dS6ZuplR4gMAUbhaueT98vov
	LpSbLTc1jxe+fZfsTiYzJl2Tq1js+HHiOi83ruaLdLfqWlVClK7BuEl2Ke1ZYVkPPVVMwguCO2o5k
	Y+Xaf7wf5BY+7pkkFc0mRPK0dQQDntMJ3J1aalxumhpV9LsOnKGVm+V7VjhUxBq4fWdultevdkUS5
	ZiphFAl8o+fc4AvlZPBICrm26rdd0HrZwW9PC/66JZZxKljItRmq0/vZQgCKPtJ+8hamepbVnE0Ns
	8uXNEEO5Yj4h9uTNCtk6j6ukMXJ1b0tfKXxYlNZLRAFoBcZjbJwo8CeV3bcIcpwC6lsYY+UjV+KrG
	CICpupYw==;
Date: Mon, 2 Mar 2026 16:59:28 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Kalle Niemi <kaleposti@gmail.com>, Bartosz Golaszewski
 <bartosz.golaszewski@oss.qualcomm.com>, Mukesh Kumar Savaliya
 <mukesh.savaliya@oss.qualcomm.com>, Viken Dadhaniya
 <viken.dadhaniya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Branden Scott <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Vignesh R <vigneshr@ti.com>, Aaro
 Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Patrice
 Chotard <patrice.chotard@foss.st.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Linus Walleij
 <linusw@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, Matti Vaittinen
 <mazziesaccount@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 01/12] i2c: allow setting the parent device and OF
 node through the adapter struct
Message-ID: <20260302165928.0e85b93c@kemnade.info>
In-Reply-To: <CAMRc=Mc1+GX52A56kBLD0XytvL=E7kpjLDiqNkR=fici4-qUnw@mail.gmail.com>
References: <EDF3FB58-4747-442E-8463-6F1C6E568962@gmail.com>
	<CAMRc=Mc1+GX52A56kBLD0XytvL=E7kpjLDiqNkR=fici4-qUnw@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_075938_417438_7C1861EC 
X-CRM114-Status: GOOD (  26.54  )
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

On Mon, 2 Mar 2026 03:08:24 -0800
Bartosz Golaszewski <brgl@kernel.org> wrote:

> On Mon, 2 Mar 2026 11:38:27 +0100, Kalle Niemi <kaleposti@gmail.com> said:
> > On 3/2/26 10:55, Bartosz Golaszewski wrote: =20
> >> On Mon, Mar 2, 2026 at 8:47=E2=80=AFAM Kalle Niemi <kaleposti@gmail.co=
m> wrote: =20
> >>> On 2/23/26 11:05, Bartosz Golaszewski wrote: =20
> >>>> In order to stop i2c bus drivers from dereferencing the struct device
> >>>> embedded in struct i2c_adapter, let's allow configuring the parent
> >>>> device and OF-node of the adapter directly through dedicated fields.
> >>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm=
.com>
> >>>> --- =20
> >>> Hello,
> >>> Automated driver test system bisected this commit to be the first bad
> >>> commit, linux-next next-20260227 was tested. Failed tests include dri=
ver
> >>> tests for ROHM PMIC and accelerometers, which are connected to
> >>> BeagleBone Black.
> >>> The failed driver tests all fail to first i2cget and the tests stop
> >>> there: "Could not open file '/dev/i2c-2' or 'dev/i2c/2': No such file=
 or
> >>> directory". =20
> >> Wolfram: well, now it would actually be useful to know which commit
> >> exactly is the culprit so maybe splitting the changes is not a bad
> >> idea after all.
> >> Kalle: which i2c bus driver fails here? Any errors in kernel log?
> >> Bart =20
> >
> > Hello Bart,
> >
> > i2c-1 and i2c-2 are failing. I am not seeing any i2c errors in kernel l=
og. I got two failures without the dmesg available (this is bugged test seq=
uence, and not a kernel crash), but those got the same stdout message "Coul=
d not open file ...." as all others.
> >
> > -Kalle
> > =20
>=20
> I meant what driver are you using but I suppose it's i2c-omap.
>=20
> Can you try the following change and let me know if it fixes the issue?
>=20
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index dd8cec9b04c6..01656f82d2c6 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1548,6 +1548,11 @@ static int i2c_register_adapter(struct i2c_adapter=
 *adap)
>  	if (adap->timeout =3D=3D 0)
>  		adap->timeout =3D HZ;
>=20
> +	if (!adap->dev.parent)
> +		adap->dev.parent =3D adap->parent;
> +	if (!adap->dev.of_node)
> +		adap->dev.of_node =3D adap->of_node;
> +
>  	/* register soft irqs for Host Notify */
>  	res =3D i2c_setup_host_notify_irq_domain(adap);
>  	if (res) {
> @@ -1561,11 +1566,6 @@ static int i2c_register_adapter(struct i2c_adapter=
 *adap)
>  	adap->dev.type =3D &i2c_adapter_type;
>  	device_initialize(&adap->dev);
>=20
> -	if (!adap->dev.parent)
> -		adap->dev.parent =3D adap->parent;
> -	if (!adap->dev.of_node)
> -		adap->dev.of_node =3D adap->of_node;
> -
>  	/*
>  	 * This adapter can be used as a parent immediately after device_add(),
>  	 * setup runtime-pm (especially ignore-children) before hand.
>=20
No changes here. Devices probe, bus indexes are still shifted.
If I take that into account, i2cget still works.

But I think there is no defined order anyways. So if
I would add e.g. usb device provoding i2c busses early than
omap-i2c for some odd reason, things were messed anyways.

On the other hand, just having numbers skipped seems to be odd.

Regards,
Andreas

