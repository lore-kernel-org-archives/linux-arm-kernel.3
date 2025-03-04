Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDD5C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 21:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uxNa2xeS196LOQdsSVTCf0UBNg0lInB0Ngjf92IZMMQ=; b=3BO9lJeLhl+QlnztgrqxM46wXQ
	Sqe2zoaw1VMa3WTJ5RYZNaPjhHkZvTkgzNVdQi4d4mYRwCbZjmCA8M9HA4Sofz2mndgsrLXHQGyo8
	ET1RT8r1gR4rewk7Ya8bThQ1S4o2Kjzb3JVBssg/+eLzQdCknyeJHsp6tzBzcfgodsvgGtQu9SRxF
	M11IIrAFa4Ps5hFU2bMPTqeupjWD0WW0KVBbnU2bBk0lzA8AxBw1UJ4y+1+GUc04+zEO6kLCiw9aC
	NO4Acq3OtnZqznVQ3XnUA7f/L4lPrnE18M6Qqu1xYyMss4ZFBN4NBJatBMZpZQWB63F0IIwjaR9T5
	L8tLgPqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpa9m-00000006KqQ-2XcE;
	Tue, 04 Mar 2025 21:50:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpa6i-00000006KZj-1b2L;
	Tue, 04 Mar 2025 21:47:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=uxNa2xeS196LOQdsSVTCf0UBNg0lInB0Ngjf92IZMMQ=; b=kEUS1jn0x7GxLZ9luvznJLXhMS
	/kWop1uCm40nx+xhjJvD7XNL+uPF2k0svAqkblZvYzcs2r4sbo2zhk3db3UVZSDCsayMP/N1DkPz7
	boZkvh7JKivduUM8oSAlHO4VH3Y1z0XCdA82XNGVLq/9My4fGHcVZUPkRYX6PUtK+34VXQVS2mrA+
	pm5hgnjAw2Z0i5ib/YrWE9ncKh09KJX0IEqYxJ2x1/DY119MIVzrsF5+6qIX676GJA5Ag2oC2zx6W
	nHxcVoCxSkZOvGsGXTfmRCceyAylcy57eTb9HqR/TnHKjsbJkgIdWJMl9l+bRqosX/WwSiKu77bTA
	1XXof2VA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpa6f-000000049T3-17rW;
	Tue, 04 Mar 2025 21:47:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uxNa2xeS196LOQdsSVTCf0UBNg0lInB0Ngjf92IZMMQ=; b=2lT3k8ic7danUGuqxwuLtt6Iw8
	t6+7hypSeCHM7GIXT3rORlcEucP11RGm/xAEkiaodt3/JNB7pEc5SmliOv90QkC3ZHs8nX6kTVeEw
	9rJqE3p85oGvqhdq6UEWGDTQjHhkITxRNlax1rnIXngZdrnc2kLSFLbkDU3xKh6wuWIYczPohm9Bc
	tNUWr7Be/mKuirvsFU3fWTdrDgjXSUooU1/Nk7rgOAwcvz0v+VOulyfGBY5OS4nmkSRm1xPH8Zc+T
	ByGnUVS7Dx9+o46rtAEppq8QgUTiQji1M+TIgsTMWl5ZWYuv4klJdsBUge5z1hbtHMZFcGMr/5dEN
	QImZ8Dwg==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tpZdB-0006GI-Qt; Tue, 04 Mar 2025 22:16:49 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 detlev.casanova@collabora.com, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Add display subsystem dt node on rk3576
Date: Tue, 04 Mar 2025 22:16:49 +0100
Message-ID: <2627393.Mh6RI2rZIc@diego>
In-Reply-To: <lfmhqurnpjmfy6pfjxd5aczxujislv2p5bsurcbl7capyt7zv3@hy2twvjj53uz>
References: <20241231095728.253943-1-andyshrk@163.com>
 <173564980410.21979.2947276365464229762.robh@kernel.org>
 <lfmhqurnpjmfy6pfjxd5aczxujislv2p5bsurcbl7capyt7zv3@hy2twvjj53uz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_214717_358122_F7E29EE6 
X-CRM114-Status: GOOD (  16.26  )
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

Am Dienstag, 4. M=C3=A4rz 2025, 15:47:28 MEZ schrieb Sebastian Reichel:
> Hello,
>=20
> On Tue, Dec 31, 2024 at 06:57:21AM -0600, Rob Herring (Arm) wrote:
> > On Tue, 31 Dec 2024 17:57:17 +0800, Andy Yan wrote:
> > > As the VOP[0] and HDMI[1] driver have already been submitted for revi=
ew.
> > > This series enable hdmi display on sige5 board.
> > >=20
> > > [0] https://lore.kernel.org/linux-rockchip/20241231090802.251787-1-an=
dyshrk@163.com/T/#t
> > > [1] https://lore.kernel.org/linux-rockchip/20241231094425.253398-1-an=
dyshrk@163.com/T/#t
> > >=20
> > > Changes in v3:
> > > - Split from https://lore.kernel.org/linux-rockchip/3330586.aeNJFYEL5=
8@diego/T/#t
> > >=20
> > > Andy Yan (3):
> > >   arm64: dts: rockchip: Add vop for rk3576
> > >   arm64: dts: rockchip: Add hdmi for rk3576
> > >   arm64: dts: rockchip: Enable hdmi display on sige5
> > >=20
> > >  .../boot/dts/rockchip/rk3576-armsom-sige5.dts |  47 +++++++
> > >  arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 126 ++++++++++++++++=
++
> > >  2 files changed, 173 insertions(+)
> >
> > [...] (a bunch of warnings due to dependency patch series not yet
> > being in linux-next)
>=20
> I think all dependencies have landed now. But it might be sensible
> to do a quick resend considering how old this is.
>=20
> Would be nice to have initial RK3576 HDMI support in 6.15 :)

now we can :-)

The update was not that difficult, so did it myself when applying.


Heiko



