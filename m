Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D323C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 15:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6odEtpsbLUs835q3V1F9htFlGcWFQ+wEDjb2L+ALX80=; b=U1rbKDzqEZroOUF2BLDUuB2EuC
	6LlXnQy+oGRySZsQuJcGjKVoOKASjj8YL9psSY831HhVJpb24AOYUdiI08crMRQA9RjpvYv5H0D4m
	iaXUynfO3cFwiABYVyIhCFYx3gKPe9qI5JZQr95UvdicEJremApSHSQGxYcsfI1B3Adr2CmgDj70h
	Jt7awShkwen1jGpSSXmXwilHqQ8PshuKzt7yxObHr+5g8WVah+xsutOjVSWnOl8iU8faK+IMukiyb
	c4szdF/QQtenxyTtoPI+2t7UJsHaWl8uLH9NaGex1qbsCGS9iAo4FlugF1LVnCOoTa+xYgqfIWqGF
	N4DwnBsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuvcL-00000009RWi-3kAv;
	Wed, 19 Mar 2025 15:46:05 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuvWc-00000009Psm-42IC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 15:40:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6odEtpsbLUs835q3V1F9htFlGcWFQ+wEDjb2L+ALX80=; b=dYaZwAuKzjhW3ZNTaXcIQCJ+k3
	iwLZzorpQDDaAyO/kmFL7XmMhmEGHfatWWzfcgfuXU/jGuELtOAuRpmVvjoc76qc1hdkeSLn7ifeg
	l+jurutCvlp6IFNR97ie6mCjgcxpu8WB7me7nKLDSciOcoK8FEmVSnyk2SCRBNVtf6dw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tuvWP-006NhH-ND; Wed, 19 Mar 2025 16:39:57 +0100
Date: Wed, 19 Mar 2025 16:39:57 +0100
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
Message-ID: <c277cc6b-6624-44df-94ff-45b341859b62@lunn.ch>
References: <a9c5cfda-e3e3-436a-8d05-b2f096157cfe@lunn.ch>
 <c902a56cf34838f60cee67624bb923e91d74e9e0.camel@ew.tq-group.com>
 <d25b1447-c28b-4998-b238-92672434dc28@lunn.ch>
 <e16076d16349e929af82fa987a658bff1d9804c4.camel@ew.tq-group.com>
 <a2a2f201-73a4-4a99-baef-0d593a88c872@lunn.ch>
 <309052f3f69950fe43390505cc7254aee8c8f5c6.camel@ew.tq-group.com>
 <2953e10c-0a57-4d49-b831-3864a07eefd5@lunn.ch>
 <e6ee878f655c31473bca54e4187d9006a19158b1.camel@ew.tq-group.com>
 <262ff436-2334-43bb-a998-ab48f06ea0e3@lunn.ch>
 <570d9c2a25b437ab75f14104b354027210809028.camel@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <570d9c2a25b437ab75f14104b354027210809028.camel@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_084011_001006_435DAA43 
X-CRM114-Status: GOOD (  28.17  )
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

> > > Fixing MAC drivers to interpret the values without
> > > "id" to mean that there is a delay on the PCB will break existing Device Trees,
> > > so that's no good.
> > 
> > You need to look at it broken driver by broken driver. I _think_ the
> > Aspeed case can be fixed. Others we need to look at the details. Maybe
> > in some cases we do need to add a warning to the device tree binding
> > the driver is FUBAR and has special, broken meaning for 'rgmii'.
> 
> I don't know about Aspeed (maybe you're mixing something up, or I'm not aware of
> something?) - in the case of the TI driver I'm dealing with, this is indeed
> possible to fix up because the MAC always adds a delay, it is not configurable.

The Aspeed driver also gets RGMII delays wrong. And there is an
ongoing discussion about how to fix it. The discussions there probably
apply to most drivers which get RGMII delays wrong. Following the
discussions on how RGMII is broken in other places might help you fix
the TI driver.

> The whole point of my suggestions is to allow fixing the drivers while staying
> compatible with old, broken Device Trees. If we could add a property 'phy-mode-
> is-fubar' to old Device Trees, we could just fix them instead - but we can only
> fix in-tree DTS, and it will only have an effect on systems that update their
> DTBs with their kernel, so I believe this simply isn't an option because of
> backwards compat guarantees for Device Trees.

So you need the TI driver to accept the broken 'rgmii', and the
correct 'rgmii-id'. You say the MAC hardware always adds the delay. So

1) Patch the driver to test for 'rgmii', and issues a warning that the
   DT is wrong and needs updating.

2) Add the missing masking of the value passed to the PHY. Since the
   MAC driver is adding the delays, it needs to modify the
   phy_interface_t passed to phy_connect(), masking out the delays the
   MAC is adding. This is an established procedure for MACs which
   implement the delays, rather than ask the PHY to do it. It then
   becomes possible to use the correct 'rgmii-id' value.

3) Patch the TI .dts files to use the correct rgmii-id. That makes the
   warnings added in 1) go away.

This is a lot simpler than the Aspeed case, but the basic discussion
taking place with the Aspeed driver would give you useful background.

	Andrew

