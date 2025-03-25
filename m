Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6CAC36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 17:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/dHlNZHbBPTVb9Fm1iMNX8UEsumJ85VEz4GTnxe5krU=; b=LivPBMFrOb7ByKUwnrimkeHcHQ
	LRL5BlQwXmc7Tkck538WYOrt7/gdwDzRQN517M2YRymot85qMWkYvjE2zh7bd+lSjdhVt7oDiIy/e
	n5eXOxRix2ZJ8LTZYg7UuzRZicgXP3/s2YPxn5X1cmhulKfppLBT+Fu+urAzZ7athgWEJqNc5ySmT
	PU6pMCKgu0MGEb+zxSSFvWOC+JFQ26w04B9On1QemQJFjl3ljIewP34ECzA/uWwThfblyPKw449xo
	VMyxQVg5lzEx71ZsPPe8yN5t/YLd4lW8ey2cmPCpu5zo9bCjDn04/iLztw5BsDkvnVFQzByo+26Hq
	uRye1gsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx7lb-00000006ZdG-2lNN;
	Tue, 25 Mar 2025 17:08:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5m4-00000006H1F-3bDn
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Mar 2025 15:01:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/dHlNZHbBPTVb9Fm1iMNX8UEsumJ85VEz4GTnxe5krU=; b=F+f/W6j/jBzCSsJucqb2sugp7v
	OoG7j9oqHIFsy/KtzeSzF9F+rbWhMFdMyDf3PrkxYoAmfTUr+G/z6jfkEuswO9vLCycYPiTSIm2q0
	01HqWsoMr2tPnjWRsjZrLTpUaT/dYuXWh7qyuXSggJPSLbR3ets8CAplivpjUQKXnm57t+siawbJn
	Gg9sPymsZhDgscoNvJTJUy99hmskbjCWNFpGsvCmlK+ac73l/psMuSziLLi6PkVKq7LebTwaHF8Df
	SvU/Kd+HM80HLKNt5IQPAjviwFAdIxfrkfKcM14dCaG6Re+Ub9CMeZft3yd7n/AJnGaddYj9ludeb
	gpYqpuOA==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx5lw-00000005XGW-12IC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 15:01:03 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tx5lo-00069R-Rt; Tue, 25 Mar 2025 16:00:48 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tx5ln-001b4w-1A;
	Tue, 25 Mar 2025 16:00:47 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tx5li-0009py-2A;
	Tue, 25 Mar 2025 16:00:42 +0100
Message-ID: <7cb810a0f80d61fea294b93ace2e2fb7515c077c.camel@pengutronix.de>
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Marek Vasut <marex@denx.de>, Boris Brezillon
 <boris.brezillon@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley
 <conor+dt@kernel.org>,  David Airlie <airlied@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Liviu
 Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring
 <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel
 <sre@kernel.org>,  Shawn Guo <shawnguo@kernel.org>, Simona Vetter
 <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,  Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  imx@lists.linux.dev
Date: Tue, 25 Mar 2025 16:00:42 +0100
In-Reply-To: <7233d56f-d07d-46c3-9954-57eb583a36ac@denx.de>
References: <20250321200625.132494-1-marex@denx.de>
	 <20250321200625.132494-5-marex@denx.de>
	 <20250324094333.7afb17a1@collabora.com>
	 <22187ae5-7486-416b-b612-53021bfca11e@denx.de>
	 <13376dff8d861389464b7ecdb2f82fe211638500.camel@pengutronix.de>
	 <7233d56f-d07d-46c3-9954-57eb583a36ac@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_150059_682533_D788BA43 
X-CRM114-Status: GOOD (  28.04  )
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

On Di, 2025-03-25 at 15:27 +0100, Marek Vasut wrote:
> On 3/25/25 3:12 PM, Philipp Zabel wrote:
> > On Mo, 2025-03-24 at 20:05 +0100, Marek Vasut wrote:
> > > On 3/24/25 9:43 AM, Boris Brezillon wrote:
> > >=20
> > > [...]
> > >=20
> > > > > @@ -563,6 +585,7 @@ int panthor_device_suspend(struct device *dev=
)
> > > > >   =20
> > > > >    	panthor_devfreq_suspend(ptdev);
> > > > >   =20
> > > > > +	reset_control_assert(ptdev->resets);
> > > >=20
> > > > Hm, that might be the cause of the fast reset issue (which is a fas=
t
> > > > resume more than a fast reset BTW): if you re-assert the reset line=
 on
> > > > runtime suspend, I guess this causes a full GPU reset, and the MCU =
ends
> > > > up in a state where it needs a slow reset (all data sections reset =
to
> > > > their initial state). Can you try to move the reset_control_[de]ass=
ert
> > > > to the unplug/init functions?
> > > The reset on the MX95 is not really a reset, it is clear-only
> > > set-never-again bit which goes only one way, the "unreset" way, so I
> > > don't think this has any impact.
> >=20
> > This sounds like the bit is initially set to 1 (reset asserted) and can
> > be cleared by writing 0 (once, to deassert the reset). But in the
> > reset-simple patch it looks to be the other way around (active_low =3D
> > true)?
> >=20
> > If the reset control can't be asserted again on this hardware, it would
> > be better to have custom driver that doesn't implement the .assert()
> > callback at all.
> Maybe the reset-simple driver can be extended with some mode of=20
> operation like this instead , to make it skip assert once deasserted ,=
=20
> for specific reset controllers ?

How about a second reset_control_ops struct without .assert, selected
in reset_simple_probe() by a new flag in reset_simple_devdata.

regards
Philipp

