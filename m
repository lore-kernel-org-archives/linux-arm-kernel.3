Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7507DCD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 21:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aT19v/akBh/92rAN6rbnhCv4aQeTgCXIVPX2AHaFqvM=; b=Po4kXQyRVIUevxyVqgviwvgh2k
	p9iLEenri8t318lUqEd/UqJRjqL17ihHEWu4xMMRGA+sDXiiZMikptsoBrvltlW4LEUNRAFIZg/lv
	5Ul88Fq7B0yNvpr6wJ4SCRwPK6g0tB4UGyv1TvxSil2KKhIvwNCGBlfT80TZ6fUFZz7UI+Y0wtHPq
	+nGnkM9x3z/6HVgRtPV2cBHsSuosCzJW33g367yK7qC6zf6b5mLcJAaFDNmCcMmB9J4tY8GOb/6U4
	3tS2PR92h+jQGCxxeWjUmWfqfsNESoaEPkht9WhjerEhFrvdz6g2yPaxb5YcEpOgbqRWo3bbuVSpS
	ZpeWQoxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP5vr-0000000H2sZ-11Cn;
	Mon, 18 May 2026 21:55:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP5vo-0000000H2rz-2peh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 21:55:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D4E832AC;
	Mon, 18 May 2026 14:55:17 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF1313F7B4;
	Mon, 18 May 2026 14:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779141322; bh=YD8ys6Cvuh2mZbnirI1fsh8QprXFw+273S/FOd5w6Kk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XxmKvM1Kytq9wmpk2HPJ0TY3hWfXQD4nJPkDZj7nb3h9B23qMrJU8MTQGMxMJJ9pY
	 uZRd7JxzqNLCnP+gCI74gIfE1GKZSZN3XHtrQTGvRWaTo0bUuQ6FbLZm3+WrE6zsca
	 whJVdCaKYHw4idToRhdsK05umXIIlpYXakZRt0tY=
Date: Mon, 18 May 2026 23:54:32 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
Message-ID: <20260518235432.07537260@ryzen.lan>
In-Reply-To: <04da68168f92b196cce4d49c766fc62702bf6472.camel@gmail.com>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
	<20260510201644.4143710-4-alexander.sverdlin@gmail.com>
	<agr9m_tidBr6Cu2h@collins>
	<04da68168f92b196cce4d49c766fc62702bf6472.camel@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_145524_849780_ABA4E20F 
X-CRM114-Status: GOOD (  31.81  )
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

On Mon, 18 May 2026 22:05:25 +0200
Alexander Sverdlin <alexander.sverdlin@gmail.com> wrote:

Hi Paul, Alexander,

> thanks for the review!
> 
> On Mon, 2026-05-18 at 13:52 +0200, Paul Kocialkowski wrote:
> >   
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
> > > new file mode 100644
> > > index 000000000000..65b094f30bf5
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi  
> 
> []
> 
> > You should add:
> > 
> > 	chosen {
> > 		stdout-path = "serial0:115200n8";
> > 	};  
> 
> I actually have it in .dts, but it's theoretically possible to deploy
> the core board in a way that serial0 is *not* a console, so the above
> probably will not be valid in all cases in .dtsi.

I am with Alexander here, to me the serial port belong into the
helper board .dts, not the SoM .dtsi.

> 
> > 
> > 
> >   
> > > +&reg_dcdc2 {
> > > +	regulator-always-on;
> > > +	regulator-min-microvolt = <500000>;
> > > +	regulator-max-microvolt = <1300000>;  
> > 
> > Should be:
> > 	regulator-min-microvolt = <900000>;
> > 	regulator-max-microvolt = <1300000>;  
> 
> 0.81..1.2v according to A133 Datasheet Revision 1.1 Jul.14, 2020?

Do you have the CPU OPPs for this board? Do they slightly
overclock/over-volt the core? We have seen this for some other boards.
But you could go with the safer 810mV...1200mV range, and we adjust
this when needed.

> 
> >   
> > > +&reg_dcdc4 {
> > > +	regulator-always-on;
> > > +	regulator-min-microvolt = <500000>;
> > > +	regulator-max-microvolt = <1300000>;
> > > +	regulator-name = "vdd-sys";  
> > 
> > Should be:
> > 	regulator-min-microvolt = <810000>;
> > 	regulator-max-microvolt = <990000>;
> > 	regulator-name = "vcc-usb-sys";  
> 
> I'm a bit puzzled here: datasheet says 0.9..1.0v
> and it has no "Typ" value, similar to VDD_CPU, but
> VDD_SYS is not part of OPP tables, so who is going
> to adjust this? Or shall it be just
> 
> regulator-min-microvolt = <950000>;
> regulator-max-microvolt = <950000>;

There is indeed no exact value to be found. Just go with whatever the
BSP used: either it's the PMIC reset value, or it's adjusted by boot0.
If you have a BSP kernel booted, check the value of this regulator on
the Linux prompt, then use this value. Chances are it's indeed 950mV,
as used by the Liontron board.

> 
> ?
> 
> >   
> > > +};
> > > +
> > > +&reg_dcdc5 {
> > > +	regulator-always-on;
> > > +	regulator-min-microvolt = <800000>;
> > > +	regulator-max-microvolt = <1840000>;
> > > +	regulator-name = "vcc-dram";  
> > 
> > Should be:
> > 	regulator-min-microvolt = <1100000>;
> > 	regulator-max-microvolt = <1100000>;
> > 	regulator-name = "vcc-dram-2";
> > 
> > ALDO2 is the main DRAM supply, this is the second one.  
> 
> Core schematics mentions 1.1V/1.2/1.35/1.5 on this rail...
> Currently U-Boot has CONFIG_AXP_DCDC5_VOLT=1100, but potentially
> this is adjustable, right? At some point LPDDR4 chips they
> are soldering today will be unavailable. And in the current
> market it will happen rather sooner than later...

We don't support multiple DRAM types for one board, really. If they
switch to another DRAM type, we will need a new DT or some other way to
adjust this (potentially runtime patched by U-Boot). But we can address
this when we get there, so just set the 1.1V that LPDDR4 requires for
the existing boards right now.

> 
> >   
> > > +};
> > > +
> > > +/* DCDC6 unused */
> > > +
> > > +&reg_dldo1 {
> > > +	regulator-min-microvolt = <700000>;
> > > +	regulator-max-microvolt = <3300000>;
> > > +	regulator-enable-ramp-delay = <1000>;  
> > 
> > Should be:
> > 	regulator-min-microvolt = <1800000>;
> > 	regulator-max-microvolt = <1800000>;
> > 	regulator-name = "vcc-pg";  
> 
> Do suggest to drop vendor's
> 
> regulator-enable-ramp-delay = <1000>;
> 
> in all cases?
> 

I don't see this used in many other mainline DTs, mostly it's just for
some picky peripherals (PHYs). So if that works stable for you without,
I'd drop all of them.

> > > 
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts
> > > new file mode 100644
> > > index 000000000000..ccbca5d0a40c
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts  
> 
> []
> 
> > > +	aliases {
> > > +		serial0 = &uart0;  
> > 
> > The is best added to the core dtsi.
> >   
> > > +	};
> > > +
> > > +	chosen {
> > > +		stdout-path = "serial0:115200n8";  
> > 
> > Ditto.  
> 
> But it only physically materializes in Helperboard, the carrier.
> Potentially this one can be left floating or used for something else.

As mentioned above, I agree on this staying in the helper board .dts,
and it not being moved.

Cheers,
Andre

