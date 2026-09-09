Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1725C79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 07:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vSmlUZNoD842yAgOOnJ5dfY6tdwXPa3MRt5dvciHVg=; b=2IDGWhJ10THrF5u+ApWCTlJCzP
	KIhOog7uY8riZFmXj2D5A3VX1ZAS1nCjOcdBu2uEnMDo3bNczgvCc80sPJnB4n14Ixkk0QoXvwNsp
	95GfVfxdLoEug1drzgOwA0LCT4znTCxjwgsHtXPlCVwZ6la3SIAZJQIpx2v0XznlRhnSTmrWt6T3Z
	b9CFpOd1mCcG2dW3+dNKPGUMu3BMhvqGn4WF9N9MKJ1BQwOjW90gsHxg0c+ASu8dhhSPidiUIBCmb
	uHC865HwpGQsRnzLEPQROBI3QqOdmJuDbfXEUyxTHHtK93uFl99UZGXxYo09BazXW5B09maMfxtDM
	cCsSownA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Cmp-0000000AzXo-1ea1;
	Wed, 09 Sep 2026 07:32:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Cmo-0000000AzXb-1Out
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 07:32:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C3A76601FE;
	Wed,  9 Sep 2026 07:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F52A1F00A3A;
	Wed,  9 Sep 2026 07:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788939121;
	bh=1vSmlUZNoD842yAgOOnJ5dfY6tdwXPa3MRt5dvciHVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VeKxFVIt+DF7mFO51IB+xdzSa94T+4yM7OeehXzAJyo8fuJZ6GgWa8sEdHGA/owkR
	 12LZipugyJTsnbISBrT+I2JNoUiiGlBdFBzX6oSy3lpV/dJxvE/EsLHQ8m9gT3vR2z
	 M8XXTVoAUd9Ef/cAaaS4BMHfCOIvIQSMPWFDoAkZilwALLFRM5Bzd67pbHblOLwSzr
	 u6MNpSijUQ2TVQ56gPlmczPuE8IgBIY7nEmgPMjH6alefnlep2UZy9RoxVhssOR6h1
	 ip3qZyPEascUmGAM4KXOPpBg6p0EXmtLdBB3UH12YiQ3ct2RTUpPFevmUQwfz9g9V5
	 Q2VmSm/1ZCc6A==
Date: Wed, 9 Sep 2026 09:31:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Yureka Lilian <yureka@cyberchaos.dev>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 4/6] dt-bindings: interrupt-controller: apple,aic2: Add
 apple,t8140 compatible
Message-ID: <20260909-advanced-marble-lorikeet-eebeef@quoll>
References: <20260904-apple-a18-pro-initial-devicetrees-v1-0-0c25401d165d@cyberchaos.dev>
 <20260904-apple-a18-pro-initial-devicetrees-v1-4-0c25401d165d@cyberchaos.dev>
 <4e65ef39-cf1b-49d4-a899-da36acb442c2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4e65ef39-cf1b-49d4-a899-da36acb442c2@gmail.com>
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

On Sat, Sep 05, 2026 at 04:25:36PM +0800, Nick Chan wrote:
>=20
> Yureka Lilian =E6=96=BC 2026/9/5 =E5=87=8C=E6=99=A83:49 =E5=AF=AB=E9=81=
=93:
> > The Apple t8140 (A18 Pro) SoC uses an AIC3 as interrupt controller, sam=
e as
> > the M1-M4 SoCs.
> >
> > Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> > ---
> >  Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml=
 | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/app=
le,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple=
,aic2.yaml
> > index 1cb886785173..e3cadc5ad39d 100644
> > --- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2=
=2Eyaml
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2=
=2Eyaml
> > @@ -46,6 +46,7 @@ properties:
> >                - apple,t6030-aic3
> >                - apple,t6031-aic3
> >                - apple,t8132-aic3
> > +              - apple,t8140-aic3
>=20
> the title should be "... Add t8140 compatible" describing the hardware co=
rresponding
> to the added compatible since the compatible being added is not "apple,t8=
140".

Commit msg is correct, it does exactly what you wrote, no?

>=20
> (Alternatively, if you mention the compatible in title, say "...Add apple=
,t8140-aic3" as
> "compatible" is already implied)

That would be repeating diff, so not really helpful.

Best regards,
Krzysztof


