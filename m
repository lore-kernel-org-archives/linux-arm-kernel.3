Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA73C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 11:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+/bh+aOh7Xr/wNEXFbED7Z9SklSOlJbINWhikaBXIc=; b=oxZrVyWGM1Hmmwmd+gs75goKCI
	5knysg12fwW1g5CY3LJroIt3HtGRaRTxOx3t2zL3aOEAm0taNHvxyOSok3ihg7Du6vvBDOyddfVdc
	FmDTsqF0+7+XD32sIaWOrUWyV5GaPTAGsODA4IQWpzvF3ZXxG4OOm7+NjaXaflLnJDIp0vwUNUNxM
	kJKRqBLEDrBJJAnhTluRxz17hsiDKB5UXlFbHQelMKq5fECyoEWcfte1hGdrwEYfFsiJISmJ+NaDj
	cMC3+7ihd8JDQjF5d4MuwokkY9AI5V/Wh3Buu73165geVQKck6sydEUSiJSz3xP/avmqhTC5x9H+D
	c9q8/Org==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFX6Y-00000000SJm-2TFi;
	Thu, 15 May 2025 11:50:26 +0000
Received: from smtp2-g21.free.fr ([212.27.42.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFX4W-00000000RyH-0lar;
	Thu, 15 May 2025 11:48:21 +0000
Received: from localhost (unknown [82.64.135.138])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 037D52003D6;
	Thu, 15 May 2025 13:48:08 +0200 (CEST)
Received: by localhost (Postfix, from userid 1502)
	id 90FFDC4D5; Thu, 15 May 2025 11:48:08 +0000 (GMT)
Date: Thu, 15 May 2025 11:48:08 +0000
From: Etienne Buira <etienne.buira@free.fr>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Etienne Buira <etienne.buira@free.fr>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware/raspberrypi: raise timeout to 3s
Message-ID: <aCXUeOmy28tqg6Oy@Z926fQmE5jqhFMgp6>
Mail-Followup-To: Stefan Wahren <wahrenst@gmx.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Etienne Buira <etienne.buira@free.fr>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <aCIiEp3CXD2o9dTw@Z926fQmE5jqhFMgp6>
 <048fd6c5-9f09-4c06-9a23-e5821dc291d5@gmx.net>
 <aCWMrJcldfrsNTQq@Z926fQmE5jqhFMgp6>
 <ffeb860f-5522-4130-ae47-45a6068b17ea@gmx.net>
 <aCW3d7tc27Awj62K@Z926fQmE5jqhFMgp6>
 <cecda824-4f47-4e4c-bee9-1a59cd5d801c@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cecda824-4f47-4e4c-bee9-1a59cd5d801c@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_044820_362095_81A7844A 
X-CRM114-Status: GOOD (  16.34  )
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

On Thu, May 15, 2025 at 12:31:38PM +0200, Stefan Wahren wrote:
> Am 15.05.25 um 11:44 schrieb Etienne Buira:
> > Hi Stefan, and thank you for your interest.
> >
> > On Thu, May 15, 2025 at 09:42:43AM +0200, Stefan Wahren wrote:
> >> Hi Etienne,
> >>
> >> Am 15.05.25 um 08:41 schrieb Etienne Buira:
> >>> On Wed, May 14, 2025 at 06:20:32PM +0200, Stefan Wahren wrote:
> >>>> Hi Etienne,
> >>>>
> >>>> Am 12.05.25 um 18:30 schrieb Etienne Buira:
> >>> ../..
> >>>> Out of curiosity and because i never saw this issue, could you please
> >>>> provide more details?
> >>>> There is nothing connected to HDMI 0 & 1 ?
> >>>> Which firmware version are you running?
> >> Please provide the dmesg output, so we can extract the firmware version.
> > Firmware version is 2025-02-17T20:03:07, i also attach the full gzipped
> > dmesg, as long as a patch of extra traces used.
> > I did not specifically test other firmware versions for the timeout
> > issue (but i did for video output).
> Thanks, i'll try to reproduce.
> 
> Sorry, i forgot but is this reproducible with a recent stable 6.12.x kernel?

Just reproduced with pristine 6.12.28.


