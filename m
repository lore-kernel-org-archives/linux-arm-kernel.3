Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE5BF588E4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 15:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRPriQZt7VyS6kWuPERur2gAon2Iu5ktl6SXcUzdsKM=; b=ZGJ0rINCAfWJn5Vv1h4VwNNIcS
	TxUxbywVYEEuI+MEGSEsJ0El0SXKZv4MF19Sl9tjBdVH7ZlyEAjD0htsGLLjzMgJyAZph92O1UIxU
	1xIvvke8/VOiRzmbVwg8N6OFNpc5XPqwxGzhrmEg1W6hJCfvUdSfjCMhZO7lmF379CO7elkIpH6Qs
	0S0Teyz0XpDcaC2ecqNDspjikpzyRoR6dmLmzfygEMi49P/6G+xM79QBRkvTGVjQYs56a4BL6tjnW
	lRQHgZfQm6eLP8kx0E/2sEBBrW0fnSwzM1t1GUliLUJ4fj2RsksJAIaFriPfrKpuKeVObr7LBf48G
	RZn0GcsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqEp-00000007Dsa-3Occ;
	Mon, 20 Apr 2026 15:08:39 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqEm-00000007DsA-32Xd;
	Mon, 20 Apr 2026 15:08:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=GRPriQZt7VyS6kWuPERur2gAon2Iu5ktl6SXcUzdsKM=; b=EcmtL1ko2hxqdMPGOJSmH0gJqF
	eOk7UIZkvYbg6xm5hhyKFDcKMB5Ol4VdiX1sdFj8JeDpFC2d1q8A9aDcNCNCwFWKLf/K1C7i/J1Vf
	Zd+VD726MK8NbBhPoyjBqHH/y31NPQLrzsBaZ4oZfmHeJR4TMENXJSyb1eKCK02H+By+M61+jGCSf
	TFuE1xikDrSziT8gf9Ti+dsFl6uL9bN4JS0mwAFwS4/LOfQ8ydMKPFX3p19RJhSy5wIXuX+mypfgV
	Kkgv1IbgnFCpDavyRoOIP+Hrijao8TF1S67rwX8r7gGYKHWw+hBGWOhD/2LKYngwfraXASsozlwQT
	yhGdd50Q==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/40] arm64: dts: rockchip: Wire up frl-enable-gpios for
 RK3576/RK3588 boards
Date: Mon, 20 Apr 2026 17:08:26 +0200
Message-ID: <2744059.tIAgqjz4sF@phil>
In-Reply-To: <66f9574c-8dff-4de2-bf54-20f1c1e64c24@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
 <2435759.n0HT0TaD9V@phil>
 <66f9574c-8dff-4de2-bf54-20f1c1e64c24@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_080836_780912_714CAAD1 
X-CRM114-Status: GOOD (  20.20  )
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

Hi Cristian,

Am Montag, 20. April 2026, 13:10:27 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Cristian Ciocaltea:
> On 4/18/26 2:18 AM, Heiko Stuebner wrote:
> > Am Freitag, 17. April 2026, 19:55:17 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Cristian Ciocaltea:
> >> On 4/17/26 2:34 PM, Heiko Stuebner wrote:
> >>> Am Freitag, 17. April 2026, 11:24:34 Mitteleurop=C3=A4ische Sommerzei=
t schrieb Cristian Ciocaltea:
> >>>
> >>> [...]
> >>>
> >>>> Cristian Ciocaltea (40):
> >>>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-100ask-ds=
hanpi-a1
> >>>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-armsom-si=
ge5
> >>>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-evb1-v10
> >>>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-evb2-v10
> >>>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-luckfox-c=
ore3576
> >>>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-nanopi-m5
> >>>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-nanopi-r7=
6s
> >>>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-roc-pc
> >>>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-rock-4d
> >>>
> >>> I do think one patch per SoC (rk3576, rk3588, rk3588s) would make more
> >>> sense, because these patches really are mostly identical :-)
> >>
> >> Yeah, apologies for the large number of patches, I went this way to al=
low
> >> per-board reviews.  As previously noted, I tried to identify the GPIO =
pins from
> >> multiple sources, so I'm not entirely sure about the accuracy in every=
 case.
> >>
> >> Would it be preferable to squash the patches per SoC and board vendor,=
 instead?
> >=20
> > I really would just do it per soc .. so 3 patches. That is a size that =
is
> > still reviewable for people, who can then check for their board.
> >=20
> > If the patch is labeled "Add frl-enable-gpios for all RK3588s boards", I
> > do expect people to notice it the same as "oh _my_ board gets changed".
> > ("all" could also be "most" :-) ).
>=20
> Ack. =20
>=20
> I would still keep the more invasive changes =E2=80=94 such as those touc=
hing
> the regulator hacks =E2=80=94 in separate patches, though.

sure, that sounds perfectly reasonable :-) .

Heiko




