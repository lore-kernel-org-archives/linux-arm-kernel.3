Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5778D2F34B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 17:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=utQYdfvBit8CkZVBBXtgEjLEKrIr7+4lx3lVz5YuoSk=; b=dCbPQfl5PHI+YXO5Twxx1Ijzv7
	QP5CJtgZxQszve8mNC6yDFQWSqFowwURpdgKmcQ93L494PiVzjj0MqbBQ3uSodVfS1Tv5O7ckQfa0
	+aNfaA7ElsZKJyNhhGOhsnc4B9lO0Fow9Ie7WrSgUkEV0scAv8YgvrMeq8L0373GQ1vn5rJJKuL2y
	JjvV9nvNMwKILJURJGrJbvImMRM6bZwMvb+jO2ndzCZOVVZeWBPCB34aWb/LKUhzhd4fyxwEMgadl
	ghhikSSAaLQ7F+UOEtcXNpvwpCtUxIOJC3LtI9FmYtP4K6R95MCD2kGR/mxJRnhA4UDiEOXlDuyi+
	SnOhNKsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfiQ2-00000007Xyu-3u58;
	Tue, 13 Jan 2026 17:43:02 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfiQ0-00000007XyV-3Hoz;
	Tue, 13 Jan 2026 17:43:02 +0000
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF346316;
	Tue, 13 Jan 2026 18:42:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768326152;
	bh=wFV93meXFrcLbuXHNLmfKXvFczDRPZgMrWOYRpkc0C0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=hTm0evM5NXFlhnKK0YGe+knYI3LzpybbZlr/N3nTkfxN07YpJVk/Y2a+JTdAqnOGQ
	 aFPvEwbyhMSgwkKTvA6g2u7I1vt6C/lSsBFYvngFSzT7uj68jTkTJMg/AUqRPFZAII
	 ANfOmbaO8X925jp3gjrAwgGcDboGA61k3HvHlLIY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <176832506332.2379386.7591736247076651406@freya>
References: <20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com> <20260113-b4-vchiq-isp-v1-1-ea0b300bffc8@ideasonboard.com> <176832303070.1230693.13311579665048872008@ping.linuxembedded.co.uk> <176832506332.2379386.7591736247076651406@freya>
Subject: Re: [PATCH 01/10] platform/raspberrypi: vchiq-mmal: Move headers to include/linux
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
To: Florian Fainelli <florian.fainelli@broadcom.com>, Jai Luthra <jai.luthra@ideasonboard.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Tomasz Figa <tfiga@chromium.org>
Date: Tue, 13 Jan 2026 17:42:55 +0000
Message-ID: <176832617565.1693075.11795770819049418637@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_094300_967221_9B4803AD 
X-CRM114-Status: GOOD (  25.13  )
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

Quoting Jai Luthra (2026-01-13 17:24:23)
> Hi Kieran,
>=20
> Quoting Kieran Bingham (2026-01-13 22:20:30)
> > Quoting Jai Luthra (2026-01-13 09:05:21)
> > > Now that VCHIQ interface is destaged, different drivers (like ISP or
> > > codec) no longer live under the same tree as VCHIQ MMAL, but in their
> > > relevant trees like media or audio.
> > >=20
> > > Enable access to VCHIQ headers for such drivers by moving these heade=
rs
> > > under include/linux/raspberrypi with other VCHIQ related headers.
> > >=20
> > > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > > ---
> > >  MAINTAINERS                                                      | 1=
 +
> > >  drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c             | 9=
 ++++-----
> > >  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-common.h       |=
 2 ++
> > >  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-encodings.h    |=
 0
> > >  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-msg-common.h   |=
 0
> > >  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-msg-format.h   |=
 0
> > >  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-msg-port.h     |=
 0
> > >  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-msg.h          |=
 0
> > >  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-parameters.h   |=
 0
> > >  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-vchiq.h        |=
 0
> > >  10 files changed, 7 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 816cceb5dc2d066665501aa8bbc04a2edd751087..16002c21fe06913ed57f4=
95265b0b1ad14772c55 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -4927,6 +4927,7 @@ F:        Documentation/devicetree/bindings/pci=
/brcm,stb-pcie.yaml
> > >  F:     drivers/pci/controller/pcie-brcmstb.c
> > >  F:     drivers/platform/raspberrypi/vchiq-*
> > >  F:     drivers/staging/vc04_services
> > > +F:     include/linux/raspberrypi/mmal*
> > >  F:     include/linux/raspberrypi/vchiq*
> > >  N:     bcm2711
> > >  N:     bcm2712
> > > diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c b/d=
rivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
> > > index a228098d8cc0af5d5900b92b2847a1626a6d599c..3ead81dd2d0f48be7a5dd=
87256c38d6ba0dbcd0e 100644
> > > --- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
> > > +++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
> > > @@ -22,17 +22,16 @@
> > >  #include <linux/mm.h>
> > >  #include <linux/slab.h>
> > >  #include <linux/completion.h>
> > > +#include <linux/raspberrypi/mmal-common.h>
> > > +#include <linux/raspberrypi/mmal-parameters.h>
> > > +#include <linux/raspberrypi/mmal-vchiq.h>
> > > +#include <linux/raspberrypi/mmal-msg.h>
> > >  #include <linux/raspberrypi/vchiq.h>
> > >  #include <linux/raspberrypi/vchiq_arm.h>
> > >  #include <linux/raspberrypi/vc_sm_knl.h>
> > >  #include <linux/vmalloc.h>
> > >  #include <media/videobuf2-vmalloc.h>
> > > =20
> > > -#include "mmal-common.h"
> > > -#include "mmal-parameters.h"
> > > -#include "mmal-vchiq.h"
> > > -#include "mmal-msg.h"
> > > -
>=20
> The mmal-common.h header got moved above videobuf2-vmalloc.h here ....
>=20
> > >  /*
> > >   * maximum number of components supported.
> > >   * This matches the maximum permitted by default on the VPU
> > > diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h b/=
include/linux/raspberrypi/mmal-common.h
> > > similarity index 97%
> > > rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
> > > rename to include/linux/raspberrypi/mmal-common.h
> > > index 6c5092a68b99594a0234f56b48b785fbc611bf5a..e7f065c539bcae7480a8d=
c2000d2a1e4cec7883c 100644
> > > --- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
> > > +++ b/include/linux/raspberrypi/mmal-common.h
> > > @@ -16,6 +16,8 @@
> > >  #ifndef MMAL_COMMON_H
> > >  #define MMAL_COMMON_H
> > > =20
> > > +#include <media/videobuf2-v4l2.h>
> > > +
> >=20
> > Is this spurious? I could understand the changes up in mmal-vchiq.c
> > above but I don't see how this relates to the move?
> >=20
>=20
> .... which exposed the fact that mmal-common.h references to `struct
> vb2_v4l2_buffer` without including the relevant header, so clangd
> complained and populated it for me, and I forgot to mention it in the
> commit message.
>=20
> Sorry for the confusion. Not a spurious change. Is this fine as a note in
> the commit message, or should I fix the header as a separate commit in v2?

Either is fine I think ;-) It just stood out otherwise!

With either approach:

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>=20
> >=20
> > >  #define MMAL_FOURCC(a, b, c, d) ((a) | (b << 8) | (c << 16) | (d << =
24))
> > >  #define MMAL_MAGIC MMAL_FOURCC('m', 'm', 'a', 'l')
> > > =20
>=20
> [...]
>=20
> Thanks,
> Jai

