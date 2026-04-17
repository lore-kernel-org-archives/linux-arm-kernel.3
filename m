Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DAFF99C69
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 23:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LXShsoJFEcOkkjkNCh05aoYzhZtRefc51zZSNE5SZj4=; b=qun6q56muGvDuezJIbS09GNp35
	AYaAr7LBnCXywYkyfq4syiOLe0QKm0whcbkhj58GejltD0OFNPEW6M3OByKPB5Og8T8R8jGNKtSVY
	bNHJ2/Pm98wtfInKaL9/B0Zcz+XcayiVl3kVTkBPQnk0h9fyd7EngjZgD+7a6U7vroCNfZbCvIk8c
	5KoEqw+TtMSQ1zgZt4gkvPx6zyp2YGtArjeLww9th+qbzZwZpIhlbLNURnoHQIOoyiu4VT0Dtt2XR
	aaI/SEF7QnRnp2xygkoRgZXms8LtYLyOfRvn3bPh7RoBdN0Qdc4hUWN7TvJlhaUEZaHp49c4cBDPz
	/QYstYMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDsSL-00000004YYG-0XYO;
	Fri, 17 Apr 2026 23:18:37 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDsSJ-00000004YXr-0R7e;
	Fri, 17 Apr 2026 23:18:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=LXShsoJFEcOkkjkNCh05aoYzhZtRefc51zZSNE5SZj4=; b=DeC9ygfOFFj4CMaWmxYUuQpZ55
	1pOMIP3QKI+esMBW6G3McrxUE6+pQOr1Lb0k+B8pgJTu/1cUGVSyVfdc0892/qd5uOvYb9PUAy6zx
	xomV2ahHqFS6eld/SXnCQtSH/2gdmc+Vi0cWu883diDKLI5cC1AZBFPE16jS4VkRuwd6n7tHndWe+
	O6JZIrDSu3WVVi/b60qC1Cmz3b3kZHNMrwNKaX+cdrC2dUb3FRVzGrg3AoRwN5kLwTYg/G6gYnhZ9
	rstNNw4rq5UZV7j5c+TzUuSdsLGmS38dRfAPkx7S5n0d8ADVJV7MBLTTfNlT9MIRZzqS+k94PQUhp
	VUpEkztA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/40] arm64: dts: rockchip: Wire up frl-enable-gpios for
 RK3576/RK3588 boards
Date: Sat, 18 Apr 2026 01:18:29 +0200
Message-ID: <2435759.n0HT0TaD9V@phil>
In-Reply-To: <70e9a8a0-414d-428f-8da8-9b65cc764849@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
 <2297365.1BCLMh4Saa@phil>
 <70e9a8a0-414d-428f-8da8-9b65cc764849@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_161835_167998_95C35539 
X-CRM114-Status: GOOD (  15.57  )
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

Hi Cristan,

Am Freitag, 17. April 2026, 19:55:17 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Cristian Ciocaltea:
> On 4/17/26 2:34 PM, Heiko Stuebner wrote:
> > Am Freitag, 17. April 2026, 11:24:34 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Cristian Ciocaltea:
> >=20
> > [...]
> >=20
> >> Cristian Ciocaltea (40):
> >>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-100ask-dsha=
npi-a1
> >>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-armsom-sige5
> >>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-evb1-v10
> >>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-evb2-v10
> >>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-luckfox-cor=
e3576
> >>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-nanopi-m5
> >>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-nanopi-r76s
> >>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-roc-pc
> >>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-rock-4d
> >=20
> > I do think one patch per SoC (rk3576, rk3588, rk3588s) would make more
> > sense, because these patches really are mostly identical :-)
>=20
> Yeah, apologies for the large number of patches, I went this way to allow
> per-board reviews.  As previously noted, I tried to identify the GPIO pin=
s from
> multiple sources, so I'm not entirely sure about the accuracy in every ca=
se.
>=20
> Would it be preferable to squash the patches per SoC and board vendor, in=
stead?

I really would just do it per soc .. so 3 patches. That is a size that is
still reviewable for people, who can then check for their board.

If the patch is labeled "Add frl-enable-gpios for all RK3588s boards", I
do expect people to notice it the same as "oh _my_ board gets changed".
("all" could also be "most" :-) ).


Heiko



