Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55EDCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 18:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a3c8V1hXrVnnDWPg12yqNE/isCFFOAhndMURyTvIpzI=; b=jSy6TMlHOaqq8UwLVtprWU/tVc
	uZlPWPUTXPy/HN90NqJ0N3MtcmWE1XGGi0GxULr+8vCkMoWTYgpMR/eobHT5+rC3DXvbtq+boez55
	tn2oupiNSdHRsW/Sf+qbo3qy9sIGKFM921yYLwu6slKduAhax5t34Vxd8ZcVK7Djz0Clo0SUesMEg
	qHpFvRK8hWis9Q+2WPAX85QSi+ptQl6m9j60+mGbreqT3jIMLKxax3/HSBE9Ry7R2QqwaTmTNEQul
	fQGrfm1ZU8H3UMoFAJMtPJEftNnquaCJIGJARVCC5vX4JqY2JiE+q9yVgzy3+apK/199zbmZAK3e2
	WbqLR7vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4OJV-0000000B3mn-3mkI;
	Thu, 02 Oct 2025 18:46:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4OJT-0000000B3lk-1W7M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 18:46:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BE79D44CD3;
	Thu,  2 Oct 2025 18:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27DF9C4CEF4;
	Thu,  2 Oct 2025 18:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759430758;
	bh=fTeswSATcB2l4kKFC+T/Jf728hFziZCZ/toefctXIrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iQhyisly4HVJjxG8UgkQns4wkNuHmaejeAERzdvdF1DOHjL+v6Bijl7RGahduUQX5
	 JryMYDLDa2za9Rm7NFm6dfYQHXByP2D0h1nFvvE9WTo/ylGOFSsUjXc2gLBZh2Uzsi
	 sOxvOaWgZfi78sMocLj7MC6NnndZTXtnjiv1Xhh0PLMCAswpJhAXjB6ITNlkE7Mphr
	 BJBpw0B+GERHJ99qcq6CblICTnd2PEShT0lrY23J0WX/rClzikI8YutFJ4Pg0m0Wyi
	 foVB+OzHWCWkoKDHaQIMQfQ2y11tjyk9sOrUh2+6ZXJH9fpu8hpnPEQZihVn0ou21l
	 zvYQquUQcBCzA==
Date: Thu, 2 Oct 2025 19:45:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
	andrew@codeconstruct.com.au, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: clock: Add AST2500/AST2600 VIDEO reset
 definition
Message-ID: <20251002-accuracy-gloomily-a3e46d5a3f02@spud>
References: <20251002095651.2211900-1-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eQ5hYxmKmELL5wam"
Content-Disposition: inline
In-Reply-To: <20251002095651.2211900-1-jammy_huang@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_114559_418011_3A7F256D 
X-CRM114-Status: GOOD (  13.51  )
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


--eQ5hYxmKmELL5wam
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 02, 2025 at 05:56:51PM +0800, Jammy Huang wrote:
> Add VIDEO reset bit definition for AST2500/AST2600.
>=20
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>  include/dt-bindings/clock/aspeed-clock.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/dt-bindings/clock/aspeed-clock.h b/include/dt-bindin=
gs/clock/aspeed-clock.h
> index 06d568382c77..421ca577c1b2 100644
> --- a/include/dt-bindings/clock/aspeed-clock.h
> +++ b/include/dt-bindings/clock/aspeed-clock.h
> @@ -53,5 +53,6 @@
>  #define ASPEED_RESET_AHB		8
>  #define ASPEED_RESET_CRT1		9
>  #define ASPEED_RESET_HACE		10
> +#define ASPEED_RESET_VIDEO		21

What's up with the gap here? Are there another 10 resets missing?

--eQ5hYxmKmELL5wam
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaN7IYQAKCRB4tDGHoIJi
0jpPAPoD3Ml/y5Zj0L/EgesLMAZ+GyKvd9Lokp4c6QrcNGpuVwD+JY5XO5FYrPik
Fl5hcgGgK1Zfdf1qYGlZVllML/j07Q8=
=ne6M
-----END PGP SIGNATURE-----

--eQ5hYxmKmELL5wam--

