Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669B9CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 07:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/d8NPHHoHLLLmfSMKxDnV22O73BappyZrrJ8bU33Oq4=; b=XkTvYqpuNzzJ2f28yBha9S5OL5
	y84PbrFFOEVMawmfQ9XyY6RPQmy+XjFp2Vh2XV+0rudyFMG8bQ7WZaTrZY2FNPR39PoWmCFvFw316
	yfvwkaj+SigdOVNBFkIl0rb2oHCPzRqx9e+tNG1TyGykG6uLE98Fn1hLrXXWfCv9D+nbTN9hhVFIY
	rh+3OVyNc2NOJhZcgG/dkrMY+/NIggyfC2bB3FKLuZnDCFkWv4yjwoJdCnYFpxkdCuOIbTC+qRKJk
	gIWJML0CaAVAGS5qwqyKC9EDJqxPlJgu3LV5YCenkOXsch0GabbmsN/VD/VN3l8Wo9ewfQuD/hjxp
	Yw/wpF2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyQDB-00000007257-1p20;
	Tue, 16 Sep 2025 07:34:49 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyQD9-0000000723y-0GSJ;
	Tue, 16 Sep 2025 07:34:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=/d8NPHHoHLLLmfSMKxDnV22O73BappyZrrJ8bU33Oq4=; b=nWPVUPfN5V9OJZVJkYajiP2J7z
	n7rLQ8eY3R8jFRO4V8BbRorqcFQMSOjp3y0hBD+AvTBcS4x2NfEuIQ/j8o9E+mGiWhPMOXGDCBt6F
	vuPV42fW4SRZv+r1VTBNfZgFcPJkKbyJbK5mVqmay2y3o12STWu82wMw/5KNZLuhLYcRPq6ts2gDs
	OO8KT2QOU9lgVcisSBM6Tq4b/VV1WQUBWtzcWgTyribLGpUXFRi0v7bXv8brcjYSfG2pinDj2IfCA
	2uCV5clSNof+eLiy+B2GK0zuFSd0cQoMF8HPrfZIrPIaD6FnpZ/6sDFnWO/VbZbbeF8GhtiMMLMV6
	8Lf289rg==;
Received: from i53875bfd.versanet.de ([83.135.91.253] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uyQCw-00066R-7K; Tue, 16 Sep 2025 09:34:34 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: "Rob Herring (Arm)" <robh@kernel.org>, Kaison Deng <dkx@t-chip.com.cn>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Peter Robinson <pbrobinson@gmail.com>, Jimmy Hon <honyuenkwun@gmail.com>,
 linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-rockchip@lists.infradead.org,
 Andrew Lunn <andrew@lunn.ch>, Dragan Simic <dsimic@manjaro.org>,
 Wayne Chou <zxf@t-chip.com.cn>, Kaison Deng <dkx@t-chip.com.cn>,
 FUKAUMI Naoki <naoki@radxa.com>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: rockchip: Add Firefly ROC-RK3588-RT
Date: Tue, 16 Sep 2025 09:34:32 +0200
Message-ID: <3034003.o0KrE1Onz3@diego>
In-Reply-To: <EEABCC59F39E8FC5+04995f9826d047eeb5f4bada25c3dd93e50983b0.camel@t-chip.com.cn>
References: <cover.1757902513.git.dkx@t-chip.com.cn>
 <175794446144.2732898.9504412064423841025.robh@kernel.org>
 <EEABCC59F39E8FC5+04995f9826d047eeb5f4bada25c3dd93e50983b0.camel@t-chip.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_003447_295717_63A4A5ED 
X-CRM114-Status: GOOD (  19.70  )
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

Hi,

Am Dienstag, 16. September 2025, 05:28:33 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Kaison Deng:
> On Mon, 2025-09-15 at 08:54 -0500, Rob Herring (Arm) wrote:
> > On Mon, 15 Sep 2025 10:22:04 +0800, Kaison Deng wrote:
> > > This documents Firefly ROC-RK3588-RT which is a SBC based on RK3588
> > > SoC.
> > >=20
> > > Link: https://en.t-firefly.com/product/industry/rocrk3588rt
> > >=20
> > > Signed-off-by: Kaison Deng <dkx@t-chip.com.cn>
> > > ---
> > >  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >=20
> >=20
> > Please add Acked-by/Reviewed-by tags when posting new versions.
> > However,
> > there's no need to repost patches *only* to add the tags. The
> > upstream
> > maintainer will do that for acks received on the version they apply.
> >=20
> > If a tag was not added on purpose, please state why and what changed.
> >=20
> > Missing tags:
> >=20
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >=20
> >=20
>=20
> Ok. Do I need to resend the next version for the missed tags?

nope, that is not necessary, I can pick up the one from v2.

Heiko



