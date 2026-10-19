Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83E2606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 19:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e1kRYOug;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UoPgKSN1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Bpag77kmspJPEOoTU0jcXIfdYDy3+L/uaEPHFY9Zf8=; b=e1kRYOug2E6LrMoboggDXCgC2i
	O155COJsw3b9PKPRAxo+i0Oe/7w4yYJ/N7vRv/e61lZuMew9dxN3O3r0pA5NuKIPZx5VVANmayrRB
	CQP0nADU1iUtF5cnzwg+zqRputhe8PaDUFyvdYwFc5+GNc25VAnF9U9JXG8lDrVuCjTXoMd7gF74Q
	8S+oi+KyKIas/h2b9gvsK6+Tsv5esCJHQZF89ouSMCZknbE+ute1vzFnSMHZv1bb2OH3SdaAATX2S
	l/lqS1JbEyr6w9vNUSbZVpbdhRMUIcF6VqjZkKRO+dZ5eRTTRdU+fEmpHFRVL/U6BqwMdcU8HhQAu
	VXcICjQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIsak-00000008D6Y-0oQA;
	Mon, 19 Oct 2026 19:00:14 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIsaf-00000008D2N-0NF4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 19:00:12 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso1451435f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 12:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792436407; x=1793041207; darn=lists.infradead.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Bpag77kmspJPEOoTU0jcXIfdYDy3+L/uaEPHFY9Zf8=;
        b=UoPgKSN1y25zAUPIkMeN5BBg0b098GLgN9IOUxjh4yojyv39Tg0Nv2SsYL//RYcsws
         7rWTaFkrZ/mucrjYmiWjU9j55+jEnrH8K2W3u8RATQJKOtnfVHnc6p4VpBI18nwrCVJG
         DNFkK3J+Fj27OF2Hb2o64HOUYaRrRQ3rBOAqyT3riiaynysyoy8yjJiDg6ISnbs0U9CF
         R2O27Kkg39ikN3iHC9FfZJdma7L/KUTfvxY8T0XuT9oYiA66iGU0eoOQEzab3qQlIkr+
         kqpK58lF4SHAHI9BjGR/8iiDqtSKyDDoT4TtxQlR8Ly0cJDUXarfQ6oQYI7TxIwAJmJL
         Q/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792436407; x=1793041207;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Bpag77kmspJPEOoTU0jcXIfdYDy3+L/uaEPHFY9Zf8=;
        b=bT5jYchK39f+lcEkS2HI/L20ypDOCc7R8BRVhV+KLuZ9cMFVSHnXXHxnYMVmZUvwMX
         AZNWFWqWC8r7nq+snmRK3f2C1ZuwCmry2wNGkIRX6fEMpL6oahC5akBBs+xCAhffJPCh
         CHGRR5OueQT1EtK+eZR3pWS61dgUwuevDj75wI3RVD5o7Cvpxw0Q8INqbfm+MB95Bykq
         AJgVPbh1WR1YsyfIK8E4KR5pXY+Qbq/Mf1a3UA0BPT6NvV8I2fcAd7xir9ep88a7STav
         GXkx7H1mio04booFAa8A8ObQwxdsrxPCwZ+dNPBfFj52LuDLn5gSSOzUrcCCJ1S4YvsS
         o74w==
X-Gm-Message-State: AFq9FYKJRQc2CQmmCtSBYlAktMPXahVickFozFv158/e6VLuI1VYZ4LW
	qy7VE1uqsdIwEEYtBnURQFAq/gbLn/0gVYyXtbSr/8qsuENzyOAPrXCdvwR+T6q/BO8=
X-Gm-Gg: AYBFou1FnMkWS+eRcVsG+VPWY9Wo89u8U/PylwIrmY1AzeR3RekZBD3OxFwXubH7kQD
	HwqGj7jDhdMV1FEcUNy1YEpo01X5AOGQzoPulEpW79dC+pY5/p0L0jbUMgbH8223Rx9Gw4C2pkW
	0eV2fTmtuQ+BpsB48ckZ3rViSbc9mfK2n36MR9ZNE7Mdnz0lWE/lIGyEKQLdk2SOzHWe9blqpLJ
	6bnFN84M+p15DMyAE5CmS/1bAPiY1rAlPWeso468hewgZJ5U2rhP6/7O7wTaAfVGBV7KkVFDrMb
	C8UTFGdUXVsyEcwVMjezYaYJEZDBOcsB++NMn9/m9i1G68vZlJNlVCBwe2A/VRnCG8ZTI05kFfL
	564cdnJLImGRWFeEQllkHXRdpldu7E6x7tgyUuoqx1U7yQcpI3XkchRqYtSvuyqYHktlBUco8GF
	XM60pPj08YISBpF1OLaIeUJ9yvuUUXZ6TS0yf+n81tHk0lRBj+H8oXObDxJ82IkQqQZw8/FHHBI
	iPHLreUgIjlnGhDEc6CXZdnYg==
X-Received: by 2002:a05:6000:5c7:b0:48e:2ac:de30 with SMTP id ffacd0b85a97d-48e07fa6035mr18871744f8f.33.1792436406338;
        Mon, 19 Oct 2026 12:00:06 -0700 (PDT)
Received: from silicon.doe.home ([148.69.129.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d818237sm702781f8f.27.2026.10.19.12.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 12:00:04 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: arnd@arndb.de, krzk@kernel.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>,
 Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v2 20/24] spi: zx: Add ZTE ZX family SPI flash controller driver
Date: Mon, 19 Oct 2026 14:15:30 +0200
Message-ID: <jjb8MyAPSXaXqHtedDkkwQ@gmail.com>
In-Reply-To: <20261014072109.1759502-21-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-21-ghahramani.navid@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartw_T8zL-ZTluB82Us-2CIWw";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_120010_128874_4027F37B 
X-CRM114-Status: GOOD (  20.02  )
X-Spam-Score: -0.6 (/)
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
X-Spam-Status: No, score=-1.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--nextPartw_T8zL-ZTluB82Us-2CIWw
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Date: Mon, 19 Oct 2026 14:15:30 +0200
Message-ID: <jjb8MyAPSXaXqHtedDkkwQ@gmail.com>
In-Reply-To: <20261014072109.1759502-21-ghahramani.navid@gmail.com>
MIME-Version: 1.0

Hi Navid,

I had some time to review the changes you made to my SPI driver.

I'll grab the code style changes, they seem in line with kernel guidelines.=
 Of=20
course it'll only live in my gitlab repo for the time being.

Am Mittwoch, 14. Oktober 2026, 09:21:00 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb=20
Navid Ghahremani:
> +static int zx_qspi_set_speed(struct zx_qspi *qspi, unsigned int max_hz)
> +{
> +	unsigned long rate;
> +	long rounded;
> +	int ret;
> +
> +	if (!max_hz)
> +		return -EINVAL;
> +	if (qspi->speed_hz =3D=3D max_hz)
> +		return 0;
> +
> +	rounded =3D clk_round_rate(qspi->wclk, max_hz);
> +	if (rounded < 0)
> +		return rounded;
> +	if (!rounded || rounded > max_hz)
> +		return -EINVAL;
> +
> +	ret =3D clk_set_rate(qspi->wclk, rounded);
> +	if (ret)
> +		return ret;
> +	rate =3D clk_get_rate(qspi->wclk);
> +	if (!rate || rate > max_hz)
> +		return -EINVAL;
> +	qspi->speed_hz =3D rate;
> +
> +	return 0;
> +}

I think the idea of op->max_freq is that it is the SPI bus clock, not the=20
controller clock. Existing drivers aren't quite consistent on it though (or=
=20
there's HW without a divider register). spi-ma35d1-qspi.c for example sets =
the=20
controller's clock divider rather than the clock.

So IOW, this function should primarily configure ZX_QSPI_TIMING_REG. If the=
=20
target clock can't be achieved with the controller input clock (e.g. divide=
r=20
is larger than ZX_QSPI_TIMING_REG supports or clock rate is lower than=20
requested SPI speed), then a change to the wclk is in order.=20

> +	ctrl->min_speed_hz =3D clk_round_rate(qspi->wclk, 1);
> +	ctrl->max_speed_hz =3D 50000000;

This looks wrong - the max speed is probably the highest possible wclk rate=
,=20
the lowest speed the lowest possible wclk rate divided by the highest possi=
ble=20
divider.

> +	/* Ensure proper data sampling point */
> +	reg =3D readl_relaxed(qspi->io_base + ZX_QSPI_TIMING_REG);
> +	if (!FIELD_GET(GENMASK(17, 16), reg)) {
> +		reg |=3D FIELD_PREP(GENMASK(17, 16), 1);
> +		writel_relaxed(reg, qspi->io_base + ZX_QSPI_TIMING_REG);
> +	}

I don't know what this is doing. Can you elaborate?

Cheers,
Stefan

--nextPartw_T8zL-ZTluB82Us-2CIWw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrWCeIbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoijXkP/32Re4QchJqG2fSsDvgO
TLqGuFK4iM6eS1lxCZWBPQJSAk/bvub0FqnXzMPlGtcHj1wfg8BJCXs0yofwg+Lp
JFgYu/TU6QYBX+qtnwl90wAyPL4Hs22SrDuUbiPbFw7jkmXqxyDfucsgrlsHSrMr
wvny6/MopUMSNgCMwPjpRYaBmfR5FYtl43J1zxgxIcgGUlioEKdilb8FL0QEUvKe
5eQw+itIq9+SMiO6p04eFvwWeGcdO6FKti/XrUu6U0/pAJ2wYLFeGSOh5olR3i03
GgXIl+g+8RdxFF0hBuX31LhgTO6AriXSVXW39Jx8oKdRac28CxLhfQB3l0XURZ05
+c71wQBpYDUYUdPZzwYGaAyyaaKz8ldui8Jh7+wAK+J9ib4bvR762iAqgLXV+s0T
hl3A2d1NzNhT+lM6NdynCArkKiQNpOn3C6KHCDopiIaeUebmdWLFUb5bRJ75OMM4
BDT9iGbsflZ8PUhgZaIdyTqAFygRB4ABwdSV2p5IkBjilf5lH+hQ5w3Xc5eUmMev
jVvqVtKBW/4f9AVUoCPMyig5zqAtI7LZvlrgF+Ed4t98hWwYDcLtTRAh/R8I8sNh
sg5QwgVW6r3DxNEpksJiVtL0acXeXejWvVdF7jIvAOv6OCrsT0T0b2JhdJfesqW2
DLps6w2pKD7uEgXjorZZo5Xt
=eb9e
-----END PGP SIGNATURE-----

--nextPartw_T8zL-ZTluB82Us-2CIWw--




