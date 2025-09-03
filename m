Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4646BCA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 17:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/n3w+1nj5a7ZofF+kFNOjqlmFwb00T2hDOvnxtx2+3M=; b=kk9rKCHH+rq2aGUYtCdvacoi59
	gZeHluYuoPu+ldvUwgbprnZQD2HNJbpTCotAGNCOtRimxRGT41azGoo6pV7dgWQlc28t8k7SZk0nJ
	gyeZwgVlojqB7NtT10mi28Ws1Dd5Be6CfjrTZ4CE2tbPIWfYX3IQYtT+HOGSyaA9JoxHmQDspKvjZ
	FhV1Slq25X7Pm1AkCIgZSYK5bJgcy9SDr5ZAbpIT+70JAABnnqUZCn68obuR0erBOK9t25efeeQcw
	9X2eu9NgEZAUskL3UtSEumfvCU0YtOxypfdldrmSU0qD9WjHj9kMe9I0I7EG2EBO+l7OoyN9ujtDp
	oyoLvRoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utrIo-00000007Bse-22b0;
	Wed, 03 Sep 2025 17:29:46 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnjV-00000006dBO-033q;
	Wed, 03 Sep 2025 13:41:07 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:480e:e039:1d0b:c5ff:a9e2])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33B7D83D;
	Wed,  3 Sep 2025 15:39:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756906792;
	bh=K/9dAyFF/P+rSML/+SeNcZwvlUM5MmpiClNT/7DQIXQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=N0tq5TFEyFNEPAEWuQykFLtPtYKWwkIk7GdD6zDzio5OcB4Q61rd9DzuNVntZGLCm
	 saS90oxafBg89QQmQ7ldOuP1fPOj99B68c5gIKWAx8fdaIT0O9rl4P1HvhWBqKxo1A
	 qJtFV01IqAFswxeh6z1HOBHiL38eALSBaFLczvC4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <731ead88-8dc9-4032-86f5-7a2dd5044b22@gmx.net>
References: <20250827-vchiq-destage-v1-0-5052a0d81c42@ideasonboard.com> <20250827-vchiq-destage-v1-4-5052a0d81c42@ideasonboard.com> <731ead88-8dc9-4032-86f5-7a2dd5044b22@gmx.net>
Subject: Re: [PATCH 4/5] media: staging: Drop bcm2835-camera driver
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-list@raspberrypi.com, Dave Stevenson <dave.stevenson@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>
Date: Wed, 03 Sep 2025 19:10:55 +0530
Message-ID: <175690685574.8095.13306600513284108529@freya>
User-Agent: alot/0.12.dev28+gd2c823fe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_064105_187660_B452B556 
X-CRM114-Status: GOOD (  18.04  )
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

Hi Stefan,

Quoting Stefan Wahren (2025-08-28 00:48:22)
> Hi Jai,
>=20
> Am 27.08.25 um 08:24 schrieb Jai Luthra:
> > The bcm2835-camera driver is replaced by the V4L2 bcm2835-unicam driver
> > that is already upstream. So drop it from staging.
> AFAIK the old Raspberry Pi Camera V1 isn't supported by V4L2=20
> bcm2835-unicam. Personally i'm fine with this, but this must be clear in =

> the commit message.Did you already talked to distributions like Redhat & =

> OpenSuSE about this step?

As Dave mentioned, the OV5647 should work with V4L2. I don't have a sensor
with me, but I can order one and try to get it working with the upstream
kernel separate from this series.

I did test the V2 camera module (IMX219) with my series applied on top of
upstream kernel, and capture worked fine with bcm2835-unicam, so I don't
believe V1 camera module should be an issue.

> > This also simplifies destaging of VCHIQ MMAL, by reducing the users of
> > the MMAL API (this driver is one of them).
> AFAIU this drops the only one user of VCHIQ MMAL. So please explain, why =

> we still need this API and how this should be tested?

The bcm2835-isp and bcm2835-codec are other users, which are currently only
present in the downstream Pi kernel [1].

I plan to upstream the ISP driver as a subsequent series (that was the main
motivation for this series), thus keeping the MMAL API still here.

[1] https://github.com/search?q=3Drepo%3Araspberrypi%2Flinux%20%23include%2=
0%22..%2Fvchiq-mmal%2F&type=3Dcode

>=20
> Best regards

Thanks,
    Jai

