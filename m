Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F2BEA4E1D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fOE00VOY5CO+udhbXmZXmQz9cKeY+YffWZiDPf2sZPk=; b=ZDY2cRUAJtf0v2qhZKsBwah6dH
	goSC6tRtAMif/CuuxXeqeadA44jiAkLFMZNou4FFPFPoqnUF5fOMcTpfGyXYHYsrAv47ChRm3L7vS
	hP9hfiBHDyWWjtqdkOXAUfoZqEcbjMGW29gxzT8qVkQAHi631HHrAqbBlYzKUYnZFXpAGaN151Drt
	XQ34ie4vVVXoKToSj+BuvfBye39LbGxzIL0sxEN8cARYDyrjIeFMRXfZMmKBkrwfbA/ZR2sY33A+I
	jI2NOwV1Tj0WLnXxA1sIxCr9FRLgsgT0ym2fkVP/vRumFcl2KquxqXKVrmoNE225DRVoVfIMKEFzd
	PLPd+MfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4w8-0000000DJiw-11NK;
	Mon, 02 Mar 2026 15:11:56 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4w5-0000000DJi2-1pDH;
	Mon, 02 Mar 2026 15:11:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=fOE00VOY5CO+udhbXmZXmQz9cKeY+YffWZiDPf2sZPk=; b=noBkohPQtvbuoZmsWo6lCfVC0v
	wnxzq1SQ5Lj/pBCMSx747FmzuCK3eO9Ch94CEp6EBHx2GpGzcEerfJlEq3n25yBTSh935UFK8DGD4
	SzpfFNUZZdnGXXIg7FSlb6nQN0crQj1+1RVt0ZZrhPMu/VabG3RzgYsd+0pDI8YtVWoftgAogzXGG
	/Kt60pHaK6B/3iUjTMbmMNc/i8GCJHUQ93IX3MyLxeBxH+Y2VHs239W1HoqMHwAv+BQ0YU39VuaD6
	rxdtCJn8AyOra+wikSbvm26LeV9ISHk9b2tds38fBYg7DDQIVOZYTRpNq1xyd648ZITveXnM4+DWx
	DsvP98lQ==;
Date: Mon, 2 Mar 2026 16:09:23 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Kalle Niemi <kaleposti@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Wolfram Sang
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
Message-ID: <20260302160923.53abf2ea@kemnade.info>
In-Reply-To: <EDF3FB58-4747-442E-8463-6F1C6E568962@gmail.com>
References: <EDF3FB58-4747-442E-8463-6F1C6E568962@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_071153_496331_94128D3B 
X-CRM114-Status: GOOD (  18.75  )
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

On Mon, 2 Mar 2026 12:38:27 +0200
Kalle Niemi <kaleposti@gmail.com> wrote:

> =EF=BB=BFOn 3/2/26 10:55, Bartosz Golaszewski wrote:
> > On Mon, Mar 2, 2026 at 8:47=E2=80=AFAM Kalle Niemi <kaleposti@gmail.com=
> wrote: =20
> >> On 2/23/26 11:05, Bartosz Golaszewski wrote: =20
> >>> In order to stop i2c bus drivers from dereferencing the struct device
> >>> embedded in struct i2c_adapter, let's allow configuring the parent
> >>> device and OF-node of the adapter directly through dedicated fields.
> >>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.=
com>
> >>> --- =20
> >> Hello,
> >> Automated driver test system bisected this commit to be the first bad
> >> commit, linux-next next-20260227 was tested. Failed tests include driv=
er
> >> tests for ROHM PMIC and accelerometers, which are connected to
> >> BeagleBone Black.
> >> The failed driver tests all fail to first i2cget and the tests stop
> >> there: "Could not open file '/dev/i2c-2' or 'dev/i2c/2': No such file =
or
> >> directory". =20
> > Wolfram: well, now it would actually be useful to know which commit
> > exactly is the culprit so maybe splitting the changes is not a bad
> > idea after all.
> > Kalle: which i2c bus driver fails here? Any errors in kernel log?
> > Bart =20
>=20
> Hello Bart,
>=20
> i2c-1 and i2c-2 are failing. I am not seeing any i2c errors in kernel log=
. I got two failures without the dmesg available (this is bugged test seque=
nce, and not a kernel crash), but those got the same stdout message "Could =
not open file ...." as all others.
>=20
Probably I am using the same host driver

tested on OMAP3 DM3730, result: i2c drivers get bound to their devices,
no obvious trouble. But controllers are registered with high indexes.

localhost:~# i2cdetect -l
i2c-3	i2c       	OMAP I2C adapter                	I2C adapter
i2c-4	i2c       	OMAP I2C adapter                	I2C adapter
i2c-5	i2c       	OMAP I2C adapter                	I2C adapter
localhost:~# uname -a
Linux localhost 7.0.0-rc1-next-20260227 #27 SMP Mon Mar  2 11:56:27 CET 202=
6 armv7l Linux

Regards,
Andreas

