Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02821CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 05:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Nlwi2eZDlx2CzWrCa0RcsbTlZcp2iV5EDjcy7s8HS8=; b=AuZnOKddVudTTaBtsdNNuTlfvs
	00pI3QWXNzPPqhhxJIfyQAhysEoQ/R92/zjDj3IiNkhnckWo5ZqO8R5JXLVzK72fWOTYKF3VeCi2M
	ddO46gxYhvaC137SCqh7ZhR8AWggToqMYYHK1OlqEz812lsgxNbD7ATLkxa4RA9RjKecwaO6sYRwf
	OPKBLLP8DkhiAQ7rDVmnQih9eTf5m88Ti9TeJUUSx30IMksWEZUF9GEdFycxr65Hb8XDV49zm9GFl
	vnbHPRLFdhBTXS/dOeB/o6+Ob0iPQOPE5UzepnvVlaPrp/8MxbbwrEVovUHRMsvONeku7pApCygW0
	xFZNVSOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV0b8-0000000GAkg-0a5Q;
	Thu, 04 Jun 2026 05:26:30 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV0b5-0000000GAkF-0997
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 05:26:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=2Nlwi2eZDlx2CzWrCa0RcsbTlZcp2iV5EDjcy7s8HS8=; b=D/9t6xsmn+1flxryO7xDR4/1Al
	OqDYmDeGV9lzlJ2X2DqOSdI2lS0mT3qQPf06+bLfDKdmGk0KCd01DF48TPKnC2N5qzkv7UxVHGYrm
	TeiwfezvFEK5GNee5AYmIxMhRkYOJwOluNM6RThP4QdvYOJWUqPAUw7/Z8czNX3RxkuG0CCnG8gg7
	Gr0pOl0I6VmNfSKTkS5qgSkRA+Wzkx13K19qin5IQTX7U72W7R9rGBxF5qmGynv90TNtVuGxG60er
	2+rRLrMbiBJRE1U5e5kmIBURnWjjwQnHvMdBK+usaQ4j227IaYG9FYn6Tai60jSv8iWedX3HRrzq3
	SQrPDwZw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wV0ay-000BQP-2Q;
	Thu, 04 Jun 2026 07:26:20 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wV0az-000BR6-05;
	Thu, 04 Jun 2026 07:26:20 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Russell King <linux@armlinux.org.uk>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Marco Felsch <m.felsch@pengutronix.de>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@baylibre.com>,
 Ryan Eatmon <reatmon@ti.com>, kernel@pengutronix.de,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] arm: gen-mach-types: don't include absolute filename
Date: Thu, 04 Jun 2026 07:26:19 +0200
Message-ID: <11950983.nUPlyArG6x@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260603-arm-remove-path-from-mach-types-h-v1-1-cda9890ba788@pengutronix.de>
References: <20260603-arm-remove-path-from-mach-types-h-v1-1-cda9890ba788@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28020/Wed Jun  3 18:10:41 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_222627_186889_3A08AC11 
X-CRM114-Status: GOOD (  21.27  )
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

Hi Sascha,

thanks for bringing this up (again).

Am Mittwoch, 3. Juni 2026, 16:12:10 CEST schrieb Sascha Hauer:
> mach-types.h is part of the kapi and as such shipped in the
> linux-headers package. The embedded build path makes that package
> non-reproducible without going through an extra step of normalizing the
> path. YOCTO has similar problems in the kernel debug source package.
>=20
> Make the path relative to the kernel source tree which is enough to
> find the tool that has generated the file.
>=20
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
> This topic comes up every once in a while, without any clear objection
> other than "Or just leave it as is. It's in a comment, it doesn't get
> into the executable, and thus is harmless.", from which I am not sure if
> it actually is an objection. Cced the authors of the previous patches
> that I am aware of:
>=20
> https://lore.kernel.org/all/20241114130021.2802803-1-m.felsch@pengutronix=
=2Ede/
> https://lore.kernel.org/all/13360982.O9o76ZdvQC@steina-w/
> https://lore.kernel.org/all/20240213092835.754462-2-u.kleine-koenig@pengu=
tronix.de/
> https://lore.kernel.org/all/20241002175049.15219-1-reatmon@ti.com/

This is much simpler as it hard-codes the file name. I don't have a prefere=
nce
on that, so
Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Thanks
Alexander

> ---
>  arch/arm/tools/gen-mach-types | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/tools/gen-mach-types b/arch/arm/tools/gen-mach-types
> index cbe1c33bb8710..65ec262b31e65 100644
> --- a/arch/arm/tools/gen-mach-types
> +++ b/arch/arm/tools/gen-mach-types
> @@ -24,7 +24,7 @@ NF =3D=3D 3 {
> =20
>  END	{
>  	  printf("/*\n");
> -	  printf(" * This was automagically generated from %s!\n", FILENAME);
> +	  printf(" * This was automagically generated from arch/arm/tools/gen-m=
ach-types!\n");
>  	  printf(" * Do NOT edit\n");
>  	  printf(" */\n\n");
>  	  printf("#ifndef __ASM_ARM_MACH_TYPE_H\n");
>=20
> ---
> base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
> change-id: 20260603-arm-remove-path-from-mach-types-h-a6f528d60e00
>=20
> Best regards,
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



