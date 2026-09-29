Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE4ACA5FAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 17:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XT6rzbwAq56nChpqUTQ2q9VsJKHTV6VFi8vBlbe3c+g=; b=yyb2UCuW/1PTWFLOvWBnl/7eWk
	RAbaKefb/1kzGYqgI+OdMyc1TZqCu9kCWMCNX6l/8DA4v+rgng4N68DYTOwwveAlY3xx4pdYCjCAW
	rt6E344zJbo79DE1IZg2lA4mM3/LJrWzBijFJKg2biwPWvkiAZkQp9t26If4L6imjil+alWD3zaBO
	fuJlMW+AVe/GJBnFSLJIoJGoOMcDF3SpeKOspvkhD03KrzMQO52TIeQtU/Jx9dDxaMoVPpAtcvecr
	Ld33UbPHbaSeCOJL8jPpvk4hMvS0Tz2RArNFFIzX+1toezabkYjuC/yPe0HCAbqD8HhcP5AOC6l/J
	E5BnX3Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbpM-00000004DUe-0MDs;
	Tue, 29 Sep 2026 17:41:16 +0000
Received: from mail-wm2-f13.google.com ([74.125.225.141])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbpJ-00000004DTj-3Tvq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 17:41:15 +0000
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so33833335e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 10:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790703671; x=1791308471; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XT6rzbwAq56nChpqUTQ2q9VsJKHTV6VFi8vBlbe3c+g=;
        b=NuS1kZF3cimdYw0FhHFO8C9qF1o4KeVWgFZNHFE753CcXkd4hGk3Efy5L7Ze/BFSOh
         uvCTkvOhb23PEBBxwcxDvuCRnfrO74bHw7++qO/FeO+Q2XdqXEq87x+HzTe5MeLdEcJf
         HyVwapjIqPpe96hWX3vqMoLvgFX2gZCD1rYrqdYa81/z5HuuhsdIXqe3Xkx0qSP4DZfM
         TTffnY41kEvmeDXoFifq2eS1K22R3VZ7RhCGVRwFCYlQIC17gFvCSDrQaDzy48OcE2mP
         fcHH+o9yIhbrtjloQJrfe0O+M6wpJYOZtdzu6qEiIz7vwBqgJorJ5tb0VVni0daIOm2l
         xEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790703671; x=1791308471;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XT6rzbwAq56nChpqUTQ2q9VsJKHTV6VFi8vBlbe3c+g=;
        b=rK0Qvwb0fT9luLGeVZIPcoCELk+DLJOtBUkET0o9maCSfPWr46F/QYWjuyyo9499sS
         W3uGOK4H3BxOEK3ZgSL8YcEGzh5Tq9s7CiZNxNH/v0WV9GEZVmRSb0su8SfONzeePlpw
         M8BCE59n0WO8Jwpgge+7nLOZqK1Z9tv1Zy8CC/KV/L+jkXX04HIP0SXc7xvgjGH1YSla
         KZxQHaJw1IxzmuOLCuG4Y6cgfgTNMoyk8Wa7cAgnSud1qKbojVbUb9OljU0kHHTakOtE
         +8tITNJ6U/kfO5M5/9yTfI/S+vjCO13gxytLMW1UJHNmMWfETCbF+sUpm9+9WL5tRdNh
         eiSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrUAT9BrXVLdhdsWryN3PebBawDn41iNDPTv+6+bB4P2x7Ym5WuoyjZNohKjhgKzRht1z53yKbZF9FWTxoAlQj@lists.infradead.org
X-Gm-Message-State: AFuF++lwsIjicwHgKrbZ5ahPyb1Vxm7igeRmS51qKhaCsAp4V3aJ/oIY
	33uyEQqtGSzn2N3QRl5yvojSHJ6oGvKNDPwckQlj1DAo8/fA+Q++WE1O
X-Gm-Gg: AYBFou3umbdTYWOp9FF3r5nbmtDXPE4kIkmVBEdXFBvighHlevff2+gmVjC+yOj764t
	cyf2KIl9qDK0+k4m2P+AlEgNjvmZ+SArBE0ZBIn6MXGXQPHPU8BtoZCvdBVQAKHN8ghQBRTXw+/
	7aL2iGMTw0FnoA/hZm53mTarWgnE9l3royGjirLBA4mmlGsGCAw0sA853r7o4uqhl/oV4+CFBg/
	bFSqEpcBQnpJVWuk2UXmFviVCxdxMKFE0kZpwwcA7EhrhhihDs6K3YeyvEksEo8VbS/UfiPSJEO
	VbD890aB6tJuMAA6mRETjAmdMXeAlT1YKeUuB/1uS32uBMYG/p8ESYM3Z6WLn25w+49fpyPDlOx
	2O2tOWdhIyIANiqWeancrltO/z/01oOwRbaeoQ7OTb0CCndJpODGMcv6kUOl4tT3fzJ4oG99LL5
	vfuI3EPvPDMxV4d5gg2TI9fDQ9g1w+QUf1P6gnOiGX+0thvuSlvsiv8GH2/rbrv3x0atD2sSIt4
	X8PuSALFvgKKpeKMMutqLGARC72t+fO6Jzaa5/4TKtGdepWqiSd+vG6hRoMX9GQETYdiPL1eqqL
	5JNu2AzKi1IpJxpxyUnVsA0wo4J1
X-Received: by 2002:a05:600c:8b33:b0:49f:f9fa:fcfe with SMTP id 5b1f17b1804b1-49ff9fafdccmr177606485e9.13.1790703671207;
        Tue, 29 Sep 2026 10:41:11 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfec770sm100002515e9.8.2026.09.29.10.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:41:10 -0700 (PDT)
Date: Tue, 29 Sep 2026 19:41:07 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>, Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v4 00/13] ARM: dts: imx6ul: Add Variscite VAR-SOM-6UL and
 DART-6UL
Message-ID: <arv4MwHV4LntROkN@Lord-Beerus.station>
References: <cover.1790693249.git.stefano.r@variscite.com>
 <20260929121455.437291ea4b53130e3e19778c@hugovil.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260929121455.437291ea4b53130e3e19778c@hugovil.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_104113_897363_0B580663 
X-CRM114-Status: GOOD (  43.95  )
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

On Tue, Sep 29, 2026 at 12:14:55PM -0400, Hugo Villeneuve wrote:
> Hi Stefano,
> 
> Your title seems to imply that VAR-SOM-6UL support did not
> exist before your patch, but it did. Please rephrase that, and
> your description accordingly.
> 

Hi Hugo,
You’re right that VAR-SOM-6UL already has mainline support.
I’ll reword the title and description to distinguish the existing
support from the new variants and DART-6UL boards.

> 
> On Tue, 29 Sep 2026 17:17:27 +0200
> Stefano Radaelli <stefano.radaelli21@gmail.com> wrote:
> 
> > Add device trees for Variscite VAR-SOM-6UL and DART-6UL modules based on
> > i.MX6UL, i.MX6ULL and i.MX6ULZ. VAR-SOM-6UL is supported on the
> > Concerto-Board and Symphony-Board carriers, and DART-6UL on the
> > VAR-6ULCustomBoard. The 90 new DTBs cover the supported combinations of
> > storage, wireless and audio options.
> 
> Do they? You would need far more than 90 DTBs to support all options...
> 
> When I submitted the latest changes for the VAR-SOM-6UL, I did not
> create DTBs for every available options knowing that it would lead to
> an insane number of files. So I simply created a full DTB that
> incorporated most of the DTSI options. And my custom boards simply
> include only the required DTSI for their specific options.
> 
> Looking simply at the ENET phy level, you seem to have now removed
> the two individual DTSI to selectively add support for ENET1 and ENET2,
> but not all board use these, so that is why they
> were created as individual DTSI files in the first place to make it
> easier to create a DTB with only the required options. As an example,
> one of my custom boards do not have ethernet at all, so i don't want
> that support enabled by default.
> 
> Please keep the existing DTSI as distinct and individual files.
> 
> Maybe using DT overlays would be better suited if you really want to
> support every available combinations?
> 

Just to be clear about the 90 DTBs: They are the minimum set of prebuilt
DTBs for the Variscite-supported configurations that select between
mutually exclusive hardware alternatives. Selecting an alternative changes
the hardware described on a SoM interface and therefore requires changes
to Device Tree nodes, pin configuration or controller properties.
For example, the SD interface may connect to an SD card or an SDIO wireless
module; storage, wireless-module and codec choices similarly require
different descriptions.

These are not every possible combination of fitted and unfitted components.
We do not add another DTB merely because an optional peripheral is not
populated.
This follows the existing VAR-SOM-MX7 mainline approach: it provides
separate DTBs for hardware choices such as eMMC versus NAND and codec
variants, without enumerating every optional component’s presence or
absence.

> 
> > The descriptions use shared module, option and carrier DTSI files with
> > SoC-specific wrappers. In particular, the WM8904 and WM8731 codecs are
> > selected explicitly instead of keeping a codec in the module base.
> > The four existing Concerto DTBs are converted to this layout without
> > changing their DTB names or compatible strings. This also replaces the
> > non-working legacy LVDS panel description with the LCDIF configuration
> 
> Can you describe what exactly is not working? When I submitted these
> LVDS changes I tested the LVDS panel with the Variscite concerto EVK
> (VAR-SOM-6UL LD option) and it was working ok (also tested with two
> custom boards).
> 
> If a fix is needed for this bug, this should go in a separate patch.
> 

In an initial hardware test, the display timing behavior did not appear
to match what we observe with Variscite’s downstream configuration.
I will repeat the test and measure the output before proposing any display
change. If a fix is needed, I will send it as a separate patch.

> 
> > for the Variscite display. Wi-Fi and Bluetooth enable/reset sequencing
> > on these modules is handled by userspace, so the legacy kernel-managed
> > power-sequence and Bluetooth nodes are not carried forward.
> 
> That is not ok. I specifically implemented enable/reset sequencing in
> the kernel to finally get rid of the need for external
> proprietary userspace scripts, and it was tested ok. If somethings needs
> to be fixed or improved in this sequencing, fine if you submit a patch
> to do it, but certainly do not get rid of it.
> 

Calling these “external proprietary userspace scripts” misses their purpose.
First because they are not proprietary :D. Second, because they implement
the initialization procedure Variscite validates for the Broadcom
modules we ship (talking about the brcm, the existing one in your DTSs)
folowing the datasheet instructions.

This is not equivalent to the sequence in the existing Concerto DT.
For the LWB5 option, the procedure enables WIFI_PWR, waits 10 ms,
enables WLAN_EN and BT_EN, waits 200 ms, then lowers BT_EN before
re-enumerating the SDIO device.
The other Broadcom option does not use the separate WIFI_PWR step.
The existing regulator and MMC power-sequence nodes do not express that
complete, module-dependent procedure, particularly the BT_EN step during
Wi-Fi initialization.
The scripts also select the Bluetooth firmware according to the detected
SDIO device.

We use that procedure to avoid sequencing-related failures for our
customers.
This approach is not new to Variscite’s mainline DTS files.

Thank you for your time,
Best Regards,
Stefano

