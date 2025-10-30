Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AA6CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 05:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zDnQizkjTdSItd+1RAonQx+cYT8w6lPwyJgHe/DCHvs=; b=OaY1VKm9OVO96YdmHh9NjckqsO
	gWveAh4BC6hN2NcWVks34+9BzoexQcEYi/CHiderfutaWDNgBklUpJr9bzHlosRzJrvs7Dv7uh29Q
	fCZK8b/NgCnD41szhLfKJzlg8s6ftQc2tpHZpOP6fRaWiXemzFOA0/M5Hw0A6zfY3ZIC5FJA35Jzt
	JA8M+jjBkXFr972WS1DFdbrz3gO1BGv6PmKU2uMC0u/yqPZVZlH+v/2guy3oPOQjAXbIDHd24tYus
	uztUdH1dmEubQNs1LW8TF+8BLmsBd7vGWqX0ZKx8lnVsf15xvJNFh+hA5fPuaKJ47s3gb3Shx2tp5
	+huXV0hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEKm2-00000003U0A-1ENo;
	Thu, 30 Oct 2025 05:00:34 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEKlz-00000003Tzb-3l7L;
	Thu, 30 Oct 2025 05:00:33 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8765B6DF;
	Thu, 30 Oct 2025 05:58:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761800316;
	bh=aIIDMY3AHK5dw1R7m3doBiBvTy/DW6Af897s/1Y0FmM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=fcyCZgxF4TpjFmwHBuC4i48DKDr4kJjvw70dSw9AgEwoEjzO8tnC/CvDyArO0N7Ar
	 yzi8VhGp38/iGMgzZIld8SGzlLgZlse3SMyA52aoZ08v6zImE4FWA+atzoXveV6lIV
	 R2Nd8Jf3wXg6+EnhYwU99ZdvYJ4nFlq+ibaYeSTg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aQIEOJUHdVMriz7S@stanley.mountain>
References: <20251029-vchiq-destage-v3-0-da8d6c83c2c5@ideasonboard.com> <aQIEOJUHdVMriz7S@stanley.mountain>
Subject: Re: [PATCH v3 0/7] staging: Destage VCHIQ interface and MMAL
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-list@raspberrypi.com, Stefan Wahren <wahrenst@gmx.net>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Phil Elwell <phil@raspberrypi.com>, Umang Jain <uajain@igalia.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Date: Thu, 30 Oct 2025 10:30:22 +0530
Message-ID: <176180042213.8690.16888216388545206511@freya>
User-Agent: alot/0.12.dev28+gd2c823fe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_220032_097023_5D1446E9 
X-CRM114-Status: GOOD (  13.27  )
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

Hi Dan,

Thanks for the review.

Quoting Dan Carpenter (2025-10-29 17:40:32)
> I did a review of some Smatch warnings.  These aren't published because
> they generate too many false positives.  Only number 3 and number 7
> are actual issues the rest are style nit-picks.

3 - 8 are for bcm2835-camera, which is altogether dropped from staging in
PATCH 1/7.

>=20
> 1. drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:2728 vc=
hiq_add_service_internal() info: returning a literal zero is cleaner
> s/return service;/return NULL;/
>=20
> 2. drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:408 vchi=
q_shutdown() info: returning a literal zero is cleaner
> Delete the "ret" variable.
>=20
> 3. drivers/staging/vc04_services/bcm2835-camera/controls.c:198 ctrl_set_i=
so() warn: array off by one? 'iso_values[ctrl->val]'
> There seems to be a mixup between iso_qmenu[] and iso_values[].  The one
> is only used for ARRAY_SIZE() and the other is never checked for
> ARRAY_SIZE().
>=20
> 4. drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c:337 buff=
er_cb() warn: can 'buf' even be NULL?
> Delete the NULL check.
>=20
> 5. drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c:513 star=
t_streaming() pedantic: propagate return from 'enable_camera' instead of re=
turning '-EINVAL'
> -       if (enable_camera(dev) < 0) {
> +       ret =3D enable_camera(dev);
> +       if (ret) {
>                 v4l2_err(&dev->v4l2_dev, "Failed to enable camera\n");
> -               return -EINVAL;
> +               return ret;
>         }
> 6. drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c:576 star=
t_streaming() pedantic: propagate return from 'disable_camera' instead of r=
eturning '-EINVAL'
> Same.
>=20
> 7. drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c:881 vidi=
oc_querycap() error: uninitialized symbol 'major'.
>    drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c:881 vidi=
oc_querycap() error: uninitialized symbol 'minor'.
> No error checking on vchiq_mmal_version()
>=20
> 8. drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c:1276 mma=
l_setup_components() info: returning a literal zero is cleaner
> s/return ret;/return 0;/
>=20
> regards,
> dan carpenter

Thanks,
Jai

