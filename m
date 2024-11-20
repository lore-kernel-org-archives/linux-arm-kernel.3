Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6B8D743E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 22:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DVr8ID2gdqtcy+z0V/qbfErj0C7+T6izpxPfPyh5PFY=; b=FpMHvCemU+eeR10pQCzbqg6OaQ
	6cKgQZhCWSkuFFoKKt+EnzNu5ThFo1A82rb9cZklBAJ1D6bXroVd5eU9jQBsMwGAPfO48LlbZ+WYw
	l5a/k963laNXMeuJD3EgYi1HuflOBH2q0K68hdh57jUm3bWS+59ZKEfA5YDhggXO60bSsJRuUhLRC
	L0roxdOffZjCCpsJdd2O1phHoB5yFIgFAYSTyvD2FuuBsCUZsp3ZRYrrTebP20i1P34kCY1f/2Lqr
	FP3KUOz66DuO2z1FgmPDgXwgL+h9ZbiQW6DYhMYOyff6TAnbadWMoYml/0PthUWy173EtDS7hSoHD
	df3JmIpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDsof-0000000GJkv-2GDx;
	Wed, 20 Nov 2024 22:04:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDsnj-0000000GJiL-0AeH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 22:03:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 16165A4340F;
	Wed, 20 Nov 2024 22:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77844C4CECD;
	Wed, 20 Nov 2024 22:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732140233;
	bh=DSdUX9EORg9aeW0O99F832Xf3e4PIsf8UeoN8YOJeXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nA62W2hkW3OBbLCKQH8pXTrIPp7xLX0CZJY5vDAvPhBwLpPzvPlJ2kUxWmYu39VKG
	 bXL21YHJVqk0RB+TCbzBL9ogC5LI92fovZHVte+cTIKd/oBvpgU2i64QHfsSeDjAMr
	 2SuTi+FYhbGpfATj49YdPNiTTGcnfSOgcKPDy4l7aMzLPiKQ1ELNIichpoyci4zlMj
	 oBUzauu7o/MgmrsT1PZWLvRHvBiT9V8jc+AMoiotLrWMaQaubg/rO0mQPZJbdOcgm3
	 0v9sfw2G2gSusv5SntcAUCSEkaZ0uk8n4+R9fokeX+iyInNmOog+msO8TLRa48heSw
	 xCdPQXLQkZHYg==
Date: Wed, 20 Nov 2024 23:03:49 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Trevor Gamblin <tgamblin@baylibre.com>, 
	Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	ychuang3@nuvoton.com, schung@nuvoton.com, cwweng@nuvoton.com
Subject: Re: [PATCH RESEND v2 2/2] pwm: Add Nuvoton MA35D1 PWM controller
 support
Message-ID: <fllw3dv6juj2vepsnrb4lajh2j7b42jl6rzncmvt57gfaalgiv@sypw55h54oag>
References: <20241024104309.169510-1-cwweng.linux@gmail.com>
 <20241024104309.169510-3-cwweng.linux@gmail.com>
 <5a6ad0dc-f777-4129-962f-e10a0f7d6ee1@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p4knel4pwzvp7g3m"
Content-Disposition: inline
In-Reply-To: <5a6ad0dc-f777-4129-962f-e10a0f7d6ee1@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_140355_147279_546AFD81 
X-CRM114-Status: GOOD (  13.52  )
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


--p4knel4pwzvp7g3m
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RESEND v2 2/2] pwm: Add Nuvoton MA35D1 PWM controller
 support
MIME-Version: 1.0

hello,

On Wed, Nov 20, 2024 at 11:49:48AM -0500, Trevor Gamblin wrote:
> On 2024-10-24 06:43, Chi-Wen Weng wrote:
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pwm.h>
> > +#include <linux/io.h>
> > +#include <linux/clk.h>
> > +#include <linux/math64.h>
> These should be organized alphabetically.
> > +
> > +/* The following are registers for PWM controller */
> > +#define REG_PWM_CTL0            (0x00)
> > +#define REG_PWM_CNTEN           (0x20)
> > +#define REG_PWM_PERIOD0         (0x30)
> > +#define REG_PWM_CMPDAT0         (0x50)
> > +#define REG_PWM_WGCTL0          (0xB0)
> > +#define REG_PWM_POLCTL          (0xD4)
> > +#define REG_PWM_POEN            (0xD8)
>=20
> These too, I think - it will make it more readable for others.

Keeping the registers in address order is the usual thing to do, so
please keep the order of these.

Otherwise I agree to Trevor's comments. Thanks for taking the time to
look at this patch.

Best regards
Uwe

--p4knel4pwzvp7g3m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmc+XMMACgkQj4D7WH0S
/k7IhAf/bg94AU7SgCoY0jUgTHhpOnTtuYX7RFUtU5+7GSv/aIpG50Lf93bcVjGC
CnmWIYI35Yl3Uqdr2zlpaxPsTJ8JrOtBpxpbhITrdYJKtJ2fWn08X6DIdcXnAwFw
qnJER3Ys5dNus+jacOcQqmAM91o+Xa8Gu+BQ37OAe5o7iPr5eBPFcVcIR/0bMmbO
S5e7pZ9FDagQXUX4JQ2IcWPDUW3/p0PNHhUC30V3AdkKv4OJrZd661iLTKe+ianl
fayeMW1fwIzQQ2Ikxi7R/INg6naPnc4vfU3X3t2YLgYhsHKHe4Jg3X5Knp251b0F
D7FcFyuB6hyhr4LDeYKtt3L0h2n0/A==
=FNhz
-----END PGP SIGNATURE-----

--p4knel4pwzvp7g3m--

