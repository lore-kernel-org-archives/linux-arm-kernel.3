Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E864DCA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 17:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HO4piufgL4b2TRhKr7+dw7lW+Kk5Lvomc9NRz1XQGR8=; b=ogd3I92KCwMnYFKJwdRrv7dQab
	dKfaGJukvyb/0y7h+66oJ5pbqH6FhpZQ99bZVR+3WJJspMNuT5H2hETe58BWgOyQdP1TJ17CuF+DI
	BQ2Lc9sNBGcCrJ+6s1BUeDubqj+e+1TNgOMQ1IZR87N+SY+5jybYvAaSP04gaTeIy2i0AJAi9uEMw
	eBYYy+6GrnnVgkYa55ydpjynCh/g8NdL690cEce/PDKleWIRsB/fTntnCrb1c2YFrI1xUx3XGqy7w
	KeSdDES916R85Px912OVHmgSEtVrxRsq6ZtQKqW4LET+SrONS8cx3VgVdGKFl3M8doIvj5AEaI5Hx
	+VKgypKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utrZ1-00000007Dhp-1NrB;
	Wed, 03 Sep 2025 17:46:31 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnqP-00000006eAV-1dZR;
	Wed, 03 Sep 2025 13:48:14 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:480e:e039:1d0b:c5ff:a9e2])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F429C6D;
	Wed,  3 Sep 2025 15:47:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756907223;
	bh=wHSYdEndGYVsU4nyD1UO39BeJ41HSWWrWO3/X8oENnI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=j/80TZBIS2ZgBtU2z7ngDSkl6Xqsr7xzKUvqOtwBn4fLRbLIAv/OAaMnCP5kjLf+d
	 mecrk4AEnkcwsQYiOg7rj/MqqMcn+gS2p0cN6uKWd0+Teq0EfCBa6cWFDXGUvVNIIX
	 71MiP5VLXJjCIqvxK2NjVm0JRXfY8wghQfeqdWZ4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c35ab51a-e9df-48f5-bc18-889980098d08@gmx.net>
References: <20250827-vchiq-destage-v1-0-5052a0d81c42@ideasonboard.com> <20250827-vchiq-destage-v1-1-5052a0d81c42@ideasonboard.com> <20250827124016.GF5650@pendragon.ideasonboard.com> <we7tl65ijs44ae2zxfejmvnml3ls2pkfhcp2fqsmvec2eqevwm@yb45fs7nnf5s> <8ed6519a-6e45-4793-b11b-7b63c1703d6e@gmx.net> <910dae68-0545-46fa-b41f-8e4fb32ed649@broadcom.com> <c35ab51a-e9df-48f5-bc18-889980098d08@gmx.net>
Subject: Re: [PATCH 1/5] include: linux: Destage VCHIQ interface headers
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-list@raspberrypi.com
To: Florian Fainelli <florian.fainelli@broadcom.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Stefan Wahren <wahrenst@gmx.net>, Umang Jain <uajain@igalia.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 03 Sep 2025 19:18:06 +0530
Message-ID: <175690728665.8095.6551736878574350999@freya>
User-Agent: alot/0.12.dev28+gd2c823fe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_064813_565155_08F4D75D 
X-CRM114-Status: GOOD (  22.04  )
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

Hi Florian, Stefan,

Quoting Stefan Wahren (2025-08-28 11:49:47)
> Hi Florian,
>=20
> Am 28.08.25 um 04:17 schrieb Florian Fainelli:
> >
> >
> > On 8/27/2025 12:05 PM, Stefan Wahren wrote:
> >> Hi,
> >>
> >> Am 27.08.25 um 16:33 schrieb Umang Jain:
> >>> On Wed, Aug 27, 2025 at 02:40:16PM +0200, Laurent Pinchart wrote:
> >>>> Hi Jai,
> >>>>
> >>>> Thank you for the patch.
> >>>>
> >>>> On Wed, Aug 27, 2025 at 11:54:08AM +0530, Jai Luthra wrote:
> >>>>> From: Umang Jain <umang.jain@ideasonboard.com>
> >>>>>
> >>>>> Move the VCHIQ headers from drivers/staging/vc04_services/include to
> >>>>> include/linux/vchiq
> >>>>>
> >>>>> This is done so that they can be shared between the VCHIQ interface
> >>>>> (which is going to be de-staged in a subsequent commit from staging)
> >>>>> and the VCHIQ drivers left in the staging/vc04_services (namely
> >>>>> bcm2835-audio, bcm2835-camera).
> >>>>>
> >>>>> The include/linux/vchiq/ provides a central location to serve both
> >>>>> of these areas.
> >>>> Lots of SoC-specific headers are stored in include/linux/soc/$vendor=
/.
> >>>> This would be include/linux/soc/bcm/vchiq/ in this case. I'm also fi=
ne
> >>>> with include/linux/vchiq/ but other people may have a preference.
> >>> I agree with this point and I might have missed to notice the
> >>> include/linux/soc earlier. That's seems a better location to me since
> >>> it's actually broadcom-specific.
> >> I would expect that headers and source would be more related.
> >>
> >> For example:
> >>
> >> include/linux/soc/bcm
> >>
> >> drivers/soc/bcm/
> >
> > This is not Broadcom code, it is Raspberry Pi AFAICT, therefore, just=20
> > like drivers/firmware/raspberrypi.c, we would need some namespacing=20
> > here that reflects that, ideally.
> The VCHIQ code originally comes from Broadcom, but the current=20
> implementation has been adapted and tested for Raspberry Pi. I'm not=20
> against a Raspberry Pi specific namespace.

Thanks for the suggestions. For v2 I'll use:

include/linux/soc/raspberrypi
drivers/soc/raspberrypi

>=20
> Should this also apply to the DT bindings?
>=20
> Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml
>=20
> Best regards
>=20

Thanks,
    Jai

