Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F12C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 23:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IDtwWb0I3ZbjG83Ioei4u8MKC7IgqlZ7y/hl1YOfWOY=; b=TwYRfgsa7WmbIoo3fxqt0QILkm
	4wysqHs+QrY5DzyvxGOqhOIO/mxbXLFeRI1bz+7L8i0xTB63vdrgYyiROHXSNgwPX5nGzDQgPSCNw
	vT/9LbiIRPYSJuG+TfP4IVLucEl2TXCw2FyYd3WNwCrSwdXdNelclQVC4HUrKfR7bKa+zfQGb0OsY
	gMY7IQjMpsvx4LWOx7N9nXxI3I+S+iK1viALi6g9M7N8r0s8OVPYrEfKs7iGCkmjAgd9Hf8iZVzO8
	ZXRnIiTjjtBnBPMFW5xHDxWaijtqR3YFv/70bO7pSEOcKyjnpD7fVQZTrWr5WHbooGGQV2YKculrA
	tWGZBLWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkt7U-0000000FasW-3X6d;
	Wed, 19 Feb 2025 23:04:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkt2s-0000000FZXf-3HKO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 22:59:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 14CD15C547E;
	Wed, 19 Feb 2025 22:59:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF696C4CED1;
	Wed, 19 Feb 2025 22:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740005997;
	bh=GAeIj8FmQR0knadcmGgigmXGl4izDzATSQxm6mP/rGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ueb9zaXDZ361ZoSo0F5ov30MAW/Gn3Qi85zXJUHST/CtziaiTrmS2WRscB7H/dTpv
	 zN7OuwNn4UhOf824Ob3fWzYzGLbUwtaX53JOOROaj3q7mcQoSUQklfyApzM0WM+UaV
	 QQlQXX7qlRC/EGBugvPt8AE2iFOp7lXv8yjrIC7Cq4GLwwxtdm1S4aB6R8m6Tv+LkL
	 PE9h81sZ5pCZfixa5Qpz296zbBiXUAaltYLRr0J5q6k+QV6YioeqZVkzYZYVEc5RIu
	 xm1uV1mt+2Z9Ih9k7d7zqQ9r+oDozYtz1ipfiF5Ubqs278IQpAICflrNM1j60EQj/p
	 2HZcdpEbjq9OQ==
Date: Wed, 19 Feb 2025 16:59:56 -0600
From: Rob Herring <robh@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH 2/8] dt-bindings: watchdog: sama5d4-wdt: Add sama7d65-wdt
Message-ID: <20250219225956.GA3127467-robh@kernel.org>
References: <cover.1739555984.git.Ryan.Wanner@microchip.com>
 <3c55e634f2993ac5a49e1b8bfceb2333e175d376.1739555984.git.Ryan.Wanner@microchip.com>
 <a1ebb518-ff69-4dff-a8b4-7c3b716450a5@tuxon.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1ebb518-ff69-4dff-a8b4-7c3b716450a5@tuxon.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_145958_862085_67CF1DB7 
X-CRM114-Status: GOOD (  15.50  )
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, Ryan.Wanner@microchip.com, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, alexandre.belloni@bootlin.com, vkoul@kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, krzk+dt@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Feb 18, 2025 at 10:42:36AM +0200, Claudiu Beznea wrote:
> 
> 
> On 14.02.2025 20:08, Ryan.Wanner@microchip.com wrote:
> > From: Ryan Wanner <Ryan.Wanner@microchip.com>
> > 
> > Add microchip,sama7d65-wdt compatible string to the dt-binding documentation.
> > 
> > Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> > ---
> >  .../devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml        | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml b/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
> > index cdf87db361837..e9c026194d403 100644
> > --- a/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
> > @@ -23,6 +23,9 @@ properties:
> >            - const: microchip,sam9x7-wdt
> >            - const: microchip,sam9x60-wdt
> >
> 
> You could have keep this new line after the items section that you've added.
> 
> > +      - items:
> > +          - const: microchip,sama7d65-wdt
> > +          - const: microchip,sama7g5-wdt
> 
> here.

Please do.

> 
> >    reg:
> >      maxItems: 1
> >  
> 

