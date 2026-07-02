Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BDFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8BWKyXVtcU1aypz3TbPj5gFArFFOSYSIbmVQ2MSXUbc=; b=vnsdLpAHJLbEC+hq3cWla8Jc0J
	UHL3Fo3am5qtgp8m9id0n3i8WwLKWcrwK9UwfJFi1pDNFzqXMsEkSLpzg1Y7iLXkWOb0V3nj2aM5M
	rOToaRDp+O0HeMkdsF/fyyAxw5bC4NgtcJIhbhyNO5Sb4WEDe6Iv5nglsUJuk+TRdwwhtxyg/rTcV
	eEaQv7mqXzRKlfwEhGOPJdWvLt2oPYSyBDibGMPqd9LnNGMOQiHjPUISTxrSnIoMRDN7uzSzN4IsN
	+iEKVr1hbjriagCfRJvUfFpQMKxf20Egu04eUXS5kVkF1n0RF2pBtGviLvXcg3XgmtMXbJQxyrL4I
	jyYcxvwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKUW-000000052bQ-2xdF;
	Thu, 02 Jul 2026 16:42:20 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKUT-000000052aA-3C6b;
	Thu, 02 Jul 2026 16:42:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=8BWKyXVtcU1aypz3TbPj5gFArFFOSYSIbmVQ2MSXUbc=; b=Gh4yA0CjfBzQMYw+w02KsUA+fF
	ztrApVsVi2MusGUVZp4iEF/Gk+GJukF8T4u7eAYy/511gB2XClPj4s3M5/wVq9Qk0QhuW0kXT6ITz
	LNrQhfcTLIDpfIfIU7iCGG89Qnav9aVloi3J/qh8nVGLmFWgCDmnLNmuvlzbwuR895lhl9OGm3OxR
	qwi/6W+EzNVi4+jgoXdfTarwbjr+VvyPDA0ORr7/8JuynSvQg/+dLgaD8sc5Zdk4UH1MNX51o6pqk
	gTyfm2326qpd8JQzoYc8t0fk77XGNSFJgun8WSgBnaTAlM3kLui18eNUP2ChiQelzRjz6Low3KX5M
	0JpUaBBg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
 linux-can <linux-can@vger.kernel.org>, 1579567540@qq.com,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, kernel <kernel@pengutronix.de>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Eric Biggers <ebiggers@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Karl Mehltretter <kmehltretter@gmail.com>, Yixun Lan <dlan@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: can: rockchip: add rk3588 CAN-FD compatible
Date: Thu, 02 Jul 2026 18:42:06 +0200
Message-ID: <4310510.6PsWsQAL7t@diego>
In-Reply-To: <636d10c0-670d-4586-b604-7559d2a24185@kernel.org>
References: <20260702140654.2961561-1-1579567540@qq.com> <2459655.BjyWNHgNrj@diego>
 <636d10c0-670d-4586-b604-7559d2a24185@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_094217_799158_7A2FB004 
X-CRM114-Status: GOOD (  15.85  )
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

Am Donnerstag, 2. Juli 2026, 18:39:53 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Krzysztof Kozlowski:
> On 02/07/2026 18:01, Heiko St=C3=BCbner wrote:
> > Am Donnerstag, 2. Juli 2026, 16:06:51 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb 1579567540@qq.com:
> >> From: Cunhao Lu <1579567540@qq.com>
> >>
> >> RK3588 integrates a Rockchip CAN-FD controller variant that is not
> >> fully compatible with RK3568v2. The RX FIFO count register field is
> >> encoded in bits 7:5 on RK3588, while RK3568v2 uses bits 6:4.
> >>
> >> Add a dedicated rockchip,rk3588-canfd compatible to describe this
> >> variant. Do not use rockchip,rk3568v2-canfd as a fallback, because that
> >> would describe a register layout that does not match the hardware.
> >>
> >> Changes in v2:
> >> - Use enum for the single-compatible entries, as suggested by Krzyszto=
f.
> >> - Reword the commit message to explain the hardware difference instead
> >>   of referring to Linux driver match data.
> >>
> >> Signed-off-by: Cunhao Lu <1579567540@qq.com>
> >=20
> > after fixing  Krzysztof's comment:
> > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> >=20
> > and doing dtbscheck of the binding against the dt-patches:
> > Tested-by: Heiko Stuebner <heiko@sntech.de>
>=20
> Makefile/build level steps are not testing. Please don't provide such
> tags for bindings. Otherwise all bindings would carry Rob's tag, because
> he wrote the bot which does such testing.

ok ... will keep that in mind for the future


Heiko



