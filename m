Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761E6E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 12:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApXpGdgj+oxW4nSG1nPo6ZKMd3YrnhZWYgtbfO1PoHk=; b=ZyyoTa/81NOjW04FdRktYt9RR0
	gecfVo4su9O2bvHDuWXe7SPuGb/TGrGyMce7vktNMoTRkTEYoghRoulIe6GxNxAXKyByJeMprlqDP
	ZdL+fAD5sgb3YPAr1BXEk/z4TfdR61Ic6YSub6MzB6P6Z983gU1zOGlLWYoH6PAN21FI7wQYru5sp
	KnYeheYRk9KDQ+GI+ISPiXChEGOMoDiqVtFj+IkBbfdpfY7SABfrj/bTYFchEjJMp0+MPGAs1MhQ6
	4i2bO4nv9zm7gBoxeWlXGrr6WQdxRHOnFYoHwH03T7DI2WdjoCYY7g4UpkKsFv0d3aH0dTNW1eGBY
	8lLSa8Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNswt-0000000GZ3P-0JZV;
	Wed, 18 Dec 2024 12:14:43 +0000
Received: from mx1.emlix.com ([178.63.209.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsvm-0000000GYwB-3qZy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 12:13:36 +0000
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 4E4775F880;
	Wed, 18 Dec 2024 13:13:30 +0100 (CET)
From: Rolf Eike Beer <eb@emlix.com>
To: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Yuntao Liu <liuyuntao12@huawei.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm32: simplify ARM_MMU_KEEP usage
Date: Wed, 18 Dec 2024 13:13:24 +0100
Message-ID: <1811814.VLH7GnMWUR@devpool47.emlix.com>
Organization: emlix GmbH
In-Reply-To: <2200295.irdbgypaU6@devpool47.emlix.com>
References: <2200295.irdbgypaU6@devpool47.emlix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart8505703.NyiUUSuA9g";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_041335_098430_B56EAA87 
X-CRM114-Status: GOOD (  18.64  )
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

--nextPart8505703.NyiUUSuA9g
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Rolf Eike Beer <eb@emlix.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm32: simplify ARM_MMU_KEEP usage
Date: Wed, 18 Dec 2024 13:13:24 +0100
Message-ID: <1811814.VLH7GnMWUR@devpool47.emlix.com>
Organization: emlix GmbH
In-Reply-To: <2200295.irdbgypaU6@devpool47.emlix.com>
References: <2200295.irdbgypaU6@devpool47.emlix.com>
MIME-Version: 1.0

On Montag, 7. Oktober 2024 15:11:40 Mitteleurop=C3=A4ische Normalzeit Rolf =
Eike=20
Beer wrote:
> All current users need to add a KEEP() around the argument so the value is
> actually kept, which doesn't feel very natural and is prone to upcoming b=
ugs
> as the name suggests that this macro alone already keeps things. Move that
> directly into the definition.
>=20
> Signed-off-by: Rolf Eike Beer <eb@emlix.com>
> ---

Ping?

> I'm unsure if ARM_MMU_DISCARD() needs the same treatment for the non-MMU
> case. I suspect noone has tried dead code elimination for non-MMU?
>=20
>  arch/arm/include/asm/vmlinux.lds.h | 2 +-
>  arch/arm/kernel/vmlinux-xip.lds.S  | 2 +-
>  arch/arm/kernel/vmlinux.lds.S      | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/arm/include/asm/vmlinux.lds.h
> b/arch/arm/include/asm/vmlinux.lds.h index d60f6e83a9f7..89697f204715
> 100644
> --- a/arch/arm/include/asm/vmlinux.lds.h
> +++ b/arch/arm/include/asm/vmlinux.lds.h
> @@ -19,7 +19,7 @@
>  #endif
>=20
>  #ifdef CONFIG_MMU
> -#define ARM_MMU_KEEP(x)		x
> +#define ARM_MMU_KEEP(x)		KEEP(x)
>  #define ARM_MMU_DISCARD(x)
>  #else
>  #define ARM_MMU_KEEP(x)
> diff --git a/arch/arm/kernel/vmlinux-xip.lds.S
> b/arch/arm/kernel/vmlinux-xip.lds.S index 5eddb75a7174..f2e8d4fac068 1006=
44
> --- a/arch/arm/kernel/vmlinux-xip.lds.S
> +++ b/arch/arm/kernel/vmlinux-xip.lds.S
> @@ -63,7 +63,7 @@ SECTIONS
>  	. =3D ALIGN(4);
>  	__ex_table : AT(ADDR(__ex_table) - LOAD_OFFSET) {
>  		__start___ex_table =3D .;
> -		ARM_MMU_KEEP(KEEP(*(__ex_table)))
> +		ARM_MMU_KEEP(*(__ex_table))
>  		__stop___ex_table =3D .;
>  	}
>=20
> diff --git a/arch/arm/kernel/vmlinux.lds.S b/arch/arm/kernel/vmlinux.lds.S
> index de373c6c2ae8..d592a203f9c6 100644
> --- a/arch/arm/kernel/vmlinux.lds.S
> +++ b/arch/arm/kernel/vmlinux.lds.S
> @@ -74,7 +74,7 @@ SECTIONS
>  	. =3D ALIGN(4);
>  	__ex_table : AT(ADDR(__ex_table) - LOAD_OFFSET) {
>  		__start___ex_table =3D .;
> -		ARM_MMU_KEEP(KEEP(*(__ex_table)))
> +		ARM_MMU_KEEP(*(__ex_table))
>  		__stop___ex_table =3D .;
>  	}


=2D-=20
Rolf Eike Beer

emlix GmbH
Headquarters: Berliner Str. 12, 37073 G=C3=B6ttingen, Germany
Phone +49 (0)551 30664-0, e-mail info@emlix.com
District Court of G=C3=B6ttingen, Registry Number HR B 3160
Managing Directors: Heike Jordan, Dr. Uwe Kracke
VAT ID No. DE 205 198 055
Office Berlin: Panoramastr. 1, 10178 Berlin, Germany
Office Bonn: Bachstr. 6, 53115 Bonn, Germany
http://www.emlix.com

emlix - your embedded Linux partner
--nextPart8505703.NyiUUSuA9g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iLMEAAEIAB0WIQQ/Uctzh31xzAxFCLur5FH7Xu2t/AUCZ2K8ZAAKCRCr5FH7Xu2t
/C2sA/9d/fi2sag/ehnfFHwsc4nyqPB3fPGdD5SR6HRX5f93NDDY3LEaq64kt+bO
SQykRBiWQ/tEaNjKMTrOPDFKfmHNTO2EuTybBOuh87g01+4RLNOHZ2rG8Q2hx+4g
4/iLQNvFE4JjTgjGTUy8QiVCdY5NI6L9c/ffFp+zAmTIq59MNg==
=WNkR
-----END PGP SIGNATURE-----

--nextPart8505703.NyiUUSuA9g--




