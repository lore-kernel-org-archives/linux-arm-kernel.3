Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABDFC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 18:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qoSIZeEZItfdQePn3xpCH5SMAbZNHhyWtQWXr+rp4aI=; b=OTIG+b0M3ktPUoET/a7l2P2Bu5
	2+Tcq02iXy+2Ojc3Cd2cFuv45Gn1wlSgqfGNPAsqCx6HugP77FVdawqXwLsGr5WriBEcQRPnwk8g2
	h8w1N2BALmgVAwBSUCDfuXLxOt71MFi1J3EQHXgV6gmGhSFcvDI9/DZ0bwxtVglGdjZXN30U8hxcb
	D0jAiNPk7FiDrbwP9B3h+CjK8e2aCnVtq+6ei2dcNOAas6GiXtgA0/k7zlvRR462rZ0UdyVv7y157
	r62D90yRAoEfNaKY+vE1azBlH7FyPm0q//Djg0ZP3pegup9MLRo3uqIQmkzrzA/TTnA5zvrb6pTcJ
	m6nkvlQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqFjb-0000000BpVP-1ndY;
	Thu, 06 Mar 2025 18:14:15 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqFeI-0000000BoCn-2UR6;
	Thu, 06 Mar 2025 18:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qoSIZeEZItfdQePn3xpCH5SMAbZNHhyWtQWXr+rp4aI=; b=r5sEDRIGxBH5f3gyz69wvRQSgC
	t7CIcyI+U1fP26VBt8p8YKwZFGcGW3bvpz8Z5Vvzsq+xzhjX/qmWP2+LuRDlfBkasaCAMhh84pJKs
	6ho59zt56Lv+Wbr07v4wpaMNgLx4T505ik1wUHZS6IGOhM3mca8GbssBhJztcPkhhBIjCi+guQ9cR
	lrBqyIUlEJwqu2ITq4EII85fjWKwmJeNgfwDmAmBapvG7dw0a/trEaxmpotVMPbqYBoqt0dfpGV2c
	YpsnWiEEf1NKxxRknYHSq+f2quCO2svAH2xIQ/H8k4lx7CGYb0XFuCuY8sYSh5h73ZdfaXCOyvlBy
	aX6mzrJA==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tqFeA-0005TK-H2; Thu, 06 Mar 2025 19:08:38 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>, Jonas Karlman <jonas@kwiboo.se>
Cc: Yao Zi <ziyao@disroot.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add rk3528 QoS register node
Date: Thu, 06 Mar 2025 19:08:37 +0100
Message-ID: <117081043.nniJfEyVGO@diego>
In-Reply-To: <cdbc1556-4662-4078-a4d6-33545e2e2491@kwiboo.se>
References: <20250306123809.273655-1-amadeus@jmu.edu.cn>
 <20250306123809.273655-3-amadeus@jmu.edu.cn>
 <cdbc1556-4662-4078-a4d6-33545e2e2491@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_100846_650865_97B30160 
X-CRM114-Status: GOOD (  18.30  )
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

Am Donnerstag, 6. M=C3=A4rz 2025, 17:55:16 MEZ schrieb Jonas Karlman:
> Hi Chukun,
>=20
> On 2025-03-06 13:38, Chukun Pan wrote:
> > The Quality-of-Service (QsS) node stores/restores specific
> > register contents when the power domains is turned off/on.
> > Add QoS node so that they can connect to the power domain.
> >=20
> > Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 160 +++++++++++++++++++++++
> >  1 file changed, 160 insertions(+)
> >=20

>=20
> These QoS node are typically referenced from power domains so that the
> PMU driver know what QoS to save/restore when a power domain is power
> cycled.
>=20
> Vendor kernel only reference the two qos_gpu nodes in it's power domains,
> do you have any documentation or knowledge about what power domain the
> remaining QoS are related to?

I think the GPU actually is the _only_ fully switchable power-domain on the
rk3528. The other powerdomains seem to be always on, but can do this
idle-request thing.

At least that is what I'm reading from the pm-domain definitions in the
vendor-kernel, combined with a look at the pmu section of the rk3528 TRM.


Heiko



