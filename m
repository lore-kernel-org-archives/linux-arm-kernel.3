Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 322CFCAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0LgwfZ9wkEAtJ94bNBrquAEb0mXoUgSOBRfwjUSoLhY=; b=FvafBr4TKxKpm3R4oy/sr7a+Eo
	iBcO5PsW3Yp40qz7k3SF5+Brzervb8DSWfjtykt9xXS3inrybnOUYX6r8ksKWZ/HZQWwN1srt9+EP
	eIbBYiuvyv7FE4MNMfo8sOEEn1D32j0Lq1wLymyaO0fjr7/hytaYOFNeSRP6WMs+Nz85eZ2BbZM6F
	k8jRMhv9td0bVuPzMaXQ03HHK3J4MlpvHQCh1JkMbVLCFHtqz6lYtbMok9KyeIgGwlD3lEif2Fv/X
	IXEURlUlRT+szo4fk22JAQERhAI7/BOiOfc5TqfJTR6NfA+jRmUjAWlRQylGW7+uGmbilCTQro2Uc
	LHpFWT+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvacU-0000000GrfO-2BHK;
	Mon, 08 Sep 2025 12:05:14 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvZWh-0000000GUa3-14Fw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 10:55:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=0LgwfZ9wkEAtJ94bNBrquAEb0mXoUgSOBRfwjUSoLhY=; b=7X7U2Xu2eOqFWTYsVy6vs1y2oY
	0qG6OglqIbcf2y9/F6qWOOyWDeRwMGACXkuOBkf0KyklP4boGFnIgTIZ0mXik2Wcg4H8Hc2jVRPCb
	vcr+fihtypb3Byy6CV8pu7S0bsd2tdMXI5UHzHfnP7XsC9y80TqZZWqgIsJYRB5wlj3Sgy3SlBA/W
	J0LYtlK+vNe/iS3RKltZRnMAlhsR6qA50w/ZNqiwgOTe0a7MFEfHOSjA68xamZxSrICNHnJSQU5Hl
	BkqPRnD2CHRWGcQB51w5qo3D/jWYnlckF46g+bG2mEEUwhMR6gdfse9oiZJ+ysc3yvpY5NxePkYay
	KVA4IT3g==;
Date: Mon, 8 Sep 2025 12:54:49 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andreas Kemnade <akemnade@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Alistair Francis <alistair@alistair23.me>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: mfd: sy7636a: Add missing gpio pins
 and supply
Message-ID: <20250908125449.0b1443cf@akair>
In-Reply-To: <288f0cf1-1ee4-4eba-b059-641120bb93f3@kernel.org>
References: <20250906-sy7636-rsrc-v1-0-e2886a9763a7@kernel.org>
	<20250906-sy7636-rsrc-v1-1-e2886a9763a7@kernel.org>
	<288f0cf1-1ee4-4eba-b059-641120bb93f3@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_035511_307905_89C3A159 
X-CRM114-Status: GOOD (  19.33  )
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

Am Sat, 6 Sep 2025 14:01:25 +0200
schrieb Krzysztof Kozlowski <krzk@kernel.org>:

> On 06/09/2025 11:09, Andreas Kemnade wrote:
> > To be able to fully describe how the SY7636A is connected to the system,
> > add properties for the EN and VCOM_EN pins. To squeeze out every bit
> > of unused current, in many devices it is possible to power off the
> > complete chip. Add an input regulator to allow that.
> > 
> > Signed-off-by: Andreas Kemnade <akemnade@kernel.org>
> > ---
> >  .../devicetree/bindings/mfd/silergy,sy7636a.yaml         | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml b/Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml
> > index ee0be32ac0204..08ad593e237f1 100644
> > --- a/Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml
> > @@ -32,6 +32,22 @@ properties:
> >        Specifying the power good GPIOs.
> >      maxItems: 1
> >  
> > +  en-gpios:  
> 
> enable-gpios, unless it is something else, but then please explain in
> the description.
>
My idea here was to have it crystal clear which hw pin is meant since
there are two pins which enable-like functions. But since you agree
with the name for the other pin, I can live with enable-gpios here,
as long as EN pin is mentioned in the description.

Regards,
Andreas

