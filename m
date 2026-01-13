Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7613DD2F347
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 17:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P/OFdX90WODFCCPEl4SoWtpreSe8lB8wGz4oOR4cavk=; b=jF3XQI8oFcAsVXf4Z127cNzca4
	VI0+AMzncHeoBNXfURsfeeyTglE4jo4vjnfxSjb1yeNTYufzks8v8ZKbBsktjbDz1tuvvSF7Yb0a0
	20gf3itf+cCHWuMUK/Yp54wsKV/uRcaoKnuY1S01s69xAaMM77OGimPLEtq6IpiHMqxO5lEUrblzz
	j3g5qF6ZB4NqOz+j+Pdv4PfgQDdDwNBW/0KSyIq4SLGePue0syot/fT+nFyMNHht6frjngb+jItj7
	P4DK+4//1ybnCqU3uH3eCx8uhSoDmw1SiLlJfy18/co3l4i91nOol/dAz5QAW4QarKWXWiHYnwaKa
	k4zzKTFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfi89-00000007WXF-0fcw;
	Tue, 13 Jan 2026 17:24:33 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfi86-00000007WWq-2A4T;
	Tue, 13 Jan 2026 17:24:31 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:a473:c554:ed1f:46ad:1ead])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 118CE73B;
	Tue, 13 Jan 2026 18:24:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768325042;
	bh=At5JYclpzHFMzQAzjMtF/k7TSbTFw4qxyRTnOnvX2Wo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=U8ri9ys2500jTH+BICIgLn+05HCRE8jlav65N9w1Km7hLLz/V78t6FmK2SvhStGSr
	 WsWu6h+jV4vSgf7Bk+VS1ik84aEjITrtfyEyifs1vN/yJP7RQ5KNsp9g0M6EPoFZwr
	 tUFrmKQ6SrsR+pyJr+sKaeJo/NDORrf2ULMsNqSk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <176832303070.1230693.13311579665048872008@ping.linuxembedded.co.uk>
References: <20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com> <20260113-b4-vchiq-isp-v1-1-ea0b300bffc8@ideasonboard.com> <176832303070.1230693.13311579665048872008@ping.linuxembedded.co.uk>
Subject: Re: [PATCH 01/10] platform/raspberrypi: vchiq-mmal: Move headers to include/linux
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
To: Florian Fainelli <florian.fainelli@broadcom.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Tomasz Figa <tfiga@chromium.org>
Date: Tue, 13 Jan 2026 22:54:23 +0530
Message-ID: <176832506332.2379386.7591736247076651406@freya>
User-Agent: alot/0.12.dev62+gb9d6144a6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_092430_716170_100C1561 
X-CRM114-Status: GOOD (  22.15  )
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

Hi Kieran,

Quoting Kieran Bingham (2026-01-13 22:20:30)
> Quoting Jai Luthra (2026-01-13 09:05:21)
> > Now that VCHIQ interface is destaged, different drivers (like ISP or
> > codec) no longer live under the same tree as VCHIQ MMAL, but in their
> > relevant trees like media or audio.
> >=20
> > Enable access to VCHIQ headers for such drivers by moving these headers
> > under include/linux/raspberrypi with other VCHIQ related headers.
> >=20
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> >  MAINTAINERS                                                      | 1 +
> >  drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c             | 9 +=
+++-----
> >  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-common.h       | 2=
 ++
> >  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-encodings.h    | 0
> >  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-msg-common.h   | 0
> >  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-msg-format.h   | 0
> >  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-msg-port.h     | 0
> >  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-msg.h          | 0
> >  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-parameters.h   | 0
> >  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-vchiq.h        | 0
> >  10 files changed, 7 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 816cceb5dc2d066665501aa8bbc04a2edd751087..16002c21fe06913ed57f495=
265b0b1ad14772c55 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4927,6 +4927,7 @@ F:        Documentation/devicetree/bindings/pci/b=
rcm,stb-pcie.yaml
> >  F:     drivers/pci/controller/pcie-brcmstb.c
> >  F:     drivers/platform/raspberrypi/vchiq-*
> >  F:     drivers/staging/vc04_services
> > +F:     include/linux/raspberrypi/mmal*
> >  F:     include/linux/raspberrypi/vchiq*
> >  N:     bcm2711
> >  N:     bcm2712
> > diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c b/dri=
vers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
> > index a228098d8cc0af5d5900b92b2847a1626a6d599c..3ead81dd2d0f48be7a5dd87=
256c38d6ba0dbcd0e 100644
> > --- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
> > +++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
> > @@ -22,17 +22,16 @@
> >  #include <linux/mm.h>
> >  #include <linux/slab.h>
> >  #include <linux/completion.h>
> > +#include <linux/raspberrypi/mmal-common.h>
> > +#include <linux/raspberrypi/mmal-parameters.h>
> > +#include <linux/raspberrypi/mmal-vchiq.h>
> > +#include <linux/raspberrypi/mmal-msg.h>
> >  #include <linux/raspberrypi/vchiq.h>
> >  #include <linux/raspberrypi/vchiq_arm.h>
> >  #include <linux/raspberrypi/vc_sm_knl.h>
> >  #include <linux/vmalloc.h>
> >  #include <media/videobuf2-vmalloc.h>
> > =20
> > -#include "mmal-common.h"
> > -#include "mmal-parameters.h"
> > -#include "mmal-vchiq.h"
> > -#include "mmal-msg.h"
> > -

The mmal-common.h header got moved above videobuf2-vmalloc.h here ....

> >  /*
> >   * maximum number of components supported.
> >   * This matches the maximum permitted by default on the VPU
> > diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h b/in=
clude/linux/raspberrypi/mmal-common.h
> > similarity index 97%
> > rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
> > rename to include/linux/raspberrypi/mmal-common.h
> > index 6c5092a68b99594a0234f56b48b785fbc611bf5a..e7f065c539bcae7480a8dc2=
000d2a1e4cec7883c 100644
> > --- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
> > +++ b/include/linux/raspberrypi/mmal-common.h
> > @@ -16,6 +16,8 @@
> >  #ifndef MMAL_COMMON_H
> >  #define MMAL_COMMON_H
> > =20
> > +#include <media/videobuf2-v4l2.h>
> > +
>=20
> Is this spurious? I could understand the changes up in mmal-vchiq.c
> above but I don't see how this relates to the move?
>=20

.... which exposed the fact that mmal-common.h references to `struct
vb2_v4l2_buffer` without including the relevant header, so clangd
complained and populated it for me, and I forgot to mention it in the
commit message.

Sorry for the confusion. Not a spurious change. Is this fine as a note in
the commit message, or should I fix the header as a separate commit in v2?

>=20
> >  #define MMAL_FOURCC(a, b, c, d) ((a) | (b << 8) | (c << 16) | (d << 24=
))
> >  #define MMAL_MAGIC MMAL_FOURCC('m', 'm', 'a', 'l')
> > =20

[...]

Thanks,
Jai

