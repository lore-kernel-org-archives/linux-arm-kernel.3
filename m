Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68025D41C12
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 09:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEYtoHd6truLlW9dDvvW4TyZqvth1FwMIgnGkOwvmQk=; b=tjag+mi6HSWmCz5QHlsbyimx6p
	fF+Qyxr7ojbtS7vZGQEr73j5V2QKRnylV3XHFsz0kX1znMeHsdQVrFqSpxEy0HEW0WHghjm6BLmqn
	iWX3n9lb1uBTz2M6ncWXWgBeMJ9la87N0oDgR1EAi0CeduwdFn5njeXgNDxd5qOBA7etmtSGDd95j
	e4xsyxz+KWrapPf0qUjb9H8ejLmIh1FT+SQ5smpw73H24HMtCHUXCrP28kDzx7CRHXixasw7jAdYH
	046JRG+GbYK8oMR2w8hru+0rIUjiOh3qylyk6WULJRmC65epet9epMaZuLqUULk+n1Zsrm8+32tYA
	ZD0W4rWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTdH5-0000000GSLS-1Y3B;
	Thu, 11 Dec 2025 09:47:51 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTdH1-0000000GSKt-1Rer
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 09:47:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 29ACC4E41B6D;
	Thu, 11 Dec 2025 09:47:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F16AA6068C;
	Thu, 11 Dec 2025 09:47:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 06BA9103C8C1E;
	Thu, 11 Dec 2025 10:47:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765446463; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dEYtoHd6truLlW9dDvvW4TyZqvth1FwMIgnGkOwvmQk=;
	b=RGSe8UYmgqic1d7gzrTAi6DwwYIydD58RU8J6fsmdoC5KlSEJclSPhwA9hemgK7p7TAyxb
	hLGOsvfjj0bVM4vks4oO+w20GsZOAkXbMLifL0QCJxE1oGW36lyEa36v4grMx2+PRF63ir
	inqrCx4Q+I9cc4QXro9EtuXKF14xvgVDPbE8BbAs4ykm46UbcLZCz0AIqjAdpU+rNGnW+5
	0i4s2yiuKa/M8hfjtszF+uB89KxdDZiOmsrjUeeBMHPRyQWlww3fZvYT1Vhw7JTZII4k9P
	ML/tOQlh2X31xmjvB2bAR79Ojdv3x4BY0ox3b2l+56gDER59bOhtr2R0Lf9a3Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Dec 2025 10:47:39 +0100
Message-Id: <DEVAJEYEL7SW.2F8RT465LAL5U@bootlin.com>
Subject: Re: [PATCH 03/21] drm/tilcdc: Remove simulate_vesa_sync flag
Cc: "Jyri Sarha" <jyri.sarha@iki.fi>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony Lindgren" <tony@atomide.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Markus
 Schneider-Pargmann" <msp@baylibre.com>, "Louis Chauvet"
 <louis.chauvet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
To: "Kory Maincent" <kory.maincent@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
 <20251126-feature_tilcdc-v1-3-49b9ef2e3aa0@bootlin.com>
 <DEUQM2HNEOQU.3K4ZPL44GVZAJ@bootlin.com>
 <20251211104024.1e7d5c42@kmaincent-XPS-13-7390>
In-Reply-To: <20251211104024.1e7d5c42@kmaincent-XPS-13-7390>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_014747_539911_75BF362C 
X-CRM114-Status: GOOD (  23.49  )
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

On Thu Dec 11, 2025 at 10:40 AM CET, Kory Maincent wrote:
> On Wed, 10 Dec 2025 19:10:45 +0100
> "Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:
>
>> Hi K=C3=B6ry,
>>
>> On Wed Nov 26, 2025 at 6:35 PM CET, Kory Maincent (TI.com) wrote:
>> > The tilcdc hardware does not generate VESA-compliant sync signals. It
>> > aligns the vertical sync (VS) on the second edge of the horizontal syn=
c
>> > (HS) instead of the first edge. To compensate for this hardware
>> > behavior, the driver applies a timing adjustment in mode_fixup().
>> >
>> > Previously, this adjustment was conditional based on the simulate_vesa=
_sync
>> > flag, which was only set when using external encoders. This appears
>> > problematic because:
>> >
>> > 1. The timing adjustment seems needed for the hardware behavior regard=
less
>> >    of whether an external encoder is used
>> > 2. The external encoder infrastructure is driver-specific and being
>> >    removed due to design issues
>> > 3. Boards using tilcdc without bridges (e.g., am335x-evm, am335x-evmsk=
)
>> >    may not be getting the necessary timing adjustments
>> >
>> > Remove the simulate_vesa_sync flag and apply the VESA sync timing
>> > adjustment unconditionally, ensuring consistent behavior across all
>> > configurations. While it's unclear if the previous conditional behavio=
r
>> > was causing actual issues, the unconditional adjustment better reflect=
s
>> > the hardware's characteristics.
>> >
>> > Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
>> > ---
>> >
>> > Only few board currently use tilcdc not associated to a bridge like th=
e
>> > am335x_evm or the am335x-evmsk.
>>
>> Have you tested this change on any affected board?
>>
>> The change looks good to me but without some testing it would be risky.
>
> I have tested it on few boards but not these mainline devicetree as I don=
't
> have them.
>
> I have tested a tilcdc with tda998x bridge (BeagleBone Black), a tilcdc w=
ith
> ti,tilcdc,panel panel (BeagleBone with LCD cape), a tilcdc with it66121 b=
ridge
> (new Beagle Bone Green Eco board with HDMI cape).
> That's all the boards I have.

OK, thanks for the info. For future iterations, I think it's useful to
mention, for all patches that may potentially break existing hardware, such
info on which hardware you have tested.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

