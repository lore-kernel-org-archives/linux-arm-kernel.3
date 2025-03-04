Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAC4C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 09:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OViK+oWMnMyjf80RtLsAbb/f83UnFoCkoTidmchXcFQ=; b=DYmDqQ4gC/wCxx6qeW5TGKho2g
	OplLhbeOfRskMYahl7pbLBULvZJgyuhHUT3IL8fktzfnWmH+qki+OHxIO/oJsnClN8ZZdqodSU/Ha
	gJOmqd4xC+MKUPBiVRQ/GC6l9osVzH+K5mPKuvKgMR6M4RFywzrIM5LSHQQR1gChzbUmRwqEtRknL
	FzOqVoYkACT3Hr/CuT8uMIuCIrZwTtJ07Mpo4FyHOwUd+EMJIXHPlubq8lH4oXs4lWJBOAC4uJUMg
	aOsM+l+YVvPiVDMcVbRrDM+WQNdiE470q6IkGoEsxec/KPSR9JRY0vpkjnXLyLefpxWfgUKCZ+A66
	T8euT5og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOMK-00000003pHY-1JoO;
	Tue, 04 Mar 2025 09:14:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpN09-00000003VJf-159D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 07:47:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9CC5DA45251;
	Tue,  4 Mar 2025 07:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499D4C4CEE8;
	Tue,  4 Mar 2025 07:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741074460;
	bh=AFZWbQeLdmlscWJGirRlHWpxaH/09ugu2ZcjrkguJhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AmsQrcb7ldMif9AB4P8WWXFrZuHD/4pz0dW/6kBzZ2di7u33yb5XNq8m+Edxpjbue
	 t1cgcLKAZmjKQpGIjMJBBPNQ8eXfpCoY5dvYXuEARGZ6jOQQxtFmdnMGMpwNDZHxzM
	 w/9DD8QsNsqFtubcoj1pdMRVJg0p7FGrOd0WFI8MuxdVj2pBpoPNBDQJ6H6Cb1Ejke
	 RkMED8G1vDf+UuWDXEkgJqRDONQ1OXXKE4GzvChTKYhYV/8HfudKhgkleMW3FX9vD+
	 VRrDoFv+awSTVONgpGrfK1b9m+9pREyedrzkFBr2/6ZDpwbJBLONHfOAxO7UMzq0kv
	 RFoQYwj6wwyTQ==
Date: Tue, 4 Mar 2025 16:47:36 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Cc: linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: Re: [PATCH v6 3/3] counter: microchip-tcb-capture: Add capture
 extensions for registers RA/RB
Message-ID: <Z8awGBW8obpG1QPN@ishi>
References: <20250227144023.64530-1-csokas.bence@prolan.hu>
 <20250227144023.64530-4-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fmbU7YrIDFXv6vYx"
Content-Disposition: inline
In-Reply-To: <20250227144023.64530-4-csokas.bence@prolan.hu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_234741_442461_C95A0AFF 
X-CRM114-Status: GOOD (  18.86  )
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


--fmbU7YrIDFXv6vYx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 03:40:20PM +0100, Bence Cs=F3k=E1s wrote:
> +static int mchp_tc_count_cap_read(struct counter_device *counter,
> +				  struct counter_count *count, size_t idx, u64 *val)
> +{
> +	struct mchp_tc_data *const priv =3D counter_priv(counter);
> +	u32 cnt;
> +	int ret;
> +
> +	switch (idx) {
> +	case COUNTER_MCHP_EXCAP_RA:
> +		ret =3D regmap_read(priv->regmap, ATMEL_TC_REG(priv->channel[0], RA), =
&cnt);
> +		break;
> +	case COUNTER_MCHP_EXCAP_RB:
> +		ret =3D regmap_read(priv->regmap, ATMEL_TC_REG(priv->channel[0], RB), =
&cnt);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (!ret)
> +		*val =3D cnt;
> +
> +	return ret;
> +}

It's cleaner to exit early on an error than to carry it to the end.
Instead of if (!ret), perform an if (ret) return ret to exit early on an
error, then simply return 0 at the end of the funtion.

> diff --git a/include/uapi/linux/counter/microchip-tcb-capture.h b/include=
/uapi/linux/counter/microchip-tcb-capture.h
> index ee72f1463594..5c015fafe42c 100644
> --- a/include/uapi/linux/counter/microchip-tcb-capture.h
> +++ b/include/uapi/linux/counter/microchip-tcb-capture.h
> @@ -12,6 +12,9 @@
>   * Count 0
>   * \__  Synapse 0 -- Signal 0 (Channel A, i.e. TIOA)
>   * \__  Synapse 1 -- Signal 1 (Channel B, i.e. TIOB)
> + * \__  Extension capture0    (RA register)
> + * \__  Extension capture1    (RB register)
> + * \__  Extension capture2    (RC register)

The capture2 extension doesn't exist in this patch so remove this
comment line.

> @@ -30,6 +33,12 @@ enum counter_mchp_signals {
>  	COUNTER_MCHP_SIG_TIOB,
>  };
> =20
> +enum counter_mchp_capture_extensions {
> +	COUNTER_MCHP_EXCAP_RA,
> +	COUNTER_MCHP_EXCAP_RB,
> +	COUNTER_MCHP_EXCAP_RC,
> +};

Remove COUNTER_MCHP_EXCAP_RC for the same reason as above.

Also, I would argue for these to be preprocessor defines rather than
enum for the same reasons as in my other review[^1].

One final comment: is RA/RB the best way to differentiate these? One of
the benefits of abstraction layers is that users won't need to be
concerned about the hardware details, and naming the capture values
after their respective general register hardware names feels somewhat
antithetic to that end.

I imagine there are better ways to refer to these that would communicate
their relationship better, such as "primary capture" and "secondary
capture". However at that point capture0 and capture1 would seem
obvious enough, in which case you might not even need to expose these to
userspace at all.

William Breathitt Gray

[^1] https://lore.kernel.org/all/Z8alaOTjZeRuXnUI@ishi/

--fmbU7YrIDFXv6vYx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZ8awGAAKCRC1SFbKvhIj
K+peAP0dCAA2g9OAlpFDPmbqoOmnwi+yDLF2hYMVY72oMo8RqAEAt6QoAGB5MLHi
Wb5E+EiJBEq2j9Hh1/bUvs7Xzsm4dws=
=jTwQ
-----END PGP SIGNATURE-----

--fmbU7YrIDFXv6vYx--

