Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250ABC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 13:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJP+7s3TYS3fSnF/ipyLW6m0of0pPBM8FR64yTjJBGk=; b=IFd2tBbV/ALfCBOyAcq1SETHPq
	B4iPPRBz1r+EzouoD78fq5m1rSyRuI5MyEJrXhLhgwB3sXNfr2kMU1jvar5i4Jle2I1wL68I17S+x
	kZ+KUHHBmu5jZp1wcT6zB+DknBgNcLn634FhMtxd+V+7l4XE8Z9L3DPrvRjwRKlBz+Gq3471H2Z8Y
	pj+2Isqb8Qd7akaxFSUefqx2mFDXJbvL2E899aUdrZDf6ftfF7tQe/WtTUuTjmPe8jmOKDmO1SLsW
	KEE1rXjm3Rbnhi3o8L+yNlOdCxsyrV8CUrBi9fO6X/RJGc7rETrU4KtT58OgJHTIbG7EJtDGRK1Bo
	j2fhrulQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzweQ-00000005pDw-0Ic1;
	Fri, 28 Aug 2026 13:29:46 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzweM-00000005pCw-3G0B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 13:29:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 61A724E413FF;
	Fri, 28 Aug 2026 13:29:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3562A60537;
	Fri, 28 Aug 2026 13:29:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B338511C7815E;
	Fri, 28 Aug 2026 15:29:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787923774; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AJP+7s3TYS3fSnF/ipyLW6m0of0pPBM8FR64yTjJBGk=;
	b=iUn2+/nU8wGnG0Y6DQH9r0UTUumsjQEeVCFOslnGK7quLEbhyKKPKiz9VK4V3plMoxYwTN
	sWuycXZrkz7wG8Vw5sxUg4Sy1VxJdfrqCrRhY0tsqGbjHnKYXtv5hlVPcdl3LnkK6qURMl
	/SY5PDhY+6YI3aNLtN/sQ2PUTLpZJMZ0CSkVSeSlzN4HXg0gBySCucZaYMAr759eyspLGs
	SfSbjinimTjkXxslNzfbVU+P/PrHUQPwNajRXhaBS7gxlVin1j+jp85jS+3nszzBoXzkGl
	B1PoPcCInTXs/bz2xoEyrUxzmcqpYGUeDPiA+HN1AiUzBIRJwOaWNW+fuyHr7w==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Grzegorz Jaszczyk <jaz@semihalf.com>, "moderated
 list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..."
 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: armada-395-gp: drop unsupported SDHCI
 clock-frequency
In-Reply-To: <20260824000356.79844-1-rosenp@gmail.com>
References: <20260824000356.79844-1-rosenp@gmail.com>
Date: Fri, 28 Aug 2026 15:29:32 +0200
Message-ID: <87pkz2pe4j.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_062942_953872_80FE20B8 
X-CRM114-Status: GOOD (  13.50  )
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

Rosen Penev <rosenp@gmail.com> writes:

> The SDHCI node carries a "clock-frequency" property, but the
> marvell,armada-380-sdhci binding does not define it and dtbs_check
> rejects the node as a result. No driver consumes it either: only a
> few other sdhci-pltfm based drivers (imx, mcf, iproc, arasan,
> dwcmshc, xenon) read that property, while sdhci-pxav3 derives the
> maximum clock from the io clock rate.
>
> Remove the property.
>
> Fixes: 356645123581 ("ARM: dts: mvebu: armada-395-gp: add support for the=
 Armada 395 GP Board")
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied on mvebu/dt

Thanks,

Gregory
> ---
>  arch/arm/boot/dts/marvell/armada-395-gp.dts | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-395-gp.dts b/arch/arm/boot/=
dts/marvell/armada-395-gp.dts
> index b854b73a64b4..fafa204387fd 100644
> --- a/arch/arm/boot/dts/marvell/armada-395-gp.dts
> +++ b/arch/arm/boot/dts/marvell/armada-395-gp.dts
> @@ -59,7 +59,6 @@ sata@a8000 {
>=20=20
>  			/* CON18 */
>  			mmc@d8000 {
> -				clock-frequency =3D <200000000>;
>  				broken-cd;
>  				wp-inverted;
>  				bus-width =3D <8>;
> --=20
> 2.55.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

