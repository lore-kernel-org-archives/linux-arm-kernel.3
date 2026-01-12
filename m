Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A94DC9EC6F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 11:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DWNPGMqaJKT2DTVjAZ8virInZYZelttbbbD/egipkf8=; b=GwuIw8C+D1hyhyQsVwrwjqPUc2
	6zQBmFdz4unnrJJeLEBc7xDYcc88fEEDDGFRtW5IQP79cUAFA8sAW5dJuTzAFn/N1HRCWGcGPZZLI
	Vo+LhIZ2JZg11NE/hUqo+m06ZozqgNZFw3CsZxKyjB6N4qbJqGdDvErlluB8jLaycbgwLWXSteboO
	taSPbYTjmMjaAKzS74Gqi7lfkLsnmZKl8JVW9RPPqNBrqfI7EJ424B2CWewROI+ARhSphBLHE/hEK
	s4i4m3ygd4yc1Hc2LZL+RWolOsd8IXe1xG+w5auSNebE7pvdiNmLZMqKBula+TCQUvVX3ecACmODS
	ImqOh3tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFh9-00000005DIE-1rCV;
	Mon, 12 Jan 2026 11:02:47 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFh8-00000005DHn-00OL;
	Mon, 12 Jan 2026 11:02:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=DWNPGMqaJKT2DTVjAZ8virInZYZelttbbbD/egipkf8=; b=Xv34hKlaaHbXVbZ1UG4gQg6bNI
	br6j8JxjmqssQQ91yiCYo9mrQWQSUln1AMH9KAB4TsARXI6SPRioylSyGp6v02G/8CD5co8bCCwtK
	b5DfISjQVKQEjUkLifa4DO65NYNqsJUvGdy5JmEMAoroY4nUNPpI38dDgRRYjoTHsnPHvKWW5rrHP
	gzWo65TeIr7HBUgkHICRJNd4cNLM7NNqpuYrwNUqpCvsQUZsxZ0H/LI4hQX4JdhtweNbkd1gZnQF4
	mbO01PhwlUpZK49RlHcMF8XLApeAOfE81/CErNpKWNtfj2ksKDae1S6ORIiXmH1JvLpRSQ0weWVXH
	bJSjBA9Q==;
Received: from i53875b6a.versanet.de ([83.135.91.106] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vfFgx-001wKN-TA; Mon, 12 Jan 2026 12:02:36 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Joseph Chen <chenjh@rock-chips.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Joseph Chen <chenjh@rock-chips.com>
Subject: Re: [PATCH v2 2/3] mfd: rk8xx: Add RK801 support
Date: Mon, 12 Jan 2026 12:02:35 +0100
Message-ID: <1980810.GKX7oQKdZx@diego>
In-Reply-To: <20260112102849.1479-3-chenjh@rock-chips.com>
References: <20260112102849.1479-1-chenjh@rock-chips.com>
 <20260112102849.1479-3-chenjh@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_030246_103881_C492EB52 
X-CRM114-Status: GOOD (  21.57  )
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

Hi Joseph,

Am Montag, 12. Januar 2026, 11:28:48 Mitteleurop=C3=A4ische Normalzeit schr=
ieb Joseph Chen:
> The RK801 is a Power Management IC (PMIC) for multimedia
> and handheld devices. It contains the following components:
>=20
> - 4 BUCK
> - 2 LDO
> - 1 SWITCH
>=20
> Signed-off-by: Joseph Chen <chenjh@rock-chips.com>
> ---
>  drivers/mfd/Kconfig                 |    6 +-
>  drivers/mfd/rk8xx-core.c            |   81 ++
>  drivers/mfd/rk8xx-i2c.c             |   33 +-
>  drivers/regulator/rk808-regulator.c | 1963 ---------------------------
>  include/linux/mfd/rk808.h           |  118 ++
>  5 files changed, 234 insertions(+), 1967 deletions(-)
>  delete mode 100644 drivers/regulator/rk808-regulator.c
>=20
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 6cec1858947..5405e8633aa 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1355,15 +1355,15 @@ config MFD_RK8XX
>  	select MFD_CORE
> =20
>  config MFD_RK8XX_I2C
> -	tristate "Rockchip RK805/RK808/RK809/RK816/RK817/RK818 Power Management=
 Chip"
> +	tristate "Rockchip RK801/RK805/RK808/RK809/RK816/RK817/RK818 Power Mana=
gement Chip"

nit: I think at some point it'd be time to make that
	"Rockchip RX8xx Power Management Chips"
The config entry is already named that way, and that list of individual
supported chips gets way too long.

Also the individual supported chips _are_ listed below, so the unwieldy
entry headline can be shortened.

>  	depends on I2C && OF
>  	select MFD_CORE
>  	select REGMAP_I2C
>  	select REGMAP_IRQ
>  	select MFD_RK8XX
>  	help
> -	  If you say yes here you get support for the RK805, RK808, RK809,
> -	  RK816, RK817 and RK818 Power Management chips.
> +	  If you say yes here you get support for the RK801, RK805, RK808,
> +	  RK809, RK816, RK817 and RK818 Power Management chips.
>  	  This driver provides common support for accessing the device
>  	  through I2C interface. The device supports multiple sub-devices
>  	  including interrupts, RTC, LDO & DCDC regulators, and onkey.

[...]

> diff --git a/drivers/regulator/rk808-regulator.c b/drivers/regulator/rk80=
8-regulator.c
> deleted file mode 100644
> index 1e814247965..00000000000
> --- a/drivers/regulator/rk808-regulator.c
> +++ /dev/null

Looks like something did go wrong here, as you're removing the whole
drivers/regulator/rk808-regulator.c file from the MFD patch.


Thanks
Heiko



