Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E76CAC589
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 08:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xYnn6eq9zDJfEhefiTAt9k41NDwuDU+EuoU6E1ypT30=; b=SOFL9xBiMv9voH9xUT6AkZLQwl
	gIql1dJQ92bLpuvcw1/nj5JJXsaR2mNj5fulLlGfJ/sw3ggxkLdL8V05jva3GhD9x3J7V9KnHII0Z
	5pc/R7GwDY6ZSy4K0Bc+J7VbkwXiPt1NjfFsLwbsHlSTthoiOsoHyAic6aW23pSLG7wph1O8zucr8
	7kLIyejuv1mmCBrcwLlbC5/oyJ6HPnrJ8r7L5Gq8svJkYd5vlt32ppkVj3aRZlDp1ZZlP+5a8Nn41
	40LnaNJfiqA4hYymwlRNsaoxtiZAzuOg3xjFH739QUZbTZzR0VFMaxJwnei7zaFmkp8esOEKwHlWa
	Zyiyxy7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtyG-00000005fCh-38dR;
	Tue, 09 Sep 2025 08:45:01 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsZR-000000055w8-1wTd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 07:15:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=xYnn6eq9zDJfEhefiTAt9k41NDwuDU+EuoU6E1ypT30=; b=TEW/akYEAvobwhIwNwLHv1OxsP
	TRvqluGtzgOR/IiAz81Ld1z7p+3NwOuRxtoTDzhgrNzF8lPVlbe5GmVwmDd9YupEcWQtoUuatEIzM
	998FaTxhLFWOIlVKDaSG+TCicA4A68/EfPtXUMNML4HI+j+7Dq0JPy6zJr+mu2BKYQwXytm+/pTy0
	gPRk2F4bj6M3Vv8ykYlxo1PgAFWix22zQoH7JUnCGDRI6agb2naeYKPzkOsMStQbcSvFM/8n86tCb
	2Xi+0hTV4n5mIBa9X8aAMu9W8pXWAFeD4UlWPwcgEOcOBN57mThT67qAVlrHginNntb8fMq6XQ+aN
	K1eI9LHg==;
Date: Tue, 9 Sep 2025 09:13:50 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Rob Herring <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Andreas Kemnade <akemnade@kernel.org>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alistair Francis <alistair@alistair23.me>, Liam
 Girdwood <lgirdwood@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: mfd: sy7636a: Add missing gpio pins
 and supply
Message-ID: <20250909091350.7732243e@akair>
In-Reply-To: <20250909004458.GA2311693-robh@kernel.org>
References: <20250906-sy7636-rsrc-v1-0-e2886a9763a7@kernel.org>
	<20250906-sy7636-rsrc-v1-1-e2886a9763a7@kernel.org>
	<288f0cf1-1ee4-4eba-b059-641120bb93f3@kernel.org>
	<c879f3e1-f64c-4cbd-97ec-646d06488d8e@sirena.org.uk>
	<20250909004458.GA2311693-robh@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_001517_496973_0A3DF35C 
X-CRM114-Status: GOOD (  15.39  )
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

Am Mon, 8 Sep 2025 19:44:58 -0500
schrieb Rob Herring <robh@kernel.org>:

> On Mon, Sep 08, 2025 at 03:34:00PM +0100, Mark Brown wrote:
> > On Sat, Sep 06, 2025 at 02:01:25PM +0200, Krzysztof Kozlowski wrote:  
> > > On 06/09/2025 11:09, Andreas Kemnade wrote:  
> >   
> > > > +  en-gpios:  
> >   
> > > enable-gpios, unless it is something else, but then please explain in
> > > the description.  
> >   
> > > > +    description:
> > > > +      If EN pin is not hardwired, specify it here to have it set up.
> > > > +    maxItems: 1  
> > 
> > It seems reasonable to name the property after the pin on the device?  
> 
> Yes, but in general we've standardized on reset, enable, powerdown, etc. 
> rather than all the possible variations of those names. At least with 
> 'reset', standardizing it has bought us the ability to handle it with 
> the reset framework rather than every driver implementing its own GPIO 
> twiddling.
> 
ok, then I will do
EN -> enable-gpios
VCOM_EN -> vcom-en-gpios (as is)

Regards,
Andreas



