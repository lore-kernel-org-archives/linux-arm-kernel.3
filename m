Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB97E7BD8A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 10:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZ4EOeb3ub2BBLKj4kgHor9DcCRbtlLvX2oXubHB8Lw=; b=yV0586c9Ab1YCgDYBuBzflGtNW
	BAfspgYUHzg0bhxWsspneDWd6Z4XLWy3UhnSaYZZwKCZc516juirI7NPtwIPAJCtmLIFwoX2FUUCv
	1EcAAmRGYtUqi++7CPomIgdflLFp9ik2U+dbGJLFDr+w7RQDhgOEZS00zOi9soq7uNTEo6O7vE7lg
	2JBFrkUsvjgz8ncU56A22pUSUZrlbvxAvYNXqYLS5HOr3fczX4st4RHtMlaGOwjArv1oJpql1tGf7
	01dsBApzp2LYiknhL3M6xtqfmDhkDTMZk/p7q7BtGUChurqRX/FwPuNxA5D4x62MEBMZesbp++5A1
	057CNm5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrw5U-00000006NNv-3QAE;
	Mon, 16 Feb 2026 10:44:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrw5S-00000006NNY-39mK;
	Mon, 16 Feb 2026 10:44:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C30E6011F;
	Mon, 16 Feb 2026 10:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 381F9C116C6;
	Mon, 16 Feb 2026 10:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771238657;
	bh=PVqVaBr/n+vwwiVRZTvOnHrcTVldkSg7n8bljp1tGzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OmBwJPlVNExeRF54zvsjriY5JlorTcvzKff5l9TBCiGJeN5TtxLsvVzNEpxJtLzS3
	 jJkx2NBYEUYEQMpagAVbB7iT2d1gV/4HnKU0LCBBu87yA0163B3k9R9lSjrvBXeAu9
	 S8BXhkbcQuJXeBERpqFgLSCeGXVSArZY3wO+6c3NvLyJFmMrZ5LTdapPGjowOns/br
	 /9OjdVF+NW7pwbKvlZSPHRfeJFNm4YooDvmf6MVsH1biZKzm3Uh193l7KYi6GTbUqa
	 ux+LpFR7/ApWvdPLe2qxIxPyM+tIDQp8tvsJgcMPWioZOrUhxde1TX7puX9hlGD7rs
	 1tPLgguHKnBCQ==
Date: Mon, 16 Feb 2026 11:44:14 +0100
From: Maxime Ripard <mripard@kernel.org>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, Melissa Wen <mwen@igalia.com>, 
	Iago Toral Quiroga <itoral@igalia.com>, Chema Casanova <jmcasanova@igalia.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
Subject: Re: [PATCH v5 2/7] clk: bcm: rpi: Add a comment about
 RPI_FIRMWARE_SET_CLOCK_STATE behavior
Message-ID: <20260216-vigilant-resourceful-coati-32baed@houat>
References: <20260213-v3d-power-management-v5-0-7a8b381eb379@igalia.com>
 <20260213-v3d-power-management-v5-2-7a8b381eb379@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="xzldcocj7z527ets"
Content-Disposition: inline
In-Reply-To: <20260213-v3d-power-management-v5-2-7a8b381eb379@igalia.com>
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


--xzldcocj7z527ets
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 2/7] clk: bcm: rpi: Add a comment about
 RPI_FIRMWARE_SET_CLOCK_STATE behavior
MIME-Version: 1.0

Hi,

On Fri, Feb 13, 2026 at 03:52:55PM -0300, Ma=EDra Canal wrote:
> On some firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
> actually power off the clock. Document this behavior so that clock
> consumers understand they may need to set the rate to minimum before
> disabling for meaningful power savings.
>=20
> Suggested-by: Stefan Wahren <wahrenst@gmx.net>
> Acked-by: Stefan Wahren <wahrenst@gmx.net>
> Reviewed-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Ma=EDra Canal <mcanal@igalia.com>
> ---
>  drivers/clk/bcm/clk-raspberrypi.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-rasp=
berrypi.c
> index 9783385d5859836898683209e320fcc928dfdc71..2e63121af0900ac9b4874b666=
cf6d02baa8be11c 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -308,6 +308,12 @@ static void raspberrypi_fw_unprepare(struct clk_hw *=
hw)
>  	u32 state =3D 0;
>  	int ret;
> =20
> +	/*
> +	 * On some firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
> +	 * actually power off the clock. To achieve meaningful power consumption
> +	 * reduction, consumers need to set the clock rate to minimum before
> +	 * disabling it.
> +	 */
>  	ret =3D raspberrypi_clock_property(rpi->firmware, data,
>  					 RPI_FIRMWARE_SET_CLOCK_STATE, &state);
>  	if (ret)

This creates a pretty weird hole in the abstraction layer and clock API.
Like, if you set the minimum rate, unprepare the clock, and then put the
clock handle, the minimum is not there anymore and you don't have that
guarantee anymore.

I don't think we ever nailed the semantics of what happens to the clock
range once the clock is disabled. And if we do, it's not because a clock
consumer disables and clock that it's actually disabled.

Couldn't we turn it backward and always set the ideal minimum firmware
rate before disabling the clock (possibly by checking the firmware
version first) ?

Maxime

--xzldcocj7z527ets
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaZL09QAKCRAnX84Zoj2+
djAVAX9Q18LM3+xl6lnztiRizzCV0M1hYddMtP85RAk7fw/L5yDk+YQhTBRCMnwk
ZknIze0Bf2qnOyS9bBuPn/Kb6JyP4n0xHs0o7sS9KDjZ1ZKMguDNgmRaXmc/AHXs
oaQUSyfJ2g==
=kbtw
-----END PGP SIGNATURE-----

--xzldcocj7z527ets--

