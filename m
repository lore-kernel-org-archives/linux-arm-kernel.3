Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CB7CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 14:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O1Z//l6k04timT7dfj9ZuAGoUYvysYRtMJVgtc7DCqw=; b=Vq4w30UeD2k/2JzIxu5Lj8RN9W
	yXGZdK0Gy9p+m7vehErj6tB7ZeQA9xA+ZxsqWUpZIN48wcJSqS3KlGInea8Qa37/br5gqO4a+WpP6
	4dLEcwYPO/twj+BjoekcxZXvrArPSxh3VzNnir5Y2jJBGaiNb4W1TvFzb/wcoNdYf2BP8FxaBDc/R
	v4t7lv3M5mPMLSsAa8O+A1h799eIjUqcFqlT88xU2ayiPAwGRNtEOLHpnWo9OwCZgNFYUxmobn6mJ
	uJDUjR+Vyk5GskEcaXJ7xZfFdjPjvvya50vTBVcHcnvR0DJZFeqQspL8bAADLhcRsjYzk0mF6MdQE
	pSKiLmww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvDd-00000009zkI-2LsG;
	Mon, 03 Nov 2025 14:07:37 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvDb-00000009zj8-1Rud
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 14:07:36 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6B42DC73;
	Mon,  3 Nov 2025 15:05:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762178740;
	bh=zGZUkrSKKsYnAxn5dIDSUtNe4q/9E6c28nR/r2Tsowo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=AuK7I6pWGaQTcsoFp69tDNHBbEj6eEHMi//NqCquqi+ICFsjc0G0FMvMJHmsiWk0M
	 lJkDKJetTmJwKgb5rgySv5rs4NnNzjGeaiWzAn7YtIEYnRQ/u7Ok5D7994y/bKqA9A
	 8Y0HomuTBTNvsGfaU0nOWtwq8AysRNsS0/JY5Qgs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <176217826196.8690.15955501577381404885@freya>
References: <20251031-b4-vc-sm-cma-v1-0-0dd5c0ec3f5c@ideasonboard.com> <20251031-b4-vc-sm-cma-v1-13-0dd5c0ec3f5c@ideasonboard.com> <d0517fad-9253-4c39-a063-a2c09e74237f@kernel.org> <176217826196.8690.15955501577381404885@freya>
Subject: Re: [PATCH 13/13] platform/raspberrypi: vchiq: Register vc-sm-cma as a platform driver
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Sumit Semwal <sumit.semwal@linaro.org>, Christian =?utf-8?q?K=C3=B6nig?= <christian.koenig@amd.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, bcm-kernel-feedback-list@broadcom.com
Date: Mon, 03 Nov 2025 19:37:28 +0530
Message-ID: <176217884879.8690.13419980100895110857@freya>
User-Agent: alot/0.12.dev28+gd2c823fe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_060735_522537_4EB69C1F 
X-CRM114-Status: GOOD (  19.97  )
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

Quoting Jai Luthra (2025-11-03 19:27:41)
> Quoting Krzysztof Kozlowski (2025-11-02 15:03:55)
> > On 31/10/2025 18:27, Jai Luthra wrote:
> > > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >=20
> > > Register the vc-sm-cma driver as a platform driver under vchiq.
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > > ---
> > >  drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >=20
> > > diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c=
 b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
> > > index 6a7b96d3dae6275a483ef15dc619c5510454765e..09d33bec46ec45175378f=
ff8dd1084d0a8a12dd6 100644
> > > --- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
> > > +++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
> > > @@ -63,6 +63,7 @@
> > >   * the interface.
> > >   */
> > >  static struct vchiq_device *bcm2835_audio;
> > > +static struct vchiq_device *vcsm_cma;
> >=20
> > Please don't write singletons. How do you handle probe of two devices?
>=20
> This driver instantiates all the devices under the vchiq bus during its
> probe.
>=20
> The VCHIQ firmware doesn't support device enumeration, hence we have to
> list out the supported devices here.

And as Laurent just pointed out to me, yes these shouldn't be globally
defined singletons.

I'll move them inside struct vchiq_drv_mgmt in v2.

>=20
> >=20
> > > =20
> > >  static const struct vchiq_platform_info bcm2835_info =3D {
> > >       .cache_line_size =3D 32,
> > > @@ -1421,6 +1422,7 @@ static int vchiq_probe(struct platform_device *=
pdev)
> >=20
> >=20
> > Best regards,
> > Krzysztof
>=20
> Thanks,
> Jai

