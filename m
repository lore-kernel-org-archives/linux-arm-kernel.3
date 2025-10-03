Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1814ECAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 20:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQMn0xYZu/W44ie7RbT5/KZKevQi8dTv/4ecWALqC3I=; b=uKxDJvxx3r8VMyj/PzqxSEsWTq
	7po0SaWbAyeaXQQDfYzyvKjTQVNDTEm2RapvcJ8rknDnYLjBQU1xrmxrb8GrKwNW8rIjZZw7mFTlq
	L5o4Rd+HcQb3s5uQA7B7hLtAHjaJnJOB32xZr+ChbwyC8XVeC2SWrZtrc14MNHWdjN/UN1kc19LTC
	q5QIR8aergdOhDavYLBynkETnV7/+oRumHZIU/oK30GoZ2EF6fUyu2m2+4iyYxgsOYvRuvWSCSy16
	aQ01H9w8gdDOCOQyYr0KvlAdj+OZEBi2hvl/HMVw5/djlXj0dJNs2tWb2nBgSXIgfh2llFKeBAYtY
	nzy+8Aew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4miA-0000000D7QD-1gsj;
	Fri, 03 Oct 2025 20:49:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4mi9-0000000D7Q5-2iZB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 20:49:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 19F9B61E01;
	Fri,  3 Oct 2025 20:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B6CEC4CEF5;
	Fri,  3 Oct 2025 20:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759524544;
	bh=HQTN2i+oT4JFL9hKIQWaUwNNbKsxDcq6rJFXHwtEikg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aAaiiEFQHTfaCaOlYOkAF/OukCRWCchT3W9jx+D2mhrmILAFZaAcwRxrdNVXkRKj2
	 02qQ68YfCssAjZzlcxQHMGs0ihIJh7PwxYi5KZ1PId5HPNXwer3tBLvizJz8/sy0ad
	 3hEiWr2yv9L5aLWBfT/KNpTsPO91gcTjcqmGiNwHWW3b33XCWsm7y2Mvhw5Jljt6jN
	 wUrNkGUCfctJPguOmbZHWsEy9siTTuhk8oDCJK6Am1lYKfsiQkf+o6FNaVc09/SNA8
	 r8khxcmnPRXK74I44TylP+W4XepoACJ2hATZC4rp62J1VcFSKW8xdvCRPLHzDbrrk/
	 1gH0u83Ddh70A==
Date: Fri, 3 Oct 2025 21:49:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
	andrew@codeconstruct.com.au, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: aspeed: Add VIDEO reset
 definition
Message-ID: <20251003-paralyze-herald-f9ef464d43e2@spud>
References: <20251003015845.2715538-1-jammy_huang@aspeedtech.com>
 <20251003015845.2715538-2-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0l94K67tftqusJJV"
Content-Disposition: inline
In-Reply-To: <20251003015845.2715538-2-jammy_huang@aspeedtech.com>
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


--0l94K67tftqusJJV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 03, 2025 at 09:58:44AM +0800, Jammy Huang wrote:
> ASPEED clock controller provides a couple of resets. Add the define of
> video to allow referring to it.
>=20
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>  v2 changes:
>   - Update index of ASPEED_RESET_VIDEO

Ah, so here is the next version. I don't see how this can be correct if
21 was correct before. Was 21 wrong?
> ---
>  include/dt-bindings/clock/aspeed-clock.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/dt-bindings/clock/aspeed-clock.h b/include/dt-bindin=
gs/clock/aspeed-clock.h
> index 06d568382c77..671e5a476eae 100644
> --- a/include/dt-bindings/clock/aspeed-clock.h
> +++ b/include/dt-bindings/clock/aspeed-clock.h
> @@ -53,5 +53,6 @@
>  #define ASPEED_RESET_AHB		8
>  #define ASPEED_RESET_CRT1		9
>  #define ASPEED_RESET_HACE		10
> +#define ASPEED_RESET_VIDEO		11
> =20
>  #endif
> --=20
> 2.25.1
>=20

--0l94K67tftqusJJV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaOA2uwAKCRB4tDGHoIJi
0kHxAP9tfxXaNJcuCWViceFs1gRlxpPvViWfAlgUUO4nMPglFQD/Y2wX2hhSzCcW
lX1Osw6hWMgsEj7CQ1ilQ4aTXa/d5QU=
=B5UU
-----END PGP SIGNATURE-----

--0l94K67tftqusJJV--

