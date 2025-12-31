Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D125EE6432
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 12:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9rLreqkh3KOaBoBE6zwFaHYZmSbkF23wTl1G/WkHYfM=; b=gcUOS+ogxa40GaHGguuVABzIi5
	NZcov9F51KQgGg9QOY79Couh8DP+g4sYggWMlQO8e1oIAYKFAvpYvhfssU2JfDSRkiDRFLULar8ex
	xH2oy5bnn+QgC1FJSGx/zgzsLgSIcjQMvegEAojy6hzCKprVavfFWEvNlyDhMFFD6IFlOEZmyK/sz
	EbX6J/pMdPNURyS3/ZhBHB7b8O2UhL9CpYOgwpJMpbLd8uHW27uepqSUhO/JhxtbQ7Tb30WUDAmuK
	B8tyuB1kc+a4aG/YBnM44oer8UkVNEIK0RHnkoTRbKK6qY53f6310LQYwUeSzDd4ihc1NAPkf5gDW
	B/6TSotQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vavK3-00000005yiB-1qSC;
	Wed, 31 Dec 2025 12:29:03 +0000
Received: from mail-4318.protonmail.ch ([185.70.43.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vavK0-00000005yho-02nn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 12:29:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail2; t=1767184133; x=1767443333;
	bh=9rLreqkh3KOaBoBE6zwFaHYZmSbkF23wTl1G/WkHYfM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gW97Na2EOh7XeoR+ZPLRj590d53u8hvmVD5biXySbGbYF8aaTo8wu/pS4/4xzLwzi
	 5mmO8XPtCeBJz57RtvTSKzDdV7aRQR1RVf1jVv1ys1GEL/wKlt+ORrvVP4hSwQ/+Ij
	 rrp0cIFFJ5BcUvKcxduCVogMEfVSNuaaMA67x106ReSZSs0S0yewhxnKror9lLcrDs
	 +MkN27KPRpKWKmBrumZqOHYMWRPfoEtbNY4a7uLb0fgzwXd7Nx0guoMQUe8bGYM3fV
	 ee1U0WmxIUxJUzGoefq8t8UOQZVKWUBVNLsYMA+E4Fa0jzBonnivbwVl+oVeT4iWM7
	 S3UxlorkVCk5g==
Date: Wed, 31 Dec 2025 12:28:50 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Alexandru Chimac <alex@chimac.ro>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: samsung: Add exynos9610-wakeup-eint node
Message-ID: <yB5WFgsxeeqHQgi87UeNPD8K2OlQbWWC6-BovxADBtgusN3n8UOrm7Gi6jz6Th0dsMA9J-LEpx69sWjNmWTH_-jx9r7AgvXNTwR2hQW7-SM=@chimac.ro>
In-Reply-To: <20251230-dramatic-gregarious-stallion-15bc07@quoll>
References: <20251228-exynos9610-pinctrl-v2-0-c9bbeee4c54b@chimac.ro> <20251228-exynos9610-pinctrl-v2-2-c9bbeee4c54b@chimac.ro> <20251230-dramatic-gregarious-stallion-15bc07@quoll>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: 438c4b314bd6f15975c0d8bc145d9e4161d2dfb1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_042900_907187_BE6060F9 
X-CRM114-Status: GOOD (  15.80  )
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

On Tuesday, December 30th, 2025 at 11:51, Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
>=20
>=20
> On Sun, Dec 28, 2025 at 06:05:52PM +0000, Alexandru Chimac wrote:
>=20
> > Add a dedicated compatible for the exynos9610-wakeup-eint node,
> > which is compatbile with Exynos850's implementation (and the
> > Exynos7 fallback).
> >=20
> > Signed-off-by: Alexandru Chimac alex@chimac.ro
> > ---
> > .../devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml |=
 2 ++
> > 1 file changed, 2 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-=
wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,p=
inctrl-wakeup-interrupt.yaml
> > index f3c433015b12..deb2730855bd 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-=
interrupt.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-=
interrupt.yaml
> > @@ -48,6 +48,7 @@ properties:
> > - enum:
> > - google,gs101-wakeup-eint
> > - samsung,exynos2200-wakeup-eint
> > + - samsung,exynos9610-wakeup-eint
> > - samsung,exynos9810-wakeup-eint
> > - samsung,exynos990-wakeup-eint
> > - samsung,exynosautov9-wakeup-eint
> > @@ -107,6 +108,7 @@ allOf:
> > contains:
> > enum:
> > - samsung,exynos850-wakeup-eint
> > + - samsung,exynos9610-wakeup-eint
>=20
>=20
> This is not needed. Device has 850 fallback, no?
It's not required, but I guess it would make the device tree look better. I=
f this patch isn't to be merged, it doesn't functionally affect anything so=
 it can just be dropped instead of requiring another patchset revision.
>=20
> Best regards,
> Krzysztof
Best regards,
Alexandru Chimac

