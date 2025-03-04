Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 953C1C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 07:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cbpqTCq78dKKsdgJHoo5yv9k/iEbESIxaH3v7LkF9WA=; b=OxdqsO3mtUJLVNbCDx8CtGCWUg
	AncM9pOzvxeXwnxvDhC0szO4fi+r77PsFlglMB1fg3CUYvMWTXdiXSeLk7P1iZ69Bv4Cg1x2xE+4V
	X/iMgGLJ2CnrnDKWGemVwsJzIW5f+SfEq/JG/uNmRK8coLH0zkmOr9f12He0t4cu0rKU9O0noL4oH
	+OLk59rnSO2pxjOmIlcIryMCzThTaigufyMHZK0XjUcA4U8pRYd+B4tk9zQnaLRnTa1ObPXyhbwKH
	6g4TK+jK7U+35tQzuUghMVZikQTDYZDOozKkLI0cmII3kQ4UzJoEflsMDPt1CRtuWV14d+/R1XMzd
	O4/frcWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpMJb-00000003Nkv-3DBi;
	Tue, 04 Mar 2025 07:03:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpMI1-00000003NZR-31l0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 07:02:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A2239A44CDA;
	Tue,  4 Mar 2025 06:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C59CC4CEE9;
	Tue,  4 Mar 2025 07:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741071724;
	bh=ZQ5PhUftJ57V/Y5zzJkozL4WSOs8vgmNZIByf0cbzq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XIIKFhwKMX5MxV7LyUyuou3YED/sF9lUwEzbeR5T4NZAe6J8YFIEYE+TG55QLq7Af
	 VoxWFYm/TplcbQwg1nQ8SWKS6b+ebpJks+yziXdxoKrQ2xmY+Kro2p9ojLsjIxEdiN
	 E6iqEMq6jA2wL41fwv9kFfY5e8wtkK0JmN57j/bJfMWun48tODnvQtWZv4sl50sP9Y
	 WQfgmKoyULF1N7nfhR0ZUTVyxLgHG8HamoXDerWkyz0yNXBB189TA9JjFC/wq7pJ6n
	 PsjAjCpSK5fiD8cJiDNYnmzu0STcRcBFO92zc5emznyiNiQdBKKWNcb7oFTdLCneSw
	 h5KpP00mUgQlw==
Date: Tue, 4 Mar 2025 16:02:00 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Cc: linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: Re: [PATCH v6 2/3] counter: microchip-tcb-capture: Add IRQ handling
Message-ID: <Z8alaOTjZeRuXnUI@ishi>
References: <20250227144023.64530-1-csokas.bence@prolan.hu>
 <20250227144023.64530-3-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BpBnxHRSyKeOs9ok"
Content-Disposition: inline
In-Reply-To: <20250227144023.64530-3-csokas.bence@prolan.hu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_230205_890285_B89A5863 
X-CRM114-Status: GOOD (  21.00  )
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


--BpBnxHRSyKeOs9ok
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 03:40:19PM +0100, Bence Cs=F3k=E1s wrote:
> Add interrupt servicing to allow userspace to wait for the following even=
ts:

Hi Bence,

This is a nitpick but keep the commit description with a maximum of 75
characters per line so we don't have formatting issues with how they
wrap.

> @@ -378,6 +444,15 @@ static int mchp_tc_probe(struct platform_device *pde=
v)
>  	counter->num_signals =3D ARRAY_SIZE(mchp_tc_count_signals);
>  	counter->signals =3D mchp_tc_count_signals;
> =20
> +	priv->irq =3D of_irq_get(np->parent, 0);
> +	if (priv->irq =3D=3D -EPROBE_DEFER)
> +		return -EPROBE_DEFER;

In theory, the error code could be something else if of_irq_get() failed
for any other reason. Handle all those error cases at once by checking
IS_ERR(priv->irq) rather than just -EPROBE_DEFER. Then you can just
return dev_err_probe() with priv->irq for the error code.

> diff --git a/include/uapi/linux/counter/microchip-tcb-capture.h b/include=
/uapi/linux/counter/microchip-tcb-capture.h
> index 7bda5fdef19b..ee72f1463594 100644
> --- a/include/uapi/linux/counter/microchip-tcb-capture.h
> +++ b/include/uapi/linux/counter/microchip-tcb-capture.h
> @@ -12,6 +12,17 @@
>   * Count 0
>   * \__  Synapse 0 -- Signal 0 (Channel A, i.e. TIOA)
>   * \__  Synapse 1 -- Signal 1 (Channel B, i.e. TIOB)
> + *
> + * It also supports the following events:
> + *
> + * Channel 0:
> + * - CV register changed
> + * - CV overflowed
> + * - RA captured
> + * Channel 1:
> + * - RB captured
> + * Channel 2:
> + * - RC compare triggered
>   */
> =20
>  enum counter_mchp_signals {
> @@ -19,4 +30,11 @@ enum counter_mchp_signals {
>  	COUNTER_MCHP_SIG_TIOB,
>  };
> =20
> +enum counter_mchp_event_channels {
> +	COUNTER_MCHP_EVCHN_CV =3D 0,
> +	COUNTER_MCHP_EVCHN_RA =3D 0,
> +	COUNTER_MCHP_EVCHN_RB,
> +	COUNTER_MCHP_EVCHN_RC,
> +};

These would be better as preprocessor defines in case we need to
introduce new events to channel 1 or 2 in the future. That would allow
us to insert new events easily to existing channels without having to
worry about its actual position in an enum list.

One additional benefit is if we do end up introducing more Counts for
the module. In that situation we would have multiple CV and RA/RB/RC per
Counter device, but we can easily define a preprocessor macro to
calculate the channel offset given the Count index. However, with enum
structure we would have to manually add and maintain redundant defines
for each Count, which is far less ideal.

William Breathitt Gray

--BpBnxHRSyKeOs9ok
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZ8alaAAKCRC1SFbKvhIj
KwgVAQC3uPc49wX760fObL8equIESUZ04H8MdACkUI4Mi1fhsAD9EpFDTNaLDOaL
s4w9rvq5ikY9mEWoKsn3ojlscOGeHQ0=
=nSNc
-----END PGP SIGNATURE-----

--BpBnxHRSyKeOs9ok--

