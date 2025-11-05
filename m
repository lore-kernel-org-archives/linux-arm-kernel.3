Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1B8CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 06:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AlUFFi5rfJVf2y32pRIQ+FZuh2lcRqrpHCjJPK/PxcM=; b=ymBn2H4791X7Vq6WkW+hiN93wC
	KfgDObfdvSKE/PKlNXHgGw0n31c0pXSPko33a+7AvCHBWR9O/qVP9yEtsf6nUg4JMvwwno1Dh+/7V
	gtxWuTEp6k5DgZurCSiC/HQjYNYn6ts+XpKGzbHbhZ4nL9nzCfVFOiT7udLGpMcXwupJkvALd3fAu
	Gy8AMja/sY/JicOhyegCQBbDFl9UycYE3AVR71waYeZfoHYVsh56qJaU15WmTJHSAClg3OlDpUf8i
	YwtI3rQKo0RBZ6WQpfGbtBSzBFshNTSbVHFcH7RhvAHeozUXRssjQnlzxGNda0UsUevIuAcv6SueO
	naQiYfgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGXMn-0000000D61i-1gYA;
	Wed, 05 Nov 2025 06:51:37 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGXMk-0000000D61G-1Bkj;
	Wed, 05 Nov 2025 06:51:35 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:1e6b:c21c:d386:b74e:e876])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 53DE3446;
	Wed,  5 Nov 2025 07:49:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762325374;
	bh=28fwD/DeHigm3/oxHExJ1zgx8z4FLlzDSl8G0AySjY8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=g3IvUDxEb1PbSXQm9Kgk3dE8t7oCPugrK4wVg5SS6cq3hvKwwKBC38U4eBt9Fudyk
	 7QAfPQLJhV0UOKe31uBeAA9TYfbqnPavatyZ+hX2p+zHde9qD9R/8q6zCK45+BnFCp
	 eOx5AB2sJHzV8t0yb1haLYa5Hr+4HW5V9iRfHXMc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3e538ec1-37f6-416c-bc04-6f21a4d31748@broadcom.com>
References: <20251028-rpi-isp-clk-v1-1-2a54fecb495c@ideasonboard.com> <3e538ec1-37f6-416c-bc04-6f21a4d31748@broadcom.com>
Subject: Re: [PATCH] clk: bcm: rpi: Mark ISP clock as critical
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Michael Turquette <mturquette@baylibre.com>, Stefan Wahren <wahrenst@gmx.net>, Stephen Boyd <sboyd@kernel.org>
Date: Wed, 05 Nov 2025 12:21:23 +0530
Message-ID: <176232548379.1167490.1126479868042439951@freya>
User-Agent: alot/0.12.dev28+gd2c823fe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_225134_471167_56115F56 
X-CRM114-Status: GOOD (  18.96  )
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

Hi Florian,

Quoting Florian Fainelli (2025-11-05 03:50:23)
> On 10/28/25 04:46, Jai Luthra wrote:
> > The ISP clock should also be marked critical to prevent the clock
> > framework from disabling it on boot, which can lead to bus lockups when
> > the kernel tries to submit buffers to the VC4 ISP firmware.
>=20
> The commit message suggests that the driver that interfaces with the VC4 =

> ISP firmware is not ensuring that the clock remains enabled for the=20
> duration of the transactions. That would be a driver bug, would not it?
>=20

Yes, from https://github.com/raspberrypi/linux/issues/7100#issuecomment-346=
7699055
the VC4 firmware should be responsible for stopping and starting that clock
when necessary.

The downstream bcm2835-isp linux driver currently does not consume this
clock at all, so I'm not sure if the cleaner solution is to drop this
altogether from linux, or mark it as a consumer, along with fixing the
firmware driver.

> >=20
> > Link: https://github.com/raspberrypi/linux/issues/7100
> > Fixes: 919d6924ae9b ("clk: bcm: rpi: Turn firmware clock on/off when pr=
eparing/unpreparing")
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> >   drivers/clk/bcm/clk-raspberrypi.c | 1 +
> >   1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-ra=
spberrypi.c
> > index 1a9162f0ae31e330c46f6eafdd00350599b0eede..dcc3ae5fb91650b042d52f0=
2499922786b43afde 100644
> > --- a/drivers/clk/bcm/clk-raspberrypi.c
> > +++ b/drivers/clk/bcm/clk-raspberrypi.c
> > @@ -151,6 +151,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] =
=3D {
> >       [RPI_FIRMWARE_ISP_CLK_ID] =3D {
> >               .export =3D true,
> >               .minimize =3D true,
> > +             .flags =3D CLK_IS_CRITICAL,
> >       },
> >       [RPI_FIRMWARE_PIXEL_BVB_CLK_ID] =3D {
> >               .export =3D true,
> >=20
> > ---
> > base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> > change-id: 20251028-rpi-isp-clk-eb5c48346e51
> >=20
> > Best regards,
>=20
>=20
> --=20
> Florian

Thanks,
Jai

