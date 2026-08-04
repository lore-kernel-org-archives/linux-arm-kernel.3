Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2F2C55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 15:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYUWloGlZLgoX2T56mF6PXpKO2BUjGPorcVZHz9FUV4=; b=N7I43ON4HecofR0VGjJRGJfv+Q
	TjOoX64hgcfHh9nNehEq9A9zXttP+9iqJdfaNhidCP8mipbTI/WWUVpM2M5jSldflixWi4KljzWVO
	hrFvDXs7tLY+umB3ZwhRihCejfxo5DF42ofmqd75uMIdJ08ZMuGrCLqof1FE2lzwyAlmZRU90iCid
	5kzSEV+jYn4H5LGr+9RET90/dQct+Ra61dAHji5rPIlGfK1QJ8Omd6VrMmC92pA0dVZZX/pSLWAnf
	vzkoGQRO2Zp5wkbLTmde4iCMnu3kKitJmHsW4B186QJjKjFYCMSdQicx1AnW45K2vxwyOWa/8J699
	GpWdmaug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGvo-00000002C03-3RX8;
	Tue, 04 Aug 2026 15:19:52 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGvj-00000002Byk-2oDg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 15:19:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 280B64E410E1;
	Tue,  4 Aug 2026 15:19:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E140F6029E;
	Tue,  4 Aug 2026 15:19:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD35E11C32FF4;
	Tue,  4 Aug 2026 17:19:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785856778; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=nYUWloGlZLgoX2T56mF6PXpKO2BUjGPorcVZHz9FUV4=;
	b=jSp+Y/w99NZGav9vFYshkbjvOhrHnWNoYuGaVJCsq62DXCVwGe5q+Dd70RRn0puKVDVXaP
	FVMe1YqNPgsLgNBQqT/VRZMleJIBnQXkhbXWKqP5DJk57e0ivYru3Vy9G1CZ2iz8yv/EFQ
	olXx7EsFayVBnNIh1nisaTixWWVl0y1y6hKFdGCeetDGtVBkUbjdZwN0pdzd9g/l051UqR
	SCHalEpPpgnsIcTLUlmciNq3b/Gsd34SWGO1T9dH/CCKouytz7upQP7VdBisPi7FlPXUI/
	jZM0pYzAkSfTmS6Jb7uNnCcdU2IQ6POya3Van9QF8QqOJpjH7DsyjN0gCxlAfw==
Message-ID: <9d201ac0-a4e3-4b74-a6ae-72c3b33bd519@bootlin.com>
Date: Tue, 4 Aug 2026 17:19:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/21] net: phy: add X-Powers AC200/AC300 EPHY driver
To: James Hilliard <james.hilliard1@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara
 <andre.przywara@arm.com>, Richard Genoud <richard.genoud@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Saravana Kannan <saravanak@kernel.org>,
 Lee Jones <lee@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-16-0a53cd9e21cc@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-16-0a53cd9e21cc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_081947_844817_0DC6A080 
X-CRM114-Status: GOOD (  18.72  )
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

Hi James,

On 8/3/26 07:14, James Hilliard wrote:
> AC200 and AC300 contain compatible Fast Ethernet link-PHY implementations
> which report the same ID, but their identification registers are not
> accessible until the companion-specific control interface completes
> its power-up sequence. Match the ID supplied by firmware and require
> an X-Powers control reference because the Rockchip RK630 PHY reports
> the same ID.
> 
> On fixed hardware, reference one already enabled control device. A fixed
> AC300 system may optionally read the configuration field for calibration-
> range tuning; its absence selects the normal range. On systems which may
> contain either companion, require a logical two-bit NVMEM field to select
> the control interface and the AC300 calibration range. Enable a selected
> fail-needs-probe node when CONFIG_OF_DYNAMIC is available; otherwise the
> same topology works when both candidate providers are already enabled.
> Validate that each phandle references the expected control-device type and
> restore the selector's status changeset if dynamic device creation fails.
> 
> Keep a device link to the selected provider and defer until its driver
> binds. Verify that the MAC interface agrees with the provider's phy-mode
> before resetting the hardware. Power the control block before each PHY
> reset, shut it down during PHY suspend, and restore the vendor
> configuration after resume. If control power-off fails during suspend,
> attempt to power the PHY back on and restore its link configuration before
> returning the error. Pass the link address to the AC200 provider for
> EPHY_CTL.PHY_ADDR programming; the AC300 provider instead validates its
> package-strapped address relationship.
> 
> Apply the common vendor analog initialization and SID-derived tuning while
> preserving unrelated register fields. Support a board-selected xMII
> receive-clock inversion and report and configure forced or automatic
> MDI/MDI-X state.
> 
> Expose UAPS through the ethtool energy-detect power-down tunable as its
> no-transmit mode. Accumulate the hardware receive-byte, receive-packet and
> receive-CRC-error counters across PHY resets, expose all three as driver
> statistics and map CRC errors to the standardized PHY receive-error
> counter. Treat counter snapshots as best-effort telemetry so a read failure
> cannot prevent PHY recovery.
> 
> Start both standard EEE advertisement and the PHY-autonomous Intelligent
> EEE transmitter disabled, matching the vendor configuration. Preserve the
> supported modes so ethtool can enable and configure both at runtime. The
> PHY has no documented programmable LPI timer, so reject a nonzero timer
> when enabling Tx LPI while accepting any timer value when disabling it.
> Clear BMCR_PDOWN before soft reset because ACx00 can acknowledge reset
> while powered down without restarting its link logic.
> 
> Use the shared PHY interrupt for link changes when firmware provides one;
> otherwise retain the normal phylib polling fallback. On wakeup-source
> systems with a routed interrupt, expose magic-packet and link-change
> Wake-on-LAN, program the detector MAC address for magic wake, and arm the
> nested IRQ as a wake source. Keep the PHY powered while either PHY or MAC
> Wake-on-LAN is active. During suspend, leave only requested PHY wake events
> unmasked, then restore normal link monitoring on resume. Do not advertise
> either wake mode in polling mode because the CPU cannot poll while
> suspended.
> 
> Register standard PHY LEDs for the described package outputs and expose
> their fixed link/activity, 100 Mbps speed and duplex rules to the netdev
> trigger. Use the vendor fallback of all three outputs active-low when no
> LED topology is provided; otherwise apply the described output set and
> shared polarity. Quiesce the provider if PHY probing or removal tears down
> the link device.

That's a very verbose commit message, which gives it an 'LLM generated' vibe.

Can you submit that driver separately and split down into multiple pieces ?

1457 lines is quite big for a PHY driver, especially one that supports
just a pair of PHYs. That makes it hard to review.

Can you plit it into more logical chunks, one bringing basic features,
one for LEDs, one for WoL, one for stats, etc.

Thanks,

Maxime



