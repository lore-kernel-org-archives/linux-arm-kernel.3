Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4C3CA100B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 06:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iX6E278sLnenR0ElEl7fBs88lDGzWQdjTL8gZ1XkMuQ=; b=D0qN6swVT9FQr5csBP8OHBaD/g
	bI3/jdsOqxzyMahtCqBGWMgQ/sjXIxnKpfG2CESmow5ii4f9fA7y762E1GblIiIrkEZ4/4MDt0KKP
	JefUrmmsPkw8SH5Ju46pr0hvYGX/LRN57uoOk9KayLLzZq87liRV/kZaqh7PXb8+D3vHaU79aUGN+
	zHf7TgFj2eD5N7J2uSg9rGodZ/6jEWMnTX3OwPy/fvhAIHco5GkrbfYJNl6tdRcTYpu5iELtXtXvd
	peQPxoA9NZXGzlHn1M39yXaRcsGzCo5JN2KVIGplobEjZcEbxtfX/Aon3wOjmULO33GKXh3fmtYSE
	HOydKYiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthP2-00000004pxt-0IDg;
	Wed, 03 Sep 2025 06:55:32 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthLg-00000004o2I-3W3q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 06:52:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1756882321;
	bh=iX6E278sLnenR0ElEl7fBs88lDGzWQdjTL8gZ1XkMuQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dAHoAAqaJCfLWv6t/f4kUcLxb4ed9cEPu8uYgdRqon2TC5yW7HPgF4I3f+d7kIIrd
	 HD/2tREDqXOl3kP5qf9DzVqylPq6JZd8JvlxLr0WbyxJeZCppIGrM90WtcWTMeAqgx
	 vdCR4coU5Dc5OaC8G9KUMIiDtGywshOBQEYWeze1jz1dFVQXTTrWSNPTiH/RpWCMrR
	 Z0A1pPWpYjmf9L4oZ8Rs2hkjuAoVDX2z+3zo5ZBGwRgBY0DHoH7trP/vMCaiemfnaB
	 1rxVGui1XlMhDkeNIs7crK3W9K/s9WmwzW9cikY6D6y7GVWwLcqNszRtEwLV71GiPa
	 RzbNftqiDUHWQ==
Received: from [IPv6:2405:6e00:242a:e4ac:24d9:ee83:45da:199b] (unknown [120.20.133.19])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6799D6445D;
	Wed,  3 Sep 2025 14:51:58 +0800 (AWST)
Message-ID: <360776d4dd765dc2c98f0c1b718fe63d4a8a70d4.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: Fix/add I2C device vendor prefixes
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Rob Herring (Arm)" <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Date: Wed, 03 Sep 2025 16:21:56 +0930
In-Reply-To: <307fa87eb552ac4a1f6dd6139450786195e3892a.camel@codeconstruct.com.au>
References: <20250815230841.3487764-1-robh@kernel.org>
	 <307fa87eb552ac4a1f6dd6139450786195e3892a.camel@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_235205_067616_11454931 
X-CRM114-Status: GOOD (  17.52  )
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

On Wed, 2025-09-03 at 15:01 +0930, Andrew Jeffery wrote:
> Hi Rob,
>=20
> On Fri, 2025-08-15 at 18:08 -0500, Rob Herring (Arm) wrote:
> > The ASpeed DTS files have various I2C devices with missing or incorrect
> > vendor prefixes in their compatible strings. This hasn't really mattere=
d
> > and doesn't impact ABI compatibility as I2C devices get matched with th=
eir
> > vendor prefix stripped.
> >=20
> > With this, the "maxim,max31790" nodes now validate and have some
> > warnings. Remove the spurious "#address-cells" and "#size-cells"
> > properties to fix the warnings.
> >=20
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > =C2=A0.../aspeed-bmc-arm-stardragon4800-rep2.dts=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +-
> > =C2=A0.../dts/aspeed/aspeed-bmc-facebook-harma.dts=C2=A0 |=C2=A0 8 ++--=
---
> > =C2=A0.../aspeed/aspeed-bmc-facebook-minerva.dts=C2=A0=C2=A0=C2=A0 | 24=
 +++++--------------
> > =C2=A0.../aspeed/aspeed-bmc-facebook-tiogapass.dts=C2=A0 |=C2=A0 2 +-
> > =C2=A0.../dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dts |=C2=A0 2 +-
> > =C2=A0.../dts/aspeed/aspeed-bmc-opp-palmetto.dts=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +-
> > =C2=A0.../boot/dts/aspeed/aspeed-bmc-quanta-s6q.dts |=C2=A0 4 ++--
> > =C2=A07 files changed, 14 insertions(+), 30 deletions(-)
> >=20
>=20
> I see you've applied this to your tree. Sorry for being slow on the up-
> take, I've been focusing on other things recently. Happy to take it
> though, if you're happy to drop it?

Actually, do you mind dropping it from your tree? It conflicts with
Krzysztof's patch that I'd already applied:

https://lore.kernel.org/all/20250819131743.86905-2-krzysztof.kozlowski@lina=
ro.org/

I've applied your patch here with a note in the trailer:

https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git/commit/?h=3Da=
speed/dt&id=3D61a913644a8c5b6c8bd9da09f78f88e50edfaeb

Andrew


