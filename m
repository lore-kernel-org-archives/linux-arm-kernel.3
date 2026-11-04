Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE7C606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 08:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i8lHcLhX;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EkMv8SpD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pADrcnEYh45IHa88Qe/iiabroBcjL7BN29WsN4XYUyU=; b=i8lHcLhXcsMJGwl4xluHu5WDk0
	/Fjuq/t9pQyO+aEWJrrqobHEju/VvPec2J5saccSV2/XL5TKE/1s3/v7Hrw5SPzhQtIDNUcAlkZfb
	vPU+BXuqLnZD+HjhdnvAXtsHvv8hYyOgU3rfzGAtzQy8vEUWpdFIYOwZVNSvFEbEjLu7vdnLJ1Lar
	iurr+AFxBsoajQTGDbzIyfnMX2+bRlriu/viegJPck/jOy95+AYGvO+hBWDbhWz4SSMeWZGBXh2/u
	gwerSbOU5sROijQy9yIIzvNY79X1oMND5niSHOxfN+4Jjh4TQe3g/1anzsp277wA2x2byfeqfORBw
	slOpbEhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWGB-00000004gvm-3OL8;
	Wed, 04 Nov 2026 08:22:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWGA-00000004gvZ-2pMR;
	Wed, 04 Nov 2026 08:22:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E8AF6022E;
	Wed,  4 Nov 2026 08:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C32D1F000C1;
	Wed,  4 Nov 2026 08:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793780537;
	bh=pADrcnEYh45IHa88Qe/iiabroBcjL7BN29WsN4XYUyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EkMv8SpDXRieR47meuB4Pmvi+QdeQNBFZee5HjFZ3ArWQntn9N0erRQunqJdSqJvi
	 sWEvzP0bt2zYGdgLulDtJnGTDFmO+bq2cs44K+vBbPcQPtB+L3P5716FURpwk3uWog
	 iY1qkIKamcct2cAmHBueyqILVdAwSkbh4sZiVKQ3FdWyUa6EA4457jh+gnyephq5zL
	 FV2F+JbxaRPq05y2ie/ZaUpQ4ppa7iO6cwu6roHi4+e/uNh80NdytCmjEBZS7NObpE
	 AhphzsAuRTjykkvYNNIvkd08xfwKMJaebMNrPd2VfuSxJEDgIhGpVvhOy1UHTFHGsu
	 BLBtITrf8+y6g==
Date: Wed, 4 Nov 2026 09:22:15 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@nbd.name>, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC net-next] net: airoha: npu: attach passive devfreq
 scaling
Message-ID: <aurrN349nP-b6FK2@lore-desk>
References: <20261104072940.52933-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GXeSiHAEIfQDVlvR"
Content-Disposition: inline
In-Reply-To: <20261104072940.52933-1-ansuelsmth@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--GXeSiHAEIfQDVlvR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 04, Christian Marangi wrote:
> The NPU can scale to different operating state from idle to normal to
> turbo. Attach a passive devfreq that will scale the NPU frequency with the
> CPU with the use of OPP table and opp-required properties.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>=20
> Posted as RFC to understand if it's the correct way to handle this...
>=20
> DT patch will come later.
>=20
>  drivers/net/ethernet/airoha/airoha_npu.c  | 61 ++++++++++++++++++++++-
>  include/linux/soc/airoha/airoha_offload.h |  3 ++
>  2 files changed, 63 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ether=
net/airoha/airoha_npu.c
> index 4d3195eb00f7..f8055ca65ec4 100644
> --- a/drivers/net/ethernet/airoha/airoha_npu.c
> +++ b/drivers/net/ethernet/airoha/airoha_npu.c
> @@ -12,6 +12,8 @@
>  #include <linux/of_platform.h>
>  #include <linux/of_reserved_mem.h>
>  #include <linux/regmap.h>
> +#include <linux/pm_opp.h>
> +#include <linux/clk.h>
> =20
>  #include "airoha_eth.h"
> =20
> @@ -656,6 +658,62 @@ void airoha_npu_put(struct airoha_npu *npu)
>  }
>  EXPORT_SYMBOL_GPL(airoha_npu_put);
> =20
> +static int airoha_npu_devfreq_get_cur_freq(struct device *dev, unsigned =
long *freq)
> +{
> +	struct airoha_npu *npu =3D dev_get_drvdata(dev);
> +
> +	*freq =3D clk_get_rate(npu->clk);
> +
> +	return 0;
> +}
> +
> +static int airoha_npu_devfreq_target(struct device *dev, unsigned long *=
freq,
> +				     u32 flags)
> +{
> +	struct airoha_npu *npu =3D dev_get_drvdata(dev);
> +
> +	return clk_set_rate(npu->clk, *freq);
> +}
> +
> +static int airoha_npu_devfreq_get_dev_status(struct device *dev,
> +					     struct devfreq_dev_status *stat)
> +{
> +	struct airoha_npu *npu =3D dev_get_drvdata(dev);
> +
> +	stat->busy_time =3D 0;
> +	stat->total_time =3D 0;
> +	stat->current_frequency =3D clk_get_rate(npu->clk);
> +
> +	return 0;
> +}
> +
> +static struct devfreq_dev_profile airoha_npu_devfreq_profile =3D {
> +	.target =3D airoha_npu_devfreq_target,
> +	.get_dev_status =3D airoha_npu_devfreq_get_dev_status,
> +	.get_cur_freq =3D airoha_npu_devfreq_get_cur_freq
> +};
> +
> +static int airoha_npu_devfreq_probe(struct device *dev)
> +{
> +	struct airoha_npu *npu =3D dev_get_drvdata(dev);
> +	struct devfreq *devfreq;
> +	int ret;
> +
> +	npu->clk =3D devm_clk_get_enabled(dev, NULL);

I guess this should be devm_clk_get_optional_enabled() otherwise this patch
will break backward compatibility. Moreover, we should bail out early if
npu->clk is NULL.

> +	if (IS_ERR(npu->clk))
> +		return dev_err_probe(dev, PTR_ERR(npu->clk), "failed to get clk\n");
> +
> +	ret =3D devm_pm_opp_of_add_table(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to parse NPU freq thresholds\n"=
);
> +
> +	npu->gov_data.parent_type =3D CPUFREQ_PARENT_DEV;
> +	devfreq =3D devm_devfreq_add_device(dev, &airoha_npu_devfreq_profile,
> +					  DEVFREQ_GOV_PASSIVE, &npu->gov_data);
> +
> +	return PTR_ERR_OR_ZERO(devfreq);
> +}
> +
>  static const struct airoha_npu_soc_data en7581_npu_soc_data =3D {
>  	.fw_rv32 =3D {
>  		.name =3D NPU_EN7581_FIRMWARE_RV32,
> @@ -803,8 +861,9 @@ static int airoha_npu_probe(struct platform_device *p=
dev)
>  			 (val >> 16) & 0xffff, val & 0xffff);
> =20
>  	platform_set_drvdata(pdev, npu);
> +	dev_set_drvdata(dev, npu);

why do we need that one? I guess this is exactly what platform_set_drvdata(=
) is
doing, right?

Regards,
Lorenzo

> =20
> -	return 0;
> +	return airoha_npu_devfreq_probe(dev);
>  }
> =20
>  static struct platform_driver airoha_npu_driver =3D {
> diff --git a/include/linux/soc/airoha/airoha_offload.h b/include/linux/so=
c/airoha/airoha_offload.h
> index 7589fccfeef6..ac776dc31487 100644
> --- a/include/linux/soc/airoha/airoha_offload.h
> +++ b/include/linux/soc/airoha/airoha_offload.h
> @@ -6,6 +6,7 @@
>  #ifndef AIROHA_OFFLOAD_H
>  #define AIROHA_OFFLOAD_H
> =20
> +#include <linux/devfreq.h>
>  #include <linux/skbuff.h>
>  #include <linux/spinlock.h>
>  #include <linux/workqueue.h>
> @@ -167,6 +168,8 @@ struct airoha_npu {
>  #if (IS_BUILTIN(CONFIG_NET_AIROHA_NPU) || IS_MODULE(CONFIG_NET_AIROHA_NP=
U))
>  	struct device *dev;
>  	struct regmap *regmap;
> +	struct clk *clk;
> +	struct devfreq_passive_data gov_data;
> =20
>  	struct airoha_npu_core {
>  		struct airoha_npu *npu;
> --=20
> 2.55.0
>=20

--GXeSiHAEIfQDVlvR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaurrNwAKCRA6cBh0uS2t
rELpAPwI9Nyf59rcUT+dErD/iejg4G1NiCfVcWRFwPmERqWr2QD/dKM7AqI7pn1A
Ju7qDHM8TiXXoQDNkpgJgPGDMOaVXgw=
=UYLH
-----END PGP SIGNATURE-----

--GXeSiHAEIfQDVlvR--

