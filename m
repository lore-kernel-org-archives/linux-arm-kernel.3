Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3727BC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 09:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lN93nT2IoUTFSDaQicw10spvaC6WDUkX0PMh0MiSAfc=; b=0Ai/lN7yKETxgn00W0VohGC3r3
	4woo9SdjvhChoymFAv1lVZ5xl+K2v9LUDrQinfGRUgsUt50X7QtlKk8eWKrG5ac8QJ+8BZvYLKkKD
	zDPN9yeaDaRhgd3NNdZwv0A5wP8bK7VdiYdY5zDke/EEybBn8XUzG0ZJQEb+UkNE4SEQkl5T1uCHz
	e/fUVF6tbMu7A+6/YF9Ty5/cBkFN2pjtIItyZikIccY+9mh2p9sgbsTmGHUQG7zdbo97wQ5581i2L
	yCZR6Ttc+P+DhBU7ZCt2fMWa51g65zO4DhHRCq3e8hFhvVENM7YKPQ8u8yqAJwwBGPfX20nHKo/Uc
	wnWx1WHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUxV-00000000AcH-0g27;
	Thu, 15 May 2025 09:32:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUpl-000000009Fo-28NY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 09:24:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 52EE35C10B1;
	Thu, 15 May 2025 09:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C28A3C4CEE7;
	Thu, 15 May 2025 09:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747301096;
	bh=JZp32cGnARt5v5SngWT8bwZW1Jh8iJC7PUvH3dlXTsI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A7mU282LSWsGdpwJ5DOiLTIAyqVyxqrlhiVc/v/e9xV8IF8oplET2K7F1vaW9ndS9
	 Tlas2OXmX6IsN+pRPlTSwvSVtCP/Cw8hsCLXnTBqvAPakVN7aP6hBug3Z5jAfSXubn
	 ZZrk7AA4uR2EeRexTRs3IkByDiF4sfYVO8tBjoHvFYBpCuapOsYHAbkzEnbptayKPG
	 MaoK0JqisvSZA0NJiNex8WCJ8Q3RnsW2nI/+VLG9cLM4obd3XEaUHaDi8QTplnEc1M
	 321EnbfQT9BLZhjy61zQ22mIKJpakf9bnmHCgr0tDdiOLD7gc8Vv4jdSy+oggRK3O8
	 BkvdzdvjkhAOg==
Date: Thu, 15 May 2025 11:24:53 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	wbg@kernel.org, jic23@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-pwm@vger.kernel.org, olivier.moysan@foss.st.com, lee@kernel.org, 
	alexandre.torgue@foss.st.com
Subject: Re: [PATCH v3 4/8] pwm: stm32: add support for stm32mp25
Message-ID: <5ui74qlssllgn4h34by5jcpi5g6rknziclcsh4w27tjvznynsv@lcjtjxn6rovl>
References: <20250110091922.980627-1-fabrice.gasnier@foss.st.com>
 <20250110091922.980627-5-fabrice.gasnier@foss.st.com>
 <4b641513-ff2e-43ab-8074-ba6b521875e2@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dxezo4t7v65ydh54"
Content-Disposition: inline
In-Reply-To: <4b641513-ff2e-43ab-8074-ba6b521875e2@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_022457_593604_B82EB67D 
X-CRM114-Status: GOOD (  21.70  )
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


--dxezo4t7v65ydh54
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 4/8] pwm: stm32: add support for stm32mp25
MIME-Version: 1.0

Hello Fabrice,

On Wed, May 14, 2025 at 11:30:26AM +0200, Fabrice Gasnier wrote:
> On 1/10/25 10:19, Fabrice Gasnier wrote:
> > Add support for STM32MP25 SoC. Use newly introduced compatible to handle
> > new features along with registers and bits diversity.
> > The MFD part of the driver fills in ipidr, so it is used to check the
> > hardware configuration register, when available to gather the number
> > of PWM channels and complementary outputs.
> >=20
> > Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> > ---
> > Changes in v2:
> > Address Uwe review comments:
> > - Make MAX_PWM_OUTPUT definition less generic: STM32_PWM_MAX_OUTPUT
> > - No need to initialize 'npwm'
> > - refactor code, for *num_enabled to use same code path
> > ---
> >  drivers/pwm/pwm-stm32.c | 42 ++++++++++++++++++++++++++++++++++-------
> >  1 file changed, 35 insertions(+), 7 deletions(-)
>=20
> Hi Uwe,
>=20
> I think this patch still miss some reviews.
> The first patches of this series have been merged.
>=20
> Is it ok for you to merge, or shall I resend separately ?

I have it still on my radar, no need to resend. I just have to find the
time to look into it in more detail.

Best regards
Uwe

--dxezo4t7v65ydh54
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmglstgACgkQj4D7WH0S
/k7tvQgAr0tuQYW7a8kZHG4D+r8Ju5Etk+73ekoD+5NJcmpwe6C8Nye8E3mKfgS6
bWCXuQS9aBsBvnmwFzIV9jkcwJrdeejQfv46EJ0IOZZFloj7b/vB3K/L/dzS3Ray
XkPiy+M1R1rGt5B5X1U2gyUK6QRCE4KOMquhXMRCQxO7zqXlozUOk2rcmcAzgGMV
tpQY/lDPoA9V6k4R6WL4yGAzwybvl+ASbzdrDmsjuIcW9On5Y5xDzkeVH9RSU5P0
apvIu6hfS3bj3LvTF8QiT9emDOMQJAMU0J5t2YOeazfw/A7rFfqFQl7FA4Z2nDGZ
wxTfL+UCcOGnVPHKb0fByZ5OKLMqrA==
=ZB/v
-----END PGP SIGNATURE-----

--dxezo4t7v65ydh54--

