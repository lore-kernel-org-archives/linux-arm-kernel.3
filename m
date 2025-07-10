Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73326C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 12:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kgi11dZK94dq8u+jzWaaEo1iTl1oo581SiHl97QOATU=; b=sgOG7W91hQVAoqmdLhK31+RlZ0
	Vpfp1t7SHtzqUMtWcuixN8rFXInUYFSl+/awLYFNGDxLYt1pJuURBfU7XW0zEq7wYR/y5U2ukCA8Q
	v7J1t0itfAzB+UC/BTtsFlHl5K0kmMYOPqmEpD3xDyZjVjo3HC/PUb5zhkkQUnoD2pXxYa4jkyP6D
	fGdLqSGyhmI63fQG0FMsquuyLUx9KIZicsdDWTJ4IPOys29PqRBXSD7POA/dr5WvrlidHxP5cr0p/
	K1RjJqSunC56JD16xqkAOpUS1T9Uf4Zy4jjScqwhyMbPm9qo3Ph894PE31XUYRWFSEnA1i5+m9UeK
	ATQEUisg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqid-0000000BpBf-1srH;
	Thu, 10 Jul 2025 12:49:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZpGX-0000000Bbp7-05rD;
	Thu, 10 Jul 2025 11:16:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Kgi11dZK94dq8u+jzWaaEo1iTl1oo581SiHl97QOATU=; b=hyIEnXbFeVAiaubFEW+EudR2QL
	EGJE/o6h3gS6JUHFZR3Mf8S5vi48x0m3Sf7Dt2MMo5ltxWJNW6iWfs3TP/fCzZESzKkGKZ3dbN2oQ
	S9yuw8lyN4Xb/TpuzKcBtpGdIhynxmzninz4hBbO1QZKe3jR4nmVPF5J7WFpcEvGsgnp/gTNxNv7y
	lgsSfvRdn1gd3LxtutYIgxAYEBGdLPIHa6cAgK4fngFNN2nCCOdous77NW5ojIPL/FwOrN2Ht7T9Z
	oyvzeSRmWdE5alqzDgWsIa7iEiUpJsD7CqQp46/sg/W6TNtwNy2T64Sj7dhG3EeoNCpQaQAdX49l1
	5uBHFEkw==;
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uZpGO-0004QB-JM; Thu, 10 Jul 2025 13:16:28 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Alexey Charkov <alchark@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v6 1/7] thermal: rockchip: rename rk_tsadcv3_tshut_mode
Date: Thu, 10 Jul 2025 13:16:27 +0200
Message-ID: <7568508.DvuYhMxLoT@phil>
In-Reply-To: <20250610-rk3576-tsadc-upstream-v6-1-b6e9efbf1015@collabora.com>
References: <20250610-rk3576-tsadc-upstream-v6-0-b6e9efbf1015@collabora.com>
 <20250610-rk3576-tsadc-upstream-v6-1-b6e9efbf1015@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_041637_063419_53953564 
X-CRM114-Status: GOOD (  17.44  )
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

Am Dienstag, 10. Juni 2025, 14:32:37 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Nicolas Frattaroli:
> The "v" version specifier here refers to the hardware IP revision.
> Mainline deviated from downstream here by calling the v4 revision v3 as
> it didn't support the v3 hardware revision at all.
>=20
> This creates needless confusion, so rename it to rk_tsadcv4_tshut_mode
> to be consistent with what the hardware wants to be called.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

I checked the vendor-kernel, and your're right the
rv1126 gets identified as v3 it seems, while all of rk35xx except rk3568
(=3D rk3506, rk3528, rk3562, rk3576, rk3588) call themself v4


> ---
>  drivers/thermal/rockchip_thermal.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/thermal/rockchip_thermal.c b/drivers/thermal/rockchi=
p_thermal.c
> index a8ad85feb68fbb7ec8d79602b16c47838ecb3c00..40c7d234c3ef99f69dd8db4d8=
c47f9d493c0583d 100644
> --- a/drivers/thermal/rockchip_thermal.c
> +++ b/drivers/thermal/rockchip_thermal.c
> @@ -1045,7 +1045,7 @@ static void rk_tsadcv2_tshut_mode(int chn, void __i=
omem *regs,
>  	writel_relaxed(val, regs + TSADCV2_INT_EN);
>  }
> =20
> -static void rk_tsadcv3_tshut_mode(int chn, void __iomem *regs,
> +static void rk_tsadcv4_tshut_mode(int chn, void __iomem *regs,
>  				  enum tshut_mode mode)
>  {
>  	u32 val_gpio, val_cru;
> @@ -1297,7 +1297,7 @@ static const struct rockchip_tsadc_chip rk3588_tsad=
c_data =3D {
>  	.get_temp =3D rk_tsadcv4_get_temp,
>  	.set_alarm_temp =3D rk_tsadcv3_alarm_temp,
>  	.set_tshut_temp =3D rk_tsadcv3_tshut_temp,
> -	.set_tshut_mode =3D rk_tsadcv3_tshut_mode,
> +	.set_tshut_mode =3D rk_tsadcv4_tshut_mode,
>  	.table =3D {
>  		.id =3D rk3588_code_table,
>  		.length =3D ARRAY_SIZE(rk3588_code_table),
>=20
>=20





