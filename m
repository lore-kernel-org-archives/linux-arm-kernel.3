Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1487E9410B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 10:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wm8iFenI7rV4BHDLWQQC9m1LuaI6pjS4oGcE2me2wdo=; b=Ylnx2/Dx1MeqJv43EdkXOoVNdp
	mFJ6Z6hjT5Tqup3i+2p7rbTy9Tzfwm+Fiak+Ysa19PkkyLTsrqbis1Z0EYGn1H/eEIH5NUJ3YpYJW
	ovs9lDiUw4y52bQWWydTO8J9omV8/37vUF8uZd8Cxs3eclSToCtpHYDPK7mlUiOJjs/+J//Uzmwkr
	tEG7v2teXLLCDZ/VlUOIYRT50wFNB9Mcirb4BwSRpv3MsHu/Gf6ipW9yLA37LCU8TwvH3p0b2lcni
	XRDXXoHM9KaK7UltgK8CF1nB3e+vbwFGBnmvIKp1YA0fQMGQa8b8Q+MiLyQCc/IdRvBWNFwKGsCgu
	0r421bdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbckS-000000085KR-09RS;
	Fri, 02 Jan 2026 10:51:12 +0000
Received: from mail-106116.protonmail.ch ([79.135.106.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbckP-000000085K3-0j5A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 10:51:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail2; t=1767351062; x=1767610262;
	bh=Wm8iFenI7rV4BHDLWQQC9m1LuaI6pjS4oGcE2me2wdo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=l1HqgXMmMKg/G/y/hrjp5w5NLDbzu6bAnCleWW0aF0bBOclzustHcaR8DAp2pRLxi
	 bFkR/CTrovwjKtwjlQS2uNQEML/hkYWvjG4n+znncN2B9xPsWhswjOyRngS9I7p/YL
	 Ilx4iQe5+K1ZsjbPSkDiWpjUlMyvTzM5iQGxTBhbYk6idOQQIvqvi5bpBHj6d1UnhD
	 6OhcPl0U8E7CcYGYGZWNFR3E2prkYpExHyisQtL4w62zFpbnMoI31abqpR31g1F+zH
	 TH4tSdG4f6MYI0emEcHpl5+AAs71O/Cc4mQlFpa1lHt/vJQe8z+vzdJFxLSllt1gys
	 XX0KHRKPqY9FQ==
Date: Fri, 02 Jan 2026 10:50:55 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Alexandru Chimac <alex@chimac.ro>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: samsung: Add exynos9610-wakeup-eint node
Message-ID: <SIUwFRvVetTkOo41ZvVr5kiSwjfVoFRJ9HPWVYoNFQgd06BUJSDLEdl95hV1W3INlc50uZNQppCZaA41mTA22kQfpDOjseC-PiHgyIfTCSA=@chimac.ro>
In-Reply-To: <fb98e395-d590-47f7-8dba-d9a691a2c174@kernel.org>
References: <20251228-exynos9610-pinctrl-v2-0-c9bbeee4c54b@chimac.ro> <20251228-exynos9610-pinctrl-v2-2-c9bbeee4c54b@chimac.ro> <20251230-dramatic-gregarious-stallion-15bc07@quoll> <yB5WFgsxeeqHQgi87UeNPD8K2OlQbWWC6-BovxADBtgusN3n8UOrm7Gi6jz6Th0dsMA9J-LEpx69sWjNmWTH_-jx9r7AgvXNTwR2hQW7-SM=@chimac.ro> <fb98e395-d590-47f7-8dba-d9a691a2c174@kernel.org>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: fcae599c395b499a3659dfd5541d73bbf461087c
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_025109_837784_FEB4B602 
X-CRM114-Status: GOOD (  22.38  )
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






On Friday, January 2nd, 2026 at 12:02, Krzysztof Kozlowski <krzk@kernel.org=
> wrote:

>=20
>=20
> On 31/12/2025 13:28, Alexandru Chimac wrote:
>=20
> > On Tuesday, December 30th, 2025 at 11:51, Krzysztof Kozlowski krzk@kern=
el.org wrote:
> >=20
> > > On Sun, Dec 28, 2025 at 06:05:52PM +0000, Alexandru Chimac wrote:
> > >=20
> > > > Add a dedicated compatible for the exynos9610-wakeup-eint node,
> > > > which is compatbile with Exynos850's implementation (and the
> > > > Exynos7 fallback).
> > > >=20
> > > > Signed-off-by: Alexandru Chimac alex@chimac.ro
> > > > ---
> > > > .../devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.ya=
ml | 2 ++
> > > > 1 file changed, 2 insertions(+)
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinc=
trl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsu=
ng,pinctrl-wakeup-interrupt.yaml
> > > > index f3c433015b12..deb2730855bd 100644
> > > > --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wak=
eup-interrupt.yaml
> > > > +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wak=
eup-interrupt.yaml
> > > > @@ -48,6 +48,7 @@ properties:
> > > > - enum:
> > > > - google,gs101-wakeup-eint
> > > > - samsung,exynos2200-wakeup-eint
> > > > + - samsung,exynos9610-wakeup-eint
> > > > - samsung,exynos9810-wakeup-eint
> > > > - samsung,exynos990-wakeup-eint
> > > > - samsung,exynosautov9-wakeup-eint
> > > > @@ -107,6 +108,7 @@ allOf:
> > > > contains:
> > > > enum:
> > > > - samsung,exynos850-wakeup-eint
> > > > + - samsung,exynos9610-wakeup-eint
> > >=20
> > > This is not needed. Device has 850 fallback, no?
> > > It's not required, but I guess it would make the device tree look bet=
ter. If this patch isn't to be merged, it doesn't functionally affect anyth=
ing so it can just be dropped instead of requiring another patchset revisio=
n.
>=20
>=20
> Please wrap your replies.
>=20
> I did not comment on the patch. Comments are in specific places
> discussing specific lines. I asked why do you need this enum to grow?
Oh, sorry, I thought you meant the whole commit. Yeah, it looks wrong.
Thanks for noticing, I will fix it in v3.
>=20
>=20
> Best regards,
> Krzysztof
Best regards,
Alexandru Chimac 

