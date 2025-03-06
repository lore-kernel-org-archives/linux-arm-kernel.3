Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B04C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 05:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mSdoTJxhQeoHjGZe87UY9dD0fnCWqR2Ybf9epRF46P0=; b=x0JcGB2VcAfa80pozczlTa74Kf
	yBqRcGM7TS1oe12u1kkdeKisl6muYewqVOExPOb+siP7Pnb+R5PUzUMCvInBrzKPqhTJ3rJhUV+18
	GqNCdLmsExvF8WYD1U/7zkDrUrujRmsyFjIzrv2o64p/KPDIM589owJ1C9jtckAlxlfGzkyxvjw6a
	V0X/fAcCi1nx7EkMKpTk6SOPUgCatlAzn1T4UwkkMQjnOrFEgwpBkBGzmdGs/nhf+5L/Y1ASZPLf7
	NGopxLICUg0A+xldoysA7wVp9nof3lREFQKiXeGoF8T2I88lMHMIQE9uXGxk9YQqBfGIzxtNFr0Ea
	gBXfiXUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq48Q-0000000A4fE-1gJa;
	Thu, 06 Mar 2025 05:51:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq46g-0000000A4Tw-3fkU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 05:49:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5BF3C5C4905;
	Thu,  6 Mar 2025 05:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02A9DC4CEE4;
	Thu,  6 Mar 2025 05:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741240157;
	bh=BSqTHd4IyO4Os53hX91Rm7M9G3KnhQxpq4axd31S4As=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QeqFgw69dpZB2r8LmAfIpzgWEe03sSj6A6R6egiaKribwDXO+9vB8fuvZOrGUI3EA
	 qK+RfD1v6NLIHJTtmmhITmzDRPynxq2HI3zvT6mCjSoB9SbOivdQ/x+LX8pPcp5R7w
	 R6TQtgldruTav5B9Dx6wbZuUMOYC2o4n0nH7VlGqNZKz72PLj5t41LZx+vmadt+bPe
	 ieX2fVJ1pt/HknLAc0+h/JJsDQqStsqKTZ21O6ZfhOCHxRc6vb9X7APR1w7HU5lA0s
	 Po1EUvWacQ37ZXv0ghd5tyeir836k2MisNDtZTL0PXVu2qjbnz+0/k/VQOZKblo/nN
	 hcONpNUjCPOHg==
Date: Thu, 6 Mar 2025 14:49:14 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: Re: [PATCH v7 1/2] counter: microchip-tcb-capture: Add IRQ handling
Message-ID: <Z8k3WlJHCrYPdW4j@ishi>
References: <20250304155156.374150-1-csokas.bence@prolan.hu>
 <20250304155156.374150-2-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fW4fCf+MWkpAn/Ne"
Content-Disposition: inline
In-Reply-To: <20250304155156.374150-2-csokas.bence@prolan.hu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_214918_958278_4A8FFDC4 
X-CRM114-Status: GOOD (  14.84  )
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


--fW4fCf+MWkpAn/Ne
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 04, 2025 at 04:51:51PM +0100, Bence Cs=F3k=E1s wrote:
> Add interrupt servicing to allow userspace to wait for the following:
> * Change-of-state caused by external trigger
> * Capture of timer value into RA/RB
> * Compare to RC register
> * Overflow
>=20
> Signed-off-by: Bence Cs=F3k=E1s <csokas.bence@prolan.hu>

Hi Bence,

I'm mostly statisfied with this patch now, but I have one minor
suggestion below.

> @@ -27,6 +33,7 @@ struct mchp_tc_data {
>  	int qdec_mode;
>  	int num_channels;
>  	int channel[2];
> +	int irq;

We don't use the irq member during the driver operation, so I don't
think this value needs to be saved here with the driver data. It seems
to only be needed in mchp_tc_irq_enable() for devm_request_irq().
Perhaps you can pass the irq value as a parameter to
mchp_tc_irq_enable() instead.

With that change made, I think I'll be ready to pick up this patchset
and merge it into counter-next.

William Breathitt Gray

--fW4fCf+MWkpAn/Ne
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZ8k3WgAKCRC1SFbKvhIj
K2i2AQCYb0T6OBjNZqGb0NMlg9KvEEx6c/RvhpeYlzQmHuWYYAD+PuWjwZ3KnEkr
hOZ7IMtE7r1qcqDFU0m9GwWw0dL+bwc=
=pVll
-----END PGP SIGNATURE-----

--fW4fCf+MWkpAn/Ne--

