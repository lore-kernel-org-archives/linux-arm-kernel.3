Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8B0CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 18:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sPCX3mVMzNT4Z5RuBkG/Vg9y9XHCiUQQEev4rY+w3PU=; b=rtX+vOwBc9GHmSgms7N51Yk04e
	0qJtVgPbyHz3i5cyuMuyD3ooS7/kyn21Z/jGSHLechkSlOnaleir1u1xbHOblVTKgN80hCgvJm0bi
	fc8Eu1xE5iipubrk/i+r74w4P03nD6MzXcwu17CJFCoD5fsWIqRb/3lxEJUKpiX6pwo3zYXwyDARk
	HjBmRtTtURRMSGLP442iRXZh1EHfbNPyciPtSfI/rdnWlSWQD+RqIZcedy8R8j5ngPZaHdxApsOWR
	WeYgK0nssNF56qVZWLdm0Bw3Fdwa4sZRMT3pamkqkt/G4i2S4hwb/op5MwWjTUfkxVpPRSF+XjOmf
	lvlUnnxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCLl6-0000000A1fR-46gb;
	Thu, 01 Oct 2026 18:43:56 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCLl4-0000000A1eY-2EsI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 18:43:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:Mime-Version:Message-Id:Subject:Cc:
	To:From:Date:subject:date:message-id:reply-to;
	bh=sPCX3mVMzNT4Z5RuBkG/Vg9y9XHCiUQQEev4rY+w3PU=; b=QKOmOFgaJLPFepX7acnZ3c1U+z
	G1y/oRQJv2UI6RKBIpUkxLXW3fX54DHsr79QVeEihpJ0K0cgsaqV7i+KqA+KDCNoy7HOggERXPC2r
	3YpdOQa+LRSDK2iKOJB2c5Z4OD02gSriJhJgfPDH0xvPpXUgyeMRvcHKcCE2vfyLL04Y=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168] helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1xCLku-0000000076j-3pDG;
	Thu, 01 Oct 2026 14:43:45 -0400
Date: Thu, 1 Oct 2026 14:43:44 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com, Stefano
 Radaelli <stefano.r@variscite.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, Joseph Guo
 <qijian.guo@nxp.com>, Josua Mayer <josua@solid-run.com>, Ernest Van Hoecke
 <ernest.vanhoecke@toradex.com>, Mehmet Fide
 <mehmet.fide@screeningeagle.com>, Francesco Dolcini
 <francesco.dolcini@toradex.com>, Markus Niebel
 <Markus.Niebel@ew.tq-group.com>, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>, Stefan Eichenberger <eichest@gmail.com>,
 netdev@vger.kernel.org
Subject: Re: [PATCH v4 00/13] ARM: dts: imx6ul: Add Variscite VAR-SOM-6UL
 and DART-6UL
Message-Id: <20261001144344.2100854b8f5e2d81cf87b424@hugovil.com>
In-Reply-To: <arv4MwHV4LntROkN@Lord-Beerus.station>
References: <cover.1790693249.git.stefano.r@variscite.com>
	<20260929121455.437291ea4b53130e3e19778c@hugovil.com>
	<arv4MwHV4LntROkN@Lord-Beerus.station>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam_score: -2.0
X-Spam_bar: --
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_114354_645295_CC47DACB 
X-CRM114-Status: GOOD (  57.63  )
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

Hi Stefano,

On Tue, 29 Sep 2026 19:41:07 +0200
Stefano Radaelli <stefano.radaelli21@gmail.com> wrote:

> On Tue, Sep 29, 2026 at 12:14:55PM -0400, Hugo Villeneuve wrote:
> > Hi Stefano,
> > 
> > Your title seems to imply that VAR-SOM-6UL support did not
> > exist before your patch, but it did. Please rephrase that, and
> > your description accordingly.
> > 
> 
> Hi Hugo,
> You’re right that VAR-SOM-6UL already has mainline support.
> I’ll reword the title and description to distinguish the existing
> support from the new variants and DART-6UL boards.

Great to know Variscite is adding support for the DART-6UL.


> > On Tue, 29 Sep 2026 17:17:27 +0200
> > Stefano Radaelli <stefano.radaelli21@gmail.com> wrote:
> > 
> > > Add device trees for Variscite VAR-SOM-6UL and DART-6UL modules based on
> > > i.MX6UL, i.MX6ULL and i.MX6ULZ. VAR-SOM-6UL is supported on the
> > > Concerto-Board and Symphony-Board carriers, and DART-6UL on the
> > > VAR-6ULCustomBoard. The 90 new DTBs cover the supported combinations of
> > > storage, wireless and audio options.
> > 
> > Do they? You would need far more than 90 DTBs to support all options...
> > 
> > When I submitted the latest changes for the VAR-SOM-6UL, I did not
> > create DTBs for every available options knowing that it would lead to
> > an insane number of files. So I simply created a full DTB that
> > incorporated most of the DTSI options. And my custom boards simply
> > include only the required DTSI for their specific options.
> > 
> > Looking simply at the ENET phy level, you seem to have now removed
> > the two individual DTSI to selectively add support for ENET1 and ENET2,
> > but not all board use these, so that is why they
> > were created as individual DTSI files in the first place to make it
> > easier to create a DTB with only the required options. As an example,
> > one of my custom boards do not have ethernet at all, so i don't want
> > that support enabled by default.
> > 
> > Please keep the existing DTSI as distinct and individual files.
> > 
> > Maybe using DT overlays would be better suited if you really want to
> > support every available combinations?
> > 
> 
> Just to be clear about the 90 DTBs: They are the minimum set of prebuilt
> DTBs for the Variscite-supported configurations that select between
> mutually exclusive hardware alternatives. Selecting an alternative changes
> the hardware described on a SoM interface and therefore requires changes
> to Device Tree nodes, pin configuration or controller properties.
> For example, the SD interface may connect to an SD card or an SDIO wireless
> module; storage, wireless-module and codec choices similarly require
> different descriptions.
> 
> These are not every possible combination of fitted and unfitted components.
> We do not add another DTB merely because an optional peripheral is not
> populated.
> This follows the existing VAR-SOM-MX7 mainline approach: it provides
> separate DTBs for hardware choices such as eMMC versus NAND and codec
> variants, without enumerating every optional component’s presence or
> absence.
> 
> > 
> > > The descriptions use shared module, option and carrier DTSI files with
> > > SoC-specific wrappers.

Please work with the existing modular DTSI files, do not simply remove
them and reimplement them into your own files.


> > > In particular, the WM8904 and WM8731 codecs are
> > > selected explicitly instead of keeping a codec in the module base.
> > > The four existing Concerto DTBs are converted to this layout without
> > > changing their DTB names or compatible strings. This also replaces the
> > > non-working legacy LVDS panel description with the LCDIF configuration
> > 
> > Can you describe what exactly is not working? When I submitted these
> > LVDS changes I tested the LVDS panel with the Variscite concerto EVK
> > (VAR-SOM-6UL LD option) and it was working ok (also tested with two
> > custom boards).
> > 
> > If a fix is needed for this bug, this should go in a separate patch.
> > 
> 
> In an initial hardware test, the display timing behavior did not appear
> to match what we observe with Variscite’s downstream configuration.
> I will repeat the test and measure the output before proposing any display
> change. If a fix is needed, I will send it as a separate patch.

If I compare the original panel timings with the one in this patch
series, they are 100% identical, so please be more specific
and double-check this.



> > > for the Variscite display. Wi-Fi and Bluetooth enable/reset sequencing
> > > on these modules is handled by userspace, so the legacy kernel-managed
> > > power-sequence and Bluetooth nodes are not carried forward.
> > 
> > That is not ok. I specifically implemented enable/reset sequencing in
> > the kernel to finally get rid of the need for external
> > proprietary userspace scripts, and it was tested ok. If somethings needs
> > to be fixed or improved in this sequencing, fine if you submit a patch
> > to do it, but certainly do not get rid of it.
> > 
> 
> Calling these “external proprietary userspace scripts” misses their purpose.
> First because they are not proprietary :D. Second, because they implement
> the initialization procedure Variscite validates for the Broadcom
> modules we ship (talking about the brcm, the existing one in your DTSs)
> folowing the datasheet instructions.
> 
> This is not equivalent to the sequence in the existing Concerto DT.

I tested it and it works. But like I said, if adjustments need to be
made, they are welcome and can be done in a separate patch to fix it.
This sequencing is something not very well documented in Variscite
datasheets. I asked Variscite support to improve the documentation for
that aspect but it was not accepted.


> For the LWB5 option, the procedure enables WIFI_PWR, waits 10 ms,
> enables WLAN_EN and BT_EN, waits 200 ms, then lowers BT_EN before
> re-enumerating the SDIO device.
> The other Broadcom option does not use the separate WIFI_PWR step.
> The existing regulator and MMC power-sequence nodes do not express that
> complete, module-dependent procedure, particularly the BT_EN step during
> Wi-Fi initialization.
> The scripts also select the Bluetooth firmware according to the detected
> SDIO device.

Firmware loading is handled properly by the kernel without external
scripts (tested with Concerto EVK).


> We use that procedure to avoid sequencing-related failures for our
> customers.
> This approach is not new to Variscite’s mainline DTS files.

Yes, this is an old way of doing things, which may have been
appropriate in the past when proper support in the kernel was missing
to achieve the proper sequencing, but no longer true these days, unless
I am mistaken.


-- 
Hugo Villeneuve

