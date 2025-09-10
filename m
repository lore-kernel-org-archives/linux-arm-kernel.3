Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4659BCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 19:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uhFI9oI1xsX/5VketVeksgJo6o20zmCCJbkUrT20l+4=; b=QK5F8uBopnMhMAj7FMkZRVzq6I
	iHIDH5JMTY035ovWxY7LqR4dvpfUFAf5uPUdAMT1YX4sBUYKDNu330uQUliuKslfW9s1CqMkgt6U9
	lzY0udkQpzps0GKaTVf+iKaDyoKWXWyzYr0Kw8D6cw49owTF2XRlAztlWPAEeKltnZkC/F6+yuWos
	gwyl6Q9DF74EtXgfHqgT9aZmcvEPa1JeD6ks0VcyfM9MbnhBDdE2MJFjy6kkIE8onMPGbPsPbBq2a
	+dz2pgA3WrwFFof8qyzpJA4383//YdCQmA2d/3iYO06k2dyeI0Bp9yHS43y80wi97aBIpUKnei9II
	djLwkvWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQNk-0000000GFSV-1l5V;
	Wed, 10 Sep 2025 19:21:28 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQNh-0000000GFQ3-0N9y;
	Wed, 10 Sep 2025 19:21:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=uhFI9oI1xsX/5VketVeksgJo6o20zmCCJbkUrT20l+4=; b=Zg95o4qdhQ3n5T72uj5V2eaTxd
	VbPPVM1DcFUw4tMgnKoPHVlb0k+AZnZmGRS51s0Wnh5SGPnQo5N8OZKxcMeK+ggYYA55asJBryyPA
	LMTUVzjI7nOygkIJM6AHGAnADS8cbzoUK8SgKF3g6PM41ibsclMNJiFouUQaScYlVIou8iadwnEaB
	oysIgeMbqjDsnStF/iIe/B/zaVxOeBi6O3YjSTAWHZhBck6On3L4zUooO0wUCUrMR5nG5ht9Yv7lE
	orCYm7q2L5QFLHmHJhlOieOS4GXp3ZoMAlUvsVYhWL6nX7JOv0/fk3meEy9Ybv5hfsOy3kGawWqgL
	ojyrPRKw==;
Received: from i53875b8a.versanet.de ([83.135.91.138] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uwQNM-0003mh-8i; Wed, 10 Sep 2025 21:21:04 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Collabora Kernel Team <kernel@collabora.com>,
 Michael Riesch <michael.riesch@collabora.com>, Vinod Koul <vkoul@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, stable@kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v4 0/7] phy: rockchip: phy-rockchip-inno-csidphy: add
 support for rk3588 variant
Date: Wed, 10 Sep 2025 21:21:03 +0200
Message-ID: <2070639.PIDvDuAF1L@diego>
In-Reply-To: <175752285211.484319.18097786132863236205.b4-ty@kernel.org>
References: <20250616-rk3588-csi-dphy-v4-0-a4f340a7f0cf@collabora.com>
 <175752285211.484319.18097786132863236205.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_122125_423532_DEB92157 
X-CRM114-Status: GOOD (  16.04  )
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

Hi Vinod,

Am Mittwoch, 10. September 2025, 18:47:32 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Vinod Koul:
>=20
> On Wed, 03 Sep 2025 19:04:48 +0200, Michael Riesch wrote:
> > Habidere,
> >=20
> > The Rockchip RK3588 features two MIPI CSI-2 DPHYs (not to be confused w=
ith
> > the two combo MIPI DSI/CSI CPHY/DPHY blocks). The CSI-2 DPHYs can be
> > supported using the existing phy-rockchip-inno-csidphy driver, the nota=
ble
> > differences being
> >  - the control bits in the GRF
> >  - the additional reset line
> > This patch series adds support for this variant.
> >=20
> > [...]
>=20
> Applied, thanks!
>=20
> [2/7] dt-bindings: phy: rockchip-inno-csi-dphy: make power-domains non-re=
quired
>       commit: c254815b02673cc77a84103c4c0d6197bd90c0ef
> [3/7] dt-bindings: phy: rockchip-inno-csi-dphy: add rk3588 variant
>       commit: 5072b8e98eef4685a5a9a8bae56072cb65a2ef69
> [4/7] phy: rockchip: phy-rockchip-inno-csidphy: allow writes to grf regis=
ter 0
>       commit: 8c7c19466c854fa86b82d2148eaa9bf0e6531423
> [5/7] phy: rockchip: phy-rockchip-inno-csidphy: allow for different reset=
 lines
>       commit: 260435153c90c8e90553e456ec43578834a14a71

question, what happened to patch 6?
  [PATCH v4 6/7] phy: rockchip: phy-rockchip-inno-csidphy: add support for =
rk3588 variant

or is it just missing from this mail?

Thanks
Heiko



