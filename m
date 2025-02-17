Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EB0C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 09:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3EY+jNj4UwnDAQ6YicrxbADHJO/7EvFXIpu5Hh8B3/U=; b=aik3BzgT5UbmjBJQ6jVJK2JT3G
	VzA7ATXQw/P13Dudv1q6mpfSOhZKVh5+ZzlCc4UqIGyz+AJxTA/s9E1ydEGCFLoTotVzK27xrIhao
	K5bbF6/oNLm0GcbEyuzAE1MBsGw66sFva4OqZbQ47Oh5Xkpk3TI8Bto9EeBNrBdrg6EQDv9ewMiP7
	WHWouB3Cp9Ab7njCptbiP93OzpsXpYQ7yxuY4lth3Gc7vUo0PwqmzpKTMZ5Wb499mayS5meCM8DA9
	rmx2hCJXu1Nsz0gmVYwHX+h3cvTRK7H0gNIHR+LMUy0LhDx/1mhI9LGr8HnreRkzTTruP7xd61vQY
	3a4I11Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxWo-00000003wnl-08W7;
	Mon, 17 Feb 2025 09:35:02 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxEI-00000003tq7-2kN2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 09:15:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2E2FB14832A5;
	Mon, 17 Feb 2025 10:15:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739783749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3EY+jNj4UwnDAQ6YicrxbADHJO/7EvFXIpu5Hh8B3/U=;
	b=xTkSOCEHHSf+HQqMdf/50S7wUNjzN5A0O+8wdVTuPZ0ezA1Yf6Z6nZ6VdecYlRIW/UmqnT
	+TKGoBXEf+hmlle4orH7Vfg42bf9jYRDiXi5eeuKbGP+OgEUWX83LUw8mrcgl7pbJjlH1x
	NdCXbNq2aSprewdPhrdn2YD4/G6kR4bKUre3iwWEHXHl7RxoSwaFTiSBV6291LhqWKF3S1
	yk4ahqS7oxRn+S8eSd5J6Lz9pwDpkQ+ceGlhrNujAELwyaPMelONaDERuU3naTbzOvJ2hK
	fCDCdpBQxrVdjcOYqHpdGIxfpE9pOWJQlJDTFGxYM0kI+OOO6P6GFr/yhvOGHQ==
Date: Mon, 17 Feb 2025 10:15:42 +0100
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH] ARM: dts: microchip: Move address/size-cells properties
 to SoC dtsi
Message-ID: <20250217-jogging-retention-c1947d68bac8@thorsis.com>
Mail-Followup-To: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Peter Rosin <peda@axentia.se>,
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
References: <20250204165205.2375940-1-ada@thorsis.com>
 <c04fc470-5ac7-4cef-98ef-5f06c3315ce4@tuxon.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c04fc470-5ac7-4cef-98ef-5f06c3315ce4@tuxon.dev>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_011555_304336_9128E6F4 
X-CRM114-Status: GOOD (  20.88  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, Alexander Dahl <ada@thorsis.com>, open list <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Peter Rosin <peda@axentia.se>, "moderated list:ARM/Microchip \(AT91\) SoC support" <linux-arm-kernel@lists.infradead.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello Claudiu,

Am Mon, Feb 17, 2025 at 09:05:47AM +0200 schrieb Claudiu Beznea:
> Hi, Alexander,
> 
> 
> On 04.02.2025 18:52, Alexander Dahl wrote:
> > Avoids warnings with board dts files enabling ethernet-controller node
> > together with phy child node(s).
> > 
> > Signed-off-by: Alexander Dahl <ada@thorsis.com>
> > ---
> >  arch/arm/boot/dts/microchip/at91-dvk_su60_somc.dtsi    | 4 ----
> >  arch/arm/boot/dts/microchip/at91-sam9_l9260.dts        | 2 --
> >  arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts | 2 --
> >  arch/arm/boot/dts/microchip/at91-sam9x60ek.dts         | 2 --
> >  arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi    | 2 --
> >  arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi  | 2 --
> >  arch/arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dts    | 2 --
> >  arch/arm/boot/dts/microchip/at91-sama5d2_xplained.dts  | 2 --
> >  arch/arm/boot/dts/microchip/at91-sama5d3_xplained.dts  | 4 ----
> >  arch/arm/boot/dts/microchip/at91-sama7g5ek.dts         | 4 ----
> >  arch/arm/boot/dts/microchip/at91-tse850-3.dts          | 3 ---
> >  arch/arm/boot/dts/microchip/at91-vinco.dts             | 3 ---
> >  arch/arm/boot/dts/microchip/at91rm9200.dtsi            | 2 ++
> >  arch/arm/boot/dts/microchip/at91sam9260.dtsi           | 2 ++
> >  arch/arm/boot/dts/microchip/at91sam9263.dtsi           | 2 ++
> >  arch/arm/boot/dts/microchip/at91sam9g45.dtsi           | 2 ++
> >  arch/arm/boot/dts/microchip/at91sam9x5_macb0.dtsi      | 2 ++
> >  arch/arm/boot/dts/microchip/at91sam9x5_macb1.dtsi      | 2 ++
> >  arch/arm/boot/dts/microchip/sam9x60.dtsi               | 4 ++++
> >  arch/arm/boot/dts/microchip/sam9x7.dtsi                | 2 ++
> >  arch/arm/boot/dts/microchip/sama5d2.dtsi               | 2 ++
> >  arch/arm/boot/dts/microchip/sama5d3_emac.dtsi          | 2 ++
> >  arch/arm/boot/dts/microchip/sama5d3_gmac.dtsi          | 2 ++
> >  arch/arm/boot/dts/microchip/sama5d3xcm_cmp.dtsi        | 2 --
> >  arch/arm/boot/dts/microchip/sama5d3xmb_cmp.dtsi        | 2 --
> >  arch/arm/boot/dts/microchip/sama5d3xmb_emac.dtsi       | 2 --
> >  arch/arm/boot/dts/microchip/sama5d3xmb_gmac.dtsi       | 2 --
> >  arch/arm/boot/dts/microchip/sama7g5.dtsi               | 4 ++++
> >  28 files changed, 28 insertions(+), 40 deletions(-)
> > 
> 
> There are some other warnings triggered by these changes:

Are these somehow mixed due to parallel building?  Some lines don't
make sense to me.  I tried reproducing with `make dtbs W=1` now, and I
think I identified three warnings which match your output.

> 
>   DTC [C] arch/arm/boot/dts/microchip/at91sam9m10g45ek.dtb
> ../arch/arm/boot/dts/microchip/at91rm9200.dtsi:213.29-225.6: Warning
> (avoid_unnecessary_addr_size): /ahb/apb/ethernet@fffbc000: unnecessary
> #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
> property
> /home/claudiu/repos/linux-microchip/build-arm32/arch/arm/boot/dts/microchip/at91rm9200ek.dtb:
> ethernet-phy: 'reg' is a required property

Not sure how at91sam9m10g45ek comes in here, but for at91rm9200ek this
warning is due to eth having a phy subnode without explicit <reg>
address.  I could not determine the address from looking at RM9200-EK
schematics, which states the board would have a DM9161E PHY, and the
datasheet of that PHY.

The at91rm9200.dtsi is just used by two other dts/dtsi files, which do
not have a phy sub node.

We could _not_ add the address/size properties to the eth node in
at91rm9200.dtsi, which would probably make this dts warning go away.
This would violate dt bindings however, namely net/cdns,macb.yaml and
net/ethernet-phy.yaml … so I'm not sure how to proceed here?

> ../arch/arm/boot/dts/microchip/sama5d3_gmac.dtsi:66.29-77.6: Warning
> (avoid_unnecessary_addr_size): /ahb/apb/ethernet@f0028000: unnecessary
> #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
> property
>   also defined at
> ../arch/arm/boot/dts/microchip/at91-sama5d3_ksz9477_evb.dts:50.8-58.3
> ../arch/arm/boot/dts/microchip/sama5d2.dtsi:382.29-393.6: Warning
> (avoid_unnecessary_addr_size): /ahb/apb/ethernet@f8008000: unnecessary
> #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
> property

Contrary to other boards using the sama5d2.dtsi the
at91-sama5d2_icp.dts uses a "fixed-link" subnode instead of
"ethernet-phy@?" subnode.  According to
Documentation/devicetree/bindings/net/cdns,macb.yaml this looks okay
to me.  Not sure why dtc throws a warning here.

Same for at91-sama5d3_ksz9477_evb.dts using sama5d3_gmac.dtsi

So in my opinion all three are problems with .dtb where I have no idea
how to solve that:

- microchip/at91rm9200ek.dtb
- microchip/at91-sama5d2_icp.dtb
- microchip/at91-sama5d3_ksz9477_evb.dtb

Suggestions?

Greets
Alex


