Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCEF3C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 17:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sGhiWFQpDnDh5hIYzqZ65rI4dfzw9Vl7m4izlhQIr8Y=; b=KoQPda3884dnIWWoMOPiKOgpA6
	Bo+7EtjktSel5Hk76NMsxkTHb/cfhHwjNK7vPdZyfnLOb5a4AozxC4IoOfUZN7mzunSYlze5/Oy6L
	ALk/yBQX8uPqd/stLwxuk+pf2baj/Odb6tM3fcXTV8AkfBjceMVdnij6HKb1gMlj2qK9uYytW+HwU
	IMxaRatbzDcP04sN1k6QW7hG+bHF5hh5NoXvdv+StenvEZAZ8bWwROOY0FsBvorJZ3csmZRG8Z34Q
	41nuHV2i4V+IjRm7Ki0e2c9prJ2rBNpqSrmkpiJekKP0i35lBjQh9OnU6Wo248EY0szQgKaPKZHpz
	tAxwGWRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRwo-0000000F8Eu-042p;
	Mon, 28 Jul 2025 17:47:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugQyH-0000000F10i-0WZK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 16:45:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 615C1A54C00;
	Mon, 28 Jul 2025 16:45:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2ED1C4CEE7;
	Mon, 28 Jul 2025 16:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753721104;
	bh=X4T3huFMENK/bbr2LynN8Axapfi9UhpKjcbblmGX5Bs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qWGGmqx66EfxCa8gov6J7bRBjwLBblLLX//wYzazzAxB4vrLuQSBOyZ7MbM8WLlZG
	 ySStgBEYbgA7/x68MEgzeESnjy4Y3A6KhTb438ZqWedAiVzHKOeSrbeGmYUkFdHwKT
	 K+7ql7zBFZn5c6dYKe59rYfyzi1ltec00QEx3UYUCjvkVf4a5LUYdeW3ncybTlRYEF
	 CwyJ8Cs/ko7WrDx5ygDP/SwwcsInBxe+KnbIL4w614FELAzcl4SMBMUmzEcGcwzsBp
	 JTFk+Pa3QaGB7R0bbzP9FRbViAFIgon2IpyinY6mfVRqal5mR+ocYCeUg+KlluOOBF
	 C9/bu42paKwUg==
Date: Mon, 28 Jul 2025 17:44:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 04/10] coresight: Appropriately disable programming
 clocks
Message-ID: <b3782b8f-8c09-4fb8-bec6-186102cc66a8@sirena.org.uk>
References: <20250724-arm_cs_fix_clock_v4-v5-0-63f648dae021@arm.com>
 <20250724-arm_cs_fix_clock_v4-v5-4-63f648dae021@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jva5e9nRu1WNTR+w"
Content-Disposition: inline
In-Reply-To: <20250724-arm_cs_fix_clock_v4-v5-4-63f648dae021@arm.com>
X-Cookie: Do not exceed recommended dosage.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_094505_237643_1B712095 
X-CRM114-Status: GOOD (  11.69  )
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


--jva5e9nRu1WNTR+w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 04:22:34PM +0100, Leo Yan wrote:

>  static inline struct clk *coresight_get_enable_apb_pclk(struct device *d=
ev)
>  {
>  	struct clk *pclk;
> -	int ret;
> =20
> -	pclk =3D clk_get(dev, "apb_pclk");
> -	if (IS_ERR(pclk)) {
> -		pclk =3D clk_get(dev, "apb");
> -		if (IS_ERR(pclk))
> -			return NULL;
> -	}

Previously we would return NULL for any error (which isn't super great
for deferred probe but never mind).

> +	pclk =3D devm_clk_get_enabled(dev, "apb_pclk");
> +	if (IS_ERR(pclk))
> +		pclk =3D devm_clk_get_enabled(dev, "apb");

=2E..

>  	return pclk;
>  }

Now we pass errors back to the caller, making missing clocks fatal.

--jva5e9nRu1WNTR+w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiHqQoACgkQJNaLcl1U
h9AEugf/Q0rlo7qxVE/p7BjSpN/fElPo7fwtwPg2sDCGvqLKh0MlhHgi8Hi/Zcj4
A/T+FYfF71i/5Np0lVNDNVXcv2g2ogF+jcS9N+KeAaG/5x58IbNe0s4USb/qt1BF
vcCuZac0BR4hNQOJX1EOgZ/NgU611k7NRDJPUqXbaacM7on4h4BabU+QJYpUaZY5
mUjSzh1USlrhb3lspn5CTKKMxtrtv65RuXzZvQpfpU4atL8N2akJtzElvks6xTDm
j4TGsbkTbStSt3WVaEeZDNAlcxMMgjMbFRF3efxrokRBdMklJL6wIzHILgBCcsX4
QDpPwEp1A8sKUIZ9BxwJbPVABY66GA==
=gcbM
-----END PGP SIGNATURE-----

--jva5e9nRu1WNTR+w--

