Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C1AC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 13:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6IFhAEM6QXSnnfEsfKnYA9AhAD6BenyTboqR3ogwdfI=; b=gkxAfMQHzsgISR+pfL+ool3thL
	0A4jKb3pTDnP4y6o8CoVr7f18QVCRkgbkWOqt8HPNYLrMOolp+VP9LVfs21rsIPDBwZDB38GN252D
	faGCk3iD2W2yKxGQ56k4Kf8N8n+sNRfCKKqZ+TaoD+1qLgue0qmdFqLVNNFXGT7kDjT78VDcAwdEa
	lZQup51enmwYohXGC1wVkl5dl9IPMXu++JrKx/Tod2hfQ9A8WIQX/SOxBEtYlyOXZ+DWMeOcz2Kau
	GKWkOdKAzr6YD0oRbCDtNypAdeDO9F+lS8Yw9glWmwS9R/3nZ/fsaGLM8hDjGal60aYmeYpcyfQQV
	KnJgO7aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tute4-000000096gw-2pBh;
	Wed, 19 Mar 2025 13:39:44 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tutcO-000000096WN-1YQx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 13:38:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6IFhAEM6QXSnnfEsfKnYA9AhAD6BenyTboqR3ogwdfI=; b=B0mWfGHLsRaufUhImXjS3PmpaS
	in1Lkaq2WqPXk9zjBA42rkH2Aq9yvTihr8padx5LBRXKYeO9ath/zqi+OYx5bUFNoAduy5fkK8sHF
	ILcbFybvEveDbj3pM5jqcXTXTDqBgT3nZ9Yuc8lkVrkEDXZH6xGfcU5osKJ7F5qlBzME=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tutcB-006Mtf-Ut; Wed, 19 Mar 2025 14:37:47 +0100
Date: Wed, 19 Mar 2025 14:37:47 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Felipe Balbi <balbi@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-hardening@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>,
	Hari Nagalla <hnagalla@ti.com>, linux@ew.tq-group.com
Subject: Re: [PATCH v2 5/5] arm64: dts: ti: Add TQ-Systems TQMa62xx SoM and
 MBa62xx carrier board Device Trees
Message-ID: <262ff436-2334-43bb-a998-ab48f06ea0e3@lunn.ch>
References: <cover.1733737487.git.matthias.schiffer@ew.tq-group.com>
 <95ff66ca2c89f69d893c2ce9eed9a0c677633c7b.1733737487.git.matthias.schiffer@ew.tq-group.com>
 <a9c5cfda-e3e3-436a-8d05-b2f096157cfe@lunn.ch>
 <c902a56cf34838f60cee67624bb923e91d74e9e0.camel@ew.tq-group.com>
 <d25b1447-c28b-4998-b238-92672434dc28@lunn.ch>
 <e16076d16349e929af82fa987a658bff1d9804c4.camel@ew.tq-group.com>
 <a2a2f201-73a4-4a99-baef-0d593a88c872@lunn.ch>
 <309052f3f69950fe43390505cc7254aee8c8f5c6.camel@ew.tq-group.com>
 <2953e10c-0a57-4d49-b831-3864a07eefd5@lunn.ch>
 <e6ee878f655c31473bca54e4187d9006a19158b1.camel@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6ee878f655c31473bca54e4187d9006a19158b1.camel@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_063800_414907_CC34D1D8 
X-CRM114-Status: GOOD (  28.71  )
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

> Hi Andrew,
> 
> I've just thought about this issue again. As mentioned, a number of MAC
> drivers(*) implement what is described here:
> 
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/net/ethernet-controller.yaml?h=v6.13#n77
> 
> 
> That is, the delay is either added by the PHY or the MAC; having a delay on the
> PCB is simply not supported.

Yes it is, you are reading it wrong. First off, as said a number of
times in the last couple of months, this description is from the
perspective of the PHY. It is not the board perspective. So:

      # RX and TX delays are added by the MAC when required
      - rgmii

From the perspective of the PHY, "when required" the MAC adds the
delay. It might not be required, because the PCB adds the delay.

      # RGMII with internal RX and TX delays provided by the PHY,
      # the MAC should not add the RX or TX delays in this case
      - rgmii-id

The MAC should not add delays because the PHY does. But this implies
the PCB cannot also be adding delays because you would end up with two
sets of delays.

> Fixing MAC drivers to interpret the values without
> "id" to mean that there is a delay on the PCB will break existing Device Trees,
> so that's no good.

You need to look at it broken driver by broken driver. I _think_ the
Aspeed case can be fixed. Others we need to look at the details. Maybe
in some cases we do need to add a warning to the device tree binding
the driver is FUBAR and has special, broken meaning for 'rgmii'.

> As a first step, I'd update the docs to describe the intended behavior, but
> mention that some drivers implement it wrong.

Feel free to submit patches. However, please think about it. DT is OS
agnostic. DT describes the hardware, not configuration. Other OSes
might decide on a different policy about which of the MAC/PHY pair
implements the delay, since that is configuration, not a hardware
description.

> The question is how to deal with
> the wrong behavior going forward. I see the following options, but none spark
> joy for me...
> 
> - Keep current driver behavior forever where fixing it would break existing
>   Device Trees
> - Deprecate all existing "rgmii*" values because of their inconsistent
>   implementation, come up with new ones. Seems like a huge pain to add support
>   for in all MAC drivers and other code that deals with PHY modes...

Won't help anyway. If developers are getting it wrong now, why should
they suddenly start getting it right when all you are changing is the
name.

The real issue is that you can combine two bugs to get a working
system. It seems like few developers actually understand RGMII
delays. They don't spend time to understand it, they just try random
things until it works. As a result, they get systems where the MAC is
unknowingly adding delays, and 'rgmii' works, so job done. They don't
know or care it is wrong.

> - Introduce an additional DTS flag next to phy-mode to express that the
>   phy-mode is supposed to be interpreted correctly

If you are going to do add any sort of property, it should be a bool
indicating the opposite, 'phy-mode-is-fubar'. Something which
developers will think about before copying into their DT.

> Do you have any suggestions?

Add a checkpatch.pl check. Any patch which adds a phy-mode !=
'rgmii-id' needs to have a comment on the previous line containing the
word PCB. That should at least help stop more broken DT being added.

	Andrew

