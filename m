Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27854CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 15:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gHlcPwsSfeGC7fQdzD88p9shunKAU1y1+oCm87rAKq4=; b=kiBF5FlLAZS8M1dKfayqjSNZEa
	IsGxjDCEVxYs60kKzOIKunHanxFwbDa1jhvTK0rMMLNbZ4Sh4CJ4ZVIzScnDjpF4nUGHZ6rF91zQo
	DS0t8mGhsYmJTG+CutZCYdUA437BH3YobkgXs1LgyY4J02W7bRBVHT3WCuMUaUlNJGMOMVGw2plQb
	KVGzdpRAg02GIQP9IEoLyLbJk11jh7FdbohEDAPOkHaxSpkCAAAmpUUXqXRmqHedwOa8jzvu5amJ/
	8DUcbapgeFDoqxpDBgUHYUZJpMqhIZnfV3gyY7pyHtOj+oC4UQHbA/fMlfXmxmhC564BBpCXt3p6i
	n/w74flw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBxUW-00000006nSN-0SwZ;
	Thu, 23 Oct 2025 15:44:40 +0000
Received: from mail.alien8.de ([2a01:4f9:3051:3f93::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBxUS-00000006nRN-00AI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 15:44:38 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4B1D940E0200;
	Thu, 23 Oct 2025 15:44:31 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id CM8NHk_6x3J3; Thu, 23 Oct 2025 15:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1761234264; bh=xm6fgzstB/ZMSe+0kYNwkV48B2KG+DhMAv57BfPYULQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WjTV2+REKidbHHyzw1OfHF4zQF34Rx/xasIxW6/h/E4JBY8M85nAxKfSMYwXlkw1G
	 uWwoD5HgmmFJITuOJ2TpbUTkrAAXqi0BBVgdSq/+3BeqxEs0kM+u/bUutjQjoXG3WU
	 382w6mk2fUOkSdIloOI5ybTQMQAzMLnWfCLBrewvgb+BlcMKf87PH9+NjC/38UR1Ve
	 Qi34JrKron19uLcrVVtiDcII/gMkB8a9D/VZcDOU/V64xfZqCi6S0un9PZq4rzeA5P
	 gUOrf3boMrUfgYwELsCUntaza720Ah+fUOtItyKzVsiCBKdUf8fnjFmqXkWNe3PbLf
	 VKAgSw0fFkh7iXYPItgCtEByZFy6WPjmgADvIF2MOolClZ/iBbtEOQIb2s3NB292Ib
	 09Gu7i0JomIePuvgjOgGdBVW7ny6B4x1Ino0S/pZ+f5AqaLpZGV9Rb1VvtYcW+vTd7
	 yUHY5tBm+URDYcgHKUvoaTBytbwmu0JUgLs3EuVesu+Hi9z++iFBHnScydM5a7Yb8a
	 td3eIlMdYGwlPxEM0p1DtfpSVYsDIYObPvDyHIfs+kw3m/0cF0oINshX9bNSXZCiUn
	 wYR9XpBUg9z1e41k/9lVNiw5tuLGoJQZ5LeVWVFRg0cK35AQY8PrXszf9mGsZxTGho
	 VPngnBss0LTXy0+XEeSZKOW8=
Received: from zn.tnic (pd9530da1.dip0.t-ipconnect.de [217.83.13.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id C89B540E00DE;
	Thu, 23 Oct 2025 15:44:11 +0000 (UTC)
Date: Thu, 23 Oct 2025 17:44:05 +0200
From: Borislav Petkov <bp@alien8.de>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-edac@vger.kernel.org, git@amd.com, shubhrajyoti.datta@gmail.com,
	dan.carpenter@linaro.org, Michal Simek <michal.simek@amd.com>,
	Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Robert Richter <rric@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] EDAC/versalnet: Refactor memory controller
 initialization and cleanup
Message-ID: <20251023154405.GRaPpNRQRyvfpZjfex@fat_crate.local>
References: <20251016052839.2650517-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251016052839.2650517-1-shubhrajyoti.datta@amd.com>
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_084436_213237_6BB689E2 
X-CRM114-Status: GOOD (  26.66  )
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

Thanks for doing this!

On Thu, Oct 16, 2025 at 10:58:39AM +0530, Shubhrajyoti Datta wrote:
> Simplify the initialization and cleanup flow for Versal Net DDRMC
> controllers in the EDAC driver. Key changes include:
>=20
> * Introduced `init_single_versalnet()` for per-controller setup and
>   `init_versalnet()` for looping through NUM_CONTROLLERS.
> * Added proper rollback logic using `remove_single_versalnet()` when
>   partial initialization fails.
> * Improved readability and maintainability by reducing duplicated code =
and
>   consolidating error handling.

"Describe your changes in imperative mood, e.g. =E2=80=9Cmake xyzzy do fr=
otz=E2=80=9D instead
of =E2=80=9C[This patch] makes xyzzy do frotz=E2=80=9D or =E2=80=9C[I] ch=
anged xyzzy to do frotz=E2=80=9D, as
if you are giving orders to the codebase to change its behaviour."

IOW:

"Introduce per-controller setup and teardown functions..."

and so on.

> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
>=20
>  drivers/edac/versalnet_edac.c | 158 +++++++++++++++++++---------------
>  1 file changed, 87 insertions(+), 71 deletions(-)
>=20
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_eda=
c.c
> index 1ded4c3f0213..fc7e4c43b387 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -758,92 +758,111 @@ static void versal_edac_release(struct device *d=
ev)
>  	kfree(dev);
>  }
> =20
> -static int init_versalnet(struct mc_priv *priv, struct platform_device=
 *pdev)
> +static void  remove_single_versalnet(struct mc_priv *priv, int i)

remove_mc(). You don't need to stick "versalnet" in static function names=
.

> +{
> +	struct mem_ctl_info *mci;
> +
> +	mci =3D priv->mci[i];
> +	device_unregister(mci->pdev);
> +	edac_mc_del_mc(mci->pdev);
> +	edac_mc_free(mci);
> +}
> +
> +static int init_single_versalnet(struct mc_priv *priv, struct platform=
_device *pdev, int i)

init_mc() is fine.

>  {
>  	u32 num_chans, rank, dwidth, config;
> -	struct edac_mc_layer layers[2];
>  	struct mem_ctl_info *mci;
> +	struct edac_mc_layer layers[2];
>  	struct device *dev;
>  	enum dev_type dt;
>  	char *name;
> -	int rc, i;
> +	int rc;
> =20
> -	for (i =3D 0; i < NUM_CONTROLLERS; i++) {
> -		config =3D priv->adec[CONF + i * ADEC_NUM];
> -		num_chans =3D FIELD_GET(MC5_NUM_CHANS_MASK, config);
> -		rank =3D 1 << FIELD_GET(MC5_RANK_MASK, config);
> -		dwidth =3D FIELD_GET(MC5_BUS_WIDTH_MASK, config);
> -
> -		switch (dwidth) {
> -		case XDDR5_BUS_WIDTH_16:
> -			dt =3D DEV_X16;
> -			break;
> -		case XDDR5_BUS_WIDTH_32:
> -			dt =3D DEV_X32;
> -			break;
> -		case XDDR5_BUS_WIDTH_64:
> -			dt =3D DEV_X64;
> -			break;
> -		default:
> -			dt =3D DEV_UNKNOWN;
> -		}
> +	config =3D priv->adec[CONF + i * ADEC_NUM];
> +	num_chans =3D FIELD_GET(MC5_NUM_CHANS_MASK, config);
> +	rank =3D 1 << FIELD_GET(MC5_RANK_MASK, config);
> +	dwidth =3D FIELD_GET(MC5_BUS_WIDTH_MASK, config);
> +
> +	switch (dwidth) {
> +	case XDDR5_BUS_WIDTH_16:
> +		dt =3D DEV_X16;
> +		break;
> +	case XDDR5_BUS_WIDTH_32:
> +		dt =3D DEV_X32;
> +		break;
> +	case XDDR5_BUS_WIDTH_64:
> +		dt =3D DEV_X64;
> +		break;
> +	default:
> +		dt =3D DEV_UNKNOWN;
> +	}
> =20
> -		if (dt =3D=3D DEV_UNKNOWN)
> -			continue;
> +	if (dt =3D=3D DEV_UNKNOWN)
> +		return 0;
> =20
> -		/* Find the first enabled device and register that one. */
> -		layers[0].type =3D EDAC_MC_LAYER_CHIP_SELECT;
> -		layers[0].size =3D rank;
> -		layers[0].is_virt_csrow =3D true;
> -		layers[1].type =3D EDAC_MC_LAYER_CHANNEL;
> -		layers[1].size =3D num_chans;
> -		layers[1].is_virt_csrow =3D false;
> +	/* Find the first enabled device and register that one. */
> +	layers[0].type =3D EDAC_MC_LAYER_CHIP_SELECT;
> +	layers[0].size =3D rank;
> +	layers[0].is_virt_csrow =3D true;
> +	layers[1].type =3D EDAC_MC_LAYER_CHANNEL;
> +	layers[1].size =3D num_chans;
> +	layers[1].is_virt_csrow =3D false;
> +
> +	rc =3D -ENOMEM;
> +	mci =3D edac_mc_alloc(i, ARRAY_SIZE(layers), layers,
> +			    sizeof(struct mc_priv));
> +	if (!mci) {
> +		edac_printk(KERN_ERR, EDAC_MC, "Failed memory allocation for MC%d\n"=
, i);
> +		return rc;
> +	}
> +	priv->mci[i] =3D mci;
> +	priv->dwidth =3D dt;
> +
> +	dev =3D kzalloc(sizeof(*dev), GFP_KERNEL);
> +	if (!dev)
> +		return rc;

No, do not return here but jump to the end of the function which unwinds
everything that's been setup so far. In this case, it should do
edac_mc_del_mc() what edac_mc_alloc() allocated.

This makes the unwinding loop easier in the remove function, see below.

> +	dev->release =3D versal_edac_release;
> +	name =3D kmalloc(32, GFP_KERNEL);
> +	sprintf(name, "versal-net-ddrmc5-edac-%d", i);
> +	dev->init_name =3D name;
> +	rc =3D device_register(dev);
> +	if (rc)
> +		goto err_mc_free;
> =20
> -		rc =3D -ENOMEM;
> -		mci =3D edac_mc_alloc(i, ARRAY_SIZE(layers), layers,
> -				    sizeof(struct mc_priv));
> -		if (!mci) {
> -			edac_printk(KERN_ERR, EDAC_MC, "Failed memory allocation for MC%d\n=
", i);
> -			goto err_alloc;
> -		}
> +	mci->pdev =3D dev;
> =20
> -		priv->mci[i] =3D mci;
> -		priv->dwidth =3D dt;
> +	platform_set_drvdata(pdev, priv);
> =20
> -		dev =3D kzalloc(sizeof(*dev), GFP_KERNEL);
> -		dev->release =3D versal_edac_release;
> -		name =3D kmalloc(32, GFP_KERNEL);
> -		sprintf(name, "versal-net-ddrmc5-edac-%d", i);
> -		dev->init_name =3D name;
> -		rc =3D device_register(dev);
> -		if (rc)
> -			goto err_alloc;
> +	mc_init(mci, dev);
> +	rc =3D edac_mc_add_mc(mci);
> +	if (rc) {
> +		edac_printk(KERN_ERR, EDAC_MC, "Failed to register MC%d with EDAC co=
re\n", i);
> +		goto err_unreg;
> +	}
> +	return 0;
> +err_unreg:
> +	device_unregister(mci->pdev);
> +err_mc_free:
> +	edac_mc_free(mci);
> +	return rc;
> +}
> =20
> -		mci->pdev =3D dev;
> =20
> -		platform_set_drvdata(pdev, priv);
> +static int init_versalnet(struct mc_priv *priv, struct platform_device=
 *pdev)
> +{
> +	int rc, i;
> =20
> -		mc_init(mci, dev);
> -		rc =3D edac_mc_add_mc(mci);
> -		if (rc) {
> -			edac_printk(KERN_ERR, EDAC_MC, "Failed to register MC%d with EDAC c=
ore\n", i);
> -			goto err_alloc;
> -		}
> +	for (i =3D 0; i < NUM_CONTROLLERS; i++) {
> +		rc =3D init_single_versalnet(priv, pdev, i);
> +		if (rc)
> +			goto err_rm_versalnet;

No need for that - just unwind here and drop the label.

>  	}
>  	return 0;
> =20
> -err_alloc:
> -	while (i--) {
> -		mci =3D priv->mci[i];
> -		if (!mci)
> -			continue;
> -
> -		if (mci->pdev) {
> -			device_unregister(mci->pdev);
> -			edac_mc_del_mc(mci->pdev);
> -		}
> -
> -		edac_mc_free(mci);
> +err_rm_versalnet:
> +	while (i) {
> +		i--;

That should be:

	while (i--)

so that when you get to remove here, you remove only fully initialized me=
mory
controllers.

> +		remove_single_versalnet(priv, i);
>  	}
> =20
>  	return rc;

In any case, yes, do you see how it all becomes a lot simpler this way?

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

