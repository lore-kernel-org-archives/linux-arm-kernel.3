Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2A4CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 10:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTL0TETi6wov8+6DSxxvFjg0nJ80CdLa2nOZg+tVLAE=; b=Y2Unv9Ynj5rbuPEkspNgObdOmg
	4LKY1RThxh8x+tvhLFf+woAiSwB0u3XWxj90Y1pyrk3ME55W/4uWO+VOCu2LMrHoMj6ks7jMLEOW6
	ae+a8dr4orrGn4fjrluxbQ6coXLtnpBTZTgJM7YMRDxAIOWHa3B2Z0Xe0/aiHE2X/CBSaGhbFpOdG
	2KkDKka3zXVBZ06NWEUlDugsCP4Vu+kKiuaG/1w6KraYaj3NGXMIZIoJsvWemTYFHZx2Hh/Y2P2If
	x6goTMYzV7uv3C/0s4dJB8IuL6YUJhq1SLM6dB1t5FS3XlUU7rnykSqh1mxOIW5PewPlLJU9w8z7u
	mqYoavGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOsu-000000029Up-0T3y;
	Wed, 07 Oct 2026 10:28:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOst-000000029Ud-0z0u;
	Wed, 07 Oct 2026 10:28:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A8BC043AFD;
	Wed,  7 Oct 2026 10:28:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABCB41F0089B;
	Wed,  7 Oct 2026 10:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791368906;
	bh=lTL0TETi6wov8+6DSxxvFjg0nJ80CdLa2nOZg+tVLAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SOXb73hCTRuSHIAJ72hkQiFKZEpX+WBJt7tordjKDFEXlItLFDM4M39jauirdGgBu
	 5Ig8ZZ7tFAthJBWZgfBcTe4mO4+T/m+Df5Wyl5a3SxRK58gwOzOuSqYhbZMYqE89Nm
	 UbgdMw8kHZjwD4b/tj8nw/N+crp5BaBAhwKKcDCsQZthV3ZCbTco0g0IgH+LErURS7
	 9nUTFrwhkwQWgp7zY+AxXzvnuUQOi1GjUu3ZB51tmoSzaeETfVjN9PRXxOCpBg6Q7i
	 JXE1ts/2tcByzlEjeWpziuxtrW9P4IEkRNdY3he1nBpoivM1YnQiCdEOXZLM6V8MOt
	 3xwH30eb5F45Q==
Date: Wed, 7 Oct 2026 11:28:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: mediatek: mt7629: add RTC clock
 IDs
Message-ID: <20261007-fd52cb4e1451642185a6589f@squawk>
References: <20261006-b4-mt7629-rtc-v1-0-e556386df816@gmail.com>
 <20261006-b4-mt7629-rtc-v1-1-e556386df816@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s4wIikCK1FzuJJqu"
Content-Disposition: inline
In-Reply-To: <20261006-b4-mt7629-rtc-v1-1-e556386df816@gmail.com>
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

--s4wIikCK1FzuJJqu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 06, 2026 at 02:42:23PM +0800, Chuanhong Guo wrote:
> Expose the 40 MHz / 1221 RTC source and the RTC clock mux. Keep the
> existing CLK_TOP_RTC ID for the 40 MHz / 1024 source.
>=20
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
>  include/dt-bindings/clock/mt7629-clk.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/dt-bindings/clock/mt7629-clk.h b/include/dt-bindings=
/clock/mt7629-clk.h
> index ad8e6d7f0154..aa94a398ae05 100644
> --- a/include/dt-bindings/clock/mt7629-clk.h
> +++ b/include/dt-bindings/clock/mt7629-clk.h
> @@ -115,7 +115,9 @@
>  #define CLK_TOP_CRYPTO_SEL		105
>  #define CLK_TOP_SGMII_REF_1_SEL		106
>  #define CLK_TOP_10M_SEL			107
> -#define CLK_TOP_NR_CLK			108
> +#define CLK_TOP_RTC_32K			108
> +#define CLK_TOP_RTC_SEL			109
> +#define CLK_TOP_NR_CLK			110

Since you can change NR_CLK, its not a binding.
Please remove it, and put it in a driver or w/e uses it.

pw-bot: changes-requested

Thanks,
Conor.

> =20
>  /* INFRACFG */
>  #define CLK_INFRA_MUX1_SEL		0
>=20
> --=20
> 2.55.0
>=20

--s4wIikCK1FzuJJqu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasYexQAKCRB4tDGHoIJi
0gzPAQDCkxgZs1Pry9OFkFX1+k2jkE9trqoJYE7GdRSabNdexwD/dtbqGFDDuYqS
8F5IjTUa7gRFcntcEi5/OLTRiGCg4Qo=
=bYV2
-----END PGP SIGNATURE-----

--s4wIikCK1FzuJJqu--

