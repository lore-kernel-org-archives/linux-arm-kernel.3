Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F71CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 09:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3oDt2jJ5eroinSzBE7a0pKxeDHDoisvS+4wtDl2R4A=; b=aRg4Q6Klhi+tcS6vnXv/VfkCR6
	6OwVaXa7FC54RQ2WOXOqDzJALZFYXwFoysaLCvWWSz8ABxdX5Hi9DyQLreHHsMOi+SS9G50vpqznQ
	khMXPbnglokILI5Ym+au33jvRve2A3ChOnZjoHZfNYTwUCGUJI4ygDVNKPdm/qAUNAxaBQTgSzu25
	r7Fy+8QGCAvytxNyrmK0TdCz7eSopEF2nb0f+O5eIYpndHfmt9b0bp7WD3oEtnQy1k4GnhrQoq61w
	RKVWHJ7NvMa05f2vs5VgcmMDqYqSRHNv1FRIrO/fHrjJwtf0knay9ZeZijCIdgUSWNh8pXVC1/Osc
	1VTMXPQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXhu-00000002RFW-0sBU;
	Fri, 19 Sep 2025 09:47:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXht-00000002RFK-0IrE
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 19 Sep 2025 09:47:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=i3oDt2jJ5eroinSzBE7a0pKxeDHDoisvS+4wtDl2R4A=; b=AkCV+g7L03YBnoU3V4fJVf6oZK
	iuTqEdl+k6vzHcO4pmpaM9LAcFNTzAyBSwIHUyVAEiLVCApnrRuLU0X1KDEtEwi+SGe1BzDZ804HT
	7IDDtshFH6R4Hx0gC8lVuXIB9N3XlYV5EjclFsbw9IeeSclX43Ig5E2tfhMM0mL4tmGYjIRMgtLWA
	peGbw93u2aY1AANVwW/3JmjOLqHlKvsIWNuxZmNAuaj3PlCflX6C8WNRa1psyt3bQUeO5dxOEoqBa
	J+bjEQOlCzI9xFpiGEwKT2drw208/XMCqOy+S+YquGcgdPGqyWU7cKOAqwpkVrWcpWfejghPar1+9
	tgzZyJ2g==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXhq-00000007opj-0kes
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 09:47:07 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1uzXhn-0004Ap-6o; Fri, 19 Sep 2025 11:47:03 +0200
Message-ID: <1159aa58f8a0ab69f9327a98ae3fbb973f6ee36d.camel@pengutronix.de>
Subject: Re: [PATCH] arm: gen-mach-types: don't include absolute filename
From: Lucas Stach <l.stach@pengutronix.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, 
	linux-kernel@vger.kernel.org, Marco Felsch <m.felsch@pengutronix.de>
Date: Fri, 19 Sep 2025 11:46:59 +0200
In-Reply-To: <20241114130021.2802803-1-m.felsch@pengutronix.de>
References: <20241114130021.2802803-1-m.felsch@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_104706_318913_B2449564 
X-CRM114-Status: GOOD (  20.01  )
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

Hi Russell,

can I ask you to kindly reconsider this patch? The generated header
ends up in various packages, not just in compiled form where the
comment wouldn't matter, but also in its raw source code form.

For embedded build systems this mostly affects the debug packages that
carry the full source code. More general purpose distributions like
debian ship this file in the linux-headers package as it's part of the
kapi and they want to allow out-of-tree module builds with the header
package. All those distributions have to jump through various hoops to
make those header packages reproducible, while this patch would be an
easy fix from the kernel side.

I don't think the input file name carries any real value for any of the
users of this header. Especially now where mach-types is essentially
static, with no substantial changes in the last 8 years.

Best regards,
Lucas

Am Donnerstag, dem 14.11.2024 um 14:00 +0100 schrieb Marco Felsch:
> Don't include the abosulte filename into the generated mach-types.h
> header and instead make use of arm64 note. The motivation for this
> change is Yocto emitting a build warning:
>=20
> > File /usr/src/debug/linux-raspberrypi/6.11.7/arch/arm/include/generated=
/asm/mach-types.h in package linux-raspberrypi-src contains reference to TM=
PDIR [buildpaths]
>=20
> So this change brings us one step closer to make the build result
> reproducible independent of the build path.
>=20
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  arch/arm/tools/gen-mach-types | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/tools/gen-mach-types b/arch/arm/tools/gen-mach-type=
s
> index cbe1c33bb871..fdc4805b9d98 100644
> --- a/arch/arm/tools/gen-mach-types
> +++ b/arch/arm/tools/gen-mach-types
> @@ -24,8 +24,7 @@ NF =3D=3D 3 {
> =20
>  END	{
>  	  printf("/*\n");
> -	  printf(" * This was automagically generated from %s!\n", FILENAME);
> -	  printf(" * Do NOT edit\n");
> +	  printf(" * Generated file - do not edit\n");
>  	  printf(" */\n\n");
>  	  printf("#ifndef __ASM_ARM_MACH_TYPE_H\n");
>  	  printf("#define __ASM_ARM_MACH_TYPE_H\n\n");


