Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED40E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 16:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhuAePAZ8ZQ2jPG7JG2KWJmbb/vDD1kvHPakjiEM5uk=; b=QcNCliHLVE4Ecj4bBE3jhiklyp
	VDeaMRvsguFKEZKAWlbJVUzByaxpZzBoOkqlAv/+GoYFgQib8oeyKQxaZetCkRtyTo8O1X1GyVMoA
	VMepkh28FlgHsbNDLQ5XLNlJ+iBUDMClbBi+U8k6WkYayfCBUvGMlR7DOLRid1sSHSthRSg0nccvX
	Sj8gI/94Zk+QCgu6/6NYWqMDO4gf8i69wzfSH3Hhem0h+JOKZ71dyUwsATvr0BPI68/dyIYS6+0r1
	7eYG8dI5rliha2QqB//KxDe4i1QC3cNtqp7/ctr9xPOLFzKHERKX+xYT4+7w/WdZgb7Z4sJPDNrnD
	WGZrde6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgQi-00000008W5O-2I3Q;
	Mon, 09 Dec 2024 16:16:16 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgPe-00000008Vwl-3iKA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 16:15:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=jhuAePAZ8ZQ2jPG7JG2KWJmbb/vDD1kvHPakjiEM5uk=; b=UwN/nAXdCbg5hTnPExU+Z7mgLx
	SbL6GdW45VGT2qd8kBufCqrskyGXUAPznVedKM/Nix9MQKqUo8jM1R4t/QacwQNaahHbLwFAMd4Q/
	oxoHwri9w986EdBfksTcBcYCVs6huLVOG0Ruq3+otfivHXk5tORU1pcn8jTKcVFwHHd0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tKgPR-00Fgw5-QG; Mon, 09 Dec 2024 17:14:57 +0100
Date: Mon, 9 Dec 2024 17:14:57 +0100
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
Message-ID: <a2a2f201-73a4-4a99-baef-0d593a88c872@lunn.ch>
References: <cover.1733737487.git.matthias.schiffer@ew.tq-group.com>
 <95ff66ca2c89f69d893c2ce9eed9a0c677633c7b.1733737487.git.matthias.schiffer@ew.tq-group.com>
 <a9c5cfda-e3e3-436a-8d05-b2f096157cfe@lunn.ch>
 <c902a56cf34838f60cee67624bb923e91d74e9e0.camel@ew.tq-group.com>
 <d25b1447-c28b-4998-b238-92672434dc28@lunn.ch>
 <e16076d16349e929af82fa987a658bff1d9804c4.camel@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e16076d16349e929af82fa987a658bff1d9804c4.camel@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_081510_930683_8B40CF38 
X-CRM114-Status: GOOD (  17.56  )
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

> Not our board, but the AM62 SoC. From the datasheet:
> 
> "TXC is delayed internally before being driven to the RGMII[x]_TXC pin. This
> internal delay is always enabled." So enabling the TX delay on the PHY side
> would result in a double delay.

phy-mode describes the board. If the board does not have extra long
clock lines, phy-mode should be rgmii-id.

The fact the MAC is doing something which no other MAC does should be
hidden away in the MAC driver, as much as possible.

The MAC driver should return -EINVAL with phy-mode rgmii, or
rmgii-rxid, because the MAC driver is physically incapable of being
used on a board which has extra long TX clock lines, which 'rmgii' or
rgmii-rxid would indicate.

Since the MAC driver is forcing the TX delay, it needs to take the
value returned from of_get_phy_mode() and mask out the TX bit before
passing it to the PHY.

Now, it could be that history has got in the way. There are boards out
there which have broken DT but work. Fixing the MAC driver to do the
correct thing will break those boards. Vendors with low quality code
which works, but not really.

~/linux/arch/arm64/boot/dts/ti$ grep rgmii k3-am625-*
k3-am625-beagleplay.dts:	phy-mode = "rgmii-rxid";
k3-am625-sk.dts:	phy-mode = "rgmii-rxid";

Yep, these two have broken DT, they don't describe the board
correctly.

O.K. Can we fix this for you board? Yes, i think we can. If you take
rmgii-rxid, aka PHY_INTERFACE_MODE_RGMII_RXID, and mask out the TX,
you still get PHY_INTERFACE_MODE_RGMII_RXID. If you take rgmii-id,
a.k.a. PHY_INTERFACE_MODE_RGMII_ID and mask out the TX, you get
PHY_INTERFACE_MODE_RGMII_RXID, which is what you want.

Please produce a patch to the MAC driver, explaining the horrible mess
the vendor made, and how this fixes it, but should also not break
other boards.

> No such defaults exist in the DP83867 driver. If any rgmii-*id mode is used, the
> corresponding delays *must* be specified in the DTB:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/phy/dp83867.c#n532

That is bad, different to pretty every other PHY driver :-(

If you want, you could patch this driver as well, make it default to
2ns if delays are asked for.

    Andrew

---
pw-bot: cr

