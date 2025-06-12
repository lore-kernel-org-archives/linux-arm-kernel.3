Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D862C7113E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 06:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0ztJlo825I13kb3bxddMAoPs02kBnZ14ol1fnruaBk=; b=qIWV7aJ4KOUDgtuXpsVl9RQRKX
	H52HoSfe40OEvyxz+tMWEDgHjrb2MwwmCps9mQlgZ/RLHFJpAyEOhPRLbpZzczMNFgNrDBJWlw5W0
	Bx1lwJAzTbnDoms6VWw9PZqcogT9OfZHUaCxEU5awZpqGh1JkkhaMQI6gvtBIrqRRU3Q3NyP3SpkA
	+2WTHfJYjeP1x9ASyTk3/AMykSBSt8QHbB5SK6oXEIhZmUmLAdRui2YypWLuYfbrRbSxbPrH73Y4T
	gaEBB1mEeoVqIRnJD+VKTitfclL4cknvZqzAw5quv9UkmI3oE7vPylgu+l1fJENoz7eiL2TwLMz0Z
	vZ2Kn7wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPbK0-0000000CJ6S-3NfB;
	Thu, 12 Jun 2025 06:21:56 +0000
Received: from mail.andi.de1.cc ([178.238.236.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPbFz-0000000CISJ-0wWA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 06:17:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=d0ztJlo825I13kb3bxddMAoPs02kBnZ14ol1fnruaBk=; b=6Tnk2zpkgi0x5+D82Lxct/AdoC
	iaw89WEFQKaSURM/9N0G/vYHbWPR9syN8Lce4kYsIaHls/rp9AZHk6GIg4yPviQ5BaKOJPzss2E2b
	zkscX4co+YmrV2qUBBUQrTIlQvK4G2etPhd69AE6xW0gYWthmxZTrgkOJsGgp3CGSZphCn55JLtAZ
	vWMzvomzcm5v8y89ZxPFFYSeJDY4JqAsmel/43USago5qpkoU+xmXx0ekee6RRzRJNK/R/SDLtei6
	bE4f14YN7R6E7jJuWc0gSAjM80i2v1UsuEgN884lOfdqJp99+mO93lBpeTsfSgEhWMIBLB3DgbMgK
	uAOEWfNQ==;
Date: Thu, 12 Jun 2025 08:12:55 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Andrew Davis <afd@ti.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>, Tony Lindgren
 <tony@atomide.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros
 <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, Bajjuri Praneeth
 <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 5/5] arm: omap2plus_defconfig: Enable TPS65219
 regulator
Message-ID: <20250612081255.255be21e@akair>
In-Reply-To: <1d87fa3b-c3b9-44fd-9e61-7f1ffadcfb0c@ti.com>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
	<20250609-bbg-v2-5-5278026b7498@bootlin.com>
	<1d87fa3b-c3b9-44fd-9e61-7f1ffadcfb0c@ti.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_231747_265698_F0C8EC50 
X-CRM114-Status: GOOD (  17.18  )
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

Am Wed, 11 Jun 2025 16:13:05 -0500
schrieb Andrew Davis <afd@ti.com>:

> On 6/9/25 10:43 AM, Kory Maincent wrote:
> > Enable the TPS65219 regulator in the defconfig, as the TPS65214
> > variant is used by the newly introduced BeagleBoard Green Eco board.
> > 
> > Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > ---
> >   arch/arm/configs/omap2plus_defconfig | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
> > index 9f9780c8e62a..2ad669f7b202 100644
> > --- a/arch/arm/configs/omap2plus_defconfig
> > +++ b/arch/arm/configs/omap2plus_defconfig  
> 
> Why omap2plus_defconfig? OMAP3 and newer are all ARMv7 and
> boards with those can/should use multi_v7_defconfig.
> 
if there are enough drivers enabled there, it would work, but it is not.
So there need to be a bunch of patches to add the missing stuff.
omap2plus_defconfig is there and support for boards are added.

So I think until multi_v7_defconfig is really usable for OMAP3+, we
should stick with the name omap2plus_defconfig and add stuff.
If we rename omap2plus_defconfig to omap2_defconfig, we should imho
disable OMAP3/4/5 there to avoid confusion.

Regards,
Andreas

