Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9458DC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 11:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4XNCQGx3Yoz7/BOqlK2VzWgj1mfuyl8aN4mkc2Mh9/Y=; b=IcnuEjA9gDL3iVeJPmSJ39yAC3
	sMI8FEYNno84Pqr21tmyuxzYwqmpysFQJiMjXCLuQnY/EGx4Oygr29gtHdPJ2GrgMR3NRlUxxtVqY
	zebQWWxRSqAxXQqLH88qVD8juigZqxZfy13f5K1lYgMdBu7ZmTi9P9t0bSDu3IuC8SenbM7+j1T0F
	JDqDJ6T0sKDRRz6bn7k1eI5i0ucmsN2LheLiTYvfs75iNflDGP57SL5xp6Bb/hCS6EVZhGkER5coH
	F0kKfhwshnY6cdys5tBuQ1mw5V/eui6k3RZ10WS8f2AeBWBpp7MwJw6o7sCjdXuTIzU3Tv9naCX+5
	CLL9E+Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHhfm-0000000FdL3-2HZz;
	Wed, 21 May 2025 11:31:46 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHhcV-0000000Fd4N-3pPG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 11:28:25 +0000
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 152926AF;
	Wed, 21 May 2025 13:28:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747826880;
	bh=9ldtAZOjiwBoSV88KvGA6xuaTmbjwRGIREj/XBztDYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N2H3Mog7VyzmtlM/z8giI0CLF2vmMNs7RIYDeU/is1pMALM3VHO/3FdpUhY2EwRoR
	 XFtXEEzohS+fk0Kr4yT1fpFgiPait86avoORJaluvwmAtSgSQXnUWt1w7M3fcpjFrc
	 dS5f0FWYfe5RQQCbriXeksTCOp5bHqkGoTe39IRE=
Date: Wed, 21 May 2025 13:28:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Stefan Wahren <wahrenst@gmx.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com, kernel-list@raspberrypi.com,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH RFC 2/2] staging: vc04_services: Document VCHIQ character
 device
Message-ID: <20250521112815.GA25453@pendragon.ideasonboard.com>
References: <20250509221152.13564-1-wahrenst@gmx.net>
 <20250509221152.13564-3-wahrenst@gmx.net>
 <2025052121-glisten-serpent-8ede@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2025052121-glisten-serpent-8ede@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_042824_395582_44BA0AFA 
X-CRM114-Status: GOOD (  20.38  )
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

On Wed, May 21, 2025 at 01:20:54PM +0200, Greg KH wrote:
> On Sat, May 10, 2025 at 12:11:52AM +0200, Stefan Wahren wrote:
> > From: Phil Elwell <phil@raspberrypi.com>
> > 
> > Document the IOCTLs for the VCHIQ character device, which provide
> > a userspace interface to access the VideoCore VPU of the
> > Raspberry Pi. Several ARM side libraries make use of it like EGL,
> > MMAL and OpenMAX.
> > 
> > Link: https://github.com/raspberrypi/linux/pull/6801
> > Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> > [wahrenst@gmx.net: Rewrite commit log]
> > Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> > ---
> >  .../vc04_services/Documentation/vchiq-cdev    | 87 +++++++++++++++++++
> >  1 file changed, 87 insertions(+)
> >  create mode 100644 drivers/staging/vc04_services/Documentation/vchiq-cdev
> > 
> > diff --git a/drivers/staging/vc04_services/Documentation/vchiq-cdev b/drivers/staging/vc04_services/Documentation/vchiq-cdev
> > new file mode 100644
> > index 000000000000..99ab2567643e
> > --- /dev/null
> > +++ b/drivers/staging/vc04_services/Documentation/vchiq-cdev
> > @@ -0,0 +1,87 @@
> > +What:		/dev/vchiq
> > +Date:		October 2016
> > +KernelVersion:	4.9
> > +Contact:	kernel-list@raspberrypi.com
> > +Description:
> > +		The ioctl interface for the VCHIQ character device.
> > +		Following actions are supported:
> > +
> > +		* VCHIQ_IOC_CONNECT:
> > +		  Establish/confirm the link to the VPU peer.
> 
> I understand the need, but this does not document the parameters to the
> ioctls, so it's not all that useful.  How about just a normal
> documentation file with this all written out?

That would be my preference too, somewhere in
Documentation/userspace-api/.

-- 
Regards,

Laurent Pinchart

