Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CCFCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 08:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OMqtz21WxbMi8VBZjYtytcrz+hZpM9P8lLYQDAdVBZc=; b=U08ryuoZYkim1r6zyni4wsN6I3
	dpb0jrEcOiHNfNf3yXQbkNeaSoCYUuKBRjwO4IXYYfU0/NOkSW5RNG/pKni6gJYKzo6r9Vd5FlemI
	7WpTCxj1A6DPqnBn5Pooi9fjQwfzfAsz4B1/YvhPzvQL86y4B0Xx0G+G+l+GWS+FJkEiiahVt+uGa
	AxnaQH4aaNgL5rdk7uN5MpnR1iZum6hI4H7hn0XTLrEt0Pq/T0eQUUzlsjGUiZqLIqLhlGN7xgSmX
	LY/hb6o1y3plhAHWlZVZoGjy160TTnmBgsQwSFFIgbVBpNEj5iOyFqzdyiAK58/MFQz6szVjov8+t
	cJZyd0bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7vp-0000000GJov-2qUD;
	Tue, 21 Oct 2025 08:41:25 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7vm-0000000GJno-0Gxm;
	Tue, 21 Oct 2025 08:41:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=OMqtz21WxbMi8VBZjYtytcrz+hZpM9P8lLYQDAdVBZc=; b=JeutWjWfFw7/Z6LO+JooK0rt9M
	MhJp80ndS4eV7655BwHzm5EZqINVFQq9RCIyXPsS8ie7ScQnMmmwNGyvscr46QqnXAJ00kLUmDnXk
	anL12s+RnLboKyspfEBOqBU5Y24WFCdLEide841YtSCUv9AF1dNDy1oZEG0n/U4HxF7ugmz1okiHV
	/Tu5nLLxJQaVgT7bwwtmS4F8NYlFbZ34dEo5AchB+c2zrTEVvYbelYojpn7pfCC4508OmBOoyR392
	BM0VDanby9lrU3gzfYFZkrOfLOG2CsdRtAkHad5mRTYUdpyN5YE2MmGTo0RhubRHGaMaHpvjYd+tE
	/QKCraag==;
Received: from [212.111.240.218] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vB7vc-0001Wr-GZ; Tue, 21 Oct 2025 10:41:12 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Alexey Charkov <alchark@gmail.com>, Algea Cao <algea.cao@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Cenk Uluisik <cenk.uluisik@googlemail.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Jimmy Hon <honyuenkwun@gmail.com>, Kever Yang <kever.yang@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Muhammed Efe Cetin <efectn@6tel.net>, Ondrej Jirman <megi@xff.cz>,
 Rob Herring <robh@kernel.org>, Sandy Huang <hjc@rock-chips.com>
Subject: Re: [PATCH v2 0/5] arm64: dts: rockchip: Add device tree for the Orange Pi
 CM5 Base board
Date: Tue, 21 Oct 2025 10:41:11 +0200
Message-ID: <3720286.R56niFO833@phil>
In-Reply-To: <20251020154625.GB6159@pendragon.ideasonboard.com>
References: <20251005235542.1017-1-laurent.pinchart@ideasonboard.com>
 <2328202.iZASKD2KPV@phil> <20251020154625.GB6159@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_014122_096044_B70AEA90 
X-CRM114-Status: GOOD (  34.77  )
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

Am Montag, 20. Oktober 2025, 17:46:25 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Laurent Pinchart:
> On Mon, Oct 20, 2025 at 04:44:21PM +0200, Heiko Stuebner wrote:
> > Am Montag, 6. Oktober 2025, 01:55:36 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Laurent Pinchart:
> > > Hello,
> > >=20
> > > This patch series adds a device tree for the Orange Pi CM5 Base board
> > > from Xunlong. This is a combination of a compute module and a carrier
> > > board, so the device tree is split in two files.
> > >=20
> > > The work is based on a combination of upstream device trees for other
> > > RK3588-based Orange Pi boards and the downstream device tree, all
> > > checked against the available schematics for the carrier board. The
> > > compute module schematics is unfortunately not available.
> > >=20
> > > The series starts with three patches that add a new tmds-enable-gpios
> > > property to the rk3588-dw-hdmi-qp DT binding (1/5) and update the dri=
ver
> > > accordingly (2/5 and 3/5). Those patches have been authored by Cristi=
an
> > > Ciocaltea as part of a larger series, I have incorporated them here
> > > as-is.
> > >=20
> > > Patch 4/5 then add a new compatible for the board to arm/rockchip.yam=
l.
> > > The last patch (5/5) adds the device tree for the board.
> > >=20
> > > Patches 2/5 and 3/5 could be merged separately through the DRM tree,
> > > but patch 1/5 needs to be merged with the device tree in 5/5 to avoid
> > > introducing DT validation warnings. I'd appreciate advice from the DT
> > > maintainers regarding how to handle this, as I have been told before
> > > that DT bindings and DT sources can't be merged through the same tree.
> >=20
> > I think we generally only care about binding warnings happening
> > in linux-next.
> >=20
> > I.e. in most cases, the binding is merged with the driver and
> > the dts then into a separate tree - sort of ignoring the local
> > binding error, because everything will be fine once stuff comes
> > together in linux-next.
>=20
> Assuming they get merged together in linux-next. If there's a delay,
> linux-next will exhibit warnings for some time. I don't know what the
> rule is regarding that.

Normally once the driver-maintainer has applied binding + driver
change, I also pick up the devicetree shortly change after that.

And in most cases the driver change will be in -next the next day,
and the dts change as well or 1-2 days later.

If a CI bot complains, one then goes looking if something went wrong :-) .
But in 99.9% of cases, things just work out.


> > Speaking of bindings, does your board _need_ the frl-gpio to produce
> > any hdmi output? Like could we merge the board without the (optional)
> > gpio and then add it later, once the binding+driver have made it in?
>=20
> With a suitable pull-up I think so. I can submit a v3 with that.

I guess that might be a nice way to go, as then the main board dts
doesn't has to wait for the drm changes to be finalized :-)


Heiko



