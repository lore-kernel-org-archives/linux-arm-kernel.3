Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5378EA4E38
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 16:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twQe7m5x4QDzYF5myGO1qmalh+JuN/K7HsbfYxfx4IQ=; b=WXrjwrXV3EXcnAvuNsLrLZzpda
	fAEtbJnVdcvBRB2uq1rJY/SHHaghX4RNwZi07JOqwUGHofCag9iwjorz9xix87A7tiWli0EMTId4Z
	D1dFxPALNZyc9zAge9ZXj0u3o1fABpn6wilQ+RZiopfd7fqx7AQoyhxCHP0bIwBgCUFIjWWffF3DQ
	7NuWsoJh2ClcEq5Dwo8nns40O3xkqcX2lk2cX9uojVJ0K8sJ0cZRN6X3oGjc8Tikf6pqb8p6nU1KW
	yiso+gzwRLIzcAKingzGPGICaNN9s2cH8Kf4C024NLUr4QJT6309yq+fft5pJHQqMEWRNHjVt1DyF
	srOYuzjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5uX-0000000DT8L-3Xpl;
	Mon, 02 Mar 2026 16:14:21 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5uU-0000000DT7t-2IxD;
	Mon, 02 Mar 2026 16:14:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=twQe7m5x4QDzYF5myGO1qmalh+JuN/K7HsbfYxfx4IQ=; b=OW7jSdksduYz+IKSvOLDkKN61z
	3stPn86I1Zpe3QM5ckzmWFy9QKdsLUm1afvc7mqa9jqSrsSe/HF2/UDMZ62nQEWps7ipDbyFKPiVR
	B+i33nquzzN1C2mXfxh21wa5Gu4aAS/qpyikokftCREziVEfX/TnqygdkoVhF04Dhv6A+qn5OvTkU
	vIA0BdP9CNGr3KG2rGgl7NeB6ktSCXuuxxCtOOKSwVx2SsE3wwuLUMj0qMAMS2pyIhfk68kfDoOFQ
	1iFMM+u2zIw2O5oxhtUVW/Ql/PbtbqWjgYRdj0qwgQyK8kB0uCv7WxaiKTVaGvQN0LxGpEg200Mnx
	Qv/VMSDA==;
Date: Mon, 2 Mar 2026 17:14:07 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Kalle Niemi <kaleposti@gmail.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Bartosz Golaszewski
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
 <mazziesaccount@gmail.com>
Subject: Re: [PATCH v2 01/12] i2c: allow setting the parent device and OF
 node through the adapter struct
Message-ID: <20260302171407.5afe3b12@kemnade.info>
In-Reply-To: <CAMRc=Mcg7_MAGA2_Ue7etOHvLOxpRs7aOBHxRM3AdAHyscFxDw@mail.gmail.com>
References: <EDF3FB58-4747-442E-8463-6F1C6E568962@gmail.com>
	<20260302160923.53abf2ea@kemnade.info>
	<CAMRc=Mcg7_MAGA2_Ue7etOHvLOxpRs7aOBHxRM3AdAHyscFxDw@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_081418_590169_4134919C 
X-CRM114-Status: GOOD (  24.20  )
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

On Mon, 2 Mar 2026 16:42:58 +0100
Bartosz Golaszewski <brgl@kernel.org> wrote:

> On Mon, Mar 2, 2026 at 4:11=E2=80=AFPM Andreas Kemnade <andreas@kemnade.i=
nfo> wrote:
> >
> > On Mon, 2 Mar 2026 12:38:27 +0200
> > Kalle Niemi <kaleposti@gmail.com> wrote:
> > =20
> > > =EF=BB=BFOn 3/2/26 10:55, Bartosz Golaszewski wrote: =20
> > > > On Mon, Mar 2, 2026 at 8:47=E2=80=AFAM Kalle Niemi <kaleposti@gmail=
.com> wrote: =20
> > > >> On 2/23/26 11:05, Bartosz Golaszewski wrote: =20
> > > >>> In order to stop i2c bus drivers from dereferencing the struct de=
vice
> > > >>> embedded in struct i2c_adapter, let's allow configuring the parent
> > > >>> device and OF-node of the adapter directly through dedicated fiel=
ds.
> > > >>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualc=
omm.com>
> > > >>> --- =20
> > > >> Hello,
> > > >> Automated driver test system bisected this commit to be the first =
bad
> > > >> commit, linux-next next-20260227 was tested. Failed tests include =
driver
> > > >> tests for ROHM PMIC and accelerometers, which are connected to
> > > >> BeagleBone Black.
> > > >> The failed driver tests all fail to first i2cget and the tests stop
> > > >> there: "Could not open file '/dev/i2c-2' or 'dev/i2c/2': No such f=
ile or
> > > >> directory". =20
> > > > Wolfram: well, now it would actually be useful to know which commit
> > > > exactly is the culprit so maybe splitting the changes is not a bad
> > > > idea after all.
> > > > Kalle: which i2c bus driver fails here? Any errors in kernel log?
> > > > Bart =20
> > >
> > > Hello Bart,
> > >
> > > i2c-1 and i2c-2 are failing. I am not seeing any i2c errors in kernel=
 log. I got two failures without the dmesg available (this is bugged test s=
equence, and not a kernel crash), but those got the same stdout message "Co=
uld not open file ...." as all others.
> > > =20
> > Probably I am using the same host driver
> >
> > tested on OMAP3 DM3730, result: i2c drivers get bound to their devices,
> > no obvious trouble. But controllers are registered with high indexes.
> >
> > localhost:~# i2cdetect -l
> > i2c-3   i2c             OMAP I2C adapter                        I2C ada=
pter
> > i2c-4   i2c             OMAP I2C adapter                        I2C ada=
pter
> > i2c-5   i2c             OMAP I2C adapter                        I2C ada=
pter
> > localhost:~# uname -a
> > Linux localhost 7.0.0-rc1-next-20260227 #27 SMP Mon Mar  2 11:56:27 CET=
 2026 armv7l Linux
> >
> > Regards,
> > Andreas =20
>=20
> Hi! Does the change I posted earlier in this thread help?
>=20
It does *not* as written earlier.

Just for comparison, with the offending patch reverted, it
looks like this:

localhost:~# i2cdetect -l
i2c-0	i2c       	OMAP I2C adapter                	I2C adapter
i2c-1	i2c       	OMAP I2C adapter                	I2C adapter
i2c-2	i2c       	OMAP I2C adapter                	I2C adapter


So as long only kernel drivers are used and matched via devicetree compatib=
le
nothing seems to care about the change of bus numbers.

Regards,
Andreas

