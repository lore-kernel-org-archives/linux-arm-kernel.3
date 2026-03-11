Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9811049513
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 09:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONvlDCAz8iTTB0H+F5+hE7m3thkqxiLj8SsuFjUaXWM=; b=5DsvlUKKGDiewBOvnK0Nm7tgRl
	d4Em52AhkmdpT75vDKZuTbgIdD2sZ+saURtmzKjF9pnKvQT/jGVmuoi2KIB7oxIF09CLaJODg+42h
	j0tJ45S51Yod6sNua1MCJoieEMnyQsupP/VknSfdUujvMyfprYVerZYtEOLbyS7FkRQfVDSshooXF
	/ZhCvf9JMhfI4mAJztiThGbn3tobQB+uzz3jNa/w0g6w0HPHtQWHcWTYEFs/lzPaqFG0HiTQ/lE14
	CJJjQHlvP3LwQdwqdGdIw4VnA9xDBHriGcUeF3Y+0fSP+LJDe/O2wysZr4k08eRzV3AfF1kFRhM1F
	BSCXU+MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Flg-0000000BG3K-2VZ9;
	Wed, 11 Mar 2026 09:22:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Fle-0000000BG2W-3mZS
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Mar 2026 09:22:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ONvlDCAz8iTTB0H+F5+hE7m3thkqxiLj8SsuFjUaXWM=; b=YX5JsmOdWIXZQUm1i1BIhEyLpM
	1I/wWLcWf61H9WHeIGI7LE12U7k85XckvAE55Bjd93PHJM6CCrXlE5+hDm+wfmyJCyz+tmGrZqIXq
	Hfdju43FOfnyKV0bAFMH63vPI7VX/LHTSnCi26j68ykGOKkSUw9924TB1QAa7vGPp7XmZu06pFaIX
	OllpQ17H3YCJC8XhWrg9UN2jDyNvWJNOC4+KzQAN4JyhqV9BNDzAeP4b3/VUTGbgybjoNUHD7WU9W
	IYIP+/6hR2iPv66bvVvP1I6HANwGo9LoIWArF2d2GMIRCSdWm4FX9lsCaqGwcJrO7jqNeOku31zmg
	yDlhJdkg==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Flb-0000000GXDK-1yuW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 09:22:13 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1773220919; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iZQ7BRC3VmrC5pOc6an3Cmw1EtRiO7GP0XmcB01js00pmeCpAi/QJJxNmj9k8V9Z3FpXTebNi4hkwv++tFlMAfy1bujUz0yqqzvHuwWE/itxMwsZPfTefIsfZiAExPLDax++O7BT89JjNaw5bzhpbNvGV3ezQwICM+lpybiR4pI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773220919; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ONvlDCAz8iTTB0H+F5+hE7m3thkqxiLj8SsuFjUaXWM=; 
	b=L41GPBHkWD9qm6xUdQmiVun6qRWVyq8iqSUckvdc6w2C/szXN/bP+gNLh3LEu8L+IAFXXEhLV5EBiIWSwPab+9q40GguR6In82XfLaJdRjGJvNrOKaOXWMz9/UEomhiIg7KRg++rUgMeDxU6Q6abqjhDWqPzcY3f5Ew0RQ0OCWU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773220919;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=ONvlDCAz8iTTB0H+F5+hE7m3thkqxiLj8SsuFjUaXWM=;
	b=c4uyrduFsHc+RwmPhxinHIQppYYy8mOgB76fl5iSvBXW2KFo03vL1n3CYiOzsl+s
	MY+Ok4JfXa+gncaZUF6x2de8S5yvTKptnKAFAL42MZD0kJlLDSfiqOTqXwDGVIcXCdT
	M96aNS6VAZgbgDfRsY1uDPp+GRHM0xhZv9FBWW9U=
Received: by mx.zohomail.com with SMTPS id 1773220916508975.5222689796449;
	Wed, 11 Mar 2026 02:21:56 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 3E2C2180598; Wed, 11 Mar 2026 10:21:39 +0100 (CET)
Date: Wed, 11 Mar 2026 10:21:39 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	John Stultz <john.stultz@linaro.org>, Moritz Fischer <moritz.fischer@ettus.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Andre Draszik <andre.draszik@linaro.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v20 01/10] power: reset: reboot-mode: Remove devres based
 allocations
Message-ID: <abEzdgQ6pe0fC-5z@venus>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-1-cf7d346b8372@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ugxzc4dr53elckrk"
Content-Disposition: inline
In-Reply-To: <20260304-arm-psci-system_reset2-vendor-reboots-v20-1-cf7d346b8372@oss.qualcomm.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.1.1.4.3/273.195.15
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_092211_930784_8E086E19 
X-CRM114-Status: GOOD (  23.08  )
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


--ugxzc4dr53elckrk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v20 01/10] power: reset: reboot-mode: Remove devres based
 allocations
MIME-Version: 1.0

Hi,

On Wed, Mar 04, 2026 at 11:33:01PM +0530, Shivendra Pratap wrote:
> Devres APIs are intended for use in drivers, where the managed lifetime
> of resources is tied directly to the driver attach/detach cycle. In
> shared subsystem code, there is no guarantee that the subsystem
> functions will only be called after a driver has been attached, nor that
> they will not be referenced after the managed resources have been
> released during driver detach.
>=20
> To ensure correct lifetime handling, avoid using devres-based
> allocations in the reboot-mode and explicitly handle allocation and
> cleanup of resources.
>=20
> Fixes: 4fcd504edbf7 ("power: reset: add reboot mode driver")
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

The patch does not apply, though.

-- Sebastian

>  drivers/power/reset/reboot-mode.c | 33 ++++++++++++++++++++-------------
>  1 file changed, 20 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/rebo=
ot-mode.c
> index fba53f638da04655e756b5f8b7d2d666d1379535..d033043f5250a4de152a7786e=
f37e88a0ace3bbb 100644
> --- a/drivers/power/reset/reboot-mode.c
> +++ b/drivers/power/reset/reboot-mode.c
> @@ -3,13 +3,17 @@
>   * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
>   */
> =20
> +#define pr_fmt(fmt)	"reboot-mode: " fmt
> +
>  #include <linux/device.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/property.h>
>  #include <linux/reboot.h>
>  #include <linux/reboot-mode.h>
> +#include <linux/slab.h>
> =20
>  #define PREFIX "mode-"
> =20
> @@ -74,6 +78,7 @@ int reboot_mode_register(struct reboot_mode_driver *reb=
oot)
>  	struct property *prop;
>  	struct device_node *np =3D reboot->dev->of_node;
>  	size_t len =3D strlen(PREFIX);
> +	u32 magic;
>  	int ret;
> =20
>  	INIT_LIST_HEAD(&reboot->head);
> @@ -82,19 +87,18 @@ int reboot_mode_register(struct reboot_mode_driver *r=
eboot)
>  		if (strncmp(prop->name, PREFIX, len))
>  			continue;
> =20
> -		info =3D devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
> +		if (device_property_read_u32(reboot->dev, prop->name, &magic)) {
> +			pr_debug("reboot mode %s without magic number\n", prop->name);
> +			continue;
> +		}
> +
> +		info =3D kzalloc(sizeof(*info), GFP_KERNEL);
>  		if (!info) {
>  			ret =3D -ENOMEM;
>  			goto error;
>  		}
> =20
> -		if (of_property_read_u32(np, prop->name, &info->magic)) {
> -			dev_err(reboot->dev, "reboot mode %s without magic number\n",
> -				info->mode);
> -			devm_kfree(reboot->dev, info);
> -			continue;
> -		}
> -
> +		info->magic =3D magic;
>  		info->mode =3D kstrdup_const(prop->name + len, GFP_KERNEL);
>  		if (!info->mode) {
>  			ret =3D  -ENOMEM;
> @@ -102,8 +106,7 @@ int reboot_mode_register(struct reboot_mode_driver *r=
eboot)
>  		} else if (info->mode[0] =3D=3D '\0') {
>  			kfree_const(info->mode);
>  			ret =3D -EINVAL;
> -			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
> -				prop->name);
> +			pr_err("invalid mode name(%s): too short!\n", prop->name);
>  			goto error;
>  		}
> =20
> @@ -116,8 +119,8 @@ int reboot_mode_register(struct reboot_mode_driver *r=
eboot)
>  	return 0;
> =20
>  error:
> -	list_for_each_entry(info, &reboot->head, list)
> -		kfree_const(info->mode);
> +	kfree(info);
> +	reboot_mode_unregister(reboot);
> =20
>  	return ret;
>  }
> @@ -130,11 +133,15 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
>  int reboot_mode_unregister(struct reboot_mode_driver *reboot)
>  {
>  	struct mode_info *info;
> +	struct mode_info *next;
> =20
>  	unregister_reboot_notifier(&reboot->reboot_notifier);
> =20
> -	list_for_each_entry(info, &reboot->head, list)
> +	list_for_each_entry_safe(info, next, &reboot->head, list) {
> +		list_del(&info->list);
>  		kfree_const(info->mode);
> +		kfree(info);
> +	}
> =20
>  	return 0;
>  }
>=20
> --=20
> 2.34.1
>=20

--ugxzc4dr53elckrk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmmxNB8ACgkQ2O7X88g7
+pp88BAAmGk4Xg3kRYPFFEZhWyBR8jjNEGWm8pYmX311V82br2YqFPYSRXMAGFA7
0uJ3/oW+oCo3mTnxxfusITm/PqkAUzMRdeLEhvvKeOfrOvUNcoP0khPceaS3pxof
qJSavQ1HPk4olXNzSEq2wBwxXWqhP8w7LB899uxp0Kv3Bazz2mn+T/R7rlaqsUP6
YiOQzVEueTfosq79eI2SPZwwW0s6xGprqzY0QCZSFMPy3Njfo4B5Uc1TH2df4knq
Snuid3lAD7iHsn3zNHGvPMlX7nKWGosLXVQQ+jPYRDki02YXCD13H15DGjyPQVuT
U1fQlRvX4GYSGTWdNdwy86PvcBNwkD1i6XcgQoYonPEHqst779sdqQXMQlp6ruo3
Zo2BGUw7lqM2N+pC6fyWnohTahnOincvoiNEYvSn9MdIPmS9dTwCj93gsu1jRAdX
UOzZmWYNPXtMntquOa6rpjjat50heDtUslXYa4U3xtKF9vW3NIw5ZIoHJGmBPHhJ
K3Q7M5MVA9ocguW9La3yGMyPTOEpvTBPGZFRUzAQA94Ph+/wznne2paQQvnkoAia
4w7DNEz0vJkSj3ZhXYKtQWLPoBZhPkTVUqRvDCqXcktgUj/tc8Fh011Jk40LFJr5
y2UPW23Ts9tduHIqaT0+PAm8iPplNGRhj8wTMdhQNQzWQjZXPnM=
=H9sF
-----END PGP SIGNATURE-----

--ugxzc4dr53elckrk--

