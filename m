Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAE9C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 09:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+UDivxkzUWm8jCVEzWimvw5QQQKBgJN2rUad2RA1A+g=; b=4Q82umVuULgsr+A5xFt3yULa7p
	ieVSIKFL8atGbWcODKNNh7fBUWL212CwggGdhk290TAIMat/Xb8z79ni+Hmifro6nyQ3/TuPWFP3+
	Vds7FHJ5TGboQHEflRQIH515PqbRtN8Blir9SL9PpoHQ80qNldGMV1gYXgMuFufbFXBeL2ZFKRX6w
	v68hRVqd/QBCsqmDnvHueujrS7TFphjSwSWKuW2qUTCNMzuU2Vqd14C4W4+Q9BnE9k3rWIZzt4OEr
	2dSb32XZdYiMQ5qQoGvF4uLnpNOYhTJhpqEyzMLOk16s98KnHy6JAcU7bz0yypEGcMKjZInPhvGXf
	YabpUSBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLZk-0000000CvQK-3AJt;
	Fri, 21 Aug 2026 09:30:12 +0000
Received: from mail.zlab.su ([109.73.193.145])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLZh-0000000CvOu-187M;
	Fri, 21 Aug 2026 09:30:10 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 466D7C03D9;
	Fri, 21 Aug 2026 12:30:00 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1787304604; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+UDivxkzUWm8jCVEzWimvw5QQQKBgJN2rUad2RA1A+g=;
	b=m/RN7abP1i3juYX1BEYCFHZNhP77sGhYzJVe8mgEF64OgNjrVjZ0IqEvVloMx/3LYZqf33
	W4K8qbuJDw/so2cdCrFwUZLx7HHFFbsD3ZimrzGHNn+qOpX4EcOTWijB6xp2vIbYA810dg
	OSu7DAgJOpLaDBZKzIm+xZDDaYreq+ztL7PEP9/3kkOJTYUp3U+l7uwgQfZqUnP34TcnoP
	ejXETsBjhFWPaYLidqzETMu4IIvEgzWj6DcvFspAPNBJ5wQpLvwqDav9tfjns/xp6rYLeu
	4ai+Mu+s0S9ctAK0wc7tVE00o5NyRPGPc3Rli3PIj0BX8PJrc+XXrOgCnLYCRQ==
From: "Vladislav Leonov" <vlad@zlab.su>
In-Reply-To: <20260821-bouncy-sticky-dalmatian-4f72c2@quoll>
Content-Type: text/plain; charset="utf-8"
References: <20260816113636.33635-1-vlad@zlab.su> <20260821-bouncy-sticky-dalmatian-4f72c2@quoll>
Date: Fri, 21 Aug 2026 12:30:00 +0300
Cc: "Jonathan Cameron" <jic23@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>, "Andy Shevchenko" <andy@kernel.org>, "David Lechner" <dlechner@baylibre.com>, "Conor Dooley" <conor+dt@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Rob Herring" <robh@kernel.org>, "Jonas Karlman" <jonas@kwiboo.se>, "Simon Glass" <sjg@chromium.org>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?utf-8?q?=D0=92=D0=BB=D0=B0=D0=B4=D0=B8=D1=81=D0=BB=D0=B0=D0=B2_=D0=9B=D0=B5=D0=BE=D0=BD=D0=BE=D0=B2?= <vlad@zlab.su>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
MIME-Version: 1.0
Message-ID: <9425cd59-7b78-7e0e-5d7f-aaff876ce8d6@zlab.su>
Subject: =?utf-8?q?Re=3A?= [PATCH] =?utf-8?q?dt-bindings=3A?==?utf-8?q?_iio=3A?=
 =?utf-8?q?_adc=3A?==?utf-8?q?_rockchip-saradc=3A?= Fix RV1106 compatible
User-Agent: SOGoMail 5.12.8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_023009_498830_FF491081 
X-CRM114-Status: GOOD (  18.99  )
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

On Friday, August 21, 2026 10:27 MSK, Krzysztof Kozlowski <krzk@kernel.=
org> wrote:

> On Sun, Aug 16, 2026 at 02:36:36PM +0300, Vladislav Leonov wrote:
> > rockchip,rv1106-saradc was folded into the fallback enum together
> > with rockchip,rk3576-saradc, falling back to rockchip,rk3588-saradc=
.
> > The two IP blocks are not equivalent, though: per the RV1106 TRM v0=
.3,
> > chapter 20 (SAR-ADC), RV1106 only has 2 channels at 10-bit resoluti=
on,
> > versus 8 channels at 12-bit on RK3588. Documenting it as falling ba=
ck
> > to rk3588-saradc allows device trees that would bind against the wr=
ong
> > channel table and report an incorrect voltage scale.
> >=20
> > Remove rockchip,rv1106-saradc from the RK3588 fallback enum and giv=
e
> > it its own standalone compatible entry, matching the dedicated matc=
h
> > table entry added by the driver patch.
> >=20
> > Fixes: bdba14f6122c ("dt-bindings: iio: adc: rockchip-saradc: Add R=
V1106 compatible")
> > Link: https://lore.kernel.org/all/20260810090826.146758-1-vlad@zlab=
.su
> > Signed-off-by: Vladislav Leonov <vlad@zlab.su>
> > ---
> >  .../devicetree/bindings/iio/adc/rockchip-saradc.yaml         | 5 +=
+---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/iio/adc/rockchip-sar=
adc.yaml b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.ya=
ml
> > index f0551d665916..dc56855527b8 100644
> > --- a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yam=
l
> > +++ b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yam=
l
> > @@ -22,9 +22,7 @@ properties:
> >        - const: rockchip,rk3562-saradc
> >        - const: rockchip,rk3588-saradc
> >        - items:
> > -          - enum:
> > -              - rockchip,rk3576-saradc
> > -              - rockchip,rv1106-saradc
> > +          - const: rockchip,rk3576-saradc
> >            - const: rockchip,rk3588-saradc
> >        - items:
> >            - enum:
> > @@ -35,6 +33,7 @@ properties:
> >                - rockchip,rv1108-saradc
> >                - rockchip,rv1126-saradc
> >            - const: rockchip,rk3399-saradc
> > +      - const: rockchip,rv1106-saradc
>=20
> So this goes to an enum with all the other single-entries.
>=20
> Anyway, where is a driver binding to above compatible (see DT submitt=
ing
> patches). git grep on a week old next gave me nothing.
>=20
> Best regards,
> Krzysztof
>=20

Hi Krzysztof,

I will combine it into a single enum in v2.

The driver patch adding this compatible has been sent but is not merged=
 yet:
Link: https://lore.kernel.org/all/20260810090826.146758-1-vlad@zlab.su

--=20
Regards,
Vladislav


