Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F4BC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 11:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ErhD3FiTYRRx1Wog3nvjmKw38ovKw5T5g6iYA9/bOnY=; b=mBXZ4Ph2Apr3vhNU+AFFfQJSUA
	ZcCelIpAqNe13TrY/Xfe76bxlcHzoeLLjaSGaIAJSu9cYY+bLsI7ZjlhFr/YFEJxoNc7aTzTFGWDt
	ejPdWb8OPaSUliqv4G5Kdr4aGhK7t5BUrw96e3/8flEmaAgTlvvUZV5n0/WHggwN63jqrMrwnBjtt
	DcarL/MYIWyNwlit0uM9VR0xuEFGnm6LBAkCJQgezwWvl/GV9sUhbpf1LWUJdP/kLkbGllVqSiVsW
	hWyI8sxjoAJc9wP0qoiZbTYilAc+rg1HRVA3NsWNX24cst++v1Xwhquz2jeXVZRnaQOwF2+0wl1A3
	vKlSNw4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHi5H-0000000FhjV-1sTg;
	Wed, 21 May 2025 11:58:07 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHi07-0000000Fghg-12FR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 11:52:48 +0000
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA70F6AF;
	Wed, 21 May 2025 13:52:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747828343;
	bh=1lIpQjeZWM4B9/XmD81iy/IEh/WiTrtNntrczpbhpoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hm4IfOYrhHp6JXpwuzKAnBrmQUO7WP7cZNSiyOc+Hg7tHFzZg007Q3hUcH/qEBJQq
	 NbITT004qqSDRlaZtWqFId+aM//kCbBT6OkLm8MUKXH1BL3HB0NR5aavDJrwL4JF/l
	 CzRzezaXpeAnAUStyKWW3yVhYil0hHAHNAvkQ/f8=
Date: Wed, 21 May 2025 13:52:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com, kernel-list@raspberrypi.com,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH RFC 2/2] staging: vc04_services: Document VCHIQ character
 device
Message-ID: <20250521115239.GI12514@pendragon.ideasonboard.com>
References: <20250509221152.13564-1-wahrenst@gmx.net>
 <20250509221152.13564-3-wahrenst@gmx.net>
 <2025052121-glisten-serpent-8ede@gregkh>
 <20250521112815.GA25453@pendragon.ideasonboard.com>
 <4cac2c68-a975-4b68-92c4-91e90ffe8041@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4cac2c68-a975-4b68-92c4-91e90ffe8041@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_045247_421599_4CC64F58 
X-CRM114-Status: GOOD (  21.36  )
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

On Wed, May 21, 2025 at 01:39:15PM +0200, Stefan Wahren wrote:
> Am 21.05.25 um 13:28 schrieb Laurent Pinchart:
> > On Wed, May 21, 2025 at 01:20:54PM +0200, Greg KH wrote:
> >> On Sat, May 10, 2025 at 12:11:52AM +0200, Stefan Wahren wrote:
> >>> From: Phil Elwell <phil@raspberrypi.com>
> >>>
> >>> Document the IOCTLs for the VCHIQ character device, which provide
> >>> a userspace interface to access the VideoCore VPU of the
> >>> Raspberry Pi. Several ARM side libraries make use of it like EGL,
> >>> MMAL and OpenMAX.
> >>>
> >>> Link: https://github.com/raspberrypi/linux/pull/6801
> >>> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> >>> [wahrenst@gmx.net: Rewrite commit log]
> >>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> >>> ---
> >>>   .../vc04_services/Documentation/vchiq-cdev    | 87 +++++++++++++++++++
> >>>   1 file changed, 87 insertions(+)
> >>>   create mode 100644 drivers/staging/vc04_services/Documentation/vchiq-cdev
> >>>
> >>> diff --git a/drivers/staging/vc04_services/Documentation/vchiq-cdev b/drivers/staging/vc04_services/Documentation/vchiq-cdev
> >>> new file mode 100644
> >>> index 000000000000..99ab2567643e
> >>> --- /dev/null
> >>> +++ b/drivers/staging/vc04_services/Documentation/vchiq-cdev
> >>> @@ -0,0 +1,87 @@
> >>> +What:		/dev/vchiq
> >>> +Date:		October 2016
> >>> +KernelVersion:	4.9
> >>> +Contact:	kernel-list@raspberrypi.com
> >>> +Description:
> >>> +		The ioctl interface for the VCHIQ character device.
> >>> +		Following actions are supported:
> >>> +
> >>> +		* VCHIQ_IOC_CONNECT:
> >>> +		  Establish/confirm the link to the VPU peer.
> >>
> >> I understand the need, but this does not document the parameters to the
> >> ioctls, so it's not all that useful.  How about just a normal
> >> documentation file with this all written out?
> >
> > That would be my preference too, somewhere in
> > Documentation/userspace-api/.
>
> could you please point me to a comparable IOCTL documenation to better 
> understand your expectations?

Documentation/userspace-api/gpio/ seems to be a good example. You can
split ioctls in different files, see gpio-get-chipinfo-ioctl.rst for
instance. If several ioctls are closely related they can also be
documented in the same file, see for instance
Documentation/userspace-api/media/v4l/vidioc-g-ctrl.rst.

-- 
Regards,

Laurent Pinchart

