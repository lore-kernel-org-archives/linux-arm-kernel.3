Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A31C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 08:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RTPCL3bJ22/BfZ0DYy+zPJ2HcQNthlLl55iYHSsXgf4=; b=SDiTvFFl8OUuSFuuaeQL0mW4nr
	zYhugebDYmKsO6WpkuZvO1TrtpJhqo0bGe5byizGBeVzGKmM2Ad9iNBR2HKbxtXnzWTLZC+70JB/7
	gq9vpYaOKgqloqmuTL1bWYeA8uZHyIX527/9ODfoqtVEmEPlxdczJyulqdWo04mHtLBltmM1hTn7I
	IAm1itusaz/ReJID1RAA1rFlzp5XS8GD36mBw6iDMX8dpX4VGyoKfHr9DuPj7+hVTiSZI7pM5gz49
	K9Mwvhq3UDqY2BxPwYMAerLtEUamz9D/7xxJGdqW+plVFQlDe7zaNdLGEms8RLVVMqHenQDHX1C6k
	lDlwi5Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCpn-00000002tc2-26h5;
	Wed, 26 Feb 2025 08:32:03 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCRn-00000002oe0-08Pq;
	Wed, 26 Feb 2025 08:07:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RTPCL3bJ22/BfZ0DYy+zPJ2HcQNthlLl55iYHSsXgf4=; b=fRP53DWuVGxiOES0oTWTWO40pa
	aQbMHORaTsVwKaFQnsDdyAO6FV5Pu5jiMrr6lVAfy2+Z3UOfhrHVSanu++BR3slgsrN7yXB4UkSWy
	X2auVT4MHLTC5wBWSrl9he6ntyojDcxdf/j9XUfVnAXBuihGbjgOTsNK39VVVp07tVTJExZ7NYjrk
	jj6pmdh4BqDYXpMB/3bfEcArywK1xToNDaMt+RHVjZzC8v2fKkg34zKyGcre3Rxcj+8j2Puc865/O
	g618ljGYIwK4KWm9Rw9H5xVn1imt6Nmhl6t80evJ8MwT+4pUXVPvr8yIIh8k6Wmcm93lFBLtGi0KK
	KjqbuwqA==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tnCRk-0004zD-A4; Wed, 26 Feb 2025 09:07:12 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>,
 Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2] arm64: dts: rockchip: add usb typec host support to
 rk3588-jaguar
Date: Wed, 26 Feb 2025 09:07:11 +0100
Message-ID: <1952248.GKX7oQKdZx@diego>
In-Reply-To: <18716872.sWSEgdgrri@diego>
References: <20250218211044.2256762-1-heiko@sntech.de>
 <c50c6053-4569-44b0-943d-5450960be147@cherry.de> <18716872.sWSEgdgrri@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_000715_090876_EDB9D16E 
X-CRM114-Status: GOOD (  30.21  )
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

Am Freitag, 21. Februar 2025, 22:53:20 MEZ schrieb Heiko St=C3=BCbner:
> Am Freitag, 21. Februar 2025, 17:43:08 MEZ schrieb Quentin Schulz:
> > Hi Heiko,
> >=20
> > On 2/18/25 10:10 PM, Heiko Stuebner wrote:
> > > From: Heiko Stuebner <heiko.stuebner@cherry.de>
> > >=20
> > > Jaguar has two type-c ports connected to fusb302 controllers that can
> > > work both in host and device mode and can also run in display-port
> > > altmode.
> > >=20
> > > While these ports can work in dual-role data mode, they do not support
> > > powering the device itself as power-sink. This causes issues because
> > > the current infrastructure does not cope well with dual-role data
> > > without dual-role power.
> > >=20
> > > So add the necessary nodes for the type-c controllers as well
> > > as enable the relevant core usb nodes, but limit the mode to host-mode
> > > for now until we figure out device mode.
> > >=20
> > > Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> >=20
> > While the USB functionality does work for both ports, and the=20
> > orientation is properly reported, it seems like there may be some issue=
=20
> > with how the PHY or controller interacts with that info because I do no=
t=20
> > get USB3 speeds when the device is inserted in reverse orientation,=20
> > while I do when it's in normal orientation.
>=20
> I've tested both ports and saw the issue too.
> Interestingly on the usbdp-phy side, orientation detection seems correct
> and also the sbu pins are set accordingly.
>=20
>=20
> > I assume that's the case for the Rock 5 ITX and Orange Pi 5+ as well an=
d=20
> > probably has nothing to do with the DT?
> >=20
> > Should we go still go on with trying to merge this patch knowing that? =
I=20
> > mean USB2 is still better than no USB at all :)
> >=20
> > +Cc Chen-Yu, owner of an Orange Pi 5+, who may be able to confirm the=20
> > issue is widespread.

=46or reference, after digging around I found out that the usbdp-phy does n=
ot
handle the orientation correctly but relies on specific behaviour of the dw=
c3
controller (suspending between unplug and plugin).

usbdp-phy series fixing that is in
https://lore.kernel.org/linux-rockchip/20250225184519.3586926-1-heiko@sntec=
h.de/



