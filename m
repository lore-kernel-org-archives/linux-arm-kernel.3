Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6599C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 18:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zMy+y5c/8mfi8FAA89LQATnBS6oZZIjVu32K5ipEiDQ=; b=szLYqffrHSLb1iba6c+PEBKDgc
	ufVF+DXAu06XKFI2GDpC+0ZwS/O7mfFh7MNL9CBk4n7PxN4f/1T7j/tN3Rlsxq1wt31p7pGYTY8Yg
	/JWGyMwt8BL8OF+MtypEkUM9tWJBBplUAKsU35a3lEwIzh0d5K+P5PJVYgIh8ZFlMqo0t6XFO7xOR
	Oa4HRIoYJ9U1XvrvQJwfza+s94KR0oHt4zg/USsr8FSXHCRT31HtbDe8MF8xaHusomPUnLZYUIv2f
	JvK5VZS1y0K5jwkc0Ev+COBTnHvPX51yb/aWNNumVct3IIajQKTVZaCkFT4HB+kMELKyQf19LOWZW
	xsDkxdxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uREZz-00000005DdU-3cKG;
	Mon, 16 Jun 2025 18:29:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRC0X-00000004v00-0Yp1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 15:44:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A33DF43BFF;
	Mon, 16 Jun 2025 15:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1237C4CEEA;
	Mon, 16 Jun 2025 15:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750088663;
	bh=zMy+y5c/8mfi8FAA89LQATnBS6oZZIjVu32K5ipEiDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pNxQ978VmTyHAQQ9sM1UZUhVQbkOiaADT141E3DfFXEwOcwu4qEMxMTh1IVstEQGt
	 3PAOJqTKVY8HfvN8cTN+fK2oxDoJ5AkhIlaCRGObXvujSzMrFcaJcYwLfG+Trvg6w4
	 j921Hfcu+9Nad7s08+IUQFyT3vv1PWMl9FhwEnuqJUBBkMYATf9ppHtqBITbPsM6GW
	 GeYE5rVpfhm4iainanvkEnHIJwvNF5wE41xpDPrJNfogRb8E6LNirFmNMK9YjpYFnn
	 p4RkLzn4dxmNQis5Lpyt2r5WaU8IX0y2FEu0CFHx0mShhxY9FLCXOesN5eMnYGP5KQ
	 EpOZ60DvuS6BQ==
Date: Mon, 16 Jun 2025 17:44:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: lee@kernel.org, alexandre.torgue@foss.st.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, wbg@kernel.org, jic23@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	olivier.moysan@foss.st.com
Subject: Re: [PATCH v3 4/8] pwm: stm32: add support for stm32mp25
Message-ID: <hsmkc6ydsyjgyq7dkhvcytqrn6uu7ezngknetshkf4kj4mjt3i@3hgg42aq3sd5>
References: <20250110091922.980627-1-fabrice.gasnier@foss.st.com>
 <20250110091922.980627-5-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ezyzxvlev7k4prvr"
Content-Disposition: inline
In-Reply-To: <20250110091922.980627-5-fabrice.gasnier@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_084425_192136_5954C9F0 
X-CRM114-Status: GOOD (  12.01  )
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


--ezyzxvlev7k4prvr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 4/8] pwm: stm32: add support for stm32mp25
MIME-Version: 1.0

Hello Fabrice,

On Fri, Jan 10, 2025 at 10:19:18AM +0100, Fabrice Gasnier wrote:
> Add support for STM32MP25 SoC. Use newly introduced compatible to handle
> new features along with registers and bits diversity.
> The MFD part of the driver fills in ipidr, so it is used to check the
> hardware configuration register, when available to gather the number
> of PWM channels and complementary outputs.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Applied to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
=2E

Thanks for your patience
Uwe

--ezyzxvlev7k4prvr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhQO9IACgkQj4D7WH0S
/k5Gygf9Gy+dDmATpLY1NSgEaVsqseEX8U1OK8Qr0hXVS6DWdx1yiKu/usPB/Ns8
KlFNa+c0Yd/lDEYjkvaLr0FmmGazj3yReZB7iuTBjo42rR4ZMg70Ch92UmhZL4JQ
jWYv+ZLzvdDvyEN1mtPizoYrwazqtK+9ajkbSgIWORogLWD2ieG12tfwpE0FjPjB
IkdnMX9NbFB777pXHx8JZTux0YzwmZ9Y6grswoV2Rdlor2xxm/atUWqAE0g8qRzM
QFCOVen4t50xS6ptchwAsDwMRIrDfmVaiMg3T8tC55Fpix5GOkkzFfunE33BqDhi
kt5RKeBIclzLIGFvx72daCwUDZqidg==
=4Cak
-----END PGP SIGNATURE-----

--ezyzxvlev7k4prvr--

