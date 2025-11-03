Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D54DCCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 13:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IeVEBDf5PtlARC07HnOuvbxzKbLmMeY3jMRp7yx4h7M=; b=xqJnAyQp2OX3hcwpJBXMhx5h85
	GViLA0l1CRk8q/86R2n0/ckAvD2Zjf8qunoJY09MseNrooQ8t/RsOD3wgbxmYmX+91CbX2bbioRrB
	2QEYG2B5S4UkDHxXViMcBZlyFxNYxgLv5E229ckz93H8eI7u81TKPvucLCqwP6CJawMdsA6A7a68y
	Ba+Kk0OOJoh7ppa4SYUy/DlTeNmbVymReMY6uq66OkDV8phwVzYxMZ1fbyLk6BXzNYCiL1tMs6YIa
	E3iB5l6X3tbkOc2E6yeOedUV3tA36fvly8Lo9/mk/h3K1w4RTe4KyBv7sjtBnhnr+3MYyr43oDnBl
	APHNpChw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFuW9-00000009t96-3JAB;
	Mon, 03 Nov 2025 13:22:41 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFuW7-00000009t8M-1Hmu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 13:22:40 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CF32A1C6;
	Mon,  3 Nov 2025 14:20:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762176043;
	bh=KTavCG9dcnWlWcBPGQuxuWsWD5GhGldfM+WDzWPZ6GI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=iv063utxxGJrjSsQdhzhMkYbb4c7mqvhCvHFYX5mFqB163XF/lIg27csr2uOGGwZh
	 xQvfOu8pl5k5R14V96mdxS784NcgMEbKVC4GSiEMlkIwv8h7hUYCi/XCVDYNMuNcmG
	 jK2IGrdMjLpzDeDAcmrgh8rXHpxLmouFCW01bu4s=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e3b8e670-313d-44b0-b026-f92252d71662@amd.com>
References: <20251031-b4-vc-sm-cma-v1-0-0dd5c0ec3f5c@ideasonboard.com> <20251031-b4-vc-sm-cma-v1-1-0dd5c0ec3f5c@ideasonboard.com> <e3b8e670-313d-44b0-b026-f92252d71662@amd.com>
Subject: Re: [PATCH 01/13] platform/raspberrypi: vchiq-mmal: Avoid use of bool in structures
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Sumit Semwal <sumit.semwal@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.org>
To: Christian =?utf-8?q?K=C3=B6nig?= <christian.koenig@amd.com>, Krzysztof Kozlowski <krzk@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, bcm-kernel-feedback-list@broadcom.com
Date: Mon, 03 Nov 2025 18:52:30 +0530
Message-ID: <176217615029.8690.11618877016123000092@freya>
User-Agent: alot/0.12.dev28+gd2c823fe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_052239_481474_23BABFC5 
X-CRM114-Status: GOOD (  15.89  )
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

Hi Christian, Krzyztof,

Quoting Christian K=C3=B6nig (2025-11-03 16:39:15)
> On 10/31/25 18:27, Jai Luthra wrote:
> > From: Dave Stevenson <dave.stevenson@raspberrypi.org>
> >=20
> > Fixes up a checkpatch error "Avoid using bool structure members
> > because of possible alignment issues".
>=20
> Mhm, at least of hand that doesn't looks correct to me.
>=20
> What exactly is the checkpatch.pl error or warning message you get?

My bad, commit 640e77466e69 ("staging: mmal-vchiq: Avoid use of bool in
structures") that had switched vchiq_mmal_component.enabled from a bool to
1-bit bitfield has already been reverted in mainline.. this stray change
seems to have persisted in RPi's downstream kernel.

I'll drop this and other irrelevant changes in the next revision of this
series.

>=20
> Regards,
> Christian.
>=20
> >=20
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> >  drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c b/dri=
vers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
> > index cd073ed3ea2dd9c45b137f1a32e236e520b7b320..82c2c261fd9cf0669cbd2ca=
7c814e0703317885a 100644
> > --- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
> > +++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
> > @@ -1776,7 +1776,7 @@ int vchiq_mmal_component_enable(struct vchiq_mmal=
_instance *instance,
> > =20
> >       ret =3D enable_component(instance, component);
> >       if (ret =3D=3D 0)
> > -             component->enabled =3D true;
> > +             component->enabled =3D 1;
> > =20
> >       mutex_unlock(&instance->vchiq_mutex);
> > =20
> >=20
>=20

Thanks,
Jai

